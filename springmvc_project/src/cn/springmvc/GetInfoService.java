package cn.springmvc;

import java.util.List;

public interface GetInfoService {
	public List<Works> getAllJobs();
	public List<News> getAllNews();
	public boolean login(String _phoneNumber,String password);
	public boolean addUser(String _phoneNumber,String password);
	public boolean changePassword(String _phoneNumber,String password);
	public boolean deleteUser(String _phoneNumber,String password);
}
