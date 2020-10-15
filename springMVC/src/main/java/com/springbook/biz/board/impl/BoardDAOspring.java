//package com.springbook.biz.board.impl;
//
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
//
//import javax.sql.DataSource;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.jdbc.core.JdbcTemplate;
//import org.springframework.jdbc.core.support.JdbcDaoSupport;
//import org.springframework.stereotype.Repository;
//
//import com.springbook.biz.board.boardVO;
//import com.springbook.biz.common.JDBCUtil;
//
////DAO(Data Access Object)
//@Repository
//public class BoardDAOspring  implements BoardService{
//	public BoardDAOspring() {
//		System.out.println("boardDAOSpring 생성");
//	}
////	public class BoardDAOspring extends JdbcDaoSupport implements BoardService{
////		public BoardDAOspring() {
////			System.out.println("boardDAOSpring 생성");
////		}
//	@Autowired
//	private JdbcTemplate jdbctemplate;
//
////	JDBCUtil jdbcutil;
//	// jdbc 관련 변수 jdbc 서포터 이용 아래 변수 필요없음
////	private Connection conn = null;
////	private PreparedStatement pstmt = null;
////	private ResultSet rs = null;
//
//	// sql 명령어
//	private final String INSERT = "insert into board(seq, title, writer,content) values(?,?,?,?)";
//	private final String UPDATE = "update from board set title=?, content=? where seq=?";
//	private final String DELETE = "delete from board where seq=?";
//	private final String GET = "select * from board where seq=?";
//	private final String LIST = "select * from board order by seq desc";
////	private final String INSERT = "insert into board(seq, title, writer,content) values((SELECT IFNULL(MAX(seq+1), 0) FROM board SUBQUERY),?,?,?)";
////	원래 데이터 소스 만들어진걸 얘가 가져가 쓰는건대 프로퍼티로 바로 의존성 주입해줘서 안옴
////	@Autowired
////	public void setSuperDataSource(DataSource dataSource) {
////		super.setDataSource(dataSource);
////
////	}
//
//	// CRUD 기능의 메소드 구현 (크리에이드 리드 업데이트 딜리트)
//
//	// 글등록
//	public void insertboard(boardVO vo) {
//		System.out.println("-====>spring jdbc 로 인설트 기능처리");
////		getJdbcTemplate().update(INSERT,vo.getTitle(),vo.getWriter(),vo.getContent());
//		jdbctemplate.update(INSERT,vo.getSeq(),vo.getTitle(),vo.getWriter(),vo.getContent());
//		// 글 수정
//
////		try {
////			conn = jdbcutil.getconnection();
////			pstmt = conn.prepareStatement(INSERT);
////			pstmt.setString(1, vo.getTitle());
////			pstmt.setString(2, vo.getWriter());
////			pstmt.setString(3, vo.getContent());
////			pstmt.executeUpdate();
////
////		} catch (SQLException e) {
////			e.printStackTrace();
////		} finally {
////			jdbcutil.close(pstmt, conn);
////		}
//
//	}
//
//	// 글 수정
//	public void updateboard(boardVO vo) {
//		System.out.println("====>spring jdbc 로 수정기능처리");
//	
////		getJdbcTemplate().update(UPDATE, vo.getTitle(), vo.getContent(), vo.getSeq());
//		jdbctemplate.update(UPDATE, vo.getTitle(), vo.getContent(), vo.getSeq());
////		try {
////			conn = jdbcutil.getconnection();
////			pstmt = conn.prepareStatement(UPDATE);
////			pstmt.setString(1, vo.getTitle());
////			pstmt.setString(2, vo.getWriter());
////			pstmt.setString(3, vo.getContent());
////			pstmt.executeUpdate();
////
////		} catch (SQLException e) {
////			e.printStackTrace();
////		} finally {
////			jdbcutil.close(pstmt, conn);
////		}
//
//	}
//
//	// 글삭제
//	public void deleteboard(boardVO vo) {
//		System.out.println("====>spring jdbc 로글삭제 기능처리");
////		getJdbcTemplate().update(DELETE,vo.getSeq());
//		jdbctemplate.update(DELETE,vo.getSeq());
////		System.out.println("글삭제");
////		try {
////			conn = jdbcutil.getconnection();
////			pstmt = conn.prepareStatement(DELETE);
////			pstmt.setInt(1, vo.getSeq());
////			pstmt.executeUpdate();
////
////		} catch (SQLException e) {
////			e.printStackTrace();
////		} finally {
////			jdbcutil.close(pstmt, conn);
////		}
//	}
//
//	// 글 상세조회
//	public boardVO getboard(boardVO vo) {
//		System.out.println("====>Spring jdbc 로 상세조회 기능처리");
//		Object[] args= {vo.getSeq()};
////		return 	getJdbcTemplate().queryForObject(GET,args,new BoardRowMapper());
//		return jdbctemplate.queryForObject(GET,args,new BoardRowMapper());
//		
//		
//		
//		
////		System.out.println("상세조회");
////		boardVO board = null;
////		try {
////			conn = jdbcutil.getconnection();
////			pstmt = conn.prepareStatement(GET);
////			pstmt.setInt(1, vo.getSeq());
////			rs = pstmt.executeQuery();
////			if (rs.next()) {
//////				board=new boardVO();
////				board.setSeq(rs.getInt("seq"));
////				board.setTitle(rs.getString("title"));
////				board.setWriter(rs.getString("writer"));
////				board.setContent(rs.getString("content"));
////				board.setRegDate(rs.getDate("regdate"));
////				board.setCnt(rs.getInt("cnt"));
////			}
////		} catch (SQLException e) {
////			e.printStackTrace();
////		} finally {
////			jdbcutil.close(pstmt, conn);
////		}
////
////		return board;
//
//	}
//
//	// 글목록 조회
//	public List<boardVO> getboardList(boardVO vo) {
//				System.out.println("====>spring jdbc 리스트 불러오기");
////		return 	getJdbcTemplate().query(LIST, new BoardRowMapper());		
//		return jdbctemplate.query(LIST, new BoardRowMapper());		
//		
//		
//		
//		//		System.out.println("6번 서비스 거쳐서 리스트 불러오기");
////		List<boardVO> list = new ArrayList<boardVO>();
////		try {
////			conn = jdbcutil.getconnection();
////			pstmt = conn.prepareStatement(LIST);
////			rs = pstmt.executeQuery();
////			while (rs.next()) {
////				boardVO board = new boardVO();
////				board.setSeq(rs.getInt("seq"));
////				board.setTitle(rs.getString("title"));
////				board.setWriter(rs.getString("writer"));
////				board.setContent(rs.getString("content"));
////				board.setRegDate(rs.getDate("regdate"));
////				board.setCnt(rs.getInt("cnt"));
////				list.add(board);
////			}
////		} catch (SQLException e) {
////			e.printStackTrace();
////		} finally {
////			jdbcutil.close(pstmt, conn);
////		}
//
////		return list;
//
//	}
//}
