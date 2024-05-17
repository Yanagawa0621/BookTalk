package com.bookclass.model;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import com.bookproducts.model.BookProductsVO;
import com.booksandpicture.model.BooksAndPictureVO;

public class BookClassService {
	
	
	
	// =================================以下做圖片處理用========================================

		// 單筆書籍資料的圖片轉換
		private BookProductsVO singleConversion(BookProductsVO bpVO) {
			List<String> base64 = new ArrayList<>();
			List<BooksAndPictureVO> imgs = bpVO.getBapVO();

			if (imgs != null) {
				for (BooksAndPictureVO img : imgs) {
					byte[] pictureFile = img.getPictureFile();
					String base64Encoded = Base64.getEncoder().encodeToString(pictureFile);
					base64.add(base64Encoded);
				}
				bpVO.setImg(base64);
			}
			return bpVO;
		}

		// 多筆書籍資料的圖片轉換
		private List<BookProductsVO> multipleConversions(List<BookProductsVO> list) {
			for (BookProductsVO myCollection : list) {
				List<String> base64 = new ArrayList<>();
				List<BooksAndPictureVO> imgs = myCollection.getBapVO();

				if (imgs != null) {
					for (BooksAndPictureVO img : imgs) {
						byte[] pictureFile = img.getPictureFile();
						String base64Encoded = Base64.getEncoder().encodeToString(pictureFile);
						base64.add(base64Encoded);
					}
					myCollection.setImg(base64);
				}
			}
			return list;
		}
		
}
