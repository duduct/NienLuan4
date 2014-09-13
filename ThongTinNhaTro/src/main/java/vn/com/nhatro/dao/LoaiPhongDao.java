package vn.com.nhatro.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import vn.com.nhatro.model.Loai;
import vn.com.nhatro.model.Loaiphong;

@Repository
public class LoaiPhongDao {
	@Autowired
	private SessionFactory sessionFactory;

	@Transactional
	public Loai findById(Integer id) {
		return (Loai) sessionFactory.getCurrentSession().get(Loaiphong.class,
				id);
	}

	@Transactional
	public List<Loai> list() {
		List<Loai> list = (List<Loai>) sessionFactory.getCurrentSession()
				.createCriteria(Loaiphong.class).list();
		return list;
	}

	@Transactional
	public void save(Loaiphong loaiphong) {
		sessionFactory.getCurrentSession().saveOrUpdate(loaiphong);
	}
}
