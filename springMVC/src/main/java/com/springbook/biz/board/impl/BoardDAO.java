package com.springbook.biz.board.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.springbook.biz.board.boardVO;
import com.springbook.biz.common.JDBCUtil;

//DAO(Data Access Object)
//@Repository("boardDAO")
public class BoardDAO {
	public BoardDAO() {
		System.out.println("dao 빈생성");
	}
	JDBCUtil jdbcutil;
	// jdbc 관련 변수
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	// sql 명령어
	private final String BOARD_LIST_T="select * from board where title like ? order by seq desc";
	private final String BOARD_LIST_C="select * from board where content like ? order by seq desc";
	private final String INSERT = "insert into board(seq, title, writer,content) values((SELECT IFNULL(MAX(seq+1), 0) FROM board SUBQUERY),?,?,?)";
	private final String UPDATE = "update board set title=?, content=? where seq=?";
	private final String DELETE = "delete from board where seq=?";
	private final String GET = "select * from board where seq=?";
	private final String LIST = "select * from board order by seq desc";
	
	// CRUD 기능의 메소드 구현 (크리에이드 리드 업데이트 딜리트)

	// 글등록
	public void insertboard(boardVO vo) {
		System.out.println("-====>jdbc 로 인설트 기능처리");

		try {
			conn = jdbcutil.getconnection();
			pstmt = conn.prepareStatement(INSERT);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getWriter());
			pstmt.setString(3, vo.getContent());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			jdbcutil.close(pstmt, conn);
		}

	}

	// 글 수정
	public void updateboard(boardVO vo) {
		System.out.println("업데이트보더DAO?");
		try {
			conn = jdbcutil.getconnection();
			pstmt = conn.prepareStatement(UPDATE);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getSeq());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			jdbcutil.close(pstmt, conn);
		}

	}

	// 글삭제
	public void deleteboard(boardVO vo) {
		System.out.println("글삭제");
		try {
			conn = jdbcutil.getconnection();
			pstmt = conn.prepareStatement(DELETE);
			pstmt.setInt(1, vo.getSeq());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			jdbcutil.close(pstmt, conn);
		}
	}

	// 글 상세조회
	public boardVO getboard(boardVO vo) {
		System.out.println("상세조회");
		boardVO board = new boardVO();
		try {
			conn = jdbcutil.getconnection();
			pstmt = conn.prepareStatement(GET);
			pstmt.setInt(1, vo.getSeq());
			rs = pstmt.executeQuery();
			if (rs.next()) {
//				board=new boardVO();
				board.setSeq(rs.getInt("seq"));
				board.setTitle(rs.getString("title"));
				board.setWriter(rs.getString("writer"));
				board.setContent(rs.getString("content"));
				board.setRegDate(rs.getDate("regdate"));
				board.setCnt(rs.getInt("cnt"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			jdbcutil.close(pstmt, conn);
		}

		return board;

	}
	//글목록 조회
	public List<boardVO> getboardList(boardVO vo){
		List<boardVO> list = new ArrayList<boardVO>();
		try {
			conn = jdbcutil.getconnection();
			if(vo.getSearchCondition().equals("TITLE")) {
				pstmt =conn.prepareStatement(BOARD_LIST_T);
			}else if(vo.getSearchCondition().equals("CONTENT")) {
				pstmt=conn.prepareStatement(BOARD_LIST_C);
			}
				pstmt.setString(1, "%"+vo.getSerchKeyword()+"%");
				System.out.println(vo.getSerchKeyword());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				boardVO board=new boardVO();
				board.setSeq(rs.getInt("seq"));
				board.setTitle(rs.getString("title"));
				board.setWriter(rs.getString("writer"));
				board.setContent(rs.getString("content"));
				board.setRegDate(rs.getDate("regdate"));
				board.setCnt(rs.getInt("cnt"));
				list.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			jdbcutil.close(pstmt, conn);
		}

		return list;
		
		
	}
}
