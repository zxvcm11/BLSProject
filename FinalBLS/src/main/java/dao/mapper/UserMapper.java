package dao.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;

import logic.User;

public interface UserMapper {

	@Update("update member2 set password=#{password}, "
			+ "tel=#{tel}, email=#{email}, addr=#{addr}, addr1=#{addr1}, ft=#{ft}, fp=#{fp}, type=#{type}, userName=#{userName} ,#{postcode} where userId=#{userId}")
	void update(User user);

	@Insert("insert into member2 (userId,password,tel,email,addr,addr1,ft,fp,type,userName,postcode) "
			+ "values(#{userId},#{password},#{tel},#{email},#{addr},#{addr1},#{ft},#{fp},#{type},#{userName},#{postcode})")
	void insert(User user);

	@Delete("delete from member2 where userId=#{Id}")
	void delete(Map<String, String> map);

}
