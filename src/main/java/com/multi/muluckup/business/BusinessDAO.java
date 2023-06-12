package com.multi.muluckup.business;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BusinessDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public int insert(BusinessVO bag) {
		
		System.out.println("BusinessVO :" +bag);
		int result= my.insert("business.create",bag);
		
		return result;
	}
	public List<BusinessVO> list2(PageVO vo){
		return my.selectList("business.list2",vo);
	}
	
	public List<BusinessVO> list(){
		return my.selectList("business.list");
	}
	
	public int count() {
		return my.selectOne("business.count");
	}
	
	public int count1() {
		return my.selectOne("business.count1");
	}
	public BusinessVO one(BusinessVO vo) {
		return my.selectOne("business.one",vo);
	}

	public List<BusinessVO> all(PageVO vo){
		return my.selectList("business.all",vo);
	}
	
	public List<BusinessVO> all2(PageVO vo){
		return my.selectList("business.all2",vo);
	}

}
