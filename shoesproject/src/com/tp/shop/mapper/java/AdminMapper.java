package com.tp.shop.mapper.java;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.tp.shop.dto.ProductDto;
import com.tp.shop.dto.Search;

@Mapper
public interface AdminMapper {
	//상품등록
	public void insertProduct(ProductDto dto);
	//상품목록조회 페이징 기능 추가중
	public List<ProductDto> listProduct(Search search);
	//페이징 전체 리스트 수량 받아오는 쿼리
	public int listCount(Search search);
	//상품 상세조회
	public ProductDto selectByName(String prodName);
	//상품컬러,사이즈 리스트가져오기
	public List<ProductDto> productColorSize(String prodName);
	//장바구니로 넘겨줄 no 값 가져오기
	public List<ProductDto> productNo(String prodName, String prodColor, int prodSize);
	//상품 수정에 필요한 전체 정보 no로 가져오기
	public ProductDto selectByNo(int prodNo);
	//상품 수정
	public void updateProduct(ProductDto dto);
	//상품 삭제
	public void deleteProduct(int prodNo);
	//상품 수정 리스트
	public List<ProductDto> updateList(String prodName);
	//상품 컬러에 맞는 사이즈 가져오기
	public List<Integer> getProdSizeByColor(@Param("color") String color,@Param("prodName") String prodName);
	//장바구니 추가에 필요한 id 가져오기
	public int getProdNo(@Param("name") String name, @Param("color") String color, @Param("size") String size );
	
}
