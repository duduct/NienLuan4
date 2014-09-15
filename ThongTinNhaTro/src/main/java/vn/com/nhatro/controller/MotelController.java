package vn.com.nhatro.controller;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.LinkedList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.com.nhatro.dao.CommentDao;
import vn.com.nhatro.dao.FileMetaDao;
import vn.com.nhatro.dao.HinhDao;
import vn.com.nhatro.dao.LoaiDao;
import vn.com.nhatro.dao.LoaiPhongDao;
import vn.com.nhatro.dao.NhatroDao;
import vn.com.nhatro.dao.ThichDao;
import vn.com.nhatro.dao.UserDao;
import vn.com.nhatro.form.YeuCauDangNhaTro;
import vn.com.nhatro.model.Comment;
import vn.com.nhatro.model.FileMeta;
import vn.com.nhatro.model.Hinh;
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
	@Autowired
	private HinhDao hinhDao;
	@Autowired
	private FileMetaDao fileMetaDao;
	@Autowired
	private FileDirectory fileDirectory;
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

	/**
	 * @author Luong Duc Duy Show view form
	 */
	@RequestMapping(value = "/thanhvien/suanhatro/{nhatroid}", method = RequestMethod.GET)
	public String suaNhaTro(@PathVariable("nhatroid") Integer nhaTroId,
			Model model) {
		System.out.println("OK");
		Nhatro nhatro = nhatroDao.findById(nhaTroId);
		model.addAttribute("nhatro", nhatro);
		List<Loaiphong> loaiPhongs = new ArrayList<Loaiphong>(
				nhatro.getLoaiphongs());
		model.addAttribute("loaiPhongs", loaiPhongs);
		return "suaNhaTro";
	}

	/**
	 * @author Luong Duc Duy Show view form
	 */
	@Transactional
	@RequestMapping(value = "/thanhvien/suanhatro/handling", method = RequestMethod.POST)
	public String suaNhaTroHandling(
			@ModelAttribute YeuCauDangNhaTro yeuCauDangNhaTro,
			HttpSession session) {
		Nhatro nhatro = new Nhatro();
		nhatro = nhatroDao.findById(yeuCauDangNhaTro.getNhatroid());
		nhatro.setSdt(yeuCauDangNhaTro.getSoDt());
		nhatro.setEmail(yeuCauDangNhaTro.getEmail());
		System.out.println("Email = " + yeuCauDangNhaTro.getEmail());
		nhatro.setLoai(loaiDao.findById(yeuCauDangNhaTro.getLoaiid()));
		nhatro.setUser(userDao.findByUserName("admin"));
		// Remove all old
		List<Loaiphong> phongs = new ArrayList<Loaiphong>(
				nhatro.getLoaiphongs());
		for (Loaiphong phong : phongs) {
			loaiphongDao.delete(phong);
		}
		// Add new loai phong
		phongs = yeuCauDangNhaTro.getPhongs();
		for (int i = 0; i < phongs.size(); i++) {
			phongs.get(i).setNhatro(nhatro);
			loaiphongDao.save(phongs.get(i));
		}
		// Update image list
		// Remove all old
		List<Hinh> hinhs = new ArrayList<Hinh>(nhatro.getHinhs());
		for (Hinh hinh : hinhs) {
			hinhDao.delete(hinh);
		}
		// Add new hinh
		List<FileMeta> newHinhs = (List<FileMeta>) session
				.getAttribute("imagesList");
		int count = 0;
		for (FileMeta newHinh : newHinhs) {
			Hinh hinh = new Hinh();
			hinh.setNhatro(nhatro);
			String absoluteFinalDirectory = fileDirectory.getSaveDirectoryImage() + "hinh"
					+ nhatro.getNhatroid() + "-" + count + "."
					+ FilenameUtils.getExtension(newHinh.getFileDirectory());
			String dynamicFinalDirectory = "hinh"
					+ nhatro.getNhatroid() + "-" + count + "."
					+ FilenameUtils.getExtension(newHinh.getFileDirectory());
			hinh.setDuongdan(dynamicFinalDirectory);
			try {
				FileCopyUtils.copy(newHinh.getBytes(), new FileOutputStream(
						absoluteFinalDirectory));
			} catch (FileNotFoundException e) {
				System.out.println("File" + absoluteFinalDirectory + " not found !");
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			hinhDao.add(hinh);
			fileMetaDao.delete(newHinh);
			count++;
		}
		session.removeAttribute("imagesList");
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
		System.out.println("Size = " + loaiPhongs.size());
		float gia = Float.MAX_VALUE;
		for (Loaiphong loaiPhong : loaiPhongs) {
			gia = Math.min(gia, loaiPhong.getGia());
			System.out.println(loaiPhong);
		}
		if (gia == Float.MAX_VALUE) {
			gia = (float) 0;
		}
		List<Comment> comments = new ArrayList<Comment>(nhatro.getComments());
		List<Hinh> hinhs = new ArrayList<Hinh>(nhatro.getHinhs());
		model.addAttribute("gia", gia);
		model.addAttribute("loaiPhongs", loaiPhongs);
		model.addAttribute("nhatro", nhatro);
		model.addAttribute("numberOfLikes", nhatro.getThiches().size());
		model.addAttribute("hinhs", hinhs);
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

