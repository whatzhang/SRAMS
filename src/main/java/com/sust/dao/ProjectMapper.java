package com.sust.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.sust.entity.Project;

@Repository
public interface ProjectMapper {
	int deleteByPrimaryKey(Integer proId);

	int insert(Project record);

	int insertSelective(Project record);

	Project selectByPrimaryKey(Integer proId);

	int updateByPrimaryKeySelective(Project record);

	int updateByPrimaryKey(Project record);

	List<Project> selectProjectList(Integer usId);

	void updateUpTime(@Param("proUptime") Date proUptime, @Param("proId") Integer proId);

	Date selectUpTimeByKey(Integer proId);

	String selectNameById(Integer proId);

	List<Project> selectAllProjectList();

	int deleteByUsId(Integer usId);

	List<Project> selectGuiNaThesis(@Param("flg") Integer flg,@Param("xuyuan") String xuyuan, @Param("sex") Byte sex,
			@Param("duty") String duty, @Param("bigAge") Integer bigAge, @Param("smlAge") Integer smlAge,
			@Param("major") String major, @Param("bigProda") Date bigProda, @Param("smlProda") Date smlProda,
			@Param("proCate") String proCate, @Param("bigMoney") Integer bigMoney, @Param("smlMoney") Integer smlMoney,
			@Param("bigProUp") Date bigProUp, @Param("smlProUp") Date smlProUp);

	List<Project> selectProjectFind(@Param("usId") Integer usId, @Param("bigProda") Date bigProda, @Param("smlProda") Date smlProda,
			@Param("proCate") String proCate, @Param("bigMoney") Integer bigMoney, @Param("smlMoney") Integer smlMoney,
			@Param("bigProUp") Date bigProUp, @Param("smlProUp") Date smlProUp);

	List<Date> selectAllProjectFileName();

}