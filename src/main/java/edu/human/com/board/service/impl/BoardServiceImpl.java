package edu.human.com.board.service.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import edu.human.com.board.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO boardDAO;//같은 패키지안에 있으면, import가 필요 없음.

	@Override
	public Integer delete_board(Integer nttId) throws Exception {
		// DAO호출
		return boardDAO.delete_board(nttId);
	}

	@Override
	public Integer delete_attach(String atchFileId) throws Exception {
		// DAO 호출 2개 삭제는 역순으로
		//bbs(1)->attach(2)->attachdetail(3)
		int result=0;
		if(boardDAO.delete_attach_detail(atchFileId) > 0) {
			result = boardDAO.delete_attach(atchFileId);
		}
		return result;
	}

}