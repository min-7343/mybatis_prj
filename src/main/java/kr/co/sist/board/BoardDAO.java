package kr.co.sist.board;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.co.sist.dao.MyBatisDAO;

/**
 * 
 */
public class BoardDAO {
	// CRUD

	private static BoardDAO bDAO;

	private BoardDAO() {
	}// BoardDAO

	public static BoardDAO getInstance() {
		if (bDAO == null) {
			bDAO = new BoardDAO();
		} // end if
		return bDAO;
	}// getInstance

	public int selectTotalCount(RangeDTO rDTO) throws PersistenceException {
		int cnt = 0;
		
		SqlSession ss=MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml")
				.getMyBatisHandler(); //auto commit x
		//2.쿼리를 실행
		cnt=ss.selectOne("kr.co.sist.user.board.selectTotalCount",rDTO);
		//검색결과
		//3. Transaction처리
		//4. MyBatis Handler 닫기
		ss.close();
		return cnt;
		
	}// selecttotalCount

	/**
	 * 시작번호와 끝번호 사이의 레코드를 얻는 메소드
	 * ctrl shift o => import정리
	 * 
	 * @param rDTO
	 * @return
	 * @throws SQLException
	 */
	public List<BoardDTO> selectBoard(RangeDTO rDTO) throws PersistenceException {

		List<BoardDTO> list = new ArrayList<BoardDTO>();
		
		
		SqlSession ss=MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml")
				.getMyBatisHandler(); //auto commit x
		//2.쿼리를 실행
		list=ss.selectList("kr.co.sist.user.board.selectBoard",rDTO);
		//검색결과
		//3. Transaction처리
		//4. MyBatis Handler 닫기
		ss.close();
		return list;
	}// selectBoard


}// class
