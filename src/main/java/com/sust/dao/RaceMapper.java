package com.sust.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.sust.entity.Race;

@Repository
public interface RaceMapper {
	int deleteByPrimaryKey(Integer raId);

	int insert(Race record);

	int insertSelective(Race record);

	Race selectByPrimaryKey(Integer raId);

	int updateByPrimaryKeySelective(Race record);

	int updateByPrimaryKey(Race record);

	List<Race> selectUserRaceList(Integer usId);

	String selectUserNameById(Integer usId);

	void updateUpTime(@Param("raUptime") Date raUptime, @Param("raId") Integer raId);

	Date selectUpTimeByKey(Integer raId);

	String selectNameById(Integer id);

	List<Race> selectAllRaceInfo();

	int deleteByUsId(Integer usId);

	List<Race> selectGuiNaRace(@Param("flg") Integer flg,@Param("xuyuan") String xuyuan, @Param("sex") Byte sex,
			@Param("duty") String duty, @Param("bigAge") Integer bigAge, @Param("smlAge") Integer smlAge,
			@Param("major") String major, @Param("bigRada") Date bigRada, @Param("smlRada") Date smlRada,
			@Param("raCate") String raCate, @Param("raTuan") String raTuan,@Param("bigRaUp") Date bigRaUp, @Param("smlRaUp") Date smlRaUp);

	List<Race> selectRaceFind(@Param("usId") Integer usId,  @Param("bigRada") Date bigRada, @Param("smlRada") Date smlRada,
			@Param("raCate") String raCate, @Param("raTuan") String raTuan,@Param("bigRaUp") Date bigRaUp, @Param("smlRaUp") Date smlRaUp);

}