package com.sust.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.sust.entity.Praise;

@Repository
public interface PraiseMapper {
	int deleteByPrimaryKey(Integer prId);

	int insert(Praise record);

	int insertSelective(Praise record);

	Praise selectByPrimaryKey(Integer prId);

	int updateByPrimaryKeySelective(Praise record);

	int updateByPrimaryKey(Praise record);

	List<Praise> selectUserPraiseInfo(Integer usId);

	String selectUserNameById(Integer usId);

	void updateUpTime(@Param("prUptime") Date prUptime, @Param("prId") Integer prId);

	Date selectUpTimeByKey(Integer prId);

	String selectNameById(Integer prId);

	List<Praise> selectAllPraiseInfo();

	int deleteByUsId(Integer usId);

	List<Praise> selectGuiNaPraise(@Param("flg") Integer flg,@Param("xuyuan") String xuyuan, @Param("sex") Byte sex,
			@Param("duty") String duty, @Param("bigAge") Integer bigAge, @Param("smlAge") Integer smlAge,
			@Param("major") String major, @Param("bigPrda") Date bigPrda, @Param("smlPrda") Date smlPrda,
			@Param("PrCate") String PrCate,@Param("bigPrUp") Date bigPrUp, @Param("smlPrUp") Date smlPrUp);

	List<Praise> selectPraiseFind(@Param("usId") Integer usId, @Param("bigPrda") Date bigPrda, @Param("smlPrda") Date smlPrda,
			@Param("PrCate") String PrCate,@Param("bigPrUp") Date bigPrUp, @Param("smlPrUp") Date smlPrUp);

	List<Date> selectAllPraiseFileName();
}