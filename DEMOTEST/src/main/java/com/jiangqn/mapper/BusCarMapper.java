package com.jiangqn.mapper;

import com.jiangqn.model.BusCar;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.Date;

public interface BusCarMapper {
    int BusCar_ins(@Param("car_id")String car_id, @Param("car_startstation") String car_startstation, @Param("car_endstation") String car_endstation, @Param("car_paymoney") String car_paymoney, @Param("car_starttime") String car_starttime, @Param("car_endtime") String car_endtime, @Param("car_station") String car_station);
    BusCar BusCar_sel(@Param("car_id")String car_id);
    ArrayList<String> BusCar_selAll();
    int BusCar_update(@Param("car_id")String car_id, @Param("car_startstation") String car_startstation, @Param("car_endstation") String car_endstation, @Param("car_paymoney") String car_paymoney, @Param("car_starttime") String car_starttime, @Param("car_endtime") String car_endtime, @Param("car_station") String car_station);
    int BusCar_delete(@Param("car_id")String car_id);
    ArrayList<BusCar> BusCar_sel10(@Param("page")int page);
    ArrayList<BusCar> BusCar_select(@Param("car_id")String car_id, @Param("car_startstation") String car_startstation, @Param("car_endstation") String car_endstation, @Param("car_paymoney") String car_paymoney, @Param("car_starttime") String car_starttime, @Param("car_endtime") String car_endtime, @Param("car_station") String car_station);
    ArrayList<String> BusCar_selectcount(@Param("car_id")String car_id, @Param("car_startstation") String car_startstation, @Param("car_endstation") String car_endstation, @Param("car_paymoney") String car_paymoney, @Param("car_starttime") String car_starttime, @Param("car_endtime") String car_endtime, @Param("car_station") String car_station);
    ArrayList<BusCar> BusCar_selpage(@Param("page")int page,@Param("car_id")String car_id, @Param("car_startstation") String car_startstation, @Param("car_endstation") String car_endstation, @Param("car_paymoney") String car_paymoney, @Param("car_starttime") String car_starttime, @Param("car_endtime") String car_endtime, @Param("car_station") String car_station);

}







