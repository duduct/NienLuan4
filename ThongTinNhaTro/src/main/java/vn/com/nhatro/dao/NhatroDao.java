package vn.com.nhatro.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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
	public void deleteById(Integer id) {
		Nhatro nhaTro = findById(id);
		sessionFactory.getCurrentSession().delete(nhaTro);
	}
	
	
	/*
	 * author: Phuong
	 * 
	 */
	@Transactional
	public List<Nhatro> listWaiting(){
		List<Nhatro> lists = sessionFactory.getCurrentSession().createQuery("from Nhatro where trangthai=0").list();
		return lists;
	}
	
	@Transactional
	public void dongy(Integer id){
		sessionFactory.getCurrentSession().createQuery("UPDATE  Nhatro SET trangthai = 1 WHERE nhatroid=" +id).executeUpdate();
	}
	@Transactional
	public void khongdongy(Integer id){
		sessionFactory.getCurrentSession().createQuery("UPDATE  Nhatro SET trangthai = 2 WHERE nhatroid=" +id).executeUpdate();
	}
	
	@Transactional
	public List<Nhatro> searchYeuCau(String noidung){
		//List<Nhatro> lists = sessionFactory.getCurrentSession().createQuery("FROM Nhatro WHERE trangthai=0 and username like '%"+noidung+"%' ").list();
		String hql = "select b.username, a.ngayyeucau, a.diachi, a.sdt, c.tenloai, a.nhatroid from Nhatro as a join a.user as b join a.loai as c where a.trangthai = 0 and (b.username like :noidung or a.ngayyeucau like :noidung or a.diachi like :noidung or c.tenloai like :noidung or a.sdt like :noidung) ";
		Session session = sessionFactory.getCurrentSession();
		List<Nhatro> lists	= (List<Nhatro>) session.createQuery(hql).setString("noidung", "%" + noidung + "%").list();
		return lists;
	}
}
