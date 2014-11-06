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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import vn.com.nhatro.dao.NhatroDao;
import vn.com.nhatro.dao.UserDao;
import vn.com.nhatro.model.Loai;
import vn.com.nhatro.model.Loaiphong;
import vn.com.nhatro.model.Nhatro;
import vn.com.nhatro.model.Toado;
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
	public String quanLyDangTin() {
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
	public String loadYeuCau(@RequestParam("id") String id, Model model) {
		Integer nhatroId = Integer.parseInt(id);
		Nhatro nhatro = nhatroDao.findById(nhatroId);
		model.addAttribute("nhatro", nhatro);
		return "load-yeucau";
	}

	@Transactional
	@RequestMapping(value = "quanlydangtin/dongy", method = RequestMethod.GET)
	public String dongy(HttpServletRequest http) {
		String strNhatroid = http.getParameter("showYeuCauID");
		Integer nhatroid = Integer.parseInt(strNhatroid);
		float kinhdo = Float.parseFloat(http.getParameter("kinhdo"));
		float vido = Float.parseFloat(http.getParameter("vido"));
		Nhatro nhatro = nhatroDao.findById(nhatroid);
		nhatro.setToado(new Toado(kinhdo,vido));
		nhatro.setTrangthai(1);
		nhatroDao.dongyObject(nhatro);
		return "redirect:/admin/quanlydangtin";
	}
	@Transactional
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
					resultToday.add(nhatro);
				} else {
					if (date.equals(yesterday)) {
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
	@RequestMapping(value = "quanlythanhvien")
	public String quanLyThanhVien() {
		return "adminThanhVien";
	}

	@RequestMapping(value = "quanlythanhvien/xoa/user={username}", method = RequestMethod.GET)
	public String xoa(@PathVariable("username") String username) {
		userDao.xoaThanhVien(username);
		return "redirect:/admin/quanlythanhvien";
	}

	@Transactional
	@RequestMapping(value = "quanlythanhvien/searchThanhVien")
	public String searchThanhVien(Model model, HttpServletRequest request) {
		String searchContent = request.getParameter("searchContent");
		searchContent = searchContent.trim();
		List<User> lists = userDao.searchThanhVien(searchContent);
		model.addAttribute("lists", lists);
		return "admin.ajax.thanhvien";
	}
	
	@Transactional
	@RequestMapping(value = "quanlythanhvien/loadThanhVien",method = RequestMethod.GET)
	public String loadThanhVien(HttpServletRequest request, Model model) {
		String user = request.getParameter("user");
		User list = userDao.findUserbyUserName(user);
		model.addAttribute("show", list);
		return "load-thanhvien";
	}
	
	@Transactional
	@RequestMapping(value = "quanlythanhvien/loadYeuCauThanhVien")
	public String loadYeuCauThanhVien(@RequestParam("id") String id, Model model) {
		Integer nhatroId = Integer.parseInt(id);
		Nhatro nhatro = nhatroDao.findById(nhatroId);
		model.addAttribute("nhatro", nhatro);
		return "load-yeucauThanhVien";
	}
	
	@Transactional
	@RequestMapping(value = "quanlythanhvien/dongy", method = RequestMethod.GET)
	public String dongyThanhVien(HttpServletRequest http) {
		String strNhatroid = http.getParameter("showYeuCauID");
		Integer nhatroid = Integer.parseInt(strNhatroid);
		float kinhdo = Float.parseFloat(http.getParameter("kinhdo"));
		float vido = Float.parseFloat(http.getParameter("vido"));
		Nhatro nhatro = nhatroDao.findById(nhatroid);
		nhatro.setToado(new Toado(kinhdo,vido));
		nhatro.setTrangthai(1);
		nhatroDao.dongyObject(nhatro);
		return "redirect:/admin/quanlythanhvien";
	}
	@Transactional
	@RequestMapping(value = "quanlythanhvien/khongdongy", method = RequestMethod.GET)
	public String khongdongyThanhVien(HttpServletRequest http) {
		String strNhatroid = http.getParameter("showYeuCauID");
		Integer nhatroid = Integer.parseInt(strNhatroid);
		nhatroDao.khongdongy(nhatroid);
		return "redirect:/admin/quanlythanhvien";
	}

}
