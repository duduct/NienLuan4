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
import vn.com.nhatro.model.GoogleMapMarker;
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
	@RequestMapping(value = "/searchMotel", method = RequestMethod.POST)
	public @ResponseBody List<GoogleMapMarker> searchMotel(
			HttpServletRequest request) {
		List<Nhatro> nhatros = nhatroDao.list();
		List<GoogleMapMarker> markers = new ArrayList<GoogleMapMarker>();
		for (int i = 0; i < nhatros.size(); i++) {
			Nhatro nhatro = nhatros.get(i);
			GoogleMapMarker marker = new GoogleMapMarker();
			marker.setX(nhatro.getToado().getX());
			marker.setY(nhatro.getToado().getY());
			markers.add(marker);
		}
		System.out.println("Number of motel " + nhatros.size());
		return markers;
	}
}
