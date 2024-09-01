package com.hy.haidati.model.dto.question;

import lombok.Data;
import java.util.List;

@Data
public class QuestionContentDTO {
    /**
     * 题目标题
     */
    private String title;

    /**
     * 题目选项列表
     */
    private List<Option> options;

    /**
     * 题目选项
     */
    @Data
    public static class Option {
        private String result;
        private int score;
        private String value;
        private String key;
    }
}


