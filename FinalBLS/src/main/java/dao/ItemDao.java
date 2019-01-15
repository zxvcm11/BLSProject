package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.ItemMapper;
import logic.Item;	//Bean

@Repository
public class ItemDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS="dao.mapper.ItemMapper.";
	
	public List<Item> list(){
		return sqlSession.selectList(NS+"list");
	}
	public Item getItem(String id) {
		Map<String, String> map = new HashMap<String,String>();
		map.put("id", id);	
		return sqlSession.selectOne(NS+"list",map); 
		}
	public void insert(Item item) {		
		int i = sqlSession.getMapper(ItemMapper.class).maxid();
		item.setId(++i);
		sqlSession.getMapper(ItemMapper.class).insert(item);
	}
	public void update(Item item) {
		sqlSession.getMapper(ItemMapper.class).update(item);
	}
	public void delete(String id) {
		Map<String, String> map = new HashMap<String,String>();
		map.put("id", id);
		sqlSession.getMapper(ItemMapper.class).delete(map);
	}
	public List<Item> typeList(String type) {
		Map<String, String> map = new HashMap<String,String>();
		map.put("type", type);
		return sqlSession.selectList(NS+"list", map);
	}
	public int Maxnum() {
		int maxnum = sqlSession.getMapper(ItemMapper.class).maxnum();
		return maxnum;
	}
}
