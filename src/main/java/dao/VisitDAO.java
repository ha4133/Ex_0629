package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.VisitVO;

public class VisitDAO {
	SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//방명록 전체 게시글 조회
	public List<VisitVO> selectList(){
		List<VisitVO> list = sqlSession.selectList("v.visit_list");
		return list;//DB에서 얻어낸 List를 반환
	}
	
	//새 글 추가
	public int insertUser(VisitVO vo) {
		//맵퍼에게 vo를 전달
		//맵퍼로 전달되는 파라미터 값은 무조건 한 개
		int res = sqlSession.insert("v.visit_insert", vo);
		return res;
	}
	
	//글 삭제
	public int delUser(int idx){
		int res = sqlSession.delete("v.visit_delete", idx);
		return res;
	}
	
	//글 수정
	public int update_modify(VisitVO vo) {
		System.out.println(vo.getContent());
		System.out.println(vo.getIdx());
		System.out.println(vo.getIp());
		System.out.println(vo.getName());
		System.out.println(vo.getPwd());
		int res = sqlSession.update("v.visit_update", vo);
		return res;
	}
}

















