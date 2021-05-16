package com.tp.shop.dto;

public class QnaDto {

	private int qnaNo;
	private String qnaTitle;	
	private String qnaWriter;
	private String qnaContent;
	private String regDate; 
	private int team;//팀은 게시글을만들연 답글을달때 그 답글이 맨위로가는게아니라 그 원글이랑같이있게하는거
	private int depth;//한칸들어가서 re같은거해줄때 구분하기위한거
	private int ranking; //답글 같이있을때 답글이 위에있으면안되니까 그걸 답글에 랭크값을 올려서 원글아래에뜨게하는거
	
	public QnaDto() {}

	public QnaDto(int qnaNo, String qnaTitle, String qnaWriter, String qnaContent, String regDate, int team, int depth,
			int ranking) {
		super();
		this.qnaNo = qnaNo;
		this.qnaTitle = qnaTitle;
		this.qnaWriter = qnaWriter;
		this.qnaContent = qnaContent;
		this.regDate = regDate;
		this.team = team;
		this.depth = depth;
		this.ranking = ranking;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaWriter() {
		return qnaWriter;
	}

	public void setQnaWriter(String qnaWriter) {
		this.qnaWriter = qnaWriter;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
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
		return "QnaDto [qnaNo=" + qnaNo + ", qnaTitle=" + qnaTitle + ", qnaWriter=" + qnaWriter + ", qnaContent="
				+ qnaContent + ", regDate=" + regDate + ", team=" + team + ", depth=" + depth + ", ranking=" + ranking
				+ "]";
	}

}