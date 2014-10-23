package vn.com.nhatro.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import vn.com.nhatro.model.Loaiphong;
import vn.com.nhatro.model.Nhatro;
import vn.com.nhatro.model.User;

@Repository
public class NhatroDao {
	@Autowired
	private SessionFactory sessionFactory;
	@Autowired
	private UserDao userDao;

	@Transactional
	public Nhatro findById(Integer id) {
		return (Nhatro) sessionFactory.getCurrentSession()
				.get(Nhatro.class, id);
	}

	@Transactional
	public void save(Nhatro nhatro) {
		sessionFactory.getCurrentSession().save(nhatro);
	}

	@Transactional
	public void update(Nhatro nhatro) {
		sessionFactory.getCurrentSession().update(nhatro);
	}

	@Transactional
	public List<Nhatro> list() {
		List<Nhatro> list = (List<Nhatro>) sessionFactory.getCurrentSession()
				.createCriteria(Nhatro.class).list();
		return list;
	}

	@Transactional
	public List<Nhatro> findNhaTroByUsername(String username) {
		User user = userDao.findByUserName(username);
		List<Nhatro> nhatros = new ArrayList<Nhatro>(user.getNhatros());
		return nhatros;
	}

	@Transactional
	boolean checkNhatro(Nhatro nhatro, Integer mucGiaMin, Integer mucGiaMax,
			Integer dienTichMin, Integer dienTichMax) {
		List<Loaiphong> loaiPhong = new ArrayList<Loaiphong>(
				nhatro.getLoaiphongs());
		boolean isGiaOk = false;
		boolean isDienTichOk = false;
		for (Loaiphong phong : loaiPhong) {
			float gia = phong.getGia();
			Integer dienTich = phong.getDientich();
			if (gia >= mucGiaMin && gia <= mucGiaMax)
				isGiaOk = true;
			if (dienTich >= dienTichMin && dienTich <= dienTichMax)
				isDienTichOk = true;
		}
		return (isGiaOk && isDienTichOk);
	}

	/**
	 * 
	 * @param loaiNhaTro
	 * @param mucGiaMin
	 * @param mucGiaMax
	 * @param dienTichMin
	 * @param dienTichMax
	 * @param kinhDo
	 * @param viDo
	 * @return danh sach nha tro phu hop theo tieu chi tim kiem
	 */
	@Transactional
	public List<Nhatro> findNhaTro(Integer loaiNhaTro, Integer mucGiaMin,
			Integer mucGiaMax, Integer dienTichMin, Integer dienTichMax,
			Integer trangThai) {
		List<Nhatro> list = new ArrayList<Nhatro>();
		List<Nhatro> result = new ArrayList<Nhatro>();
		Query query;
		String strQuery = "from Nhatro where trangthai = :trangthai";
		if (loaiNhaTro != 0) {
			strQuery += " and loaiid = :loai";
			query = sessionFactory.getCurrentSession().createQuery(strQuery);
			query.setParameter("loai", loaiNhaTro);
		} else {
			query = sessionFactory.getCurrentSession().createQuery(strQuery);
		}
		query.setParameter("trangthai", trangThai);
		list = query.list();
		for (Nhatro nhatro : list) {
			if (checkNhatro(nhatro, mucGiaMin, mucGiaMax, dienTichMin,
					dienTichMax)) {
				result.add(nhatro);
			}
		}
		return result;
	}

	@Transactional
	public void deleteById(Integer id) {
		Nhatro nhaTro = findById(id);
		sessionFactory.getCurrentSession().delete(nhaTro);
	}

	/*
	 * author: Phuong
	 */
	@Transactional
	public List<Nhatro> listWaiting() {
		List<Nhatro> lists = sessionFactory.getCurrentSession()
				.createQuery("from Nhatro where trangthai=0").list();
		return lists;
	}

	@Transactional
	public void dongy(Integer id) {
		sessionFactory
				.getCurrentSession()
				.createQuery(
						"UPDATE  Nhatro SET trangthai = 1 WHERE nhatroid=" + id)
				.executeUpdate();
	}

	@Transactional
	public void khongdongy(Integer id) {
		sessionFactory
				.getCurrentSession()
				.createQuery(
						"UPDATE  Nhatro SET trangthai = 2 WHERE nhatroid=" + id)
				.executeUpdate();
	}

	@Transactional
	public List<Nhatro> searchYeuCau(String noidung) {
		// List<Nhatro> lists =
		// sessionFactory.getCurrentSession().createQuery("FROM Nhatro WHERE trangthai=0 and username like '%"+noidung+"%' ").list();
		String hql = "select b.username, a.ngayyeucau, a.diachi, a.sdt, c.tenloai, a.nhatroid from Nhatro as a join a.user as b join a.loai as c where a.trangthai = 0 and (b.username like :noidung or a.ngayyeucau like :noidung or a.diachi like :noidung or c.tenloai like :noidung or a.sdt like :noidung) ";
		Session session = sessionFactory.getCurrentSession();
		List<Nhatro> lists = (List<Nhatro>) session.createQuery(hql)
				.setString("noidung", "%" + noidung + "%").list();
		return lists;
	}

	/**
	 * @author luong_000 Kiem tra xem toa do da co ton tai trong he thong hay
	 *         chua
	 */
	public boolean kiemTraDiaChi(Float kinhDo, Float viDo) {
		String hql = "select count(*) from Toado where abs(x - " + kinhDo
				+ ") <= power(10, -5) and abs(y - " + viDo + ") <= power(10, -5)";
		Integer result = ((Number) sessionFactory.getCurrentSession()
				.createQuery(hql).uniqueResult()).intValue();
		System.out.println(hql + " " + result);
		return (result > 0);
	}
}
