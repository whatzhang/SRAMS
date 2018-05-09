package com.sust.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.sust.entity.Thesis;

@Repository
public interface ThesisMapper {
	int deleteByPrimaryKey(Integer thId);

	int insert(Thesis record);

	int insertSelective(Thesis record);

	Thesis selectByPrimaryKey(Integer thId);

	int updateByPrimaryKeySelective(Thesis record);

	int updateByPrimaryKey(Thesis record);

	List<Thesis> selectByUsId(Integer usId);

	String selectUserNameById(int usId);

	void updateUpTime(@Param("thUptime") Date thUptime, @Param("thId") Integer thId);

	Date selectUpTimeByKey(Integer thId);

	String selectNameByid(Integer id);

	List<Thesis> selectAllThesis();

	int deleteByUsId(Integer usId);

	List<Thesis> selectGuiNaThesis(@Param("flg") Integer flg,@Param("xuyuan") String xuyuan, @Param("sex") Byte sex,
			@Param("duty") String duty, @Param("bigAge") Integer bigAge, @Param("smlAge") Integer smlAge,
			@Param("major") String major, @Param("bigThda") Date bigThda, @Param("smlThda") Date smlThda,
			@Param("thCate") String thCate, @Param("thle") String thle, @Param("thIsCl") String thIsCl,
			@Param("bigThUp") Date bigThUp, @Param("smlThUp") Date smlThUp);

	List<Thesis> selectThesisFind(@Param("usId") Integer usId, @Param("bigThda") Date bigThda, @Param("smlThda") Date smlThda,
			@Param("thCate") String thCate, @Param("thle") String thle, @Param("thIsCl") String thIsCl,
			@Param("bigThUp") Date bigThUp, @Param("smlThUp") Date smlThUp);

}