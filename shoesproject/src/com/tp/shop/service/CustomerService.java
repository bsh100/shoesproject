package com.tp.shop.service;

import java.util.List;

import com.tp.shop.dto.ProductDto;
import com.tp.shop.dto.Search;

public interface CustomerService {
	public List<ProductDto> customerCategoryList(Search search);

	public int listCount(Search search);
}
