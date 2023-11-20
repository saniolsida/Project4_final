package com.example.project4_final;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.example.project4_final.BoardVO;
import com.example.project4_final.JDBCUtil;

public class BoardDAO {
	
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	private final String BOARD_INSERT = "insert into BOARD (title, writer, content, category, updates) values (?,?,?,?,?)";
	private final String BOARD_UPDATE = "update BOARD set title=?, writer=?, content=?, category=?, updates=? where seq=?";
	private final String BOARD_DELETE = "delete from BOARD  where seq=?";
	private final String BOARD_REUPDATE = "UPDATE BOARD SET seq = seq - 1 WHERE seq > ?";
	private final String BOARD_GET = "select * from BOARD  where seq=?";
	private final String BOARD_LIST = "select * from BOARD order by seq desc";

	public int insertBoard(BoardVO vo) {
		System.out.println("===> JDBC로 insertBoard() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_INSERT);
			stmt.setString(1, vo.getTitle());
			stmt.setString(2, vo.getWriter());
			stmt.setString(3, vo.getContent());
			stmt.setInt(4,vo.getCategory());
			stmt.setInt(5,vo.getUpdates());
			stmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	// 글 삭제
	public void deleteBoard(BoardVO vo) {
		System.out.println("===> JDBC로 deleteBoard() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_DELETE);
			stmt.setInt(1, vo.getSeq());
			stmt.executeUpdate();

			stmt = conn.prepareStatement(BOARD_REUPDATE);
			stmt.setInt(1, vo.getSeq());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public int updateBoard(BoardVO vo) {
		System.out.println("===> JDBC로 updateBoard() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_UPDATE);
			stmt.setString(1, vo.getTitle());
			stmt.setString(2, vo.getWriter());
			stmt.setString(3, vo.getContent());
			stmt.setInt(4,vo.getCategory());
			stmt.setInt(5,vo.getUpdates());
			stmt.setInt(6, vo.getSeq());
			System.out.println(vo.getTitle() + "-" + vo.getWriter() + "-" + vo.getContent() + "- seq > " + vo.getSeq() + "-" + vo.getCategory() + "- updates ->" + vo.getUpdates());
			stmt.executeUpdate();
			return 1;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}	
	
	public BoardVO getBoard(int seq) {
		BoardVO one = new BoardVO();
		System.out.println("===> JDBC로 getBoard() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_GET);
			stmt.setInt(1, seq);
			rs = stmt.executeQuery();
			if(rs.next()) {
				one.setSeq(rs.getInt("seq"));
				one.setTitle(rs.getString("title"));
				one.setWriter(rs.getString("writer"));
				one.setContent(rs.getString("content"));
				one.setCnt(rs.getInt("cnt"));
				one.setCategory(rs.getInt("category"));
				one.setUpdates(rs.getInt("updates"));
				one.setRegdate(rs.getDate("regdate"));
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return one;
	}
	
	public List<BoardVO> getBoardList(){
		List<BoardVO> list = new ArrayList<BoardVO>();
		System.out.println("===> JDBC로 getBoardList() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_LIST);
			rs = stmt.executeQuery();
			while(rs.next()) {
				BoardVO one = new BoardVO();
				String title_s = rs.getString("title");
				String content_s = rs.getString("content");
				if(title_s.length() > 9)
					title_s = title_s.substring(0,9);
				if(content_s.length() > 9)
					content_s = content_s.substring(0,9);
				one.setSeq(rs.getInt("seq"));
				one.setTitle(title_s);
				one.setWriter(rs.getString("writer"));
				one.setContent(content_s);
				one.setRegdate(rs.getDate("regdate"));
				one.setCnt(rs.getInt("cnt"));
				one.setCategory(rs.getInt("category"));
				one.setUpdates(rs.getInt("updates"));
				list.add(one);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
        return list;
	}

}
