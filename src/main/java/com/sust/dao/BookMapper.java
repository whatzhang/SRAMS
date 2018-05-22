package com.sust.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.sust.entity.Book;

@Repository
public interface BookMapper {
	int deleteByPrimaryKey(Integer boId);

	int insert(Book record);

	int insertSelective(Book record);

	Book selectByPrimaryKey(Integer boId);

	int updateByPrimaryKeySelective(Book record);

	int updateByPrimaryKey(Book record);

	String selectUserNameById(Integer usId);

	List<Book> selectBookList(Integer usId);

	void updateUpTime(@Param("boUptime") Date boUptime, @Param("boId") Integer boId);

	Date selectUpTimeByKey(Integer boId);

	String selectNameById(Integer boId);

	List<Book> selectAllBoList();

	int deleteByUsId(Integer usId);

	List<Book> selectGuiNaBook(@Param("flg") Integer flg,@Param("xuyuan") String xuyuan, @Param("sex") Byte sex,
			@Param("duty") String duty, @Param("bigAge") Integer bigAge, @Param("smlAge") Integer smlAge,
			@Param("major") String major, @Param("bigBoda") Date bigBoda, @Param("smlBoda") Date smlBoda,
			@Param("boCate") String boCate, @Param("bigFont") Integer bigFont, @Param("smlFont") Integer smlFont,
			@Param("bigBoUp") Date bigBoUp, @Param("smlBoUp") Date smlBoUp);

	List<Book> selectBookFind(@Param("usId") Integer usId, @Param("bigBoda") Date bigBoda, @Param("smlBoda") Date smlBoda,
			@Param("boCate") String boCate, @Param("bigFont") Integer bigFont, @Param("smlFont") Integer smlFont,
			@Param("bigBoUp") Date bigBoUp, @Param("smlBoUp") Date smlBoUp);

	List<Date> selectAllBoFileName();

	int selectSexNumber(@Param("usSex") Byte usSex);
	
	int selectXueYuanNum(@Param("usAcademy") String usAcademy);
	
	int selectTimeNum(@Param("Year") Integer Year);

	int selectCateNum(@Param("boCate") String boCate);

	int selectCateNumByFont(@Param("smlFont") Integer smlFont, @Param("bigFont") Integer bigFont);
}