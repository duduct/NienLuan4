package vn.com.nhatro.controller;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.LinkedList;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

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
	 * @author Luong Duc Duy
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/thanhvien/yeucauHandling", method = RequestMethod.POST)
	public String yeuCauHandling(
			@ModelAttribute YeuCauDangNhaTro yeuCauDangNhaTro, Principal principal, HttpSession session) {
		Nhatro nhatro = new Nhatro();
		nhatro.setDiachi(yeuCauDangNhaTro.getDiaChi());
		nhatro.setSdt(yeuCauDangNhaTro.getSoDt());
		nhatro.setLoai(loaiDao.findById(yeuCauDangNhaTro.getLoaiid()));
		nhatro.setToado(yeuCauDangNhaTro.getToaDo());
		nhatro.setTrangthai(0);
		if (principal != null) {
			User user = userDao.findByUserName(principal.getName());
			nhatro.setUser(user);
		} else {
			return "redirect:/login";
		}
		nhatro.setNgayyeucau(new Date());
		nhatroDao.save(nhatro);
		List<Loaiphong> phongs = yeuCauDangNhaTro.getPhongs();
		if (phongs == null) {
			phongs = new ArrayList<Loaiphong>();
		}
		System.out.println("Loai phong size = " + phongs.size());
		for (int i = 0; i < phongs.size(); i++) {
			phongs.get(i).setNhatro(nhatro);
			loaiphongDao.save(phongs.get(i));
		}
		session.setAttribute("isPosted", 1);
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
		return "sua-nhatro";
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
		if (newHinhs != null) {
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
		}
		
		session.removeAttribute("imagesList");
		return "redirect:/";
	}
	
	/**
	 * Load thong tin cua mot motel tren danh sach cac card
	 * @param request
	 * @param model
	 * @param principal
	 * @return
	 */
	@Transactional
	@RequestMapping(value = "loadMotel", method = RequestMethod.GET)
	public String xemNhaTro(HttpServletRequest request,
			Model model, Principal principal) {
		Integer nhaTroId = Integer.parseInt(request.getParameter("nhatroid"));
		Nhatro nhatro = nhatroDao.findById(nhaTroId);
		
		// Kiem tra xem nguoi dung hien tai da like nha tro nay hay chua
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
		
		// Load gia nho nha tro danh sach cac phong cua nhatro id
		Integer gia = Integer.MAX_VALUE;
		for (Loaiphong loaiPhong : loaiPhongs) {
			gia = Math.min(gia, loaiPhong.getGia());
		}
		System.out.println("Gia = " + gia);
		/*List<Hinh> hinhs = new ArrayList<Hinh>(nhatro.getHinhs());
		model.addAttribute("hinhs", hinhs);*/
		model.addAttribute("gia", tachTien(gia));
		model.addAttribute("nhatro", nhatro);
		model.addAttribute("isLike", isLike);
		return "xem-nhatro";
	}
	/**
	 * Them dau phay ngan cach vao tien de cho de doc
	 * @param in
	 * @return
	 * @author luong_000
	 */
	public String tachTien(Integer in) {
		String result = "";
		if (in == 0)
		{
			return "0";
		}
		int cnt = 0;
		while (in > 0) {
			cnt ++;
			result = in % 10 + result;
			in /= 10;
			if (in != 0 && cnt == 3) {
				result = "," + result;
			}
		}
		return result;
	}
	
	/**
	 * Load thong tin cua mot motel tren danh sach cac card
	 * @param request
	 * @param model
	 * @param principal
	 * @return
	 */
	@Transactional
	@RequestMapping(value = "loadMotelInfowindow", method = RequestMethod.GET)
	public String xemNhaTroInfowindow(HttpServletRequest request,
			Model model, Principal principal) {
		Integer nhaTroId = Integer.parseInt(request.getParameter("nhatroid"));
		Nhatro nhatro = nhatroDao.findById(nhaTroId);
		
		List<Loaiphong> loaiPhongs = new ArrayList<Loaiphong>(
				nhatro.getLoaiphongs());
		
		// Load gia nho nha tro danh sach cac phong cua nhatro id
		Integer gia = Integer.MAX_VALUE;
		for (Loaiphong loaiPhong : loaiPhongs) {
			gia = Math.min(gia, loaiPhong.getGia());
		}
		model.addAttribute("gia", tachTien(gia));
		model.addAttribute("nhatro", nhatro);

		return "xem-nhatro-infowindow";
	}
	
	/**
	 * Sap xep cac comment theo tu thu ngay thang
	 * @param inComments Set cac comment dau vao
	 * @return List cac comments da duoc sap xep
	 * @author luong_000
	 */
	public List<Comment> sortComment(Set<Comment> inComments) {
		List<Comment> comments = new ArrayList<Comment>(inComments);
		for (int i = 0; i < comments.size(); i++) {
			for (int j = i + 1; j < comments.size(); j++) {
				if (comments.get(i).getDatecomment()
						.compareTo(comments.get(j).getDatecomment()) > 0) {
					Collections.swap(comments, i, j);
				}
			}
		}
		return comments;
	}
	
	/**
	 * Load danh sach cac comment cua mot nha tro
	 * @param request chua nhatroId
	 * @return trang jsp cac comment cua nha tro phuc vu cho Ajax
	 */
	@Transactional
	@RequestMapping(value = "/loadComments", method = RequestMethod.GET)
	public String loadComments(HttpServletRequest request, Model model) {
		Integer nhatroId = Integer.parseInt(request.getParameter("nhatroid"));
		Nhatro nhatro = nhatroDao.findById(nhatroId);
		model.addAttribute("comments", sortComment(nhatro.getComments()));
		model.addAttribute("nhatroid", nhatroId);
		return "list-comments";
	}

	/**
	 * Like nha tro
	 * @param nhaTroId id cua nha tro can like
	 * @param principal chua thong tin nguoi dang dang nhap
	 * @return so luong like cua nha tro
	 */
	@Transactional
	@RequestMapping(value = "/nhatro/{nhatroid}/like", method = RequestMethod.POST)
	public @ResponseBody String likeNhaTro(@PathVariable("nhatroid") Integer nhaTroId,
			Principal principal) {
		Integer numberOfLikes = 0;
		Nhatro nhatro = nhatroDao.findById(nhaTroId);
		numberOfLikes = nhatro.getThiches().size();
		System.out.println("Before Number of likes = " + numberOfLikes);
		String name = principal.getName();
		User user = userDao.findByUserName(name);
		Thich thich = thichDao.findByNhaTroUser(nhatro, user);
		if (thich == null) {
			thich = new Thich();
			thich.setNhatro(nhatro);
			thich.setUser(user);
			thichDao.add(thich);
			numberOfLikes ++;
		} else {
			thichDao.delete(thich);
			numberOfLikes --;
		}
		System.out.println("After Number of likes = " + numberOfLikes);
		return numberOfLikes + "";
	}
	/**
	 * Comment cho nha tro
	 * @param nhaTroId id cua nhatro can comment
	 * @param principal nguoi dang dang nhap hien tai
	 * @param request lay noi dung comment
	 * @return 
	 */
	@Transactional
	@RequestMapping(value = "/nhatro/{nhatroid}/comment", method = RequestMethod.POST)
	public @ResponseBody String commentNhaTro(@PathVariable("nhatroid") Integer nhaTroId,
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
		comment.setNhatro(nhatro);
		comment.setUser(user);
		commentDao.add(comment);
		return "OK";
	}
}

