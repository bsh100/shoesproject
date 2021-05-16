package com.tp.shop.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tp.shop.dto.QnaDto;
import com.tp.shop.exception.DMLException;

@Service
public class QnaService {

	@Autowired
	private QnaDao qnaDao;
	
	public List selectAll() {
		List<QnaDto> list = qnaDao.selectAll();
		return list;
	}

	public QnaDto detail(int qnaNo) { //관리자 페이지 등록시 사용할 아이
		return qnaDao.detail(qnaNo);
	}
	
	public void delete(int qnaNo) throws DMLException {
		qnaDao.delete(qnaNo);
	}
	
	public void update(QnaDto qna) throws DMLException {
		qnaDao.update(qna);
	}
	
	public void insert(QnaDto qna) throws DMLException {
		qnaDao.insert(qna);
	}

	public void reply(QnaDto qna) throws DMLException {
		qnaDao.reply(qna);
	}
	
}
