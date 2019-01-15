package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Sale;

public interface SaleMapper {
	
	
	@Insert("insert into sale (saleid, userid, updateTime) values (#{saleId}, #{user.userId}, #{updateTime})")
	void insert(Sale sale);
	
	@Select("select ifnull(max(saleid),0) from sale")
	Integer maxid();
	
	@Select("select * from sale where userid=#{userId}")
	List<Sale> select(Map<String, String> map);

}
