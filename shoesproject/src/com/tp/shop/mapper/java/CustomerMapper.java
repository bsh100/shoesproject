package com.tp.shop.mapper.java;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.tp.shop.dto.ProductDto;
import com.tp.shop.dto.Search;

@Mapper
public interface CustomerMapper {
	
	//유저 상품 카테고리값이 있으면 조건문 mybatis에서 조건문생성후 카테고리값을 받음 없으면 안받음 == 전체리스트출력
	public List<ProductDto> customerCategoryList(Search search);
	
	//페이징 전체 리스트 수량 받아오는 쿼리
	public int listCount(Search search);
}
