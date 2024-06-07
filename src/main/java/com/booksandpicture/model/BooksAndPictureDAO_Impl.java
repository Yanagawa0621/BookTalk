package com.booksandpicture.model;

import java.util.List;

import com.bookproducts.model.BookProductsVO;

public interface BooksAndPictureDAO_Impl {
	int increase (BooksAndPictureVO bapVO);
	int update (BooksAndPictureVO bapVO);
	List<BooksAndPictureVO> relatedPictures(BookProductsVO bpVO);
	BooksAndPictureVO singleQuery(Integer pictureNumber);
}
