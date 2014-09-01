package vn.com.nhatro.model;

// default package
// Generated Sep 1, 2014 7:11:03 PM by Hibernate Tools 4.0.0

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 * Diachi generated by hbm2java
 */
@Entity
@Table(name = "diachi", catalog = "nhatro")
public class Diachi implements java.io.Serializable {

	private Integer diachiid;
	private Duong duong;
	private String diachi;
	private Nhatro nhatro;

	public Diachi() {
	}

	public Diachi(Duong duong, String diachi, Nhatro nhatro) {
		this.duong = duong;
		this.diachi = diachi;
		this.nhatro = nhatro;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "DIACHIID", unique = true, nullable = false)
	public Integer getDiachiid() {
		return this.diachiid;
	}

	public void setDiachiid(Integer diachiid) {
		this.diachiid = diachiid;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "DUONGID")
	public Duong getDuong() {
		return this.duong;
	}

	public void setDuong(Duong duong) {
		this.duong = duong;
	}

	@Column(name = "DIACHI", length = 100)
	public String getDiachi() {
		return this.diachi;
	}

	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}

	@OneToOne(fetch = FetchType.LAZY, mappedBy = "diachi")
	public Nhatro getNhatro() {
		return this.nhatro;
	}

	public void setNhatro(Nhatro nhatro) {
		this.nhatro = nhatro;
	}

}
