package com.sust.other;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import net.lingala.zip4j.core.ZipFile;
import net.lingala.zip4j.exception.ZipException;
import net.lingala.zip4j.io.ZipOutputStream;
import net.lingala.zip4j.model.FileHeader;
import net.lingala.zip4j.model.ZipParameters;
import net.lingala.zip4j.util.Zip4jConstants;

public final class ZipUtil {

	private static final Log logger = LogFactory.getLog(ZipUtil.class);

	/**
	 * 单文件压缩
	 * 
	 * @param filePath
	 * @param toFilePath
	 */
	public static void zipFile(String filePath, String toFilePath) {

		ZipFile zipFile = null;
		File singleFile = new File(filePath);
		try {
			zipFile = new ZipFile(toFilePath);
		} catch (ZipException e1) {
			logger.error("创建压缩目的文件失败！");
		}
		ZipParameters parameters = new ZipParameters();
		parameters.setCompressionMethod(Zip4jConstants.COMP_DEFLATE);
		parameters.setCompressionLevel(Zip4jConstants.DEFLATE_LEVEL_NORMAL);
		try {
			zipFile.addFile(singleFile, parameters);
		} catch (ZipException e) {
			logger.error("压缩文件失败！");
		}
	}

	/**
	 * 单文件压缩返回文件
	 * 
	 * @param filePath
	 * @param toFilePath
	 * @return
	 */
	public static ZipFile zipFileReturZipFile(String filePath, String toFilePath) {

		ZipFile zipFile = null;
		File singleFile = new File(filePath);
		try {
			zipFile = new ZipFile(toFilePath);
		} catch (ZipException e1) {
			logger.error("创建压缩目的文件失败！");
		}
		ZipParameters parameters = new ZipParameters();
		parameters.setCompressionMethod(Zip4jConstants.COMP_DEFLATE);
		parameters.setCompressionLevel(Zip4jConstants.DEFLATE_LEVEL_NORMAL);
		try {
			zipFile.addFile(singleFile, parameters);
		} catch (ZipException e) {
			logger.error("压缩文件失败！");
		}
		return zipFile;
	}

	/**
	 * 多文件压缩
	 * 
	 * @param filePath
	 * @param toFilePath
	 */
	public static void zipFiles(ArrayList<File> fileList, String toFilePath) {

		ZipFile zipFile = null;
		try {
			zipFile = new ZipFile(toFilePath);
		} catch (ZipException e1) {
			logger.error("创建压缩目的文件失败！");
		}
		ZipParameters parameters = new ZipParameters();
		parameters.setCompressionMethod(Zip4jConstants.COMP_DEFLATE);
		parameters.setCompressionLevel(Zip4jConstants.DEFLATE_LEVEL_NORMAL);
		try {
			zipFile.addFiles(fileList, parameters);
		} catch (ZipException e) {
			logger.error("压缩文件失败！");
		}
	}

	/**
	 * 多文件压缩返回文件
	 * 
	 * @param filePath
	 * @param toFilePath
	 * @return
	 */
	public static ZipFile zipFilesReturnZipFile(ArrayList<File> fileList, String toFilePath) {

		ZipFile zipFile = null;
		try {
			zipFile = new ZipFile(toFilePath);
		} catch (ZipException e1) {
			logger.error("创建压缩目的文件失败！");
		}
		ZipParameters parameters = new ZipParameters();
		parameters.setCompressionMethod(Zip4jConstants.COMP_DEFLATE);
		parameters.setCompressionLevel(Zip4jConstants.DEFLATE_LEVEL_NORMAL);
		try {
			zipFile.addFiles(fileList, parameters);
		} catch (ZipException e) {
			logger.error("压缩文件失败！");
		}
		return zipFile;
	}

	/**
	 * 设置密码压缩
	 * 
	 * @param filePath
	 * @param toFilePath
	 * @param password
	 */
	public static void zipFiles(ArrayList<File> fileList, String toFilePath, String password) {

		ZipFile zipFile = null;
		try {
			zipFile = new ZipFile(toFilePath);
		} catch (ZipException e1) {
			logger.error("创建压缩目的文件失败！");
		}
		ZipParameters parameters = new ZipParameters();
		parameters.setCompressionMethod(Zip4jConstants.COMP_DEFLATE);
		parameters.setCompressionLevel(Zip4jConstants.DEFLATE_LEVEL_NORMAL);
		parameters.setEncryptFiles(true);
		parameters.setEncryptionMethod(Zip4jConstants.ENC_METHOD_STANDARD);
		parameters.setPassword(password);
		try {
			zipFile.addFiles(fileList, parameters);
		} catch (ZipException e) {
			logger.error("压缩文件失败！");
		}
	}

	/**
	 * 文件夹压缩
	 * 
	 * @param dir
	 * @param toFilePath
	 */
	public static void zipFolder(String dir, String toFilePath) {

		ZipFile zipFile = null;
		try {
			zipFile = new ZipFile(toFilePath);
		} catch (ZipException e1) {
			logger.error("创建压缩目的文件失败！");
		}
		ZipParameters parameters = new ZipParameters();
		parameters.setCompressionMethod(Zip4jConstants.COMP_DEFLATE);
		parameters.setCompressionLevel(Zip4jConstants.DEFLATE_LEVEL_NORMAL);
		try {
			zipFile.addFolder(dir, parameters);
		} catch (ZipException e) {
			logger.error("zipFolder_压缩文件失败！");
		}
	}

	/**
	 * 文件夹压缩返回压缩文件对象
	 * 
	 * @param dir
	 * @param toFilePath
	 * @return
	 */
	public static ZipFile zipFolderReturnZipFile(String dir, String toFilePath) {

		ZipFile zipFile = null;
		try {
			zipFile = new ZipFile(toFilePath);
		} catch (ZipException e1) {
			logger.error("创建压缩目的文件失败！");
		}
		ZipParameters parameters = new ZipParameters();
		parameters.setCompressionMethod(Zip4jConstants.COMP_DEFLATE);
		parameters.setCompressionLevel(Zip4jConstants.DEFLATE_LEVEL_NORMAL);
		try {
			zipFile.addFolder(dir, parameters);
		} catch (ZipException e) {
			logger.error("zipFolderReturnZipFile_压缩文件失败！");
		}
		return zipFile;
	}

	/**
	 * 将单个文件压缩到指定文件夹中
	 * 
	 * @param filePath
	 * @param toFilePath
	 * @param todir
	 */
	public static void zipFileToFolder(String filePath, String toFilePath, String todir) {

		ZipFile zipFile = null;
		File singleFile = new File(filePath);
		try {
			zipFile = new ZipFile(toFilePath);
		} catch (ZipException e1) {
			logger.error("创建压缩目的文件失败！");
		}
		ZipParameters parameters = new ZipParameters();
		parameters.setCompressionMethod(Zip4jConstants.COMP_DEFLATE);
		parameters.setCompressionLevel(Zip4jConstants.DEFLATE_LEVEL_NORMAL);
		parameters.setRootFolderInZip(todir);
		try {
			zipFile.addFile(singleFile, parameters);
		} catch (ZipException e) {
			logger.error("zipFileToFolder_压缩文件失败！");
		}
	}

	/**
	 * 将多个文件压缩到指定文件夹中
	 * 
	 * @param filePath
	 * @param toFilePath
	 * @param todir
	 */
	public static void zipFilesToFolder(ArrayList<File> fileList, String toFilePath, String todir) {

		ZipFile zipFile = null;
		try {
			zipFile = new ZipFile(toFilePath);
		} catch (ZipException e1) {
			logger.error("创建压缩目的文件失败！");
		}
		ZipParameters parameters = new ZipParameters();
		parameters.setCompressionMethod(Zip4jConstants.COMP_DEFLATE);
		parameters.setCompressionLevel(Zip4jConstants.DEFLATE_LEVEL_NORMAL);
		parameters.setRootFolderInZip(todir);
		try {
			zipFile.addFiles(fileList, parameters);
		} catch (ZipException e) {
			logger.error("zipFilesToFolder_压缩文件失败！");
		}
	}

	/**
	 * 往ZIP中添加文件
	 * 
	 * @param zipPath
	 * @param fileName
	 * @param filePath
	 */
	public static void AddFilesToZipFile(String zipPath, String fileName, String filePath) {

		ZipFile zipFile = null;
		try {
			zipFile = new ZipFile(zipPath);
		} catch (ZipException e) {
			logger.error("创建zipFile失败");
		}
		ZipParameters parameters = new ZipParameters();
		parameters.setCompressionMethod(Zip4jConstants.COMP_DEFLATE);
		parameters.setFileNameInZip(fileName);
		parameters.setSourceExternalStream(true);

		InputStream is = null;
		try {
			is = new FileInputStream(filePath);
			zipFile.addStream(is, parameters);
		} catch (ZipException | FileNotFoundException e) {
			logger.error("AddFilesToZipFile_压缩失败");
		} finally {
			try {
				is.close();
			} catch (IOException e) {
				logger.equals("关闭流失败");
			}
		}
	}

	/**
	 * 获取ZIP流
	 * 
	 * @param filePath
	 * @param toFilePath
	 * @param password
	 * @return
	 * @throws FileNotFoundException
	 */
	public static ZipOutputStream zipFilesGetOutStream(ArrayList<File> fileList, String toFilePath, String password)
			throws FileNotFoundException {

		ZipOutputStream outputStream = null;
		try {
			outputStream = new ZipOutputStream(new FileOutputStream(new File(toFilePath)));

			ZipParameters parameters = new ZipParameters();
			parameters.setCompressionMethod(Zip4jConstants.COMP_DEFLATE);
			parameters.setCompressionLevel(Zip4jConstants.DEFLATE_LEVEL_NORMAL);

			parameters.setEncryptFiles(true);
			parameters.setEncryptionMethod(Zip4jConstants.ENC_METHOD_AES);
			parameters.setAesKeyStrength(Zip4jConstants.AES_STRENGTH_256);
			parameters.setPassword(password);
			for (int i = 0; i < fileList.size(); i++) {
				File file = (File) fileList.get(i);
				outputStream.putNextEntry(file, parameters);
				if (file.isDirectory()) {
					outputStream.closeEntry();
					continue;
				}
				InputStream inputStream = new FileInputStream(file);
				byte[] readBuff = new byte[4096];
				int readLen = -1;
				while ((readLen = inputStream.read(readBuff)) != -1) {
					outputStream.write(readBuff, 0, readLen);
				}
				outputStream.closeEntry();
				inputStream.close();
			}
			outputStream.finish();
		} catch (Exception e) {
			logger.error("zipFilesGetOutStream失败");
		}
		return outputStream;
	}

	/**
	 * 从ZIP中删除文件
	 * 
	 * @param zipPath
	 * @param fileName
	 *            完整文件名
	 */
	public static void deleteFileFromZip(String zipPath, String fileName) {

		ZipFile zipFile = null;
		try {
			zipFile = new ZipFile(zipPath);
		} catch (ZipException e) {
			logger.error("创建zipFile失败");
		}
		try {
			// 删除指定文件
			zipFile.removeFile(fileName);
			// 删除第一个文件
			if (zipFile.getFileHeaders() != null && zipFile.getFileHeaders().size() > 0) {
				zipFile.removeFile((FileHeader) zipFile.getFileHeaders().get(0));
			} else {
				logger.info("无此文件！");
			}
		} catch (Exception e) {
			logger.error("删除文件出错！");
		}
	}

	/**
	 * 获取ZIP中文件信息
	 * 
	 * @param zipPath
	 * @return
	 */
	public static List<Map<String, String>> getZipInfo(String zipPath) {

		ZipFile zipFile = null;
		try {
			zipFile = new ZipFile(zipPath);
		} catch (ZipException e) {
			logger.error("创建zipFile失败");
		}
		List<Map<String, String>> reList = new ArrayList<Map<String, String>>();

		List<?> fileHeaderList = null;
		try {
			fileHeaderList = zipFile.getFileHeaders();
		} catch (ZipException e) {
			logger.error("获取fileHeaderList失败");
		}

		for (int i = 0; i < fileHeaderList.size(); i++) {
			FileHeader fileHeader = (FileHeader) fileHeaderList.get(i);
			Map<String, String> reMap = new HashMap<String, String>();
			reMap.put("FileName", fileHeader.getFileName());
			reMap.put("CompressedSize", String.valueOf(fileHeader.getCompressedSize()));
			reMap.put("UncompressedSize", String.valueOf(fileHeader.getUncompressedSize()));
			reMap.put("CRC", String.valueOf(fileHeader.getCrc32()));
		}
		return reList;
	}
	/**
	 * 解压文件
	 * @param zipPath
	 * @param UnzipDir
	 * @param password
	 */
	public static void UnzipFile(String zipPath, String UnzipDir, String password) {

		ZipFile zipFile = null;
		try {
			zipFile = new ZipFile(zipPath);
		} catch (ZipException e1) {
			logger.error("创建zipFile失败");
		}
		long startTime = System.currentTimeMillis();
		// 第一时间设置编码格式
		try {
			zipFile.setFileNameCharset("UTF-8");
		} catch (ZipException e) {
			logger.error("设置编码格式出错");
		    e.printStackTrace();
		}
		try {
			// 用自带的方法检测一下zip文件是否合法，包括文件是否存在、是否为zip文件、是否被损坏等
			if (!zipFile.isValidZipFile()) {
				logger.error("文件不合法或不存在");
				return;
			}
			if (zipFile.isEncrypted()) {
				zipFile.setPassword(password);
			}
		} catch (ZipException e) {
			logger.error("文件密码出错");
		}
		// 跟java自带相比，这里文件路径会自动生成，不用判断
		try {
			zipFile.extractAll(UnzipDir);
		} catch (ZipException e) {
			logger.error("解压出错");
		}
		long endTime = System.currentTimeMillis();
		logger.info("耗时：" + (endTime - startTime) + "ms");
	}

}
