package vn.com.nhatro.model;
// default package
// Generated Sep 9, 2014 4:09:16 PM by Hibernate Tools 4.0.0

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Userrole generated by hbm2java
 */
@Entity
@Table(name = "userrole", catalog = "nhatro")
public class UserRole implements java.io.Serializable {

	private Integer userroleid;
	private User user;
	private String role;

	public UserRole() {
	}

	public UserRole(User user, String role) {
		this.user = user;
		this.role = role;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "USERROLEID", unique = true, nullable = false)
	public Integer getUserroleid() {
		return this.userroleid;
	}

	public void setUserroleid(Integer userroleid) {
		this.userroleid = userroleid;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "USERNAME", nullable = false)
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "ROLE", nullable = false, length = 45)
	public String getRole() {
		return this.role;
	}

	public void setRole(String role) {
		this.role = role;
	}

}
