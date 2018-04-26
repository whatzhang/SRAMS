package com.sust.other;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import com.sust.entity.Book;
import com.sust.entity.Patent;
import com.sust.entity.Praise;
import com.sust.entity.Project;
import com.sust.entity.Race;
import com.sust.entity.Thesis;
import com.sust.entity.Users;

public final class ExclUtils {

	private static final Log logger = LogFactory.getLog(ExclUtils.class);

	public static CellStyle[] getExcelStyle(Workbook wb) {

		// 创建两种单元格格式
		CellStyle cs = wb.createCellStyle();
		CellStyle cs2 = wb.createCellStyle();

		// 创建两种字体
		Font f1 = wb.createFont();
		Font f2 = wb.createFont();

		// 创建第一种字体样式（用于列名）
		f1.setFontHeightInPoints((short) 10);
		f1.setColor(IndexedColors.BLACK.getIndex());
		f1.setBoldweight(Font.BOLDWEIGHT_BOLD);

		// 创建第二种字体样式（用于值）
		f2.setFontHeightInPoints((short) 10);
		f2.setColor(IndexedColors.BLACK.getIndex());

		// 设置第一种单元格的样式（用于列名）
		cs.setFont(f1);
		cs.setBorderLeft(CellStyle.BORDER_THIN);
		cs.setBorderRight(CellStyle.BORDER_THIN);
		cs.setBorderTop(CellStyle.BORDER_THIN);
		cs.setBorderBottom(CellStyle.BORDER_THIN);
		cs.setAlignment(CellStyle.ALIGN_CENTER);

		// 设置第二种单元格的样式（用于值）
		cs2.setFont(f2);
		cs2.setBorderLeft(CellStyle.BORDER_THIN);
		cs2.setBorderRight(CellStyle.BORDER_THIN);
		cs2.setBorderTop(CellStyle.BORDER_THIN);
		cs2.setBorderBottom(CellStyle.BORDER_THIN);
		cs2.setAlignment(CellStyle.ALIGN_CENTER);

		CellStyle[] ces = { cs, cs2 };
		return ces;
	}

	/**
	 * 创建excel文档， list 数据
	 * 
	 * @param keys
	 *            list中map的key数组集合
	 * @param columnNames
	 *            excel的列名
	 */
	public static Workbook createWorkBook(List<Map<String, Object>> list, String[] keys, String columnNames[]) {
		// 创建excel工作簿
		Workbook wb = new HSSFWorkbook();
		CellStyle aa1 = getExcelStyle(wb)[0];
		CellStyle aa2 = getExcelStyle(wb)[1];
		// 创建第一个sheet（页），并命名
		Sheet sheet = wb.createSheet(list.get(0).get("sheetName").toString());
		logger.info("createWorkBook++" + list.get(0).get("sheetName").toString());
		// 手动设置列宽。第一个参数表示要为第几列设；，第二个参数表示列的宽度，n为列高的像素数。
		for (int i = 0; i < keys.length; i++) {
			sheet.setColumnWidth((short) i, (short) (35.7 * 200));
		}

		// 创建第一行
		Row row = sheet.createRow((short) 0);

		// 设置列名
		for (int i = 0; i < columnNames.length; i++) {
			Cell cell = row.createCell(i);
			cell.setCellValue(columnNames[i]);
			cell.setCellStyle(aa1);
		}
		if (!list.isEmpty() || list != null) {
			// 设置每行每列的值
			for (short i = 1; i < list.size(); i++) {
				// Row 行,Cell 方格 , Row 和 Cell 都是从0开始计数的
				// 创建一行，在页sheet上
				Row row1 = sheet.createRow((short) i);
				// 在row行上创建一个方格
				for (short j = 0; j < keys.length; j++) {
					Cell cell = row1.createCell(j);
					cell.setCellValue(list.get(i).get(keys[j]) == null ? " " : list.get(i).get(keys[j]).toString());
					cell.setCellStyle(aa2);
				}
			}
		}
		return wb;
	}

	public static List<Map<String, Object>> createExcelPatent(List<Patent> list) {

		List<Map<String, Object>> listmap = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sheetName", "patent");
		listmap.add(map);
		for (int j = 0; j < list.size(); j++) {
			Patent patent = list.get(j);
			Map<String, Object> mapValue = new HashMap<String, Object>();
			mapValue.put("paId", j);
			mapValue.put("paName", patent.getPaName());
			mapValue.put("paCategory", patent.getPaCategory());
			mapValue.put("paAuthor", patent.getPaAuthor());
			mapValue.put("paPlease", patent.getPaPlease().toString());
			mapValue.put("paDate", patent.getPaDate().toString());
			mapValue.put("paNumber", patent.getPaNumber());
			mapValue.put("paAbout", patent.getPaAbout());
			mapValue.put("paUptime", patent.getPaUptime());
			listmap.add(mapValue);
		}
		return listmap;
	}

	public static List<Map<String, Object>> createExcelBook(List<Book> list) {

		List<Map<String, Object>> listmap = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sheetName", "book");
		listmap.add(map);
		for (int j = 0; j < list.size(); j++) {
			Book book = list.get(j);
			Map<String, Object> mapValue = new HashMap<String, Object>();
			mapValue.put("boId", j);
			mapValue.put("boName", book.getBoName());
			mapValue.put("boCategory", book.getBoCategory());
			mapValue.put("boDate", book.getBoDate().toString());
			mapValue.put("boEditor", book.getBoEditor());
			mapValue.put("boEditor2", book.getBoEditor2());
			mapValue.put("boFont", book.getBoFont());
			mapValue.put("boPublish", book.getBoPublish());
			mapValue.put("boAbout", book.getBoAbout());
			mapValue.put("boUptime", book.getBoUptime());
			listmap.add(mapValue);
		}
		return listmap;
	}

	public static List<Map<String, Object>> createExcelPraise(List<Praise> list) {
		List<Map<String, Object>> listmap = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sheetName", "praise");
		listmap.add(map);
		for (int j = 0; j < list.size(); j++) {
			Praise praise = list.get(j);
			Map<String, Object> mapValue = new HashMap<String, Object>();
			mapValue.put("prId", j);
			mapValue.put("prName", praise.getPrName());
			mapValue.put("prCategory", praise.getPrCategory());
			mapValue.put("prDate", praise.getPrDate().toString());
			mapValue.put("prUnit", praise.getPrUnit());
			mapValue.put("prAuthor", praise.getPrAuthor());
			mapValue.put("prAbout", praise.getPrAbout());
			mapValue.put("prUptime", praise.getPrUptime());
			listmap.add(mapValue);
		}
		return listmap;
	}

	public static List<Map<String, Object>> createExcelProject(List<Project> list) {
		List<Map<String, Object>> listmap = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sheetName", "project");
		listmap.add(map);
		for (int j = 0; j < list.size(); j++) {
			Project project = list.get(j);
			Map<String, Object> mapValue = new HashMap<String, Object>();
			mapValue.put("proId", j);
			mapValue.put("proName", project.getProName());
			mapValue.put("proCategory", project.getProCategory());
			mapValue.put("proDate", project.getProDate().toString());
			mapValue.put("proCash", project.getProCash());
			mapValue.put("proLeader", project.getProLeader());
			mapValue.put("proTeam", project.getProTeam());
			mapValue.put("proAbout", project.getProAbout());
			mapValue.put("proUptime", project.getProUptime());
			listmap.add(mapValue);
		}
		return listmap;
	}

	public static List<Map<String, Object>> createExcelRace(List<Race> list) {
		List<Map<String, Object>> listmap = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sheetName", "race");
		listmap.add(map);
		for (int j = 0; j < list.size(); j++) {
			Race race = list.get(j);
			Map<String, Object> mapValue = new HashMap<String, Object>();
			mapValue.put("raId", j);
			mapValue.put("raName", race.getRaName());
			mapValue.put("raCategory", race.getRaCategory());
			mapValue.put("raType", race.getRaType());
			mapValue.put("raAuthor", race.getRaAuthor());
			mapValue.put("raLevel", race.getRaLevel());
			mapValue.put("raTeacher", race.getRaTeacher());
			mapValue.put("raDate", race.getRaDate().toString());
			mapValue.put("raAbout", race.getRaAbout());
			mapValue.put("raUptime", race.getRaUptime());
			listmap.add(mapValue);
		}
		return listmap;
	}

	public static List<Map<String, Object>> createExcelThesis(List<Thesis> list) {
		List<Map<String, Object>> listmap = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sheetName", "thesis");
		listmap.add(map);
		for (int j = 0; j < list.size(); j++) {
			Thesis thesis = list.get(j);
			Map<String, Object> mapValue = new HashMap<String, Object>();
			mapValue.put("thId", j);
			mapValue.put("thName", thesis.getThName());
			mapValue.put("thCategory", thesis.getThCategory());
			mapValue.put("thAuthor", thesis.getThAuthor());
			mapValue.put("thDate", thesis.getThDate().toString());
			mapValue.put("thLevel", thesis.getThLevel());
			mapValue.put("thFactor", thesis.getThFactor());
			mapValue.put("thIncluded", thesis.getThIncluded());
			mapValue.put("thNumber", thesis.getThNumber());
			mapValue.put("thJournal", thesis.getThJournal());
			mapValue.put("thPage", thesis.getThPage());
			mapValue.put("thAbout", thesis.getThAbout());
			mapValue.put("thUptime", thesis.getThUptime());
			listmap.add(mapValue);
		}
		return listmap;
	}

	public static List<Map<String, Object>> createExcelUsers(List<Users> list) {

		List<Map<String, Object>> listmap = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sheetName", "AllUsers");
		listmap.add(map);
		for (int j = 0; j < list.size(); j++) {
			Users user = list.get(j);
			Map<String, Object> mapValue = new HashMap<String, Object>();
			mapValue.put("usId", j);
			mapValue.put("usName", user.getUsName());
			mapValue.put("usAge", user.getUsAge());
			mapValue.put("usSex", user.getUsSex());
			mapValue.put("usBirthday", user.getUsBirthday());
			mapValue.put("usNum", user.getUsNum());
			mapValue.put("usDuty", user.getUsDuty());
			mapValue.put("usMajor", user.getUsMajor());
			mapValue.put("usAddress", user.getUsAddress());
			mapValue.put("usMail", user.getUsMail());
			mapValue.put("usPhone", user.getUsPhone());
			mapValue.put("usAcademy", user.getUsAcademy());
			listmap.add(mapValue);
		}
		return listmap;
	}

	public static List<Map<String, Object>> createExcelTemplets(String type) {

		List<Map<String, Object>> listmap = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = new HashMap<String, Object>();
		switch (type) {
		case "patent":
			map.put("sheetName", "patent");
			break;
		case "book":
			map.put("sheetName", "book");
			break;
		case "praise":
			map.put("sheetName", "praise");
			break;
		case "project":
			map.put("sheetName", "project");
			break;
		case "race":
			map.put("sheetName", "race");
			break;
		case "thesis":
			map.put("sheetName", "thesis");
			break;
		case "user":
			map.put("sheetName", "user");
			break;
		case "typeData":
			map.put("sheetName1", "patent");
			map.put("sheetName2", "book");
			map.put("sheetName3", "praise");
			map.put("sheetName4", "project");
			map.put("sheetName5", "race");
			map.put("sheetName6", "thesis");
			map.put("sheetName7", "user");
			break;
		default:
			break;
		}
		listmap.add(map);
		return listmap;
	}

	public static Workbook createWorkBookAllSheet(List<Map<String, Object>> list, List<String[]> key,
			List<String[]> columnName) {
		// 创建excel工作簿
		Workbook wb = new HSSFWorkbook();
		// 创建两种单元格格式
		CellStyle aa1 = getExcelStyle(wb)[0];
		// 创建sheet
		int s = 0;
		for (int i = 0; i < list.size(); i++) {
			for (Map.Entry<String, Object> entry : list.get(i).entrySet()) {

				Sheet sheet = wb.createSheet(entry.getValue().toString());
				logger.info("createWorkBook++" + s + "++" + entry.getKey() + ":" + entry.getValue().toString());

				Row row = sheet.createRow((short) 0);
				// 手动设置列宽,第一个参数表示要为第几列设,第二个参数表示列的宽度，n为列高的像素数。
				for (int j = 0; j < key.get(i).length; j++) {
					sheet.setColumnWidth((short) j, (short) (35.7 * 200));
				}
				// 设置列名
				for (int k = 0; k < columnName.get(s).length; k++) {
					Cell cell = row.createCell(k);
					cell.setCellValue(columnName.get(s)[k]);
					cell.setCellStyle(aa1);
				}
				s++;
			}
		}
		return wb;
	}

	public static List<List<Map<String, Object>>> createExcelAllInfo(List<Patent> PaList, List<Book> BoList,
			List<Praise> PrList, List<Project> ProList, List<Race> RaceList, List<Thesis> ThList,
			List<Users> UserList) {

		List<List<Map<String, Object>>> listmap = new ArrayList<List<Map<String, Object>>>();
		listmap.add(0, createExcelPatent(PaList));
		listmap.add(1, createExcelBook(BoList));
		listmap.add(2, createExcelPraise(PrList));
		listmap.add(3, createExcelProject(ProList));
		listmap.add(4, createExcelRace(RaceList));
		listmap.add(5, createExcelThesis(ThList));
		listmap.add(6, createExcelUsers(UserList));
		return listmap;
	}

	public static Workbook createWorkBookAllData(List<List<Map<String, Object>>> list, List<String[]> key,
			List<String[]> columnName) {
		// 创建excel工作簿
		Workbook wb = new HSSFWorkbook();
		CellStyle aa1 = getExcelStyle(wb)[0];
		CellStyle aa2 = getExcelStyle(wb)[1];
		// 创建sheet
		for (int i = 0; i < list.size(); i++) {
			Sheet sheet = null;
			int s = 0;
			for (int f = 0; f < list.get(i).size(); f++) {
				for (Map.Entry<String, Object> entry : list.get(i).get(f).entrySet()) {

					if (s == 0) {
						sheet = wb.createSheet(entry.getValue().toString());
						logger.info("createWorkBook++" + s + "++" + entry.getKey() + ":" + entry.getValue().toString());
					}
					if (sheet != null) {
						for (int q = 0; q < key.get(i).length; q++) {
							sheet.setColumnWidth((short) q, (short) (35 * 200));
						}
						Row row = sheet.createRow((short) 0);

						// 设置列名
						for (int k = 0; k < columnName.get(i).length; k++) {
							Cell cell = row.createCell(k);
							cell.setCellValue(columnName.get(i)[k]);
							cell.setCellStyle(aa1);
						}
						// 加数据
						for (int g = f + 1; g < list.get(i).size(); g++) {
							// 创建一行，在页sheet上
							Row row1 = sheet.createRow((short) g);
							// 在row行上创建一个方格
							for (short j = 0; j < key.get(i).length; j++) {
								Cell cell = row1.createCell(j);
								cell.setCellValue(list.get(i).get(f).get(key.get(i)[j]) == null ? " "
										: list.get(i).get(f).get(key.get(i)[j]).toString());
								cell.setCellStyle(aa2);
							}
						}
						s++;
					}
				}
			}
		}
		return wb;
	}

}
