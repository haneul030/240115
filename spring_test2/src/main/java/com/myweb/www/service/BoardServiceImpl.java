package com.myweb.www.service;


import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myweb.www.domain.BoardDTO;
import com.myweb.www.domain.BoardVO;
import com.myweb.www.domain.FileVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.repository.BoardDAO;
import com.myweb.www.repository.FileDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class BoardServiceImpl implements BoardService{

	private final BoardDAO bdao;
	private final FileDAO fdao;
	
	@Transactional
	@Override
	public int insert(BoardDTO bdto) {
		log.info("insert service in");
		//bvo boardMapper / flist fileMapper 등록
		int isOk = bdao.insert(bdto.getBvo());
		
		if(bdto.getFlist() == null) {
			return isOk;
		}
		
		//bvo insert 후 파일도 있다면...
		if(isOk > 0 && bdto.getFlist().size() > 0) {
			//bno setting
			long bno = bdao.selectOneBno(); //가장 마지막에 등록된 bno
			for(FileVO fvo : bdto.getFlist()) {
				fvo.setBno(bno);
				isOk *= fdao.insertFile(fvo);
			}
		}
		return isOk;
	}

	@Override
	public List<BoardVO> getList(PagingVO pgvo) {
		// TODO Auto-generated method stub
		bdao.updateCommentCount();
		bdao.updateFileCount();
		return bdao.selectList(pgvo);
	}
	
	@Transactional
	@Override
	public BoardDTO getDetail(int bno) {
		//readCount
		bdao.addReadCount(bno); //bno, +1
		log.info(">>> board service detail >>>> 123123");
		BoardVO bvo = bdao.getDetail(bno);
		List<FileVO>flist = fdao.getFileList(bno);
		BoardDTO bdto = new BoardDTO(bvo, flist);
			return bdto;
		}

	@Override
	public void update(BoardVO bvo) {
		bdao.modify(bvo);
		
	}

	@Override
	public int remove(int bno) {
		log.info("remove service impl");
		return bdao.delete(bno);
	}

	@Override
	public int gettotalCount(PagingVO pgvo) {
		
		return bdao.gettotalCount();
	}

	@Override
	public int delete(String uuid) {
		
		return fdao.remove(uuid);
	}
	
	
	
	}

	
	
	

