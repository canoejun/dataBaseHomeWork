package cn.springmvc;

import java.util.List;

public class GetInfoServiceImpl implements GetInfoService{
	@Override
	public List<Works> getAllJobs() {
		return GetInfo.getAllJobs();
	}
	@Override
	public List<News> getAllNews() {
		return GetInfo.getAllNews();
	}
	public boolean login(String _phoneNumber,String password) {
		return GetInfo.login(_phoneNumber, password);
	}
	
	public boolean addUser(String _phoneNumber,String password) {
		return GetInfo.addUser(_phoneNumber, password);
	}
	public boolean changePassword(String _phoneNumber,String password) {
		return GetInfo.changePassword(_phoneNumber, password);
	}
	public boolean deleteUser(String _phoneNumber,String password) {
		return GetInfo.deleteUser(_phoneNumber, password);
	}
}
