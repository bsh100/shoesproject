package test;

import static org.junit.Assert.assertNotNull;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tp.shop.dto.ProductDto;
import com.tp.shop.mapper.java.AdminMapper;
import com.tp.shop.service.AdminService;
import com.tp.shop.service.CartService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:com/tp/shop/config/root-context.xml")
public class AdminTest {

	@Autowired
	AdminService service;
	@Autowired
	AdminMapper mapper;
	
	@Autowired
	ApplicationContext ctx;
	
	@Autowired
	SqlSessionFactoryBean sqlSessionFactoryBean;
	
	@Autowired
	CartService cs;
	@Test
	public void test() {
		assertNotNull(sqlSessionFactoryBean);

//		List<ProductDto> plist;
//		plist = mapper.listProduct();
//		System.out.println(plist);
		
//		System.out.println(mapper.selectById(1));
		
//		System.out.println(mapper.productColorSize("슬리퍼2"));
//		System.out.println(service.getProdSizeByColor("blue", "슬리퍼2"));
//		System.out.println(mapper.getProdNo("슬리퍼2", "blue", "260"));
//		cs.insertCart(2, "user1");
	}

}
