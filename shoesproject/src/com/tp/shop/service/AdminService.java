package com.tp.shop.service;

import java.util.List;

import com.tp.shop.dto.Pagination;
import com.tp.shop.dto.ProductDto;
import com.tp.shop.dto.Search;

public interface AdminService {

	public void insertProduct(ProductDto dto);

	public List<ProductDto> listProduct(Search search);
	
	public int listCount(Search search);
	
	public ProductDto selectByName(String prodName);
	
	public List<ProductDto> productColorSize(String prodName);
	
	public List<ProductDto> productNo(String prodName, String prodColor, int prodSize);
	
	public List<ProductDto> updateList(String prodName);
	
	public ProductDto selectByNo(int prodNo);
	
	public void updateProduct(ProductDto dto);
	
	public void deleteProduct(int prodNo);

	public List<Integer> getProdSizeByColor(String color, String prodName);

	public int getProdNo(String name, String color, String size);
}
