package com.sust.service;

import java.util.List;

import javax.servlet.http.HttpSession;

public interface DownloadService {

	List<String> getDownloadFile(HttpSession session, String type, String id);
}
