package com.tp.shop.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tp.shop.dto.NoticeDto;
import com.tp.shop.exception.DMLException;

@Service
public class NoticeService {

	@Autowired
	private NoticeDao noticeDao;
	
	public List selectAll() {
		List<NoticeDto> list = noticeDao.selectAll();
		return list;
	}
	
	public NoticeDto detail(int noticeId) {
		return noticeDao.detail(noticeId);
	}
	
	public void delete(int noticeId) throws DMLException{
		noticeDao.delete(noticeId);
	}
	public void update(NoticeDto notice) throws DMLException {
		noticeDao.update(notice);
	}
	
	public void insert(NoticeDto notice) throws DMLException {
		noticeDao.insert(notice);
	}
}
