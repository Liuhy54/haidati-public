package com.hy.haidati.scoring;

import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.hy.haidati.model.dto.question.QuestionContentDTO;
import com.hy.haidati.model.entity.App;
import com.hy.haidati.model.entity.Question;
import com.hy.haidati.model.entity.ScoringResult;
import com.hy.haidati.model.entity.UserAnswer;
import com.hy.haidati.model.vo.QuestionVO;
import com.hy.haidati.service.QuestionService;
import com.hy.haidati.service.ScoringResultService;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 自定义测评类应用评分策略
 */
@ScoringStrategyConfig(appType = 1, scoringStrategy = 0)
public class CustomTestScoringStrategy implements ScoringStrategy {

    @Resource
    private QuestionService questionService;

    @Resource
    private ScoringResultService scoringResultService;


    @Override
    public UserAnswer doScore(List<String> choices, App app) throws Exception {
        Long appId = app.getId();
        // 1.根据id查询到题目和题目结果信息
        Question question = questionService.getOne(
                Wrappers.lambdaQuery(Question.class).eq(Question::getAppId, appId)
        );
        List<ScoringResult> scoringResultList = scoringResultService.list(
                Wrappers.lambdaQuery(ScoringResult.class).eq(ScoringResult::getAppId, appId)
        );
        // 2.统计用户每个选择对应的属性个数，如 I = 10 个， E = 5 个
        // 初始化一个Map来存储每个评分结果的分数
        Map<String, Integer> optionCount = new HashMap<>();

        QuestionVO questionVO = QuestionVO.objToVo(question);
        List<QuestionContentDTO> questionContent = questionVO.getQuestionContent();


        // 遍历题目列表
        for (QuestionContentDTO QuestionContentDTO : questionContent) {
            // 遍历答案列表
            for (String answer : choices) {
                // 遍历题目的选项
                for (QuestionContentDTO.Option option : QuestionContentDTO.getOptions()) {
                    //如果答案和选项的key匹配
                    if (option.getKey().equals(answer)) {
                        // 获取选项对应的result评分结果
                        String result = option.getResult();

                        // 如果result属性不在optionCount中，初始化为0
                        if (!optionCount.containsKey(result)) {
                            optionCount.put(result, 0);
                        }

                        // 计数器optionCount加1
                        optionCount.put(result, optionCount.get(result) + 1);
                    }
                }
            }
        }

        // 3.便利每种评分结果，计算哪个结果的得分跟高
        // 初始化最高分数和对应的评分结果
        int maxScore = 0;
        ScoringResult maxScoreResult = scoringResultList.get(0);

        // 遍历评分结果列表，找到最高分数和对应的评分结果
        for (ScoringResult scoringResult : scoringResultList) {
            List<String> resultProp = JSONUtil.toList(scoringResult.getResultProp(), String.class);
            int score = resultProp.stream().mapToInt(prop -> optionCount.getOrDefault(prop,0)).sum();
            if (score > maxScore) {
                maxScore = score;
                maxScoreResult = scoringResult;
            }
        }

        // 4.构造返回值，填充答案对象属性
        UserAnswer userAnswer = new UserAnswer();
        userAnswer.setAppId(appId);
        userAnswer.setAppType(app.getAppType());
        userAnswer.setScoringStrategy(app.getScoringStrategy());
        userAnswer.setChoices(JSONUtil.toJsonStr(choices));
        userAnswer.setResultId(maxScoreResult.getId());
        userAnswer.setResultName(maxScoreResult.getResultName());
        userAnswer.setResultDesc(maxScoreResult.getResultDesc());
        userAnswer.setResultPicture(maxScoreResult.getResultPicture());

        return userAnswer;
    }
}
