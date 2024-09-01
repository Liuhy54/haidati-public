/**
 * 获取得分最高的题目评分结果的函数
 * @param {Array} answerList - 用户提交的答案列表，例如 ["A"]
 * @param {Array} questions - 题目列表，每个题目包含选项和对应的评分结果
 * @param {Array} question_results - 题目评分结果列表，每个结果包含评分属性和描述
 * @returns {Object} - 最高分数对应的评分结果
 */
export function getBestQuestionResult(answerList, questions, question_results) {
    // 初始化一个对象来存储每个评分结果的分数
    const scoreMap = {};

    // 遍历用户提交的答案列表
    answerList.forEach(answer => {
        // 遍历题目列表，找到与答案对应的题目
        questions.forEach(question => {
            // 遍历题目的选项，找到与答案对应的选项
            question.options.forEach(option => {
                if (option.key === answer) {
                    // 获取选项对应的评分结果
                    const result = option.result;
                    // 遍历题目评分结果列表，找到包含该评分结果的评分结果
                    question_results.forEach(question_result => {
                        if (question_result.resultProp.includes(result)) {
                            // 如果评分结果已经在scoreMap中，分数加1，否则初始化分数为1
                            if (scoreMap[question_result.resultName]) {
                                scoreMap[question_result.resultName].score += 1;
                            } else {
                                scoreMap[question_result.resultName] = {
                                    score: 1,
                                    result: question_result
                                };
                            }
                        }
                    });
                }
            });
        });
    });

    // 初始化最高分数和对应的评分结果
    let maxScore = 0;
    let maxScoreResult = question_results[0];

    // 遍历scoreMap，找到最高分数和对应的评分结果
    for (const key in scoreMap) {
        if (scoreMap[key].score > maxScore) {
            maxScore = scoreMap[key].score;
            maxScoreResult = scoreMap[key].result;
        }
    }

    // 返回最高分数对应的评分结果
    return {
        resultProp: maxScoreResult.resultProp,
        resultDesc: maxScoreResult.resultDesc,
        resultPicture: maxScoreResult.resultPicture,
        resultName: maxScoreResult.resultName
    };
}

// 示例调用
const answerList = ["A"];
const questions = [
    {
        "title": "你通常更喜欢",
        "options": [
            {
                "result": "I",
                "value": "独自工作",
                "key": "A"
            },
            {
                "result": "E",
                "value": "与他人合作",
                "key": "B"
            }
        ]
    }
];
const question_results = [
    {
        "resultProp": ["I", "S", "T", "J"],
        "resultDesc": "忠诚可靠，被公认为务实，注重细节。",
        "resultPicture": "icon_url_istj",
        "resultName": "ISTJ（物流师）"
    }
];

console.log(getBestQuestionResult(answerList, questions, question_results));
