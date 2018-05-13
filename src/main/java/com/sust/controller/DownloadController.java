package com.sust.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sust.entity.AllInfo;
import com.sust.entity.Login;
import com.sust.service.DownloadService;

@Controller
@RequestMapping("/download")
public class DownloadController {

	private static final Log logger = LogFactory.getLog(DownloadController.class);
	@Resource
	private DownloadService downloadService;
	/**
	 * 下载不同类型单一文件
	 * @param session
	 * @param type
	 * @param id
	 * @param isFind
	 * @param rloe
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/downloadTypeFile")
	public ResponseEntity<byte[]> downloadTypeFile(HttpSession session, @RequestParam("type") String type,
			@RequestParam("id") String id, @RequestParam(value = "isFind", defaultValue = "no") String isFind,
			@RequestParam(value = "role", defaultValue = "USER") String rloe, HttpServletResponse response,
			HttpServletRequest request) {

		logger.info("downloadTypeFile++"+type+"++"+isFind+"++"+rloe);
		List<String> list = this.downloadService.getDownloadFile(session, type, id);
		if (list != null && !"NO_SUCH_FILE".equals(list.get(0))) {
			File dowenloadFile = new File(list.get(1));
			HttpHeaders headers = new HttpHeaders();
			String FielName = "";
			try {
				FielName = new String(list.get(0).getBytes("UTF-8"), "iso-8859-1");
			} catch (UnsupportedEncodingException e) {
				logger.error("downloadTypeFile_error");
			}
			headers.setContentDispositionFormData("attachment", FielName);
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			ResponseEntity<byte[]> entity = null;
			try {
				entity = new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(dowenloadFile), headers,
						HttpStatus.CREATED);
			} catch (IOException e) {
				logger.error("downloadTypeFile_ResponseEntity_error");
			}
			return entity;
		} else {
			String urlString = "";
			if ("no".equals(isFind)) {
				if ("USER".equals(rloe)) {
					switch (type) {
					case "patent":
						urlString = "/patent/getUserPaInfo";
						break;
					case "book":
						urlString = "/book/getUserBoList";
						break;
					case "praise":
						urlString = "/praise/getUserPraiseInfo";
						break;
					case "project":
						urlString = "/project/getUserProList";
						break;
					case "race":
						urlString = "/race/getUserRaceInfo";
						break;
					case "thesis":
						urlString = "/thesis/getUserThInfo";
						break;
					default:
						break;
					}
				} else {
					switch (type) {
					case "patent":
						urlString = "/patent/getAllPaInfo";
						break;
					case "book":
						urlString = "/book/getAllBoList";
						break;
					case "praise":
						urlString = "/praise/getAllPraiseInfo";
						break;
					case "project":
						urlString = "/project/getAllProList";
						break;
					case "race":
						urlString = "/race/getAllRaceInfo";
						break;
					case "thesis":
						urlString = "/thesis/getAllThInfo";
						break;
					default:
						break;
					}
				}
			} else {
				if ("USER".equals(rloe)) {
					switch (type) {
					case "patent":
						urlString = "/patent/getUserPage";
						break;
					case "book":
						urlString = "/book/getUserPage";
						break;
					case "praise":
						urlString = "/praise/getUserPage";
						break;
					case "project":
						urlString = "/project/getUserPage";
						break;
					case "race":
						urlString = "/race/getUserPage";
						break;
					case "thesis":
						urlString = "/thesis/getUserPage";
						break;
					default:
						break;
					}
				}else{
					switch (type) {
					case "patent":
						urlString = "/patent/getPage";
						break;
					case "book":
						urlString = "/book/getPage";
						break;
					case "praise":
						urlString = "/praise/getPage";
						break;
					case "project":
						urlString = "/project/getPage";
						break;
					case "race":
						urlString = "/race/getPage";
						break;
					case "thesis":
						urlString = "/thesis/getPage";
						break;
					default:
						break;
					}
				}
			}
			logger.info(urlString);
			try {
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("window.location='" + request.getContextPath() + urlString + "'");
				out.println("alert('没有此信息的电子文件，请及时上传！');");
				out.println("</script>");
				out.flush();
				out.close();
			} catch (IOException e) {
				logger.warn("没有此信息的电子文件！");
			}
			return null;
		}
	}
	/**
	 * 删除 不同类型文件
	 * @param id
	 * @param type
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/DeleteAllFile", method = RequestMethod.GET)
	@ResponseBody
	public AllInfo DeleteFile(@RequestParam("Id") int id, @RequestParam("type") String type, HttpSession session) {

		logger.info("DeleteFile++" + id + "++" + type);
		return new AllInfo(this.downloadService.DeleteUnusedFile(session, id, type));
	}
	/**
	 * 下载不同类型的数据Excel
	 * @param type
	 * @param session
	 * @return
	 */
	@RequestMapping("/downloadTypeExcl")
	public ResponseEntity<byte[]> downloadTypeExcl(@RequestParam("type") String type, HttpSession session) {

		Integer usId = ((Login) session.getAttribute("login")).getUsId();
		logger.info("downloadTypeExcl+" + usId + "++" + type);
		HttpHeaders headers = new HttpHeaders();
		String FileName = type + "Excl" + ".xls";
		try {
			FileName = new String(FileName.getBytes("UTF-8"), "iso-8859-1");
		} catch (UnsupportedEncodingException e) {
			logger.error("downloadTypeExcl_error");
		}
		headers.setContentDispositionFormData("attachment", FileName);
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		ResponseEntity<byte[]> entity = null;
		try {
			entity = new ResponseEntity<byte[]>(
					FileUtils.readFileToByteArray(this.downloadService.getWorkBookStream(usId, type, session, "PART")),
					headers, HttpStatus.CREATED);
		} catch (IOException e) {
			logger.error("downloadTypeExcl_ResponseEntity_error");
		}
		return entity;
	}
	/**
	 * 下载所有类型的Excel文档
	 * @param type
	 * @param session
	 * @return
	 */
	@RequestMapping("/downloadAllTypeExcl")
	public ResponseEntity<byte[]> downloadAllTypeExcl(@RequestParam("type") String type, HttpSession session) {

		Integer usId = ((Login) session.getAttribute("login")).getUsId();
		logger.info("downloadAllTypeExcl+" + usId + "++" + type);
		HttpHeaders headers = new HttpHeaders();
		String FileName = "All" + type + "Excl" + ".xls";
		try {
			FileName = new String(FileName.getBytes("UTF-8"), "iso-8859-1");
		} catch (UnsupportedEncodingException e) {
			logger.error("downloadAllTypeExcl_error");
		}
		headers.setContentDispositionFormData("attachment", FileName);
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		ResponseEntity<byte[]> entity = null;
		try {
			entity = new ResponseEntity<byte[]>(
					FileUtils.readFileToByteArray(this.downloadService.getWorkBookStream(usId, type, session, "ALL")),
					headers, HttpStatus.CREATED);
		} catch (IOException e) {
			logger.error("downloadAllTypeExcl_ResponseEntity_error");
		}
		return entity;
	}
	/**
	 * 下载不同类型信息Excel模板
	 * @param type
	 * @param session
	 * @return
	 */
	@RequestMapping("/downloadExcelTemplets")
	public ResponseEntity<byte[]> downloadExcelTemplets(@RequestParam("type") String type, HttpSession session) {

		Integer usId = ((Login) session.getAttribute("login")).getUsId();
		logger.info("downloadExcelTemplets+" + usId + "++" + type);
		HttpHeaders headers = new HttpHeaders();
		String FileName = "Templets" + type + "Excl" + ".xls";
		try {
			FileName = new String(FileName.getBytes("UTF-8"), "iso-8859-1");
		} catch (UnsupportedEncodingException e) {
			logger.error("downloadTypeExcl_error");
		}
		headers.setContentDispositionFormData("attachment", FileName);
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		ResponseEntity<byte[]> entity = null;
		try {
			entity = new ResponseEntity<byte[]>(
					FileUtils.readFileToByteArray(
							this.downloadService.getWorkBookStream(usId, type, session, "TEMPLET")),
					headers, HttpStatus.CREATED);
		} catch (IOException e) {
			logger.error("downloadTypeExcl_ResponseEntity_error");
		}
		return entity;
	}
	/**
	 * 下载不同类型下的所有文件
	 * @param type
	 * @param session
	 * @return
	 */
	@RequestMapping("/downloadTypeZipFiles")
	public ResponseEntity<byte[]> downloadTypeFiles(@RequestParam("type") String type, HttpSession session) {

		logger.info("downloadTypeFiles+" + type);
		HttpHeaders headers = new HttpHeaders();
		String FileName = type + "Info.zip";
		try {
			FileName = new String(FileName.getBytes("UTF-8"), "iso-8859-1");
		} catch (UnsupportedEncodingException e) {
			logger.error("downloadTypeFiles_error");
		}
		headers.setContentDispositionFormData("attachment", FileName);
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		ResponseEntity<byte[]> entity = null;
		try {
			entity = new ResponseEntity<byte[]>(
					FileUtils.readFileToByteArray(
							this.downloadService.getFileStream(type, session)),
					headers, HttpStatus.CREATED);
		} catch (IOException e) {
			logger.error("downloadTypeFiles_ResponseEntity_error");
		}
		return entity;
	}
}
