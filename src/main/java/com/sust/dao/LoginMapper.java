package com.sust.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.sust.entity.Login;

@Repository
public interface LoginMapper {
	
    int deleteByPrimaryKey(Integer usId);

    int insert(Login record);

    int insertSelective(Login record);

    Login selectByPrimaryKey(Integer usId);
          
    int updateByPrimaryKeySelective(Login record);

    int updateByPrimaryKey(Login record);

	Login selectLoginInfo(@Param("loLogin")String account, @Param("loPass")String userPassword, @Param("loType")String type);

	int selectLoginByAccount(String account);

	int selectLoginByPass(String password);

	int selectLoginByAll(@Param("loLogin")String account, @Param("loPass")String userPassword, @Param("loType")String type);

	int selectByNum(String num);

	int selectByAccount(String account);

	int selectThNum(Integer id);

	int selectPaNum(Integer id);

	int selectPrNum(Integer id);

	int selectProNum(Integer id);

	int selectBoNum(Integer id);

	int selectRaNum(Integer id);

	int selectMeNum(Integer id);

	int updatePassword(@Param("usId") Integer usId, @Param("loPass") String pass);

}