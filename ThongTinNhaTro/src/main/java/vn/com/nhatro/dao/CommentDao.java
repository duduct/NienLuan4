package vn.com.nhatro.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import vn.com.nhatro.model.Nhatro;
import vn.com.nhatro.model.Comment;
import vn.com.nhatro.model.User;

@Repository
public class CommentDao {
	@Autowired
	private SessionFactory sessionFactory;

	@Transactional
	public Comment findById(Integer id) {
		return (Comment) sessionFactory.getCurrentSession().get(Comment.class,
				id);
	}

	@Transactional
	public List<Comment> list() {
		List<Comment> list = (List<Comment>) sessionFactory.getCurrentSession()
				.createCriteria(Comment.class).list();
		return list;
	}

	@Transactional
	public void add(Comment Comment) {
		sessionFactory.getCurrentSession().saveOrUpdate(Comment);
	}

	@Transactional
	public void delete(Comment Comment) {
		sessionFactory.getCurrentSession().delete(Comment);
	}
}
