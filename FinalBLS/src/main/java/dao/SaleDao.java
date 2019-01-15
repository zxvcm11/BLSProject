package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.SaleMapper;
import logic.Sale;

@Repository
public class SaleDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS="dao.mapper.SaleMapper.";
	
	
	public Integer getMaxSaleId() {
		Integer ret = sqlSession.getMapper(SaleMapper.class).maxid();
		return ret+1;
	}
	public void insert(Sale sale) {
		sqlSession.getMapper(SaleMapper.class).insert(sale);
	}
	public List<Sale> list(String userId){
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		return sqlSession.getMapper(SaleMapper.class).select(map);
	}
}
