package vn.com.nhatro.model;

// default package
// Generated Aug 30, 2014 10:27:16 PM by Hibernate Tools 4.0.0

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
import javax.persistence.Table;

/**
 * Diachi generated by hbm2java
 */
@Entity
@Table(name = "diachi", catalog = "nhatro")
public class Diachi implements java.io.Serializable {

	private Integer diachiid;
	private Quan quan;
	private Duong duong;
	private Khac khac;
	private Phuong phuong;
	private Set<Nhatro> nhatros = new HashSet<Nhatro>(0);

	public Diachi() {
	}

	public Diachi(Quan quan, Phuong phuong) {
		this.quan = quan;
		this.phuong = phuong;
	}

	public Diachi(Quan quan, Duong duong, Khac khac, Phuong phuong,
			Set<Nhatro> nhatros) {
		this.quan = quan;
		this.duong = duong;
		this.khac = khac;
		this.phuong = phuong;
		this.nhatros = nhatros;
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
	@JoinColumn(name = "QUANID", nullable = false)
	public Quan getQuan() {
		return this.quan;
	}

	public void setQuan(Quan quan) {
		this.quan = quan;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "DUONGID")
	public Duong getDuong() {
		return this.duong;
	}

	public void setDuong(Duong duong) {
		this.duong = duong;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "KHACID")
	public Khac getKhac() {
		return this.khac;
	}

	public void setKhac(Khac khac) {
		this.khac = khac;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "PHUONGID", nullable = false)
	public Phuong getPhuong() {
		return this.phuong;
	}

	public void setPhuong(Phuong phuong) {
		this.phuong = phuong;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "diachi")
	public Set<Nhatro> getNhatros() {
		return this.nhatros;
	}

	public void setNhatros(Set<Nhatro> nhatros) {
		this.nhatros = nhatros;
	}

}
