package cn.springmvc;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class GetInfoServlet {
//	获取工作信息
	@RequestMapping("/getAllJobs")
	public void getAllJobs(HttpServletRequest request,HttpServletResponse response) {
		System.out.println("getAllJobs");
		List<Works> list = new GetInfoServiceImpl().getAllJobs();
		ListObject listObject = new ListObject();
		listObject.setItems(list);
		listObject.setCode(StatusCode.CODE_SUCCESS);
		listObject.setMsg("访问成功");
		ResponseUtils.renderJson(response, JackJsonUtils.toJson(listObject));
	}
//	获取新闻信息
	@RequestMapping("/getAllNews")
	public void getAllNews(HttpServletRequest request,HttpServletResponse response) {
		System.out.println("getAllNews");
		List<News> list = new GetInfoServiceImpl().getAllNews();
		ListObject listObject = new ListObject();
		listObject.setItems(list);
		listObject.setCode(StatusCode.CODE_SUCCESS);
		listObject.setMsg("访问成功");
		ResponseUtils.renderJson(response, JackJsonUtils.toJson(listObject));
	}
//	登录
	@RequestMapping(value="login", method= RequestMethod.POST)
	public void login(HttpServletRequest request,HttpServletResponse response) {
//	    Map<String, Object> paramMap = new HashMap<String, Object>();
//		System.out.println(request);
//	    Enumeration<String> enume = request.getParameterNames();
//	    while (enume.hasMoreElements()) {
//	    	String key = (String) enume.nextElement();
//	        String[] values = request.getParameterValues(key);
//	        System.out.println(key+" "+values);
//	    }
		
		String phoneNumber = request.getParameter("phoneNumber");
		String password = request.getParameter("password");
		System.out.println("login");
//		System.out.println(password);
		boolean isPasswordTrue = new GetInfoServiceImpl().login(phoneNumber, password);
		System.out.println(isPasswordTrue);
		ListObject listObject = new ListObject();
		if (isPasswordTrue) {
			listObject.setItems(null);
			listObject.setCode(StatusCode.CODE_SUCCESS);
			listObject.setMsg("访问成功");
			ResponseUtils.renderJson(response, JackJsonUtils.toJson(listObject));
			return ;
		}
		listObject.setItems(null);
		listObject.setCode(StatusCode.CODE_ERROR);
		listObject.setMsg("访问失败");
		ResponseUtils.renderJson(response, JackJsonUtils.toJson(listObject));
		
	}
	
	
	
	
	
	

}
