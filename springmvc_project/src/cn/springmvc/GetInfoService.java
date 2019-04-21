package cn.springmvc;

import java.util.List;

public interface GetInfoService {
	public List<Works> getAllJobs();
	public List<News> getAllNews();
	public boolean login(String _phoneNumber,String password);
}
