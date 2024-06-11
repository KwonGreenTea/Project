package com.everytime.web.service;

import java.util.List;

import com.everytime.web.domain.PostVO;
import com.everytime.web.util.Pagination;

public interface PostService {
    int createPost(PostVO postVO);
    List<PostVO> getAllPosts(int boardId);
    PostVO getPostById(int postId);
    int updatePost(PostVO postVO);
    int deletePost(int postId);
    List<PostVO> getPagingPosts(Pagination pagination);
    int getTotalCount();
}
