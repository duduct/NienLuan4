package vn.com.nhatro.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import vn.com.nhatro.model.Duong;
import vn.com.nhatro.model.Loai;

/**
 * @author luong_000
 */
@Repository
public class DuongDao {
	@Autowired
	private SessionFactory sessionFactory;

	/**
	 * @author luong_000
	 * @param id
	 *            Id of Duong which want to find
	 * @return Duong by Id.
	 */
	@Transactional
	public final Duong findById(final Integer id) {
		return (Duong) sessionFactory.getCurrentSession().get(Duong.class, id);
	}

	/**
	 * @author luong_000
	 * @return List of Duong
	 */
	@Transactional
	public List<Duong> list() {
		List<Duong> list = (List<Duong>) sessionFactory.getCurrentSession()
				.createCriteria(Duong.class).list();
		return list;
	}
}
