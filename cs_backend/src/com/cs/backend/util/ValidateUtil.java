package com.cs.backend.util;

import org.apache.commons.lang3.StringUtils;

import com.opensymphony.xwork2.ActionSupport;

public class ValidateUtil {
	
	public ActionSupport athis;
	public String language ;
	public String[] methodNames ; 
	public int index = 0;
	public String message ;
	public Integer intMessage;
	public String describe;
	public int minLen;
	public int maxLen;
	public boolean noproblem = true;
	public boolean isString ;
	
	public void init(String describe, String[] methodNames){
		setMethodNames(methodNames);
		setDescribe(describe);
		index = 0;
		noproblem = true;
	}
	
	public void init(String message, String describe, String[] methodNames){
		init(describe, methodNames);
		setMessage(message);
		isString = true;
	}
	
	public void init(Integer intMessage, String describe, String[] methodNames){
		init(describe, methodNames);
		setIntMessage(intMessage);
		isString = false;
	}
	
	@SuppressWarnings("unchecked")
	public void enter(){
		try {
			if (index >= methodNames.length) {
				return;
			}
			Class<ValidateUtil> validateUtilClass = (Class<ValidateUtil>) Class.forName(this.getClass().getName());
			validateUtilClass.getMethod(methodNames[index++]).invoke(this);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void enter(String message, String describe, String[] methodNames){
		init(message, describe, methodNames);
		enter();
	}
	
	public void enter(Integer intMessage, String describe, String[] methodNames){
		init(intMessage, describe, methodNames);
		enter();
	}
	
	@SuppressWarnings("unchecked")
	public void validateIsEmpty() {
		try {
			if (isString?StringUtils.isEmpty(message.trim()): intMessage==null) {
				athis.addFieldError(describe, athis.getText("gccp.validate.notnull"));
				noproblem = false;
			} else {
				if (index >= methodNames.length) {
					return;
				}
				Class<ValidateUtil> validateUtilClass = (Class<ValidateUtil>) Class.forName(this.getClass().getName());
				validateUtilClass.getMethod(methodNames[index++]).invoke(this);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@SuppressWarnings("unchecked")
	public void validateNumAndLetter(){
		String numAndLetter = "[0-9A-Za-z]+$";
		try {
			if (message!=null&&!message.trim().matches(numAndLetter)) {
				athis.addFieldError(describe, athis.getText("gccp.validate.numAndLetter"));
				noproblem = false;
			} else {
				if (index >= methodNames.length) {
					return;
				}
				Class<ValidateUtil> validateUtilClass = (Class<ValidateUtil>) Class.forName(this.getClass().getName());
				validateUtilClass.getMethod(methodNames[index++]).invoke(this);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@SuppressWarnings("unchecked")
	public void validateLenghtIsInSide(){
		try {
			if (isString?(message!=null&&message.length() < minLen || message.length() > maxLen):(intMessage!=null&&intMessage < minLen||intMessage > maxLen)) {
				athis.addFieldError(describe, athis.getText("gccp.validate.lenghtOffside"));
				noproblem = false;
			} else {
				if (index >= methodNames.length) {
					return;
				}
				Class<ValidateUtil> validateUtilClass = (Class<ValidateUtil>) Class.forName(this.getClass().getName());
				validateUtilClass.getMethod(methodNames[index++]).invoke(this);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@SuppressWarnings("unchecked")
	public void validateBracketsAndNum(){
		String numAndLetter = "(\\[\\d+\\])*$";
		try {
			if (message!=null&&!message.trim().matches(numAndLetter)) {
				athis.addFieldError(describe, athis.getText("gccp.validate.numAndLetter"));
				noproblem = false;
			} else {
				if (index >= methodNames.length) {
					return;
				}
				Class<ValidateUtil> validateUtilClass = (Class<ValidateUtil>) Class.forName(this.getClass().getName());
				validateUtilClass.getMethod(methodNames[index++]).invoke(this);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void setAthis(ActionSupport athis) {
		this.athis = athis;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public void setMethodNames(String[] methodNames) {
		this.methodNames = methodNames;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	public void setMinLenAndMaxLen(int minLen, int maxLen){
		this.minLen = minLen;
		this.maxLen = maxLen;
	}
	
	public boolean isNoproblem() {
		return noproblem;
	}
	
	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public void setIntMessage(Integer intMessage) {
		this.intMessage = intMessage;
	}

	public static void main(String[] args){
		ValidateUtil validateUtil = new ValidateUtil();
		//validateUtil.setLanguage(String.valueOf(request.getAttribute("LANGUAGE")));
		String userName = "[]";
		try {
			validateUtil.setMessage(userName);
			validateUtil.setDescribe("");
			validateUtil.validateBracketsAndNum();
		}
		catch(Exception e){
			
		}
	}
	
}
