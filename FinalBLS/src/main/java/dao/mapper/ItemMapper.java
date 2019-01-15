package dao.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Item;

public interface ItemMapper {

	
	@Select("select ifnull(max(id), 0) from item")
	int maxid();

	@Insert("insert into item (id,name,price,description, pictureUrl, stock, type)"
			+ " values(#{id},#{name},#{price},#{description},#{pictureUrl},#{stock},#{type})")
	void insert(Item item);

	
	@Update("update item set name=#{name}, price=#{price}, description=#{description}, stock=#{stock}, type=#{type} "
			+ " pictureUrl=#{pictureUrl} where id=#{id}")
	void update(Item item);
	
	@Delete("delete from item where id=#{id}")
	void delete(Map<String, String> map);

	@Select("select ifnull(max(id), 0) from item")
	int maxnum();

}
