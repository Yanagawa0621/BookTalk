package com.forum.model;

import java.util.List;


public class ForumService {
	private ForumDAO_interface dao;

	public ForumService() {
		dao = new ForumDAO();
	}

	public ForumVO getForumNumber(Integer forumNumber) {
		return dao.findByForumNumber(forumNumber);
	}

	public List<ForumVO> getAll() {
		return dao.getAll();
	}

	public List<ForumVO> getName(String name) {
		return dao.findByForumName(name);
	}
	public ForumVO updateForum(Integer forumNumber, String name) {
		ForumVO forumVO = new ForumVO();
		forumVO.setForumNumber(forumNumber);
		forumVO.setName(name);
		dao.update(forumVO);
		return(forumVO);
	}
	public ForumVO addForum(String name) {

		ForumVO forumVO = new ForumVO();

		forumVO.setName(name);
		dao.insert(forumVO);

		return forumVO;
	}

}
