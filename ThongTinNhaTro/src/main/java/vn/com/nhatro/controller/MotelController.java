package vn.com.nhatro.controller;

import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import vn.com.nhatro.dao.CommentDao;
import vn.com.nhatro.dao.LoaiDao;
import vn.com.nhatro.dao.LoaiPhongDao;
import vn.com.nhatro.dao.NhatroDao;
import vn.com.nhatro.dao.ThichDao;
import vn.com.nhatro.dao.UserDao;
import vn.com.nhatro.form.YeuCauDangNhaTro;
import vn.com.nhatro.model.Comment;
import vn.com.nhatro.model.Loaiphong;
import vn.com.nhatro.model.Nhatro;
import vn.com.nhatro.model.Thich;
import vn.com.nhatro.model.Toado;
import vn.com.nhatro.model.User;

/**
 * Luong Duc Duy Handles requests for the application home page.
 */
@Controller
public class MotelController {
	@Autowired
	private LoaiDao loaiDao;
	@Autowired
	private LoaiPhongDao loaiphongDao;
	@Autowired
	private NhatroDao nhatroDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private ThichDao thichDao;
	@Autowired
	private CommentDao commentDao;

	/**
	 * @author Luong Duc Duy Show view form
	 */
	@RequestMapping(value = "/thanhvien/yeucau", method = RequestMethod.GET)
	public String yeuCau(Model model) {
		return "yeucaudang";
	}

	/**
	 * @author Luong Duc Duy
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/thanhvien/yeucauHandling", method = RequestMethod.POST)
	public String yeuCauHandling(
			@ModelAttribute YeuCauDangNhaTro yeuCauDangNhaTro) {
		Nhatro nhatro = new Nhatro();
		System.out.println(yeuCauDangNhaTro);
		nhatro.setDiachi(yeuCauDangNhaTro.getDiaChi());
		nhatro.setSdt(yeuCauDangNhaTro.getSoDt());
		System.out.println("Ten loai = "
				+ loaiDao.findById(yeuCauDangNhaTro.getLoaiid()).getTenloai());
		nhatro.setLoai(loaiDao.findById(yeuCauDangNhaTro.getLoaiid()));
		nhatro.setToado(yeuCauDangNhaTro.getToaDo());
		nhatro.setTrangthai(0);
		nhatro.setUser(userDao.findByUserName("admin"));
		nhatroDao.save(nhatro);
		List<Loaiphong> phongs = yeuCauDangNhaTro.getPhongs();
		for (int i = 0; i < phongs.size(); i++) {
			phongs.get(i).setNhatro(nhatro);
			loaiphongDao.save(phongs.get(i));
		}
		return "redirect:/";
	}

	@Transactional
	@RequestMapping(value = "/nhatro/{nhatroid}", method = RequestMethod.GET)
	public String xemNhaTro(@PathVariable("nhatroid") Integer nhaTroId,
			Model model, Principal principal) {
		Nhatro nhatro = nhatroDao.findById(nhaTroId);
		boolean isLike = false;
		if (principal != null) {
			User user = userDao.findByUserName(principal.getName());
			Thich thich = thichDao.findByNhaTroUser(nhatro, user);
			if (thich != null) {
				isLike = true;
			}
		}

		List<Loaiphong> loaiPhongs = new ArrayList<Loaiphong>(
				nhatro.getLoaiphongs());

		float gia = Float.MAX_VALUE;
		for (Loaiphong loaiPhong : loaiPhongs) {
			gia = Math.min(gia, loaiPhong.getGia());
			System.out.println(loaiPhong);
		}
		if (gia == Float.MAX_VALUE) {
			gia = (float) 0;
		}
		List<Comment> comments = new ArrayList<Comment>(nhatro.getComments());
		model.addAttribute("gia", gia);
		model.addAttribute("loaiPhongs", loaiPhongs);
		model.addAttribute("nhatro", nhatro);
		model.addAttribute("numberOfLikes", nhatro.getThiches().size());

		model.addAttribute("isLike", isLike);

		for (int i = 0; i < comments.size(); i++) {
			for (int j = i + 1; j < comments.size(); j++) {
				if (comments.get(i).getDatecomment()
						.compareTo(comments.get(j).getDatecomment()) > 0) {
					Collections.swap(comments, i, j);
				}
			}
		}

		model.addAttribute("comments", comments);
		return "xemNhaTro";
	}

	@Transactional
	@Secured({ "ROLE_USER" })
	@RequestMapping(value = "/nhatro/{nhatroid}/like", method = RequestMethod.GET)
	public String likeNhaTro(@PathVariable("nhatroid") Integer nhaTroId,
			Principal principal) {
		Nhatro nhatro = nhatroDao.findById(nhaTroId);
		String name = principal.getName();
		System.out.println("Name = " + name);
		User user = userDao.findByUserName(name);
		Thich thich = thichDao.findByNhaTroUser(nhatro, user);
		if (thich == null) {
			thich = new Thich();
			thich.setNhatro(nhatro);
			thich.setUser(user);
			thichDao.add(thich);
		} else {
			thichDao.delete(thich);
		}
		return "redirect:/nhatro/" + nhaTroId;
	}

	@Transactional
	@Secured({ "ROLE_USER" })
	@RequestMapping(value = "/nhatro/{nhatroid}/comment", method = RequestMethod.POST)
	public String commentNhaTro(@PathVariable("nhatroid") Integer nhaTroId,
			Principal principal, HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Nhatro nhatro = nhatroDao.findById(nhaTroId);
		User user = userDao.findByUserName(principal.getName());
		Comment comment = new Comment();
		comment.setComment(request.getParameter("comment"));
		System.out.println("Comment = " + request.getParameter("comment"));
		comment.setNhatro(nhatro);
		comment.setUser(user);
		commentDao.add(comment);
		return "redirect:/nhatro/" + nhaTroId;
	}
}
