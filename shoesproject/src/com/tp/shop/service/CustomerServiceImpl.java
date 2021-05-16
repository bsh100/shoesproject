package com.tp.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tp.shop.dto.ProductDto;
import com.tp.shop.dto.Search;
import com.tp.shop.mapper.java.CustomerMapper;

@Service
public class CustomerServiceImpl implements CustomerService{

	@Autowired
	CustomerMapper mapper;
	

	@Override
	public List<ProductDto> customerCategoryList(Search search) {
		return mapper.customerCategoryList(search);
	}


	@Override
	public int listCount(Search search) {
		return mapper.listCount(search);
	}

}
