package com.sust.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.sust.entity.MeStatus;

@Repository
public interface MeStatusMapper {
	int deleteByPrimaryKey(Integer stId);

	int insert(MeStatus record);

	int insertSelective(MeStatus record);

	MeStatus selectByPrimaryKey(Integer stId);

	int updateByPrimaryKeySelective(MeStatus record);

	int updateByPrimaryKey(MeStatus record);

	int updateSetReadStatus(@Param("meId") Integer meId, @Param("usId") Integer usId);

	int updateSetNoReadStatus(@Param("meId") Integer meId, @Param("usId") Integer usId);

	int updateSetDelStatus(@Param("meId") Integer meId, @Param("usId") Integer usId);
}