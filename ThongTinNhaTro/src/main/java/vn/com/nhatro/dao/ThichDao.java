package vn.com.nhatro.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import vn.com.nhatro.model.Nhatro;
import vn.com.nhatro.model.Thich;
import vn.com.nhatro.model.User;

@Repository
public class ThichDao {
	@Autowired
	private SessionFactory sessionFactory;

	@Transactional
	public Thich findById(Integer id) {
		return (Thich) sessionFactory.getCurrentSession().get(Thich.class, id);
	}

	@Transactional
	public List<Thich> list() {
		List<Thich> list = (List<Thich>) sessionFactory.getCurrentSession()
				.createCriteria(Thich.class).list();
		return list;
	}

	@Transactional
	public void add(Thich thich) {
		sessionFactory.getCurrentSession().saveOrUpdate(thich);
	}

	@Transactional
	public Thich findByNhaTroUser(Nhatro nhatro, User user) {
		List<Thich> thich;
		thich = sessionFactory.getCurrentSession()
				.createQuery("from Thich where nhatroid = ? and username = ?")
				.setParameter(0, nhatro.getNhatroid())
				.setParameter(1, user.getUsername()).list();
		if (thich.size() > 0) {
			return thich.get(0);
		} else {
			return null;
		}
	}

	@Transactional
	public void delete(Thich thich) {
		sessionFactory.getCurrentSession().delete(thich);
	}
}
