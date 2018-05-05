package com.sust.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.sust.entity.Book;
import com.sust.entity.Patent;
import com.sust.entity.Praise;
import com.sust.entity.Project;
import com.sust.entity.Race;
import com.sust.entity.Thesis;

public interface DownloadService {

	List<String> getDownloadFile(HttpSession session, String type, String id);

	String DeleteUnusedFile(HttpSession session, int id, String type);

	File getWorkBookStream(int usId, String type, HttpSession session, String flg);

	File getGuiNaWorkBookStreamTh(String type, List<Thesis> thesisList, HttpSession session);

	File getGuiNaWorkBookStreamPa(String type, List<Patent> patentList, HttpSession session);

	File getGuiNaWorkBookStreamPr(String type, List<Praise> praiseList, HttpSession session);

	File getGuiNaWorkBookStreamPro(String type, List<Project> projectList, HttpSession session);

	File getGuiNaWorkBookStreamBo(String type, List<Book> bookList, HttpSession session);

	File getGuiNaWorkBookStreamRa(String type, List<Race> raceList, HttpSession session);

}
