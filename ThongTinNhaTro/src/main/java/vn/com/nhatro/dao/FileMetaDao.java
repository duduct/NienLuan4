package vn.com.nhatro.dao;

import java.io.File;

import org.springframework.stereotype.Repository;

import vn.com.nhatro.model.FileMeta;

@Repository
public class FileMetaDao {

	/**
	 * 
	 */
	public FileMetaDao() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void delete(FileMeta file) {

		try {
			File fileToDelete = new File(file.getFileDirectory());

			if (fileToDelete.delete()) {
				System.out.println("File deleted successfully !");
			} else {
				System.out.println("File delete operation failed !");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
