package vn.com.nhatro.dao;

import java.io.File;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import vn.com.nhatro.model.Nhatro;
import vn.com.nhatro.model.Hinh;
import vn.com.nhatro.model.User;

@Repository
public class HinhDao {
	@Autowired
	private SessionFactory sessionFactory;

	@Transactional
	public Hinh findById(Integer id) {
		return (Hinh) sessionFactory.getCurrentSession().get(Hinh.class, id);
	}

	@Transactional
	public List<Hinh> list() {
		List<Hinh> list = (List<Hinh>) sessionFactory.getCurrentSession()
				.createCriteria(Hinh.class).list();
		return list;
	}

	@Transactional
	public void add(Hinh Hinh) {
		sessionFactory.getCurrentSession().saveOrUpdate(Hinh);
	}

	@Transactional
	public void delete(Hinh Hinh) {
		sessionFactory.getCurrentSession().delete(Hinh);
		try {
			File fileToDelete = new File(Hinh.getDuongdan());

			if (fileToDelete.delete()) {
				System.out.println("File " + Hinh.getDuongdan()
						+ " deleted successfully !");
			} else {
				System.out.println("File " + Hinh.getDuongdan()
						+ " delete operation failed !");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
