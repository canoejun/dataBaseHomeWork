package cn.springmvc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class GetInfo {
	public static List<Works> getAllJobs(){
		List<Works> list = new ArrayList<Works>();//list����
		String sql = null;
		DBHelper db1 = null;
		sql = "select *from works";// SQL
		db1 = new DBHelper(sql);//����DBHelper����
		ResultSet ret = null;//�������������ִ��sql�󷵻ص����ݼ���
//		System.out.println("fbadfbd");
		try {
			ret = db1.pst.executeQuery();//���������������ִ����SELECT���һ����
			while (ret.next()) {
//					���ӵ�ַ
				String url = ret.getString(1);;
				//	 ְλ
				String work = ret.getString(2);;
				//	 ��˾
				String company = ret.getString(3);;
				//	 ����
				String city = ret.getString(4);;
				//	 ����ʱ��
				String time = ret.getString(5);;
				//	 ��������
				String recruits_number = ret.getString(6);;
				//	 ��λҪ��
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
			} //ѭ���ӽ�����л�ȡ���ݲ����õ�list�б������
			ret.close();//�رն���
			db1.close();//��ϵ���ݿ�����
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} //
		return list;//���ؽ��
	}
	
	public static List<News> getAllNews() {
		List<News> list = new ArrayList<News>();//list����
		String sql = null;
		DBHelper db1 = null;
		sql = "select *from news";// SQL
		db1 = new DBHelper(sql);//����DBHelper����
		ResultSet ret = null;//�������������ִ��sql�󷵻ص����ݼ���
		try {
			ret = db1.pst.executeQuery();//���������������ִ����SELECT���һ����
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
			} //ѭ���ӽ�����л�ȡ���ݲ����õ�list�б������
			ret.close();//�رն���
			db1.close();//��ϵ���ݿ�����
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} //
		return list;//���ؽ��
	}
	
	
	public static boolean login(String _phoneNumber,String password) {
		String sql = null;
		DBHelper db1 = null;
		sql = "select * from users where phoneNumber =" + _phoneNumber;// sql
		db1 = new DBHelper(sql);//����DBHelper����
		ResultSet ret = null;//�������������
		Users users = new Users();
		try {
			ret = db1.pst.executeQuery();//������˵����������ֻ��һ������
			while (ret.next()) {
				String phoneNumber = ret.getString(1);//��һ�����ֻ���
				String realPassword = ret.getString(2);//�ڶ���������
				users.setPhoneNumber(phoneNumber);
				users.setPassword(realPassword);
			} //ѭ���ӽ�����л�ȡ���ݲ����õ������У�������˵�����ѭ��ִֻ��һ�Σ�
			ret.close();//�رն���
			db1.close();//��ϵ���ݿ�����
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
