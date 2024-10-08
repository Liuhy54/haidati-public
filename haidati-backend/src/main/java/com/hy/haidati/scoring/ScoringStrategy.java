package com.hy.haidati.scoring;

import com.hy.haidati.model.entity.App;
import com.hy.haidati.model.entity.UserAnswer;

import java.util.List;

/**
 * 评分策略接口
 */
public interface ScoringStrategy {
    /**
     * 执行评分
     * @param choices
     * @param app
     * @return
     * @throws Exception
     */
    UserAnswer doScore(List<String> choices, App app) throws Exception;
}
