package com.tp.shop.dto;

public class NoticeDto {

	private int noticeId;
	private String noticeTitle;	
	private String noticeWriter;
	private String noticeContent;
	private String regDate;
	private int team;
	private int depth;
	private int ranking;
	
	public NoticeDto() {
	}

	public NoticeDto(int noticeId, String noticeTitle, String noticeWriter, String noticeContent, String regDate,
			int team, int depth, int ranking) {
		super();
		this.noticeId = noticeId;
		this.noticeTitle = noticeTitle;
		this.noticeWriter = noticeWriter;
		this.noticeContent = noticeContent;
		this.regDate = regDate;
		this.team = team;
		this.depth = depth;
		this.ranking = ranking;
	}

	public int getNoticeId() {
		return noticeId;
	}

	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeWriter() {
		return noticeWriter;
	}

	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getTeam() {
		return team;
	}

	public void setTeam(int team) {
		this.team = team;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public int getRanking() {
		return ranking;
	}

	public void setRanking(int ranking) {
		this.ranking = ranking;
	}

	@Override
	public String toString() {
		return "NoticeDto [noticeId=" + noticeId + ", noticeTitle=" + noticeTitle + ", noticeWriter=" + noticeWriter
				+ ", noticeContent=" + noticeContent + ", regDate=" + regDate + ", team=" + team + ", depth=" + depth
				+ ", ranking=" + ranking + "]";
	}
}