package vn.com.nhatro.dao;

import java.util.ArrayList;
import java.util.List;

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
}
