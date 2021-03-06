package vn.com.nhatro.model;

// default package
// Generated Sep 10, 2014 10:16:40 AM by Hibernate Tools 4.0.0

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
 * Loaiphong generated by hbm2java
 */
@Entity
@Table(name = "loaiphong", catalog = "nhatro")
public class Loaiphong implements java.io.Serializable {

	private Integer loaiphongid;
	private Nhatro nhatro;
	private int dientich;
	private int songuoi;
	private int gia;
	private int soluong;
	private String motaloaiphong;

	public Loaiphong() {
	}

	public Loaiphong(Nhatro nhatro, int dientich, int songuoi, int gia,
			int soluong) {
		this.nhatro = nhatro;
		this.dientich = dientich;
		this.songuoi = songuoi;
		this.gia = gia;
		this.soluong = soluong;
	}

	public Loaiphong(Nhatro nhatro, int dientich, int songuoi, int gia,
			int soluong, String motaloaiphong) {
		this.nhatro = nhatro;
		this.dientich = dientich;
		this.songuoi = songuoi;
		this.gia = gia;
		this.soluong = soluong;
		this.motaloaiphong = motaloaiphong;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "LOAIPHONGID", unique = true, nullable = false)
	public Integer getLoaiphongid() {
		return this.loaiphongid;
	}

	public void setLoaiphongid(Integer loaiphongid) {
		this.loaiphongid = loaiphongid;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "NHATROID", nullable = false)
	public Nhatro getNhatro() {
		return this.nhatro;
	}

	public void setNhatro(Nhatro nhatro) {
		this.nhatro = nhatro;
	}

	@Column(name = "DIENTICH", nullable = false)
	public int getDientich() {
		return this.dientich;
	}

	public void setDientich(int dientich) {
		this.dientich = dientich;
	}

	@Column(name = "SONGUOI", nullable = false)
	public int getSonguoi() {
		return this.songuoi;
	}

	public void setSonguoi(int songuoi) {
		this.songuoi = songuoi;
	}

	@Column(name = "GIA", nullable = false)
	public int getGia() {
		return this.gia;
	}

	public void setGia(int gia) {
		this.gia = gia;
	}

	@Column(name = "SOLUONG", nullable = false)
	public int getSoluong() {
		return this.soluong;
	}

	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}

	@Column(name = "MOTALOAIPHONG", length = 200)
	public String getMotaloaiphong() {
		return this.motaloaiphong;
	}

	public void setMotaloaiphong(String motaloaiphong) {
		this.motaloaiphong = motaloaiphong;
	}

	@Override
	public String toString() {
		return "Loaiphong [loaiphongid=" + loaiphongid + ", nhatro=" + nhatro
				+ ", dientich=" + dientich + ", songuoi=" + songuoi + ", gia="
				+ gia + ", soluong=" + soluong + ", motaloaiphong="
				+ motaloaiphong + "]";
	}

}
