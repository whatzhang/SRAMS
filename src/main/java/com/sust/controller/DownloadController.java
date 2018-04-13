package com.sust.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
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
import org.springframework.web.bind.annotation.RequestParam;

import com.sust.service.DownloadService;

@Controller
@RequestMapping("/download")
public class DownloadController {

	private static final Log logger = LogFactory
			.getLog(DownloadController.class);
	@Resource
	private DownloadService downloadService;

	@RequestMapping(value = "/downloadTypeFile")
	public ResponseEntity<byte[]> downloadTypeFile(HttpSession session,
			@RequestParam("type") String type, @RequestParam("id") String id) {

		List<String> list = this.downloadService.getDownloadFile(session, type, id);
		if (list != null) {
			File dowenloadFile = new File(list.get(1));

			HttpHeaders headers = new HttpHeaders();
			String FielName = "";
			try {
				FielName = new String(list.get(0).getBytes("UTF-8"),"iso-8859-1");
			} catch (UnsupportedEncodingException e) {
				logger.error("downloadTypeFile_error");
			}
			headers.setContentDispositionFormData("attachment", FielName);
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			ResponseEntity<byte[]> entity = null;
			try {
				entity = new ResponseEntity<byte[]>(
						FileUtils.readFileToByteArray(dowenloadFile), headers,
						HttpStatus.CREATED);
			} catch (IOException e) {
				logger.error("downloadTypeFile_ResponseEntity_error");
			}
			return entity;
		} else {
			return null;
		}
	}
	/*
	 * @RequestMapping("/testHttpMessageDown") public ResponseEntity<byte[]>
	 * download(HttpServletRequest request) throws IOException { File file = new
	 * File("E://123.jpg"); byte[] body = null; InputStream is = new
	 * FileInputStream(file); body = new byte[is.available()]; is.read(body);
	 * HttpHeaders headers = new HttpHeaders();
	 * headers.add("Content-Disposition", "attchement;filename=" +
	 * file.getName()); HttpStatus statusCode = HttpStatus.OK;
	 * ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(body, headers,
	 * statusCode); return entity; }
	 */
}
