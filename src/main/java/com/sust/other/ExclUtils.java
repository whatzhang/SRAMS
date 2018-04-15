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

public final class ExclUtils {

	private static final Log logger = LogFactory.getLog(ExclUtils.class);

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
		// 创建第一个sheet（页），并命名
		Sheet sheet = wb.createSheet(list.get(0).get("sheetName").toString());
		logger.info("createWorkBook++" + list.get(0).get("sheetName").toString());
		// 手动设置列宽。第一个参数表示要为第几列设；，第二个参数表示列的宽度，n为列高的像素数。
		for (int i = 0; i < keys.length; i++) {
			sheet.setColumnWidth((short) i, (short) (35.7 * 200));
		}

		// 创建第一行
		Row row = sheet.createRow((short) 0);

		// 创建两种单元格格式
		CellStyle cs = wb.createCellStyle();
		CellStyle cs2 = wb.createCellStyle();

		// 创建两种字体
		Font f = wb.createFont();
		Font f2 = wb.createFont();

		// 创建第一种字体样式（用于列名）
		f.setFontHeightInPoints((short) 10);
		f.setColor(IndexedColors.BLACK.getIndex());
		f.setBoldweight(Font.BOLDWEIGHT_BOLD);

		// 创建第二种字体样式（用于值）
		f2.setFontHeightInPoints((short) 10);
		f2.setColor(IndexedColors.BLACK.getIndex());
        logger.info("8888");
		// Font f3=wb.createFont();
		// f3.setFontHeightInPoints((short) 10);
		// f3.setColor(IndexedColors.RED.getIndex());

		// 设置第一种单元格的样式（用于列名）
		cs.setFont(f);
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
		// 设置列名
		for (int i = 0; i < columnNames.length; i++) {
			Cell cell = row.createCell(i);
			cell.setCellValue(columnNames[i]);
			cell.setCellStyle(cs);
		}
		// 设置每行每列的值
		for (short i = 1; i < list.size(); i++) {
			// Row 行,Cell 方格 , Row 和 Cell 都是从0开始计数的
			// 创建一行，在页sheet上
			Row row1 = sheet.createRow((short) i);
			// 在row行上创建一个方格
			for (short j = 0; j < keys.length; j++) {
				Cell cell = row1.createCell(j);
				cell.setCellValue(list.get(i).get(keys[j]) == null ? " " : list.get(i).get(keys[j]).toString());
				cell.setCellStyle(cs2);
			}
		}
		return wb;
	}

	public static List<Map<String, Object>> createExcelPatent(List<Patent> list) {

		List<Map<String, Object>> listmap = new ArrayList<Map<String, Object>>();
	        Map<String, Object> map = new HashMap<String, Object>();
	        map.put("sheetName", "sheet1");
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
        map.put("sheetName", "sheet1");
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
        map.put("sheetName", "sheet1");
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
        map.put("sheetName", "sheet1");
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
        map.put("sheetName", "sheet1");
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
        map.put("sheetName", "sheet1");
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
}
