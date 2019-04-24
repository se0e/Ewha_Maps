package kr.co.ca;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class MybatisTest {
	
	@Inject
				// ibatis = mybatis의 전단계
	private SqlSessionFactory sqlFactory;

	@Test
	public void testFactory() {
		System.out.println(sqlFactory); // null인지 아닌지 확인
	}
	
	@Test
	public void testSession() throws Exception {
		SqlSession session= null;
		try {
			session= sqlFactory.openSession(); // sqlFactory에서 openSession객체갖고오기
			System.out.println("세션을갖고왔는지 확인합니다. "+session); // Session갖고왔는지 확인
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(session!=null) session.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	


}
