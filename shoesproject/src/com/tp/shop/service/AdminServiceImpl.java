package com.tp.shop.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tp.shop.dto.Pagination;
import com.tp.shop.dto.ProductDto;
import com.tp.shop.dto.Search;
import com.tp.shop.mapper.java.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	AdminMapper adminMapper;

	@Override
	public void insertProduct(ProductDto dto) {
		adminMapper.insertProduct(dto);
	}

	@Override
	public List<ProductDto> listProduct(Search search) {
		return adminMapper.listProduct(search);
	}
	
	@Override
	public int listCount(Search search) {
		return adminMapper.listCount(search);
	}

	@Override
	public ProductDto selectByName(String prodName) {
		return adminMapper.selectByName(prodName);
	}

	@Override
	public List<ProductDto> productColorSize(String prodName) {
		return adminMapper.productColorSize(prodName);
	}

	@Override
	public List<ProductDto> productNo(String prodName, String prodColor, int prodSize) {
		return adminMapper.productNo(prodName, prodColor, prodSize);
	}

	@Override
	public List<ProductDto> updateList(String prodName) {
		return adminMapper.updateList(prodName);
	}
	
	@Override
	public ProductDto selectByNo(int prodNo) {
		return adminMapper.selectByNo(prodNo);
	}

	@Override
	public void updateProduct(ProductDto dto) {
		adminMapper.updateProduct(dto);
	}

	@Override
	public void deleteProduct(int prodNo) {
		adminMapper.deleteProduct(prodNo);
	}

	@Override
	public List<Integer> getProdSizeByColor(String color, String prodName) {
//			HashMap<String, String> prodNamecolor = new HashMap<String, String>();
//			prodNamecolor.put("color", color);
//			prodNamecolor.put("prodName", prodName);
		return adminMapper.getProdSizeByColor(color,prodName);
	}

	@Override
	public int getProdNo(String name, String color, String size) {
		return adminMapper.getProdNo(name, color, size);
		
	}

	
	
	
}
