/**
 * 
 */
package vn.com.nhatro.form;

import java.util.ArrayList;
import java.util.List;

import vn.com.nhatro.model.Loaiphong;
import vn.com.nhatro.model.Toado;

/**
 * @author Luong Duc Duy Save Yeu cau dang nha tro form
 *
 */
public class YeuCauDangNhaTro {
	private String diaChi;
	private String soDt;
	private Integer loaiid;
	private Toado toaDo;
	private List<Loaiphong> phongs = new ArrayList<Loaiphong>();

	/**
	 * 
	 */
	public YeuCauDangNhaTro() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public String getSoDt() {
		return soDt;
	}

	public void setSoDt(String soDt) {
		this.soDt = soDt;
	}

	public Integer getLoaiid() {
		return loaiid;
	}

	public void setLoaiid(Integer loaiid) {
		this.loaiid = loaiid;
	}

	public List<Loaiphong> getPhongs() {
		return phongs;
	}

	public void setPhongs(List<Loaiphong> phongs) {
		this.phongs = phongs;
	}

	public Toado getToaDo() {
		return toaDo;
	}

	public void setToaDo(Toado toaDo) {
		this.toaDo = toaDo;
	}

	@Override
	public String toString() {
		return "YeuCauDangNhaTro [diaChi=" + diaChi + ", soDt=" + soDt
				+ ", loaiid=" + loaiid + ", toaDo=" + toaDo + ", phongs="
				+ phongs + ", getDiaChi()=" + getDiaChi() + ", getSoDt()="
				+ getSoDt() + ", getLoaiid()=" + getLoaiid() + ", getPhongs()="
				+ getPhongs() + ", getToaDo()=" + getToaDo() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}

}
