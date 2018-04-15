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
import com.sust.service.DownloadService;

@Controller
@RequestMapping("/download")
public class DownloadController {

	private static final Log logger = LogFactory.getLog(DownloadController.class);
	@Resource
	private DownloadService downloadService;

	@RequestMapping(value = "/downloadTypeFile")
	public ResponseEntity<byte[]> downloadTypeFile(HttpSession session, @RequestParam("type") String type,
			@RequestParam("id") String id, HttpServletResponse response, HttpServletRequest request) {

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

	@RequestMapping(value = "/DeleteAllFile", method = RequestMethod.GET)
	@ResponseBody
	public AllInfo DeleteFile(@RequestParam("Id") int id, @RequestParam("type") String type, HttpSession session) {

		logger.info("DeleteFile++" + id + "++" + type);
		return new AllInfo(this.downloadService.DeleteUnusedFile(session, id, type));
	}
	
	@RequestMapping(value = "/downloadTypeExcl", method = RequestMethod.GET)
	@ResponseBody
	public AllInfo downloadTypeExcl(@RequestParam("usId") int usId, @RequestParam("type") String type){
		
		
		return new AllInfo("downloadTypeExcl_OK");
	}
	

}
