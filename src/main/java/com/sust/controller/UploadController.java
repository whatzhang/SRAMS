package com.sust.controller;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.sust.entity.AllInfo;
import com.sust.entity.MyConfig;
import com.sust.other.MyUtils;
import com.sust.service.UploadService;

@Controller
@RequestMapping("/upload")
public class UploadController {

	//private static final Log logger = LogFactory.getLog(UploadController.class);
	@Resource
	private UploadService uploadService;
	@Autowired
	private MyConfig config;
	
	/*@RequestMapping("uploadFile")
    public void  UploadUserTypeFile(@RequestParam("ID") String id, @RequestParam("type") String type, @RequestParam("upfile") CommonsMultipartFile file, HttpSession session) {
		this.uploadService.UploadUserTypeFile(Integer.valueOf(id), file, type, session.getServletContext().getRealPath(config.UPLOADE_URL));
    }*/
	
	@RequestMapping("/uploadFileAjax")  
    @ResponseBody
    public AllInfo uploadFileAjax(@RequestParam("ID") Integer id, @RequestParam("upfile") CommonsMultipartFile file, @RequestParam("type") String type, HttpSession session) { 
       
		MyUtils.CreatDir(new File(session.getServletContext().getRealPath(config.UPLOADE_URL)));
		return new AllInfo(this.uploadService.UploadUserTypeFile(id, file, type, session.getServletContext().getRealPath(config.UPLOADE_URL)));  
    } 
}
