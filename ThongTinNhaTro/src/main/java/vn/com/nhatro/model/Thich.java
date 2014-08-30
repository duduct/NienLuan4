package vn.com.nhatro.model;

// default package
// Generated Aug 30, 2014 10:27:16 PM by Hibernate Tools 4.0.0

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Thich generated by hbm2java
 */
@Entity
@Table(name = "thich", catalog = "nhatro")
public class Thich implements java.io.Serializable {

	private Integer thichid;
	private Nhatro nhatro;
	private User user;
	private Date date;

	public Thich() {
	}

	public Thich(Nhatro nhatro, User user, Date date) {
		this.nhatro = nhatro;
		this.user = user;
		this.date = date;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "THICHID", unique = true, nullable = false)
	public Integer getThichid() {
		return this.thichid;
	}

	public void setThichid(Integer thichid) {
		this.thichid = thichid;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "NHATROID", nullable = false)
	public Nhatro getNhatro() {
		return this.nhatro;
	}

	public void setNhatro(Nhatro nhatro) {
		this.nhatro = nhatro;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "USERNAME", nullable = false)
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "DATE", nullable = false, length = 19)
	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

}
