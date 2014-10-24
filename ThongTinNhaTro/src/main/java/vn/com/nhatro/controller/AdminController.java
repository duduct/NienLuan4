package vn.com.nhatro.controller;

import java.util.Date;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.PropertyNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import vn.com.nhatro.dao.NhatroDao;
import vn.com.nhatro.dao.UserDao;
import vn.com.nhatro.model.Loai;
import vn.com.nhatro.model.Loaiphong;
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
	
	/**
	 * Tai trang quan ly dang tin
	 * @author Phuong
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "quanlydangtin")
	public String quanLyDangTin(HttpServletRequest request) {
		System.out.println("Quan ly dang tin");
		return "admin";
	}
	
	/**
	 * Load thong tin yeu cau theo id phuc vu cho ajax
	 * @param request
	 * @param model
	 * @return
	 */
	@Transactional
	@RequestMapping(value = "quanlydangtin/loadYeuCau")
	public String loadYeuCau(HttpServletRequest request, Model model) {
		Integer nhatroId = Integer.parseInt(request.getParameter("id"));
		Nhatro nhatro = nhatroDao.findById(nhatroId);
		model.addAttribute("nhatro", nhatro);
		return "load-yeucau";
	}

	@RequestMapping(value = "quanlydangtin/dongy", method = RequestMethod.GET)
	public String dongy(HttpServletRequest http) {
		String strNhatroid = http.getParameter("showYeuCauID");
		System.out.print(strNhatroid);
		Integer nhatroid = Integer.parseInt(strNhatroid);
		nhatroDao.dongy(nhatroid);
		return "redirect:/admin/quanlydangtin";
	}

	@RequestMapping(value = "quanlydangtin/khongdongy", method = RequestMethod.GET)
	public String khongdongy(HttpServletRequest http) {
		String strNhatroid = http.getParameter("showYeuCauID");
		Integer nhatroid = Integer.parseInt(strNhatroid);
		nhatroDao.khongdongy(nhatroid);
		return "redirect:/admin/quanlydangtin";
	}

	@RequestMapping(value = "quanlydangtin/dongy/id={nhatroid}", method = RequestMethod.GET)
	public String dongy(@PathVariable("nhatroid") Integer nhatroid) {
		nhatroDao.dongy(nhatroid);
		return "redirect:/admin/quanlydangtin";
	}

	@RequestMapping(value = "quanlydangtin/khongdongy/id={nhatroid}", method = RequestMethod.GET)
	public String khongdongy(@PathVariable("nhatroid") Integer nhatroid) {
		nhatroDao.khongdongy(nhatroid);
		return "redirect:/admin/quanlydangtin";
	}
	
	/**
	 * Tim kiem yeu cau cho danh sach cua thanh ben trai. Phuc vu cho ajax
	 * @author Phuong
	 * @param model
	 * @param http
	 * @return
	 */
	@Transactional
	@RequestMapping(value = "quanlydangtin/searchYeuCau")
	public String searchYeuCau( Model model, HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String searchContent = request.getParameter("searchContent");
		searchContent = searchContent.trim();
		List<Nhatro> nhatros = nhatroDao.searchYeuCau(searchContent);
		List<Nhatro> resultToday = new ArrayList<Nhatro>();
		List<Nhatro> resultYesterday = new ArrayList<Nhatro>();
		List<Nhatro> resultOver = new ArrayList<Nhatro>();
		
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date dateTemp = new Date();
		Date sqlToday = new java.sql.Date(dateTemp.getTime());
		String today = dateFormat.format(sqlToday);
		Date sqlYesterday = new java.sql.Date(dateTemp.getTime()
				- (24 * 60 * 60 * 1000));
		String yesterday = dateFormat.format(sqlYesterday);

		// Tach ket qua thanh 3 danh sach : hom nay, hom qua, ngay khac
		for (Nhatro nhatro : nhatros) {
			try {
				Date dateInData = dateFormat.parse(nhatro.getNgayyeucau().toString());
				String date = dateFormat.format(dateInData);
				if (date.equals(today)) {
					nhatro.setNgayyeucau(sqlToday);
					resultToday.add(nhatro);
				} else {
					if (date.equals(yesterday)) {
						nhatro.setNgayyeucau(sqlYesterday);
						resultYesterday.add(nhatro);
					} else {
						resultOver.add(nhatro);
					}
				}
			} catch (Exception e) {

			}
		}
		// End for
		model.addAttribute("resultToday", resultToday);
		model.addAttribute("resultYesterday", resultYesterday);
		model.addAttribute("resultOver", resultOver);

		return "admin.ajax.dangtin";
	}

	/*
	 * Quan ly cac thanh vien actor: admin
	 */
	@Transactional
	@RequestMapping(value = "quanlythanhvien", method = RequestMethod.GET)
	public ModelAndView showUser() {
		ModelAndView model = new ModelAndView();
		model.setViewName("adminThanhVien");
		List<User> lists = userDao.listUser();
		model.addObject("listUser", lists);
		model.addObject("showUser", lists);
		return model;
	}

	@RequestMapping(value = "quanlythanhvien/xoa/user={username}", method = RequestMethod.GET)
	public String xoa(@PathVariable("username") String username) {
		userDao.xoaThanhVien(username);
		return "redirect:/admin/quanlythanhvien";
	}

	@Transactional
	@RequestMapping(value = "quanlythanhvien/searchthanhvien/nd={content}", method = RequestMethod.GET)
	public ModelAndView searchThanhVien(@PathVariable("content") String content) {
		ModelAndView model = new ModelAndView();
		List<User> lists = userDao.searchThanhVien(content);
		String searchNull = "Thông tin tìm kiếm không tồn tại.";
		if (content.isEmpty() || content.equals(" ")) {
			model.setViewName("redirect:/admin/quanlythanhvien");
		} else {
			model.setViewName("adminThanhVien");
			if (lists.isEmpty()) {
				model.addObject("searchNull", searchNull);
			} else {
				model.addObject("lists", lists);
				List<User> listUser = userDao.listUser();
				model.addObject("showUser", lists);
			}
		}
		return model;
	}
}
