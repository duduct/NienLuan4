package vn.com.nhatro.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import vn.com.nhatro.model.UserRole;

@Repository
public class UserRoleDao {
	@Autowired
	private SessionFactory sessionFactory;

	@Transactional
	public void add(UserRole userrole) {
		sessionFactory.getCurrentSession().save(userrole);
	}
}
