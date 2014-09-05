package vn.com.nhatro.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import vn.com.nhatro.model.Nhatro;

@Repository
public class NhatroDao {
	@Autowired
	private SessionFactory sessionFactory;

	@Transactional
	public Nhatro findById(Integer id) {
		return (Nhatro) sessionFactory.getCurrentSession()
				.get(Nhatro.class, id);
	}

	@Transactional
	public List<Nhatro> list() {
		List<Nhatro> list = (List<Nhatro>) sessionFactory.getCurrentSession()
				.createCriteria(Nhatro.class).list();
		return list;
	}

}
