package com.booksandpicture.controller;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.booksandpicture.model.BooksAndPictureService;

@WebServlet("/bap/Img")
public class DBGifReaderController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("image/gif");
		ServletOutputStream out = res.getOutputStream();
		InputStream in = null;

		try {
			Integer bookNumber = Integer.valueOf(req.getParameter("bookNumber"));
			BooksAndPictureService bapSvc = new BooksAndPictureService();
//			System.out.println(bapSvc.getimg(bookNumber));
			out.write(bapSvc.getimg(bookNumber).get(0).getPictureFile());
			out.close();
		} catch (Exception e) {
			try {
				in = getServletContext().getResourceAsStream("/front-end/NoData/nopic.jpg");
				byte[] buf = new byte[in.available()];
				in.read(buf);
				out.write(buf);
			} catch (IOException ioException) {
				ioException.printStackTrace(); // 日誌或其他錯誤處理
			} finally {
				if (in != null) {
					try {
						in.close();
					} catch (IOException ioException) {
						ioException.printStackTrace(); // 日誌或其他錯誤處理
					}
				}
			}

		} finally {
			if (out != null) {
				try {
					out.close();
				} catch (IOException ioException) {
					ioException.printStackTrace(); // 日誌或其他錯誤處理
				}
			}
		}
	}
}
