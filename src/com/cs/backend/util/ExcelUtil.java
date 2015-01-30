package com.cs.backend.util;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import com.cs.backend.configmodel.SystemConfig;
/**
 * @author Excel帮助类
 *
 */
public class ExcelUtil {
	private static Logger log = Logger.getLogger(ExcelUtil.class);

	/**
	 * @return 随机时间挫
	 */
	public static String generateIdentity() {
		return "" + System.currentTimeMillis() + RandomUtils.random(1000, 9999);
	}

	/**
	 * @param listmap 整齐的map队列
	 * @param sheetName Excel的sheet名字
	 * @param sheetTitle 对应的列名
	 * @param mapKey  listmap中对应的key值
	 * @return
	 */
	public static String createExcelSheet(List<Map<String, String>> listmap, String sheetName, String[] sheetTitle, String[] mapKey) {
		String identity = generateIdentity();
		Properties properties = SystemConfig.getInstance().getSystemConfigProperties() ;
		try {
			Workbook wb = new HSSFWorkbook();
			FileOutputStream out = new FileOutputStream(properties.getProperty("filedownload") + identity + ".xlsx", true);

			Sheet sheet = wb.createSheet(sheetName);
			Row trow = sheet.createRow(0);
			for (int i = 0; i < sheetTitle.length; i++) {
				trow.createCell(i).setCellValue(sheetTitle[i]);
			}
			int linenum = 0;
			for (Map<String, String> map : listmap) {
				linenum++;
				Row row = sheet.createRow(linenum);
				for (int i = 0; i < mapKey.length; i++) {
					row.createCell(i).setCellValue(ParamUtil.getMapString(map, mapKey[i]));
				}
			}
			wb.write(out);
			out.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			log.error(e, e);
		} catch (IOException e) {
			e.printStackTrace();
			log.error(e, e);
		}
		return identity;
	}

	// 注：每一个map元素需要有相同的key
	public static String createSheet(Map<String, List<Map<String, String>>> listmap) {
		String identity = generateIdentity();
		Properties properties = SystemConfig.getInstance().getSystemConfigProperties() ;
		Workbook wb = new HSSFWorkbook();
		try {
			FileOutputStream out = new FileOutputStream(properties.getProperty("filedownload") + identity + ".xlsx", false);
			Set<String> sheetnames = listmap.keySet();
			for (String sname : sheetnames) {
				// 创建表格
				log.error("创建表格:"+sname);
				Sheet sheet = wb.createSheet(sname);
				List<Map<String, String>> maplist = listmap.get(sname);
				if (maplist == null || maplist.size() < 1) {
					continue;
				}
				// 重建此表格的第一行
				Object[] thead = maplist.get(0).keySet().toArray();
				Row trow = sheet.createRow(0);
				for (int i = 0; i < thead.length; i++) {
					trow.createCell(i).setCellValue((String)thead[i]);
				}

				int linenum = 0;
				for (Map<String, String> map : maplist) {
					linenum++;
					Row row = sheet.createRow(linenum);
					for (int i = 0; i < thead.length; i++) {
						row.createCell(i).setCellValue(ParamUtil.getMapString(map, (String)thead[i]));
					}
				}
			}
			wb.write(out);
			out.close();
			log.error("excel创建完毕!");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return identity;
	}
}