package com.booksandpicture.model;

import java.util.Base64;
import java.util.List;

import com.bookproducts.model.BookProductsVO;

public class BooksAndPictureService {
	BooksAndPictureDAO dao=new BooksAndPictureDAO();
	
	public int addBap(Integer bookNumber,String imgBaes64) {
		BooksAndPictureVO bapVO=new BooksAndPictureVO();
		BookProductsVO bpVO=new BookProductsVO();
		byte[] pictureFile=decodeBase64String(imgBaes64);
		
		bpVO.setBookNumber(bookNumber);
		bapVO.setBpVO(bpVO);
		bapVO.setPictureFile(pictureFile);
		
		return dao.increase(bapVO);
	}
	
	public int updateBap(Integer pictureNumber,String imgBaes64) {
	BooksAndPictureVO bapVO=new BooksAndPictureVO();
	byte[] pictureFile=decodeBase64String(imgBaes64);
	bapVO.setPictureNumber(pictureNumber);
	bapVO.setPictureFile(pictureFile);
	
	return dao.update(bapVO);
	}
	
	public int addBapNp(Integer bookNumber,byte[] pictureFile) {
		BooksAndPictureVO bapVO=new BooksAndPictureVO();
		BookProductsVO bpVO=new BookProductsVO();
		
		bpVO.setBookNumber(bookNumber);
		bapVO.setBpVO(bpVO);
		bapVO.setPictureFile(pictureFile);
		
		return dao.increase(bapVO);
	}
	
	public int updateBapNp(Integer pictureNumber,Integer bookNumber,byte[] pictureFile) {
		BooksAndPictureVO bapVO=new BooksAndPictureVO();
		BookProductsVO bpVO=new BookProductsVO();
		bpVO.setBookNumber(bookNumber);
		bapVO.setBpVO(bpVO);
		bapVO.setPictureNumber(pictureNumber);
		bapVO.setPictureFile(pictureFile);
		return dao.update(bapVO);
	}
	
	public int updateBapNp(Integer pictureNumber,byte[] pictureFile) {
		return dao.update(pictureNumber, pictureFile);
	}
	
	public List<BooksAndPictureVO> getimg(Integer bookNumber){
		BookProductsVO bpVO=new BookProductsVO();
		bpVO.setBookNumber(bookNumber);
		return dao.relatedPictures(bpVO);
	}
	
	public BooksAndPictureVO singleQueryBap(Integer pictureNumber) {
		return dao.singleQuery(pictureNumber);
	}
	
	public int deleteImg(Integer pictureNumber){
		return dao.delete(pictureNumber);
	}
	
	//=================================以下做圖片處理用========================================
	
	private byte[] decodeBase64String(String base64){
		return Base64.getDecoder().decode(base64);
	}
}
