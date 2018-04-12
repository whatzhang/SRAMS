package com.sust.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.sust.entity.MyConfig;

@Controller
@RequestMapping("/upload")
public class UploadController {

	private static final Log logger = LogFactory.getLog(UploadController.class);
	
	@Autowired
	private MyConfig config;
	
	@RequestMapping("uploadFile")
    public String  UploadUserTypeFile(@RequestParam("type") String type, @RequestParam("upFile") CommonsMultipartFile file, HttpSession session) {

		logger.info("UploadUserTypeFile++"+type+"++"+file.getOriginalFilename());
        String path= session.getServletContext().getRealPath(config.UPLOADE_URL) + new Date().getTime()+file.getOriginalFilename();
        logger.info(path); 
        File newFile=new File(path);
        try {
			file.transferTo(newFile);
		} catch (IllegalStateException | IOException e) {
			logger.error("UploadUserTypeFile_error");
		}
        return "users/book"; 
    }
}
