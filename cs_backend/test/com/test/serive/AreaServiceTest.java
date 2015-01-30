package com.test.serive;

import java.util.List;

import org.junit.Test;

import com.cs.backend.db.model.Area;
import com.cs.backend.service.AreaService;
import com.test.MyBatisConfig;

/**
 * 
*
* @Description: TODO	区服务测试
* @author zhaowei 
* @Ceatetime 2014年9月17日
*
 */
public class AreaServiceTest {
	@Test
	public void testAreaService() throws Exception{
		AreaService areaService = MyBatisConfig.getBean(AreaService.class) ;
		List<Area> areas = areaService.selectAllAreas() ;
		System.out.println(areas);
		Area area = areaService.selectAreaById(13) ;
		System.out.println(area);
	}
}
