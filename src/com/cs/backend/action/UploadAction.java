package com.cs.backend.action;

import java.io.File;

import com.cs.backend.util.UploadUtil;
import com.opensymphony.xwork2.ActionSupport;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

/**
 * 上传文件
 * 
 * @Description: TODO
 * @author zhaowei
 * @Ceatetime 2014年6月5日
 * 
 */
public class UploadAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	// 上传文件名
	private String fileFileName;

	// 上传结果
	private Boolean result;

	// 上传文件类型
	private String fileContentType;

	// 上传文件
	private File file;

	public String uploadIconCache() {
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			//ServletConfig sconfig = (ServletConfig)request.getSession().getServletContext().getAttribute("servletConfig");  
			String subjectPath = request.getSession().getServletContext().getRealPath("/");
			String inputFilePath = this.getFile().getPath();
//			String path = UploadUtil.getPath();
//			String outputFilePath = path + "static\\ztree\\css\\zTreeStyle\\img\\define\\" + fileFileName;
			String outputFileSubjectPath = subjectPath + "static\\ztree\\css\\zTreeStyle\\img\\define\\" + fileFileName;
			UploadUtil.isExistFileAppend(outputFileSubjectPath, fileFileName);
			upload(inputFilePath, outputFileSubjectPath);
//			UploadUtil.isExistFileDelete(outputFileSubjectPath, fileFileName);
//			upload(inputFilePath, outputFileSubjectPath);
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}

		return SUCCESS;
	}
	
	private void upload(String inputFilePath, String outputFilePath) {
		outputFilePath = UploadUtil.getFilePath();
		fileFileName = UploadUtil.getFileFileName();
		UploadUtil.upload(inputFilePath, outputFilePath);
	}
	
	public void validateUploadIconCache() {
		String[] iconTypes = {"JPEG","TIFF","RAW","BMP","GIF","PNG"};
		for(String iconType: iconTypes){
			iconType.equals(fileContentType.toUpperCase());
			return;
		}
		result = false;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public Boolean getResult() {
		return result;
	}

	public void setResult(Boolean result) {
		this.result = result;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

}
