package vn.com.nhatro.dao;

import vn.com.nhatro.model.Nhatro;
import vn.com.nhatro.model.User;

public interface UserDao {
	
	User findByUserName(String username);
	
	boolean isLikeNhaTro(Nhatro nhatro, User user);

}