package com.hy.haidati.model.dto.question;

import lombok.Data;

import java.io.Serializable;

/**
 * AI 生成题目请求
 */
@Data
public class AiGenerateQuestionRequest implements Serializable {

    /**
     * 应用ID
     */
    private Long appId;

    /**
     * 题目数量
     */
    int questionNumber = 10;

    /**
     * 题目类型
     */
    int optionNumber = 2;

    private static final long serialVersionUID = 1L;
}
