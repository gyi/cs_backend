package com.test;

import static org.junit.Assert.*;

import java.util.concurrent.CountDownLatch;

import javax.annotation.Resource;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.core.task.TaskExecutor;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cs.backend.action.UserAction;
import com.cs.backend.service.GmService;
import com.cs.backend.service.PlatformService;
import com.cs.backend.service.RoleService;
import com.cs.backend.service.UserService;
import com.opensymphony.xwork2.Action;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-system.xml",
		"classpath:spring-dao.xml", "classpath:spring-shiro.xml" })
public class UserActionTest extends AbstractJUnit4SpringContextTests {

	private UserAction userAction;

	// Service层Bean
	@Resource
	private UserService userServiceImpl;
	@Resource
	private RoleService roleServiceImpl;
	@Resource
	private PlatformService platformServiceImpl;
	@Resource
	private GmService gmService ;
	@Resource
	private TaskExecutor executor ;

	@Before
	public void setUp() throws Exception {
		userAction = new UserAction();
		userAction.setUserService(userServiceImpl);
		userAction.setRoleService(roleServiceImpl);
		userAction.setPlatformService(platformServiceImpl);
	}
	
	@Test
	public void testGmService() throws Exception{
		final CountDownLatch latch = new CountDownLatch(10) ;
		for(int i=0 ; i < 10; i++) {
			executor.execute(new Runnable() {
				
				public void run() {
					try {
						System.out.println(1);
					}finally{
						latch.countDown(); 
					}
				}
			});
		}
		latch.await();
	}

	// 测试方法
	@Test
	public void testAddUserShowPage() {

		String result = userAction.addUserShowPage();
		assertEquals(Action.SUCCESS, result);
	}

	// 测试方法
	@Test
	public void testShowUserList() {

		String result = userAction.showUserList();
		assertEquals(Action.SUCCESS, result);
	}
}