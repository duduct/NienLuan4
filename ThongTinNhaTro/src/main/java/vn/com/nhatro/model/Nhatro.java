package vn.com.nhatro.model;

// default package
// Generated Sep 9, 2014 4:09:16 PM by Hibernate Tools 4.0.0

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Cascade;

@Entity
@Table(name = "nhatro", catalog = "nhatro")
public class Nhatro implements java.io.Serializable {

	private Integer nhatroid;
	private Loai loai;
	private Toado toado;
	private User user;
	private String sdt;
	private String diachi;
	private String email;
	private int trangthai;
	private String motanhatro;
	private Date ngaydang;
	private Date ngayyeucau;
	private Set<Loaiphong> loaiphongs = new HashSet<Loaiphong>(0);
	private Set<Hinh> hinhs = new HashSet<Hinh>(0);
	private Set<Comment> comments = new HashSet<Comment>(0);
	private Set<Thich> thiches = new HashSet<Thich>(0);

	public Nhatro() {
	}

	public Nhatro(Loai loai, Toado toado, User user, String sdt, int trangthai) {
		this.loai = loai;
		this.toado = toado;
		this.user = user;
		this.sdt = sdt;
		this.trangthai = trangthai;
	}

	public Nhatro(Loai loai, Toado toado, User user, String sdt, String diachi,
			String email, int trangthai, String motanhatro, Date ngaydang,
			Date ngayyeucau, Set<Loaiphong> loaiphongs, Set<Hinh> hinhs,
			Set<Comment> comments, Set<Thich> thiches) {
		this.loai = loai;
		this.toado = toado;
		this.user = user;
		this.sdt = sdt;
		this.diachi = diachi;
		this.email = email;
		this.trangthai = trangthai;
		this.motanhatro = motanhatro;
		this.ngaydang = ngaydang;
		this.ngayyeucau = ngayyeucau;
		this.loaiphongs = loaiphongs;
		this.hinhs = hinhs;
		this.comments = comments;
		this.thiches = thiches;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "NHATROID", unique = true)
	public Integer getNhatroid() {
		return this.nhatroid;
	}

	public void setNhatroid(Integer nhatroid) {
		this.nhatroid = nhatroid;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "LOAIID", nullable = false)
	public Loai getLoai() {
		return this.loai;
	}

	public void setLoai(Loai loai) {
		this.loai = loai;
	}

	@OneToOne(fetch = FetchType.EAGER, cascade=CascadeType.ALL)
	@JoinColumn(name = "TOADOID", nullable = false)
	public Toado getToado() {
		return this.toado;
	}

	public void setToado(Toado toado) {
		this.toado = toado;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "USERNAME")
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "SDT", nullable = false, length = 12)
	public String getSdt() {
		return this.sdt;
	}

	public void setSdt(String sdt) {
		this.sdt = sdt;
	}

	@Column(name = "DIACHI", length = 100)
	public String getDiachi() {
		return this.diachi;
	}

	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}

	@Column(name = "EMAIL", length = 50)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "TRANGTHAI", nullable = false)
	public int getTrangthai() {
		return this.trangthai;
	}

	public void setTrangthai(int trangthai) {
		this.trangthai = trangthai;
	}

	@Column(name = "MOTANHATRO", length = 200)
	public String getMotanhatro() {
		return this.motanhatro;
	}

	public void setMotanhatro(String motanhatro) {
		this.motanhatro = motanhatro;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "NGAYDANG", length = 19)
	public Date getNgaydang() {
		return this.ngaydang;
	}

	public void setNgaydang(Date ngaydang) {
		this.ngaydang = ngaydang;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "NGAYYEUCAU", length = 19)
	public Date getNgayyeucau() {
		return this.ngayyeucau;
	}

	public void setNgayyeucau(Date ngayyeucau) {
		this.ngayyeucau = ngayyeucau;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "nhatro", cascade = {
			CascadeType.PERSIST, CascadeType.REMOVE })
	public Set<Loaiphong> getLoaiphongs() {
		return this.loaiphongs;
	}

	public void setLoaiphongs(Set<Loaiphong> loaiphongs) {
		this.loaiphongs = loaiphongs;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "nhatro", cascade= {javax.persistence.CascadeType.PERSIST, javax.persistence.CascadeType.REMOVE })
	public Set<Hinh> getHinhs() {
		return this.hinhs;
	}

	public void setHinhs(Set<Hinh> hinhs) {
		this.hinhs = hinhs;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "nhatro", cascade= {javax.persistence.CascadeType.PERSIST, javax.persistence.CascadeType.REMOVE })
	public Set<Comment> getComments() {
		return this.comments;
	}

	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "nhatro", cascade= {javax.persistence.CascadeType.PERSIST, javax.persistence.CascadeType.REMOVE })
	public Set<Thich> getThiches() {
		return this.thiches;
	}

	public void setThiches(Set<Thich> thiches) {
		this.thiches = thiches;
	}

	public Integer tinhMinGia() {
		Integer result = 999999999;
		for (Loaiphong phong : loaiphongs) {
			result = Math.min(result, phong.getGia());
		}
		return result;
	}

}
