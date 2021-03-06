package vn.com.nhatro.model;

public class Marker {
	private Integer nhatroId;
	private String diaChi;
	private Integer gia;
	private float x;
	private float y;
	private Integer minGia;
	private String soDt;
	private String email;
	private Integer luotThich;
	private Integer luotBinhLuan;
	private boolean isLike;
	private String moTa;

	/**
	 * 
	 */
	public Marker() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getNhatroId() {
		return nhatroId;
	}

	public void setNhatroId(Integer nhatroId) {
		this.nhatroId = nhatroId;
	}

	public float getX() {
		return x;
	}

	public void setX(float x) {
		this.x = x;
	}

	public float getY() {
		return y;
	}

	public void setY(float y) {
		this.y = y;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public Integer getGia() {
		return gia;
	}

	public void setGia(Integer gia) {
		this.gia = gia;
	}

	public Integer getMinGia() {
		return minGia;
	}

	public void setMinGia(Integer minGia) {
		this.minGia = minGia;
	}

	public String getSoDt() {
		return soDt;
	}

	public void setSoDt(String soDt) {
		this.soDt = soDt;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getLuotThich() {
		return luotThich;
	}

	public void setLuotThich(Integer luotThich) {
		this.luotThich = luotThich;
	}

	public Integer getLuotBinhLuan() {
		return luotBinhLuan;
	}

	public void setLuotBinhLuan(Integer luotBinhLuan) {
		this.luotBinhLuan = luotBinhLuan;
	}

	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	public boolean isLike() {
		return isLike;
	}

	public void setLike(boolean isLike) {
		this.isLike = isLike;
	}

}