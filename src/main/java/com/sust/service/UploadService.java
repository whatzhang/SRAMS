package com.sust.service;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public interface UploadService {

	String UploadUserTypeFile(Integer id, CommonsMultipartFile file, String type, String realPath);

}
