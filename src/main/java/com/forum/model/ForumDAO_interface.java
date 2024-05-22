package com.forum.model;

import java.util.List;


public interface ForumDAO_interface {
	public void insert(ForumVO forumVO);
	public void update(ForumVO forumVO);
	public void delete(Integer forumNumber);
	public ForumVO findByForumNumber(Integer forumNumber);
	public List<ForumVO> getAll();
	public List<ForumVO> findByForumName(String name);
	
}
