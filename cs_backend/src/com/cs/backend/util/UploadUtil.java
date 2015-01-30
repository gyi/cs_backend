package com.cs.backend.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

public class UploadUtil {
	private static String filePath;
	
	private static String fileFileName;
	
	public static int upload(String inputFilePath, String outputFilePath) {
		try {
			// 文件输入流
			File inputFile = new File(inputFilePath);
			if(!inputFile.exists()){
				return 0;
			}
			FileInputStream inputStream = new FileInputStream(inputFilePath);
			FileOutputStream outputStream = new FileOutputStream(outputFilePath);
			byte[] buf = new byte[1024];
			int length = 0;
			while ((length = inputStream.read(buf)) != -1) {
				outputStream.write(buf, 0, length);
			}
			inputStream.close();
			outputStream.flush();
			outputStream.close();
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return 1;
	}
	
	@SuppressWarnings("deprecation")
	public static String getPath() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String path = request.getRealPath("/");
		return path;
	}
	
	public static void isExistFileAppend(String filePathsString, String fileFileNamesString) {
		filePath = filePathsString;
		fileFileName = fileFileNamesString;
		try {
			File outputFile = new File(filePath);
			String newFfilePath = filePath;
			String newFileFileName = fileFileName;
			for(int i = 0; outputFile.exists(); i++){
				newFfilePath = dealNameExist(filePath, i);
				newFileFileName = dealNameExist(fileFileName, i);
 				outputFile = new File(newFfilePath);
			}
			filePath = newFfilePath;
			fileFileName = newFileFileName;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public static void isExistFileDelete(String filePathsString, String fileFileNamesString) {
		filePath = filePathsString;
		fileFileName = fileFileNamesString;
		try {
			File outputFile = new File(filePath);
			while(outputFile.exists()){
				outputFile.deleteOnExit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public static String dealNameExist(String name, int i) {
		String[] filePaths = name.split("\\.");
		filePaths[filePaths.length-2] += i+".";
		StringBuffer sb = new StringBuffer();
		sb.append(filePaths[0]);
		for(int j = 1; j < filePaths.length; j++)
		{ 
		sb.append("."+filePaths[j]);
		}
		name = sb.toString();
		return name;
	}

	public static String getFilePath() {
		return filePath;
	}

	public static void setFilePath(String filePath) {
		UploadUtil.filePath = filePath;
	}

	public static String getFileFileName() {
		return fileFileName;
	}

	public static void setFileFileName(String fileFileName) {
		UploadUtil.fileFileName = fileFileName;
	}
}
