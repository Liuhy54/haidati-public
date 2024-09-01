package ${packageName}.model.dto.${dataKey};

import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * 创建${dataName}请求
 *
 * @author <a href="https://github.com/Liuhy54">Liuhy54</a>
 * @from <a href="https://github.com/Liuhy54/haidati-public">ai答题平台海答题学习圈</a>
 */
@Data
public class ${upperDataKey}AddRequest implements Serializable {

    /**
     * 标题
     */
    private String title;

    /**
     * 内容
     */
    private String content;

    /**
     * 标签列表
     */
    private List<String> tags;

    private static final long serialVersionUID = 1L;
}