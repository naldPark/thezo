package com.kh.thezo.common.template;

import com.kh.thezo.common.model.vo.PageInfo;

public class Pagination {

	public static PageInfo getPageInfo(int listCount, int currentPage, int pageLimit, int boardLimit) {
		// * 총 페이지 수
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		// * 시작 수
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		// * 끝 수
		int endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		return new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
	}
	
}
