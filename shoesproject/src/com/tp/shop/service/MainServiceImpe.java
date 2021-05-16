package com.tp.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tp.shop.dto.ProductDto;
import com.tp.shop.mapper.java.MainMapper;

@Service
public class MainServiceImpe implements MainService {

	@Autowired
	MainMapper mm;
	
	@Override
	public List<ProductDto> getBestProdList() {
		return mm.getBestProdList();
	}

	@Override
	public List<String> getCate() {
		
		return mm.getCate();
	}


}
