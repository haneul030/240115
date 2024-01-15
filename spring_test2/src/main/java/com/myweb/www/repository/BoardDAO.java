package com.myweb.www.repository;

import java.util.List;

import com.myweb.www.domain.BoardVO;
import com.myweb.www.domain.PagingVO;

public interface BoardDAO {

	int insert(BoardVO bvo);

	List<BoardVO> selectList(PagingVO pgvo);

	void addReadCount(int bno);

	BoardVO getDetail(int bno);

	void modify(BoardVO bvo);

	int delete(int bno);

	int gettotalCount();

	long selectOneBno();

	void updateCommentCount();

	void updateFileCount();

}
