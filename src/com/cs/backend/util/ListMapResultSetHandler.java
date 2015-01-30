package com.cs.backend.util;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;


/**
 * @author 赵伟
 */
public class ListMapResultSetHandler {
	private static final Logger logger = Logger.getLogger(ListMapResultSetHandler.class);

	public ListMapResultSetHandler() {
	}

	/**
	 * @param rs
	 * @return  将数据库中查询数据全部转换为List<Map<?,?>>形式
	 * @throws SQLException
	 */
	public List<Map<String, String>> handle(ResultSet rs) throws SQLException {
		int columnCount = rs.getMetaData().getColumnCount();
		List<String> columnList = new ArrayList<String>();
		for (int i = 1; i <= columnCount; i++) {
			columnList.add(rs.getMetaData().getColumnLabel(i));
		}
		List<Map<String, String>> paramlist = new ArrayList<Map<String, String>>();
		Map<String, String> parammap = new HashMap<String, String>();
		try {
			while (rs.next()) {
				parammap = new HashMap<String, String>();
				for (String columnname : columnList) {
					String p = rs.getString(columnname);
					parammap.put(columnname, p);
				}
				paramlist.add(parammap);
			}
			rs.close();
		} catch (SQLException e) {
			logger.error(e, e);
		}
		return paramlist;
	}
}
