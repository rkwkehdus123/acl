package org.kdy.dbtest;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class JDBC {
	private static final String DRIVER = "com.mysql.jdbc.Driver";
	private static final String URL = "jdbc:mysql://127.0.0.1:3306/dbtest?serverTimezone=Asia/Seoul";
	private static final String USER ="root";
	private static final String PW ="1234";
	/*
	 * 텍스트와 관련된 어노테이션(@)
	 * @Runwith
	 * @ContextConfiguration
	 * @Test
	 */
	//@Test의 빨간 줄을 없애기 위해서는 pom.xml에 junit의 버전을 올려줘야 함(4.7 -> 4.12) or import
	
	@Test	//annotaion : 자바에게 아래 메소드는 Test용 메소드라는 것을 알려줌, test 폴더에서만 사용할 수 있음
	public void testConnection() throws Exception{
		Class.forName(DRIVER);	//Driver를 메모리에 올려라
		try (Connection con=DriverManager.getConnection(URL, USER, PW)) {
			System.out.println(con);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	// @Test를 추가했기 떄문에 일반적인 실행 뿐 아니라 Junit Test라는 실행도 있음 (마우스 우클릭 -> run as)!
}
