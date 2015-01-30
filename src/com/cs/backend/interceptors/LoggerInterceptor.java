package com.cs.backend.interceptors;
   
import java.util.Map;          

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;     

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.apache.struts2.ServletActionContext;     
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.cs.backend.db.model.Operatelog;
import com.cs.backend.db.model.User;
import com.cs.backend.service.OperatelogService;
import com.cs.backend.service.UserService;
import com.cs.backend.util.DateUtil;
import com.opensymphony.xwork2.Action;        
import com.opensymphony.xwork2.ActionInvocation;     
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
  
public class LoggerInterceptor extends MethodFilterInterceptor {  
	private static final long serialVersionUID = 1L;
	
	private static Logger logger = LoggerFactory.getLogger(LoggerInterceptor.class) ;
	
	@Resource
	private OperatelogService operatelogService;
	@Resource
    private UserService userService;   
    
	public void destroy() {  
    }  
    public void init() {  
    	
    }     
	@Override
	protected String doIntercept(ActionInvocation invocation) {
		logger.info("操作日志已经开始启动..");
		Subject subject = SecurityUtils.getSubject() ;
		User user = (User) subject.getPrincipal();
		HttpServletRequest request = ServletActionContext.getRequest();
		String ip = request.getRemoteAddr();
        String actionName = invocation.getAction().getClass().toString();
        String method = invocation.getProxy().getMethod();
        final Map<String, Object> parameters = invocation
                .getInvocationContext().getParameters();
        boolean result = invocation.getProxy().getExecuteResult();
        String resultCode = Action.INPUT;
		try {
    		
            if (user != null) {
            	Operatelog operatelog = new Operatelog();
            	operatelog.setUserId(user.getUserId());   
            	operatelog.setModifyTime(DateUtil.convertString2long(DateUtil.getNowTime("yyyy-MM-dd"), 0));
            	operatelog.setUserIp(ip);
            	operatelog.setActionName(actionName);
            	operatelog.setMethod(method);
            	operatelog.setParameters(JSON.toJSONString(parameters, SerializerFeature.WriteMapNullValue));
            	operatelog.setResult(result==true? 1:0);
            	operatelog.setIsDeleted(0);
            	operatelogService.addOperatelog(operatelog);
            	resultCode = invocation.invoke();
            }
		} catch (Exception e) {
			e.printStackTrace();
		}
        return resultCode;
	}  
}