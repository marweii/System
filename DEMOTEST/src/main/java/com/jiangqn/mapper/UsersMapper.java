package com.jiangqn.mapper;

import com.jiangqn.model.User;
import org.apache.ibatis.annotations.Param;

public interface UsersMapper {
    User login(@Param("account")String account, @Param("password") String password);
    User register_sel(@Param("account")String account, @Param("name") String name);
    int register_ins(@Param("account")String account,@Param("password") String password,@Param("name") String name);
    int revisepass(@Param("account")String account, @Param("password") String password);
    int changeuser(@Param("account")String account, @Param("name") String name,@Param("pictureurl") String pictureurl);
}
