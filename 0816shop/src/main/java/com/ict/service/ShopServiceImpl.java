package com.ict.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ict.domain.CartListVO;
import com.ict.domain.CartVO;
import com.ict.domain.GoodsViewVO;
import com.ict.domain.OrderDetailVO;
import com.ict.domain.OrderListVO;
import com.ict.domain.OrderVO;
import com.ict.domain.ReplyListVO;
import com.ict.domain.ReplyVO;
import com.ict.persitence.ShopDAO;

@Service
public class ShopServiceImpl implements ShopService {

	@Inject
	private ShopDAO dao;
	
	// 이미지 리스트
	@Override
	public List<GoodsViewVO> goodsImagesList(int gdsNum) throws Exception {		
	return dao.goodsImagesList(gdsNum);
	}

	// 카테고리별 상품 리스트
	@Override
	public List<GoodsViewVO> list(int cateCode, int level) throws Exception {
		int cateCodeRef = 0;  // 카테고리 참조 코드. 없어도 무관
		
		if(level == 1) {  // level 1 = 1차 분류.
			cateCodeRef = cateCode;
			return dao.list(cateCode, cateCodeRef);
			// 두가지 모두 cateCode로 해도 무관
		} else {  // level 2 = 2차 분류
			return dao.list(cateCode);
		} 
	}
	
	// 상품 조회
	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception {
		return dao.goodsView(gdsNum);
	}
	
	// 상품 댓글 작성
	@Override
	public void registReply(ReplyVO reply) throws Exception {
		dao.registReply(reply);		
	}
	
	// 상품 댓글 리스트
	@Override
	public List<ReplyListVO> replyList(int gdsNum) throws Exception {
		return dao.replyList(gdsNum);
	}
	
	// 상품 댓글 삭제
	@Override
	public void deleteReply(ReplyVO reply) throws Exception {
		dao.deleteReply(reply);
	}

	// 아이디 체크
	@Override
	public String idCheck(int repNum) throws Exception {
		return dao.idCheck(repNum);
	}
	
	// 상품 댓글 수정
	@Override
	public void modifyReply(ReplyVO reply) throws Exception {
		dao.modifyReply(reply);
	}
	
	// 카트 담기
	@Override
	public void addCart(CartListVO cart) throws Exception {
		dao.addCart(cart);
	}
	
	// 카트 리스트
	@Override
	public List<CartListVO> cartList(String memId) throws Exception {
		return dao.cartList(memId);
	}
	
	// 카트 삭제
	@Override
	public void deleteCart(CartVO cart) throws Exception {
		dao.deleteCart(cart);
	}
	
	// 주문 정보
	@Override
	public void orderInfo(OrderVO order) throws Exception {
		dao.orderInfo(order);
	}

	// 주문 상세 정보
	@Override
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception {
		dao.orderInfo_Details(orderDetail);
	}
	
	// 카트 비우기 
	@Override
	public void cartAllDelete(String memId) throws Exception {
		dao.cartAllDelete(memId);
	}
	
	// 주문 목록
	@Override
	public List<OrderVO> orderList(OrderVO order) throws Exception {
		return dao.orderList(order);
	}
	
	// 특정 주문
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return dao.orderView(order);
	}
	
}