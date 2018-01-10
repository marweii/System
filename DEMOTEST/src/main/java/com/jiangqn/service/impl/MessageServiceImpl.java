package com.jiangqn.service.impl;

import com.jiangqn.mapper.MessageMapper;
import com.jiangqn.model.Message;
import com.jiangqn.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MessageServiceImpl implements MessageService {
    @Autowired
    private MessageMapper messageMapper;

    @Override
    public Message Message_selques(String question) {
        return messageMapper.Message_selques(question);
    }
}
