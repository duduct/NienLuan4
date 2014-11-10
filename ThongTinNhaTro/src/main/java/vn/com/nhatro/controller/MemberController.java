package vn.com.nhatro.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import vn.com.nhatro.dao.LoaiDao;
import vn.com.nhatro.dao.NhatroDao;
import vn.com.nhatro.dao.UserDao;
import vn.com.nhatro.model.Nhatro;
import vn.com.nhatro.model.User;

@RequestMapping(value = "/thanhvien")
@Controller
public class MemberController {
	@Autowired
	private LoaiDao loaiDao;

	@Autowired
	private NhatroDao nhatroDao;

	@Autowired
	private UserDao userDao;

	/**
	 * 
	 * @author lonel_000
	 */
	@RequestMapping(value = "/xoa/{nhatroId}", method = RequestMethod.GET)
	public String deleteById(@PathVariable String nhatroId) {
		nhatroDao.deleteById(Integer.parseInt(nhatroId));
		return "redirect:/thanhvien/danhsachnhatro";
	}

	/**
	 * @author lonel_000
	 * @param principal
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"/", "/danhsachnhatro"}, method = RequestMethod.GET)
	public String listNhaTroByUsername(Principal principal, Model model) {
		List<Nhatro> nhatros = new ArrayList<Nhatro>();
		if (principal != null) {
			nhatros = nhatroDao.findNhaTroByUsername(principal.getName());
		}
		model.addAttribute("nhatros", nhatros);
		return "thanhvien";
	}

	/**
	 * @author lonel_000
	 * @param request
	 * @param principal
	 * @return
	 */
	@RequestMapping(value = "/suathongtin", method = RequestMethod.POST)
	public String suaThongTin(@RequestParam String oldpass,
			@RequestParam String newpass1,
			@RequestParam String newpass2,
			Principal principal) {
		User user = userDao.findUserbyUserName(principal.getName());
		if (newpass1.equals(newpass2)) {
			if (oldpass.equals(user.getPassword())) {
				user.setPassword(newpass2);
				userDao.save(user);
			} else {
				return "redirect:/thanhvien/danhsachnhatro";
			}
		}else return "redirect:/thanhvien/danhsachnhatro";
		return "redirect:/login";
	}
}