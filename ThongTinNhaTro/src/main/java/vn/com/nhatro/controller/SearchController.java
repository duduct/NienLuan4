package vn.com.nhatro.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import vn.com.nhatro.dao.DuongDao;
import vn.com.nhatro.dao.LoaiDao;
import vn.com.nhatro.dao.NhatroDao;
import vn.com.nhatro.model.Marker;
import vn.com.nhatro.model.Nhatro;
import vn.com.nhatro.model.Toado;

/**
 * Luong Duc Duy Handles requests for the application home page.
 */
@Controller
public class SearchController {
	@Autowired
	private LoaiDao loaiDao;
	@Autowired
	private DuongDao duongDao;
	@Autowired
	private NhatroDao nhatroDao;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		model.addAttribute("loais", loaiDao.list());
		model.addAttribute("duongs", duongDao.list());
		return "home";
	}

	/**
	 * @author luong_000 Search motels
	 */
	@Transactional
	@RequestMapping(value = "/searchMotel", method = RequestMethod.POST, headers = "Accept=application/json")
	public @ResponseBody List<Marker> searchMotel(HttpServletRequest request) {
		List<Nhatro> nhatros = nhatroDao.list();
		List<Marker> markers = new ArrayList<Marker>();
		for (Nhatro nhatro : nhatros) {
			Marker marker = new Marker();
			marker.setNhatroId(nhatro.getNhatroid());
			marker.setX(nhatro.getToado().getX());
			marker.setY(nhatro.getToado().getY());
			markers.add(marker);
		}
		return markers;
	}

	@Transactional
	@RequestMapping(value = "/loadMotel", method = RequestMethod.POST)
	public @ResponseBody String loadMotel(HttpServletRequest request) {
		Integer nhatroId = Integer.parseInt(request.getParameter("id"));
		Nhatro nhatro = nhatroDao.findById(nhatroId);
		String result = "<div id=\"content\">" + "<div id=\"siteNotice\">"
				+ "</div>" + "<h2 id=\"firstHeading\" class=\"firstHeading\">"
				+ nhatro.getDiachi().getDiachi() + ", "
				+ nhatro.getDiachi().getDuong().getTenduong() + "</h2>";
		System.out.println("Result = " + result);
		return result;
	}
}
