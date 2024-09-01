import { Image, View } from "@tarojs/components";
import { AtButton } from "taro-ui";
import Taro from "@tarojs/taro";
import headerBg from "../../assets/图片背景.png";
import GlobalFooter from "../../components/GlobalFooter";
import questions from "../../data/questions.json";
import questionResults from "../../data/questionResults.json";
import "./index.scss";
import {getBestQuestionResult } from "../../utils/bizUtils";

/**
 * 结果页面
 */
export default () => {
  //获取答题结果
  const answerList = Taro.getStorageSync("answerList");
  if(!answerList || answerList.length<1){
    Taro.showToast({
      title: '答案为空，请重新答题',
      icon: 'error',
      duration: 3000
    })
  }
  //测试结果
  const result = getBestQuestionResult(answerList, questions, questionResults);
  return (
    <View className="resultPage">
      <View className="at-article__h1 title">{result.resultName}</View>
      <View className="at-article__h2 subTitle">{result.resultDesc}</View>
      <AtButton
        type="primary"
        circle
        className="enterBtn"
        onClick={() => {
          Taro.reLaunch({
            url: "../index/index",
          });
        }}
      >
        返回主页
      </AtButton>
      <Image
        style="width: 300px;height: 400px;background: #fff;"
        src={headerBg}
        className="headrerBg"
      />
      <GlobalFooter />
    </View>
  );
};
