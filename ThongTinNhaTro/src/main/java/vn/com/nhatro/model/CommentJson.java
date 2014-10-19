package vn.com.nhatro.model;

import java.util.Date;

public class CommentJson {
	private String userName;
	private String comment;
	private String dateComment;

	/**
	 * 
	 */
	public CommentJson() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getDateComment() {
		return dateComment;
	}

	public void setDateComment(String dateComment) {
		this.dateComment = dateComment;
	}

}
