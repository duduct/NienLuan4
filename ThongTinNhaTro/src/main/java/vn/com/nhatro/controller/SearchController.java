package vn.com.nhatro.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import vn.com.nhatro.dao.LoaiDao;
import vn.com.nhatro.dao.NhatroDao;
import vn.com.nhatro.dao.ThichDao;
import vn.com.nhatro.dao.UserDao;
import vn.com.nhatro.model.Comment;
import vn.com.nhatro.model.CommentJson;
import vn.com.nhatro.model.Infowindow;
import vn.com.nhatro.model.Loai;
import vn.com.nhatro.model.Loaiphong;
import vn.com.nhatro.model.LoaiphongJson;
import vn.com.nhatro.model.Marker;
import vn.com.nhatro.model.Nhatro;
import vn.com.nhatro.model.Thich;
import vn.com.nhatro.model.User;

/**
 * Luong Duc Duy Handles requests for the application home page.
 */
@Controller
public class SearchController {
	@Autowired
	private LoaiDao loaiDao;
	@Autowired
	private NhatroDao nhatroDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private ThichDao thichDao;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = { "/", "/welcome" }, method = RequestMethod.GET)
	public String home(Model model) {
		List<Loai> loais = loaiDao.list();
		model.addAttribute("loais", loais);
		return "home";
	}

	/**
	 * @author luong_000 Search motels
	 */
	@Transactional
	@RequestMapping(value = "/searchMotel", method = RequestMethod.GET)
	public @ResponseBody List<Marker> searchMotel(HttpServletRequest request,
			Principal principal) {

		Integer loaiNhaTro = Integer.parseInt(request
				.getParameter("loainhatro"));
		Integer mucGiaMin = Integer
				.parseInt(request.getParameter("mucgia-min"));
		Integer mucGiaMax = Integer
				.parseInt(request.getParameter("mucgia-max"));
		Integer dienTichMin = Integer.parseInt(request
				.getParameter("dientich-min"));
		Integer dienTichMax = Integer.parseInt(request
				.getParameter("dientich-max"));
		Float kinhDo = Float.parseFloat(request.getParameter("kinhDo"));
		Float viDo = Float.parseFloat(request.getParameter("viDo"));

		List<Nhatro> nhatros = nhatroDao.findNhaTro(loaiNhaTro, mucGiaMin,
				mucGiaMax, dienTichMin, dienTichMax, kinhDo, viDo, 1);
		List<Marker> markers = new ArrayList<Marker>();
		boolean isLike = false;
		User user = null;
		if (principal != null) {
			user = userDao.findByUserName(principal.getName());
		}
		for (Nhatro nhatro : nhatros) {
			isLike = false;
			Marker marker = new Marker();
			marker.setNhatroId(nhatro.getNhatroid());
			marker.setDiaChi(nhatro.getDiachi());
			marker.setX(nhatro.getToado().getX());
			marker.setY(nhatro.getToado().getY());
			marker.setMinGia(nhatro.tinhMinGia());
			marker.setSoDt(nhatro.getSdt());
			marker.setEmail(nhatro.getEmail());
			marker.setLuotThich(nhatro.getThiches().size());
			marker.setLuotBinhLuan(nhatro.getComments().size());
			marker.setMoTa(nhatro.getMotanhatro());
			if (user != null) {
				Thich thich = thichDao.findByNhaTroUser(nhatro, user);
				if (thich != null) {
					isLike = true;
				}
			}
			marker.setLike(isLike);
			markers.add(marker);
		}
		return markers;
	}

	/*
	 * @RequestMapping(value = "/loadMotel", method = RequestMethod.GET,
	 * produces = "text/plain;charset=UTF-8")
	 */
	@Transactional
	@RequestMapping(value = "/loadMotel", method = RequestMethod.GET)
	public @ResponseBody Infowindow loadMotel(HttpServletRequest request) {
		Integer nhatroId = Integer.parseInt(request.getParameter("id"));
		Nhatro nhatro = nhatroDao.findById(nhatroId);
		/*
		 * String result = "<div id=\"content\">" + "<div id=\"siteNotice\">" +
		 * "</div>" + "<h2 id=\"firstHeading\" class=\"firstHeading\">" +
		 * nhatro.getDiachi() + "</h2>";
		 */
		Infowindow result = new Infowindow();
		result.setDiaChi(nhatro.getDiachi());
		result.setMinGia(nhatro.tinhMinGia());
		result.setSoDt(nhatro.getSdt());
		result.setEmail(nhatro.getEmail());
		result.setId(nhatro.getNhatroid());
		result.setLuotThich(nhatro.getThiches().size());
		result.setLuotBinhLuan(nhatro.getComments().size());

		return result;
	}

	// Load danh sach cac phong cua 1 nha tro
	@Transactional
	@RequestMapping(value = "/loadDanhSachLoaiPhong", method = RequestMethod.GET)
	public @ResponseBody List<LoaiphongJson> loadLoaiPhong(
			HttpServletRequest request) {
		Integer nhatroId = Integer.parseInt(request.getParameter("nhaTroId"));
		Nhatro nhatro = nhatroDao.findById(nhatroId);
		List<Loaiphong> danhSachPhong = new ArrayList<Loaiphong>(
				nhatro.getLoaiphongs());
		List<LoaiphongJson> result = new ArrayList<LoaiphongJson>();
		for (Loaiphong loaiphong : danhSachPhong) {
			LoaiphongJson loaiphongJson = new LoaiphongJson();
			loaiphongJson.setDientich(loaiphong.getDientich());
			loaiphongJson.setGia(loaiphong.getGia());
			loaiphongJson.setSoluong(loaiphong.getSoluong());
			loaiphongJson.setSonguoi(loaiphong.getSonguoi());
			result.add(loaiphongJson);
		}
		System.out.println("LoaiPhong size = " + result.size());
		return result;
	}
	
	// Load danh sach cac comments cua 1 nha tro
	@Transactional
	@RequestMapping(value = "/loadComments", method = RequestMethod.GET)
	public @ResponseBody List<CommentJson> loadComments(
		HttpServletRequest request) {
		Integer nhatroId = Integer.parseInt(request.getParameter("nhaTroId"));
		Nhatro nhatro = nhatroDao.findById(nhatroId);
		List<Comment> comments = new ArrayList<Comment>(
				nhatro.getComments());
		List<CommentJson> result = new ArrayList<CommentJson>();
		for (Comment comment : comments) {
			CommentJson commentJson = new CommentJson();
			commentJson.setComment(comment.getComment());
			commentJson.setUserName(comment.getUser().getUsername());
			SimpleDateFormat format = new SimpleDateFormat("H:m:s a MM/dd/yyyy");
			commentJson.setDateComment(format.format(comment.getDatecomment()).toString());
			result.add(commentJson);
		}
		return result;
	}
}
