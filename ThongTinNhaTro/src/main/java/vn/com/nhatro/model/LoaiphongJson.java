package vn.com.nhatro.model;

public class LoaiphongJson {

	private Integer loaiphongid;
	private int dientich;
	private int songuoi;
	private int gia;
	private int soluong;
	private String motaloaiphong;

	/**
	 * 
	 */
	public LoaiphongJson() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param loaiphongid
	 * @param dientich
	 * @param songuoi
	 * @param gia
	 * @param soluong
	 * @param motaloaiphong
	 */
	public LoaiphongJson(Integer loaiphongid, int dientich, int songuoi,
			int gia, int soluong, String motaloaiphong) {
		super();
		this.loaiphongid = loaiphongid;
		this.dientich = dientich;
		this.songuoi = songuoi;
		this.gia = gia;
		this.soluong = soluong;
		this.motaloaiphong = motaloaiphong;
	}

	public Integer getLoaiphongid() {
		return loaiphongid;
	}

	public void setLoaiphongid(Integer loaiphongid) {
		this.loaiphongid = loaiphongid;
	}

	public int getDientich() {
		return dientich;
	}

	public void setDientich(int dientich) {
		this.dientich = dientich;
	}

	public int getSonguoi() {
		return songuoi;
	}

	public void setSonguoi(int songuoi) {
		this.songuoi = songuoi;
	}

	public int getGia() {
		return gia;
	}

	public void setGia(int gia) {
		this.gia = gia;
	}

	public int getSoluong() {
		return soluong;
	}

	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}

	public String getMotaloaiphong() {
		return motaloaiphong;
	}

	public void setMotaloaiphong(String motaloaiphong) {
		this.motaloaiphong = motaloaiphong;
	}

}
