package com.jiangqn.mapper;

import com.jiangqn.model.Message;
import org.apache.ibatis.annotations.Param;

public interface MessageMapper {
    Message Message_selques(@Param("message_question") String message_question);
}
