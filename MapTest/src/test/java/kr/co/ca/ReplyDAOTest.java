package kr.co.ca;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.dao.ReplyDAO;
import kr.co.domain.ReplyVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
	public class ReplyDAOTest {
		
		@Inject
		private ReplyDAO dao;
		
		@Test
		public void testInsert() {
			ReplyVO vo= new ReplyVO(1, 143, "aaaa", "aaaa", null, null);
			dao.insert(vo);
		}

		@Test
		public void testList() {
			List<ReplyVO> list= dao.list(143);
			for(ReplyVO vo: list ) {
				System.out.println(vo);
			}
		}

		@Test
		public void testUpdate() {
			ReplyVO vo= new ReplyVO(1, 0, "변경합니다", null, null, null);
			dao.update(vo);

			System.out.println(vo);
		}
		
		@Test
		public void testDelete() {
			dao.delete(1);
		}
		
		@Test
		public void testAllDelete() {
			int bno= 134;
			dao.allDelete(bno);
		}
		
	/*
	 * @Test public void testIdCheck() { int rno= 51; boolean is= false; boolean
	 * iis= dao.idCheck(rno); if(iis) { is= true; }
	 * 
	 * System.out.println(is); }
	 */

	}
