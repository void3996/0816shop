package com.mvc.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mvc.domain.CategoryVO;
import com.mvc.domain.GoodsVO;
import com.mvc.domain.GoodsViewVO;
import com.mvc.persitence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService{
	@Inject
	private AdminDAO dao;
	//카테고리
	@Override
	public List<CategoryVO> category() throws Exception{
		return dao.category();
	}
	//상품등록
	@Override
	public void register(GoodsVO vo) throws Exception {
		dao.register(vo);
	}
	//상품목록
	@Override
	public List<GoodsVO> goodslist() throws Exception{
		System.out.println("서비스");
		return dao.goodslist();
	}
	//상품조회
	 @Override
	 public GoodsViewVO goodsView(int gdsNum) throws Exception{ 
		 return dao.goodsView(gdsNum); }
	//상품 수정
	public void goodsModify(GoodsVO vo) throws Exception{
		dao.goodsModify(vo);
	}
	//상품 삭제
	@Override
	public void goodsDelete(int gdsNum) throws Exception{
		dao.goodsDelete(gdsNum);
	}
	 
}
