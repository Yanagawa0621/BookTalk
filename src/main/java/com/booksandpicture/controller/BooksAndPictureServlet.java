package com.booksandpicture.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.booksandpicture.model.BooksAndPictureService;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 設置臨界值，超過後會寫入磁碟
		maxFileSize = 1024 * 1024 * 10, // 設置單個文件的最大大小
		maxRequestSize = 1024 * 1024 * 50 // 設置最大請求大小（包括所有文件和表單數據）
)
@WebServlet("/booksandpicture.do")
public class BooksAndPictureServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private BooksAndPictureService bapSce;

	public void init() throws ServletException {
		bapSce = new BooksAndPictureService();
	}

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("image/gif");
		ServletOutputStream out = res.getOutputStream();
		InputStream in = null;

		try {
			Integer pictureNumber = Integer.valueOf(req.getParameter("pictureNumber"));
			BooksAndPictureService bapSvc = new BooksAndPictureService();
			out.write(bapSvc.singleQueryBap(pictureNumber).getPictureFile());
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

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		// ===新增圖片===
		if ("insert".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			// ---接收資料---
			Integer bookNumber = Integer.valueOf(req.getParameter("bookNumber"));
			System.out.println(bookNumber);
			Collection<Part> parts = req.getParts();
			List<byte[]> images = new ArrayList<>();

			for (Part part : parts) {
				if (part.getContentType() != null && part.getContentType().startsWith("image")) {
					// 讀取檔案內容到 byte[] 陣列中
					byte[] fileBytes = getBytesFromInputStream(part.getInputStream());
					System.out.println(fileBytes.length);
					images.add(fileBytes);
				}
			}
			// ---提交新增---
			for (byte[] pictureFile : images) {
				bapSce.addBapNp(bookNumber, pictureFile);
			}
			// ---提交結果---
			req.setAttribute("bookNumber", bookNumber);
			RequestDispatcher failureView = req.getRequestDispatcher("/back-end/bookProducts/newBookOnTheShelves.jsp");
			failureView.forward(req, res);
			return;
		}
	}

	// 從 InputStream 中讀取資料到 byte[] 陣列中
	private byte[] getBytesFromInputStream(InputStream inputStream) throws IOException {
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] buffer = new byte[8192];
		int bytesRead;
		while ((bytesRead = inputStream.read(buffer)) != -1) {
			baos.write(buffer, 0, bytesRead);
		}
		return baos.toByteArray();
	}
}
