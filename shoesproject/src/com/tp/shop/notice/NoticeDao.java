package com.tp.shop.notice;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tp.shop.dto.NoticeDto;
import com.tp.shop.dto.QnaDto;
import com.tp.shop.exception.DMLException;

@Repository
public class NoticeDao {

	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public List<NoticeDto> selectAll() {
		return sessionTemplate.selectList("noticeMapper.selectAll");
	}

	public NoticeDto detail(int noticeId) {
		return sessionTemplate.selectOne("noticeMapper.select", noticeId);
	}

	public void insert(NoticeDto notice) throws DMLException {
		int result = sessionTemplate.insert("noticeMapper.insert", notice);

		sessionTemplate.update("noticeMapper.update_team", sessionTemplate.selectOne("noticeMapper.selectId", notice));
		if (result == 0) {
			throw new DMLException("게시글이 등록되지 않았습니다");
		}
	}

	public void selectId(NoticeDto notice) {
		sessionTemplate.selectOne("noticeMapper.selectId", notice);
	}

	public void delete(int noticeId) throws DMLException {
		
		int result = sessionTemplate.delete("noticeMapper.delete", noticeId);
		if (result == 0) {// 해당말 출력해줌
			throw new DMLException("게시글이 삭제처리 되지 않았습니다");
		}
	}

	public void update(NoticeDto notice) throws DMLException {
		int result = sessionTemplate.update("noticeMapper.update", notice);
		if (result == 0) {
			throw new DMLException("수정에 실패하였습니다");
		}

	}
}
