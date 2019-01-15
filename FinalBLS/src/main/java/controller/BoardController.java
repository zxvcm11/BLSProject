package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import exception.LoginException;
import exception.ShopException;
import logic.Board;
import logic.ShopService;

@Controller
public class BoardController {

	@Autowired
	private ShopService service;

	@RequestMapping(value = "board/list")
	public ModelAndView list(Integer pageNum, String searchType, String searchContent) {
		if (pageNum == null || pageNum.toString().equals("")) {
			pageNum = 1;
		}
		ModelAndView mav = new ModelAndView();
		int limit = 10; // 한 페이지에 출력할 게시물 갯수
		// 총 게시물 건수
		int listcount = service.boardcount(searchType, searchContent);
		// boardlist : 한페이지에 출력할 게시물 정보 저장
		List<Board> boardlist = service.boardlist(searchType, searchContent, pageNum, limit);
		int maxpage = (int) ((double) listcount / limit + 0.95);
		// 화면에 표시될 시작 페이지 수
		int startpage = ((int) ((pageNum / 10.0 + 0.9) - 1)) * 10 + 1;
		// 화면에 표시될 마지막 페이지 수
		int endpage = startpage + 9;
		if (endpage > maxpage)
			endpage = maxpage;
		// boardcnt : 화면에 보여지는 게시물 순서
		int boardcnt = listcount - (pageNum - 1) * limit;
		mav.addObject("pageNum", pageNum);
		mav.addObject("maxpage", maxpage);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		mav.addObject("listcount", listcount);
		mav.addObject("boardlist", boardlist);
		mav.addObject("boardcnt", boardcnt);
		return mav;
	}
//	@RequestMapping("board/detail")
//	public ModelAndView detail(Integer num) {
//		ModelAndView mav = new ModelAndView();
//		Board board = new Board();
//		board = service.detail(num);
//		
//	}

	@RequestMapping(value = "board/*", method = RequestMethod.GET)
	public ModelAndView getboard(Integer num, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Board board = new Board();
		if (num != null) {
//			if(request.getRequestURI().contains("detail")) {
//				boardDao.readcntadd(num);
//			}
			board = service.getBoard(num, request);
		}
		mav.addObject("board", board);
		return mav;
	}

	@RequestMapping(value = "board/write", method = RequestMethod.POST)
	public ModelAndView write(@Valid Board board, BindingResult br, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		if (br.hasErrors()) {
			mav.getModel().putAll(br.getModel());
			return mav;
		}
		try {
			service.boardadd(board, request);
			mav.setViewName("redirect:list.shop");
			mav.addObject("board", board);

		} catch (DataIntegrityViolationException e) {
			e.printStackTrace();
			throw new ShopException("게시물 등록 실패.", "../board/write.shop?");
		}
		return mav;
	}

	/*
	 * 답글 등록 1. 유효성 검증 2. 답글 db에 등록. 원게시글 정보 중 ref는 답글 정보의 ref 값 원게시글 정보 중 reflevel
	 * 는 답글의 reflevel +1값 원게시글 정보 중 refstep 는 답글의 refstep +1 값 => 작업 전 기존의 원글의
	 * refstep 보다 큰 모든 레코드들을 refstep+1로 수정하기. 3. 등록 후 list.shop 요청하기
	 * 
	 */
	// update board set refstep = refstep+1 where ref=#{ref} and refstep >
	// #{refstep}
	@RequestMapping(value = "board/reply", method = RequestMethod.POST)
	public ModelAndView reply(@Valid Board board, BindingResult br) {
		ModelAndView mav = new ModelAndView();
		if (br.hasErrors()) {
			mav.getModel().putAll(br.getModel());
			return mav;
		}
		try {
			service.replyAdd(board);
			mav.setViewName("redirect:list.shop");
			mav.addObject("board", board);
		} catch (DataIntegrityViolationException e) {
			e.printStackTrace();
			throw new ShopException("답글 등록 실패.", "../board/write.shop?");
		}
		return mav;
	}

	@RequestMapping(value = "board/update", method = RequestMethod.POST)
	public ModelAndView update(@Valid Board board, BindingResult br, HttpServletRequest request, String file2) {
		ModelAndView mav = new ModelAndView();
		Board dbboard = service.getBoard(board.getNum(), request);
		if (br.hasErrors()) {
			mav.getModel().putAll(br.getModel());
			mav.addObject("board",dbboard);
			return mav;
		}
		
		if (!dbboard.getPass().equals(board.getPass())) {
			throw new ShopException("비밀번호가 틀렸습니다.", "../board/update.shop?num=" + board.getNum());
		} else {
			board.setFileurl(file2); //기존에 있던 파일을 fileurl에 다시 담기
			try {
				service.UpdateBoard(board, request);
				mav.setViewName("redirect:list.shop");
				mav.addObject("board", board);

			} catch (DataIntegrityViolationException e) {
				e.printStackTrace();
				throw new ShopException("수정 실패.", "../board/list.shop");
			}
		}
		return mav;
	}
	@RequestMapping(value="board/delete", method= RequestMethod.POST)
	public ModelAndView delete(Board board,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Board dbboard = service.getBoard(board.getNum(), request);
		
		if(!dbboard.getPass().equals(board.getPass())) {
			throw new ShopException("비밀번호가 틀렸습니다. 다시 입력하세요.", "../board/delete.shop?num="+board.getNum());
		}
		try {
			service.deleteboard(board);
			mav.setViewName("redirect:list.shop");
			mav.addObject("board", board);
		}catch(DataIntegrityViolationException e) {
			throw new ShopException("삭제 실패", "../board/delete.shop?num="+board.getNum());
		}
		return mav;
	}
	
}
