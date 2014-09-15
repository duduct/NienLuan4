package vn.com.nhatro.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import vn.com.nhatro.model.Nhatro;
import vn.com.nhatro.model.Thich;
import vn.com.nhatro.model.User;

@Repository
public class UserDaoImpl implements UserDao {
	@Autowired
	private SessionFactory sessionFactory;
	@Autowired
	private ThichDao thichDao;

	@SuppressWarnings("unchecked")
	@Transactional
	public User findByUserName(String username) {

		List<User> users = new ArrayList<User>();

		users = sessionFactory.getCurrentSession()
				.createQuery("from User where username=?")
				.setParameter(0, username).list();

		if (users.size() > 0) {
			return users.get(0);
		} else {
			return null;
		}

	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	@Override
	public boolean isLikeNhaTro(Nhatro nhatro, User user) {
		// TODO Auto-generated method stub
		Thich thich = thichDao.findByNhaTroUser(nhatro, user);
		return (thich == null ? false : true);
	}

	/**
	 * @author lonel_000
	 */
	@Transactional
	public void save(User user) {
		sessionFactory.getCurrentSession().update(user);
	}

	/**
	 * @author lonel_000
	 */
	@Transactional
	public void add(User user) {
		sessionFactory.getCurrentSession().save(user);
	}
	@Transactional
	public final User findUserbyUserName(String username) {
		return (User) sessionFactory.getCurrentSession()
				.get(User.class, username);
	}
	
	/*
	 * author: PHuong
	 */
	
	@Transactional
	public void xoaThanhVien(String name){
		sessionFactory.getCurrentSession().createQuery("UPDATE  User SET enabled = 0 WHERE username='"+name+"' ").executeUpdate();
	}
	
	@Transactional
	public List<User> listUser(){
		List<User> lists = sessionFactory.getCurrentSession().createQuery("from User where enabled= 1").list();
		return lists;
	}

	@Override
	@Transactional
	public List<User> searchThanhVien(String content) {
		
			//List<Nhatro> lists = sessionFactory.getCurrentSession().createQuery("FROM Nhatro WHERE trangthai=0 and username like '%"+noidung+"%' ").list();
			String hql = "from User  where enabled = 1 and (username like :content ) ";
			Session session = sessionFactory.getCurrentSession();
			List<User> lists = (List<User>) session.createQuery(hql).setString("content", "%" + content + "%").list();
			return lists;
	}
}