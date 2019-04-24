package kr.co.ca;


import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.sql.Connection;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;

// 테스트시 꼭 넣어주세욤
@RunWith(SpringJUnit4ClassRunner.class)
//환경설정 파일이 어디있는지 나타내는 부분
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class DataSourceTest {

	// Inject 어노테이션은 컨테이너가 관리하고 있는 객체들(bean) 중
	// 자료형이 dataSource인 애를 찾아서 그 객체를 ds에 넣어주라는 얘기.
	// 			== (자동으로들어감 객체가. Inject가 없으면 자동으로 안들어감.)
	@Inject
	private DataSource ds;
	
	// 테스트는 꼭 Test 어노테이션 붙여줘야하고.
	// 접근제한자는 public이어야 하고
	// 반환형은 void여야하고
	// 파라미터는 무파라미터여야한다.
	@Test
	public void testConnection() throws Exception { // 테스트방법: 메서드명을 더블클릭해서 선택하고 Run As-junit Test.
		Connection conn= null;
		try {
			conn= ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	
}
