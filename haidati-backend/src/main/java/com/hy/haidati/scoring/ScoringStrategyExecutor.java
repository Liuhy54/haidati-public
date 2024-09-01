package com.hy.haidati.scoring;

import com.hy.haidati.common.ErrorCode;
import com.hy.haidati.exception.BusinessException;
import com.hy.haidati.model.entity.App;
import com.hy.haidati.model.entity.UserAnswer;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 评分策略执行器
 */
@Service
public class ScoringStrategyExecutor {

    //策略列表
    @Resource
    private List<ScoringStrategy> scoringStrategyList;

    /**
     * 评分
     *
     * @param choiceList
     * @param app
     * @return
     * @throws Exception
     */
    public UserAnswer doScore(List<String> choiceList, App app) throws Exception{
        Integer appType = app.getAppType();
        Integer appScoringStraegy = app.getScoringStrategy();
        if (appType == null || appScoringStraegy == null){
            throw new BusinessException(ErrorCode.SYSTEM_ERROR,"应用配置有误，未找到匹配策略");
        }
        //根据注解获取策略
        for (ScoringStrategy strategy : scoringStrategyList){
            if (strategy.getClass().isAnnotationPresent(ScoringStrategyConfig.class)){
                ScoringStrategyConfig scoringStrategyConfig = strategy.getClass().getAnnotation(ScoringStrategyConfig.class);
                if (appType.equals(scoringStrategyConfig.appType()) && appScoringStraegy.equals(scoringStrategyConfig.scoringStrategy())){
                    return strategy.doScore(choiceList,app);
                }
            }
        }
        throw new BusinessException(ErrorCode.SYSTEM_ERROR,"未找到匹配策略");
    }
}
