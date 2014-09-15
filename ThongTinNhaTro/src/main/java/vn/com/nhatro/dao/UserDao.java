package vn.com.nhatro.dao;

import vn.com.nhatro.model.Nhatro;
import vn.com.nhatro.model.User;

public interface UserDao {

	User findByUserName(String username);

	/**
	 * @author lonel_000
	 * @param user
	 */
	void save(User user);

	boolean isLikeNhaTro(Nhatro nhatro, User user);

	void add(User user);

	User findUserbyUserName(String username);
}