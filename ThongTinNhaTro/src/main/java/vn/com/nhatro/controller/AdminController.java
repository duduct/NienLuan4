package vn.com.nhatro.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import vn.com.nhatro.dao.NhatroDao;
import vn.com.nhatro.dao.UserDao;
import vn.com.nhatro.dao.UserDaoImpl;
import vn.com.nhatro.model.Nhatro;
import vn.com.nhatro.model.User;
import vn.com.nhatro.model.UserRole;

@RequestMapping("/admin")
@Controller
public class AdminController {
	@Autowired
	private NhatroDao nhatroDao;
	@Autowired
	private UserDao userDao;
	/*Quan ly cac yeu cau dang tin
	 * Actor: admin
	 */
	@Transactional
	@RequestMapping(value = {"","quanlydangtin"}, method= RequestMethod.GET)
	public ModelAndView showModel(){
		ModelAndView model = new ModelAndView();
		model.setViewName("managerRequirement");
		List<Nhatro> lists = nhatroDao.listWaiting();
		String showNull = "Không có yêu cầu đăng tin";
		if(lists.isEmpty()){
			model.addObject("showNull", showNull);
		}
		else{
			model.addObject("listUser", lists);
		}
		return model;
	}
	
	@RequestMapping(value="/quanlydangtin/dongy/id={nhatroid}", method= RequestMethod.GET)
	public String dongy(@PathVariable("nhatroid") Integer nhatroid){
		nhatroDao.dongy(nhatroid);
		return "redirect:/admin/quanlydangtin";
	}
	
	@RequestMapping(value="quanlydangtin/khongdongy/id={nhatroid}", method= RequestMethod.GET)
	public String khongdongy(@PathVariable("nhatroid") Integer nhatroid){
		nhatroDao.khongdongy(nhatroid);
		return "redirect:/admin/quanlydangtin";
	}
	
	@RequestMapping(value="quanlydangtin/searchyeucau/nd={searchContent}", method=RequestMethod.GET)
	public ModelAndView searchYeuCau(@PathVariable("searchContent") String searchContent ){
		ModelAndView model = new ModelAndView();
		List<Nhatro> lists = nhatroDao.searchYeuCau(searchContent);
		String searchNull = "Thông tin tìm kiếm không tồn tại.";
		if(searchContent.isEmpty() || searchContent.equals(" ")){
			model.setViewName("redirect:/admin/quanlydangtin");
		}else{
			model.setViewName("managerRequirement");
			if (lists.isEmpty()){
				model.addObject("searchNull", searchNull);
			}
			else{
				model.addObject("lists", lists);
			}
		}
		
		return model;
	}
	
	
	
	/*Quan ly cac thanh vien
	 * actor: admin
	 */
	@Transactional
	@RequestMapping(value="quanlythanhvien", method= RequestMethod.GET)
	public ModelAndView showUser(){
		ModelAndView model = new ModelAndView();
		model.setViewName("managerUser");
		List<User> lists = userDao.listUser();
		String showNull = "Không tồn tại thành viên nào.";
		List<User> listUser = new ArrayList<User>();
		List<User> temp = new ArrayList<User>();
		if(lists.isEmpty()){
			model.addObject("showNull", showNull);
		}else{
			int size = lists.size();
			for(int i = 0; i < size; i++){
				UserRole s = (UserRole) lists.get(i).getUserroles().iterator().next();
				Set set = new HashSet();
				set.add(s.getRole());
				lists.get(i).setUserroles(set);
			}
			model.addObject("listUser", lists);
		}
		return model;
	}
	
	@RequestMapping(value="quanlythanhvien/xoa/user={username}", method= RequestMethod.GET)
	public String xoa(@PathVariable("username") String username){
		userDao.xoaThanhVien(username);
		return "redirect:/admin/quanlythanhvien";
	}
	@Transactional
	@RequestMapping(value="quanlydangtin/searchthanhvien/nd={content}", method=RequestMethod.GET)
	public ModelAndView searchThanhVien(@PathVariable("content") String content ){
		ModelAndView model = new ModelAndView();
		List<User> lists = userDao.searchThanhVien(content);
		String searchNull = "Thông tin tìm kiếm không tồn tại.";
		if(content.isEmpty() || content.equals(" ")){
			model.setViewName("redirect:/admin/quanlythanhvien");
		}else{
			model.setViewName("managerUser");
			if (lists.isEmpty()){
				model.addObject("searchNull", searchNull);
			}
			else{
				int size = lists.size();
				for(int i = 0; i < size; i++){
					UserRole s = (UserRole) lists.get(i).getUserroles().iterator().next();
					Set set = new HashSet();
					set.add(s.getRole());
					lists.get(i).setUserroles(set);
				}
				model.addObject("lists", lists);
			}
		}
		return model;
	}
}
