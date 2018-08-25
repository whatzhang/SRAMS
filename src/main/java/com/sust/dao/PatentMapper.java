package com.sust.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.sust.entity.Patent;

@Repository
public interface PatentMapper {
	int deleteByPrimaryKey(Integer paId);

	int insert(Patent record);

	int insertSelective(Patent record);

	Patent selectByPrimaryKey(Integer paId);

	int updateByPrimaryKeySelective(Patent record);

	int updateByPrimaryKey(Patent record);

	List<Patent> selectByUsId(Integer paId);

	String selectgetUserNameById(Integer usId);

	void updateUpTime(@Param("paUptime") Date paUptime, @Param("paId") Integer paId);

	Date selectUpTimeByKey(Integer paId);

	String selectNameById(Integer paId);

	List<Patent> selectAllPaInfo();

	int deleteByUsId(Integer usId);

	List<Patent> selectGuiNaPetent(@Param("flg") Integer flg,@Param("xuyuan") String xuyuan, @Param("sex") Byte sex,
			@Param("duty") String duty, @Param("bigAge") Integer bigAge, @Param("smlAge") Integer smlAge,
			@Param("major") String major, @Param("bigPada") Date bigPada, @Param("smlPada") Date smlPada,
			@Param("paCate") String paCate,@Param("bigPaUp") Date bigPaUp, @Param("smlPaUp") Date smlPaUp);

	List<Patent> selectPetentFind(@Param("usId") Integer usId,  @Param("bigPada") Date bigPada, @Param("smlPada") Date smlPada,
			@Param("paCate") String paCate,@Param("bigPaUp") Date bigPaUp, @Param("smlPaUp") Date smlPaUp);

	List<Date> selectAllPatentFileName();
	
	int selectSexNumber(@Param("usSex") Byte usSex);
	
	int selectXueYuanNum(@Param("usAcademy") String usAcademy);
	
	int selectTimeNum(@Param("Year") Integer Year);

	int selectCateNum(@Param("paCate") String paCate);

}