package com.jiangqn.model;

public class Message {
    private int message_id;

    public int getMessage_id() {
        return message_id;
    }

    public void setMessage_id(int message_id) {
        this.message_id = message_id;
    }

    public String getMessage_answer() {
        return message_answer;
    }

    public void setMessage_answer(String message_answer) {
        this.message_answer = message_answer;
    }

    public String getMessage_question() {
        return message_question;
    }

    public void setMessage_question(String message_question) {
        this.message_question = message_question;
    }

    private String message_answer;
    private String message_question;
}
