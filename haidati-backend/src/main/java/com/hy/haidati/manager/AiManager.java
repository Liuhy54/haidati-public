package com.hy.haidati.manager;

import com.hy.haidati.common.ErrorCode;
import com.hy.haidati.exception.BusinessException;
import com.zhipu.oapi.ClientV4;
import com.zhipu.oapi.Constants;
import com.zhipu.oapi.service.v4.model.*;
import io.reactivex.Flowable;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * 通用AI调用能力
 */
@Component
public class AiManager {

    @Resource
    private ClientV4 clientV4;

    // 稳定的随机数
    private static final Float STABLE_TEMPERATURE = 0.05f;

    // 不稳定的随机数
    private static final Float UNSTABLE_TEMPERATURE = 0.99f;

    /**
     * 同步请求(答案不稳定)
     *
     * @param systemMassage
     * @param userMassage
     * @return
     */
    public String doSyncUnstableRequest(String systemMassage, String userMassage){
        return doRequest(systemMassage, userMassage, Boolean.FALSE, UNSTABLE_TEMPERATURE);
    }

    /**
     * 同步请求(答案较稳定)
     *
     * @param systemMassage
     * @param userMassage
     * @return
     */
    public String doSyncStableRequest(String systemMassage, String userMassage){
        return doRequest(systemMassage, userMassage, Boolean.FALSE, STABLE_TEMPERATURE);
    }

    /**
     * 同步请求
     *
     * @param systemMassage
     * @param userMassage
     * @param temperature
     * @return
     */
    public String doSyncRequest(String systemMassage, String userMassage,Float temperature){
        return doRequest(systemMassage, userMassage, Boolean.FALSE, temperature);
    }

    /**
     * 通用请求（简化消息传递）
     *
     * @param systemMassage
     * @param userMassage
     * @param stream
     * @param temperature
     * @return
     */
    public String doRequest(String systemMassage, String userMassage, Boolean stream, Float temperature){
        List<ChatMessage> chatMessageList = new ArrayList<>();
        ChatMessage systemchatMessage = new ChatMessage(ChatMessageRole.SYSTEM.value(), systemMassage);
        chatMessageList.add(systemchatMessage);
        ChatMessage userchatMessage = new ChatMessage(ChatMessageRole.USER.value(), userMassage);
        chatMessageList.add(userchatMessage);
        return doRequest(chatMessageList, stream, temperature);
    }

    /**
     * 通用请求
     *
     * @param messages
     * @param stream
     * @param temperature
     * @return
     */
    public String doRequest(List<ChatMessage> messages, Boolean stream, Float temperature){
        //构造请求参数
        ChatCompletionRequest chatCompletionRequest = ChatCompletionRequest.builder()
                .model(Constants.ModelChatGLM4)
                .stream(stream)
                .temperature(temperature)
                .invokeMethod(Constants.invokeMethod)
                .messages(messages)
                .build();
        try{
            ModelApiResponse invokeModelApiResp = clientV4.invokeModelApi(chatCompletionRequest);
            return invokeModelApiResp.getData().getChoices().get(0).toString();
        }catch (Exception e){
            e.printStackTrace();
            throw new BusinessException(ErrorCode.SYSTEM_ERROR,e.getMessage());
        }
    }

    /**
     * 通用流式请求（简化消息传递）
     *
     * @param systemMassage
     * @param userMassage
     * @param temperature
     * @return
     */
    public Flowable<ModelData> doStreamRequest(String systemMassage, String userMassage, Float temperature){
        List<ChatMessage> chatMessageList = new ArrayList<>();
        ChatMessage systemchatMessage = new ChatMessage(ChatMessageRole.SYSTEM.value(), systemMassage);
        chatMessageList.add(systemchatMessage);
        ChatMessage userchatMessage = new ChatMessage(ChatMessageRole.USER.value(), userMassage);
        chatMessageList.add(userchatMessage);
        return doStreamRequest(chatMessageList, temperature);
    }


    /**
     * 通用流式请求
     *
     * @param messages
     * @param temperature
     * @return
     */
    public Flowable<ModelData> doStreamRequest(List<ChatMessage> messages, Float temperature){
        //构造请求参数
        ChatCompletionRequest chatCompletionRequest = ChatCompletionRequest.builder()
                .model(Constants.ModelChatGLM4)
                .stream(Boolean.TRUE)
                .temperature(temperature)
                .invokeMethod(Constants.invokeMethod)
                .messages(messages)
                .build();
        try{
            ModelApiResponse invokeModelApiResp = clientV4.invokeModelApi(chatCompletionRequest);
            return invokeModelApiResp.getFlowable();
        }catch (Exception e){
            e.printStackTrace();
            throw new BusinessException(ErrorCode.SYSTEM_ERROR,e.getMessage());
        }
    }
}
