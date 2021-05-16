package com.tp.shop.qna;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tp.shop.dto.QnaDto;
import com.tp.shop.exception.DMLException;

@Repository
public class QnaDao {

	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public List<QnaDto> selectAll() {
		return sessionTemplate.selectList("qnaMapper.selectAll");
	}

	public QnaDto detail(int qnaNo) {
		return sessionTemplate.selectOne("qnaMapper.select", qnaNo);
	}

	public void insert(QnaDto qna) throws DMLException{
		int result=sessionTemplate.insert("qnaMapper.insert", qna);
		
		sessionTemplate.update("qnaMapper.update_team",sessionTemplate.selectOne(
		"qnaMapper.selectId",qna));
		if(result==0) {
			throw new DMLException("게시글이 등록되지 않았습니다");
		}
	}
	
	public void selectId(QnaDto qna) {
		sessionTemplate.selectOne("qnaMapper.selectId", qna);
	}
	
	public void delete(int qnaId) throws DMLException{ //https://okky.kr/article/335672?note=1085031 익셉션이뜨면 해당 런타임익셉션 상섹해준 DMLException이 다시 super로 반환해주고
		int result=sessionTemplate.delete("qnaMapper.delete",qnaId);
		if(result==0) {//해당말 출력해줌
			throw new DMLException("게시글이 삭제처리 되지 않았습니다");
		}
	}
	
	public void update(QnaDto qna) throws DMLException{
		int result=sessionTemplate.update("qnaMapper.update", qna);
		if(result==0) {
			throw new DMLException("수정에 실패하였습니다");
		}
	}
	public void reply(QnaDto qna) throws DMLException{
		int result=sessionTemplate.insert("qnaMapper.reply", qna);
		if(result==0) {
			throw new DMLException("게시글이 등록되지 않았습니다");
		}
	}	
}