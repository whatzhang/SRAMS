package com.sust.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sust.entity.MyConfig;

@Controller
@RequestMapping("/download")
public class DownloadController {

	private static final Log logger = LogFactory.getLog(DownloadController.class);

	@Autowired
	private MyConfig config;

	@RequestMapping(value = "/download")
	public ResponseEntity<byte[]> downloadUserBookExcl(HttpServletRequest request,
			@RequestParam("filename") String filename, Model model) {

		String path = request.getServletContext().getRealPath("/images/");
		File file = new File(path + File.separator + filename);
		HttpHeaders headers = new HttpHeaders();
		String downloadFielName = null;
		try {
			downloadFielName = new String(filename.getBytes("UTF-8"), "iso-8859-1");
		} catch (UnsupportedEncodingException e) {
			logger.error("downloadUserBookExcl_error"+config.DOWNLOAD_URL);
		}
		headers.setContentDispositionFormData("attachment", downloadFielName);
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		ResponseEntity<byte[]> RE = null;
		try {
			RE = new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
		} catch (IOException e) {
			logger.error("downloadUserBookExcl_ResponseEntity_error");
		}
		return RE;
	}
}
