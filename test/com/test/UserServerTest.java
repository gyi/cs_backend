package com.test;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cs.backend.db.model.User;
import com.cs.backend.service.PlatformService;
import com.cs.backend.service.RoleService;
import com.cs.backend.service.UserService;
import com.cs.backend.util.CodeUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-system.xml",
		"classpath:spring-dao.xml", "classpath:spring-shiro.xml" })
public class UserServerTest extends AbstractJUnit4SpringContextTests {

	private User user;

	// Service层Bean
	@Resource
	private UserService userServiceImpl;
	@Resource
	private RoleService roleServiceImpl;
	@Resource
	private PlatformService platformServiceImpl;

	@Before
	public void setUp() throws Exception {
		User user = new User();
		user.setUserName("syf");
		user.setPassWord(CodeUtil.Md5("123456"));
		user.setPlatformId(1);
		user.setRoleId(1);
	}

	// 测试方法
	@Test
	public void testAddUser() {

		try {
			int result = userServiceImpl.addUser(user);
			assertEquals(1, result);
		} catch (Exception e) {
			e.printStackTrace();
			fail();
		}

	}
}