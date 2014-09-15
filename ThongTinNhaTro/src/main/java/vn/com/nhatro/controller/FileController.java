package vn.com.nhatro.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import vn.com.nhatro.model.FileMeta;

@Controller
@RequestMapping("/controller")
public class FileController {

	private List<FileMeta> files = new ArrayList<FileMeta>();
	private FileMeta fileMeta = null;
	@Autowired
	private FileDirectory FileDirectory;

	/***************************************************
	 * URL: /rest/controller/upload upload(): receives files
	 * 
	 * @param request
	 *            : MultipartHttpServletRequest auto passed
	 * @param response
	 *            : HttpServletResponse auto passed
	 * @return LinkedList<FileMeta> as json format
	 ****************************************************/
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public @ResponseBody List<FileMeta> upload(
			MultipartHttpServletRequest request, HttpServletResponse response,
			HttpSession session) {
		System.out.println("Begin upload file ...");
		// 1. build an iterator
		Iterator<String> itr = request.getFileNames();
		MultipartFile mpf = null;
		LinkedList<FileMeta> imagesList = (LinkedList<FileMeta>) session.getAttribute("imagesList");
		if (imagesList == null) {
			imagesList = new LinkedList<FileMeta>();
		}
		// 2. get each file
		while (itr.hasNext()) {

			// 2.1 get next MultipartFile
			mpf = request.getFile(itr.next());
			System.out.println(mpf.getOriginalFilename() + " uploaded! "
					+ imagesList.size());

			// 2.2 if files > 10 remove the first from the list
			// if (files.size() >= 10)
			// files.pop();

			// 2.3 create new fileMeta
			fileMeta = new FileMeta();
			fileMeta.setFileName(mpf.getOriginalFilename());
			fileMeta.setFileSize(mpf.getSize() / 1024 + " Kb");
			fileMeta.setFileType(mpf.getContentType());

			try {
				
				fileMeta.setBytes(mpf.getBytes());
				imagesList.add(fileMeta);
				System.out.println("Add file");
				// copy file to local disk (make sure the path
				// "e.g. D:/temp/files" exists)
				FileCopyUtils.copy(mpf.getBytes(), new FileOutputStream(
						"D:/nhatro/temp/" + mpf.getOriginalFilename()));
				fileMeta.setFileDirectory("D:/nhatro/temp/"
						+ mpf.getOriginalFilename());

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// 2.4 add to files
			//files.add(fileMeta);
			

		}
		// result will be like this
		// [{"fileName":"app_engine-85x77.png","fileSize":"8 Kb","fileType":"image/png"},...]
		session.setAttribute("imagesList", imagesList);
		return files;

	}

	/***************************************************
	 * URL: /rest/controller/get/{value} get(): get file as an attachment
	 * 
	 * @param response
	 *            : passed by the server
	 * @param value
	 *            : value from the URL
	 * @return void
	 ****************************************************/
	@RequestMapping(value = "/get/{value}", method = RequestMethod.GET)
	public void get(HttpServletResponse response, @PathVariable String value) {
		FileMeta getFile = files.get(Integer.parseInt(value));
		try {
			response.setContentType(getFile.getFileType());
			response.setHeader("Content-disposition", "attachment; filename=\""
					+ getFile.getFileName() + "\"");
			FileCopyUtils.copy(getFile.getBytes(), response.getOutputStream());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
