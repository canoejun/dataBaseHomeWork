package cn.springmvc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class GetInfo {
	public static List<Works> getAllJobs(){
		List<Works> list = new ArrayList<Works>();//list对象
		String sql = null;
		DBHelper db1 = null;
		sql = "select *from works";// SQL
		db1 = new DBHelper(sql);//创建DBHelper对象
		ResultSet ret = null;//创建结果集对象，执行sql后返回的数据集合
//		System.out.println("fbadfbd");
		try {
			ret = db1.pst.executeQuery();//这个方法就类似于执行了SELECT语句一样！
			while (ret.next()) {
//					链接地址
				String url = ret.getString(1);;
				//	 职位
				String work = ret.getString(2);;
				//	 公司
				String company = ret.getString(3);;
				//	 城市
				String city = ret.getString(4);;
				//	 发布时间
				String time = ret.getString(5);;
				//	 需求人数
				String recruits_number = ret.getString(6);;
				//	 岗位要求
				String request = ret.getString(7);;

				Works works = new Works();
				works.setUrl(url);
				works.setWork(work);
				works.setCompany(company);
				works.setCity(city);
				works.setTime(time);
				works.setRecruits_number(recruits_number);
				works.setRequest(request);
//				System.out.println(works.getCompany());
				list.add(works);
			} //循环从结果集中获取数据并设置到list列表对象中
			ret.close();//关闭对象
			db1.close();//关系数据库连接
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} //
		return list;//返回结果
	}
	
	public static List<News> getAllNews() {
		List<News> list = new ArrayList<News>();//list对象
		String sql = null;
		DBHelper db1 = null;
		sql = "select *from news";// SQL
		db1 = new DBHelper(sql);//创建DBHelper对象
		ResultSet ret = null;//创建结果集对象，执行sql后返回的数据集合
		try {
			ret = db1.pst.executeQuery();//这个方法就类似于执行了SELECT语句一样！
			while (ret.next()) {
				String title = ret.getString(1);
				String time = ret.getString(2);
				String media = ret.getString(3);
				String url = ret.getString(4);
				String pictureUrl = ret.getString(5);
				News news = new News();
				news.setTitle(title);
				news.setMedia(media);
				news.setTime(time);
				news.setUrl(url);
				news.setPictureUrl(pictureUrl);
				list.add(news);
			} //循环从结果集中获取数据并设置到list列表对象中
			ret.close();//关闭对象
			db1.close();//关系数据库连接
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} //
		return list;//返回结果
	}
	
	
	public static boolean login(String _phoneNumber,String password) {
		String sql = null;
		DBHelper db1 = null;
		sql = "select * from users where phoneNumber =" + _phoneNumber;// sql
		db1 = new DBHelper(sql);//创建DBHelper对象
		ResultSet ret = null;//创建结果集对象
		Users users = new Users();
		try {
			ret = db1.pst.executeQuery();//正常来说，这个结果集只有一个对象
			while (ret.next()) {
				String phoneNumber = ret.getString(1);//第一列是手机号
				String realPassword = ret.getString(2);//第二列是密码
				users.setPhoneNumber(phoneNumber);
				users.setPassword(realPassword);
			} //循环从结果集中获取数据并设置到对象中（正常来说，这个循环只执行一次）
			ret.close();//关闭对象
			db1.close();//关系数据库连接
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // 
		if (password.equals(users.getPassword())) {
			return true;
		}
		return false;
	}
	
	
	
}
