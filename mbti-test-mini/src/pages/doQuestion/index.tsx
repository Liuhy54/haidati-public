import { View } from "@tarojs/components";
import { AtButton, AtRadio } from "taro-ui";
import { useEffect, useState } from "react";
import Taro from "@tarojs/taro";
import "./index.scss";
import questions from "../../data/questions.json";
import GlobalFooter from "../../components/GlobalFooter";

/**
 * 做题页面
 */
export default () => {
  //const question = questions[0];

  //当前题目序号（从1开始）
  const [current, setCurrent] = useState<number>(1);
  //当前题目选项
  const [currentQuestion, setCurrentQuestion] = useState(questions[0]);
  //转换对象数组为选项数组
  const questionOptions = currentQuestion.options.map((option) => {
    return {
      label: `${option.key}.${option.value}`,
      value: option.key,
    };
  });

  //当前答案
  const [currentAnswer, setCurrentAnswer] = useState<string>();
  //回答列表
  const [answerList] = useState<string[]>([]);

  //序号发生变化时，更新当前题目选项
  useEffect(() => {
    //更新题目
    setCurrentQuestion(questions[current - 1]);
    //更新用户选择的答案
    setCurrentAnswer(answerList[current - 1]);
  }, [current]);

  return (
    <View className="doQuestionPage">
      {/*{JSON.stringify(answerList)}*/}
      <View className="at-article__h2 title">
        {current}.{currentQuestion.title}
      </View>
      <View className="options-wrapper">
        <AtRadio
          options={questionOptions}
          value={currentAnswer}
          onClick={(value) => {
            //用户当前答案
            setCurrentAnswer(value);
            //更新答案列表
            answerList[current - 1] = value;
          }}
        />
      </View>
      {current < questions.length && (
        <AtButton
          type="primary"
          circle
          className="controlBtn"
          //答案为空禁用按钮
          disabled={!currentAnswer}
          onClick={() => setCurrent(current + 1)}
        >
          下一题
        </AtButton>
      )}
      {current === questions.length && (
        <AtButton
          type="primary"
          circle
          className="controlBtn"
          //答案为空禁用按钮
          disabled={!currentAnswer}
          onClick={() => {
            // 跳转到目的页面，打开新页面
            //传递答案列表
            Taro.setStorageSync('answerList', answerList);
            Taro.navigateTo({
              url: '/pages/result/index',
            })
          }}
        >
          查看结果
        </AtButton>
      )}
      {current > 1 && (
        <AtButton
          circle
          className="controlBtn"
          onClick={() => setCurrent(current - 1)}
        >
          上一题
        </AtButton>
      )}
      <GlobalFooter />
    </View>
  );
};
