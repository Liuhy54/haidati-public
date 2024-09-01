package com.hy.haidati;

import com.hy.haidati.controller.QuestionController;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;

@SpringBootTest
public class QuestionContollerTest {

    @Resource
    private QuestionController questionController;

//    @Test
//    void aiGenerateQuestionSSETest() throws InterruptedException {
//        // 参数模拟调用
//        AiGenerateQuestionRequest aiGenerateQuestionRequest = new AiGenerateQuestionRequest();
//        aiGenerateQuestionRequest.setAppId(3L);
//        aiGenerateQuestionRequest.setQuestionNumber(10);
//        aiGenerateQuestionRequest.setOptionNumber(2);
//
//        // 模拟普通用户
//        questionController.aiGenerateQuestionSSETest(aiGenerateQuestionRequest, false);
//        // 模拟普通用户
//        questionController.aiGenerateQuestionSSETest(aiGenerateQuestionRequest, false);
//        // 模拟会员用户
//        questionController.aiGenerateQuestionSSETest(aiGenerateQuestionRequest, true);
//
//        // 模拟主线程一直启动
//        Thread.sleep(1000000L);
//    }


}
