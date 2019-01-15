package logic;

import javax.validation.constraints.Size;

public class User {
	@Size(min=3, max=10, message="3~10자 사이로 입력하세요")
	private String userId;
	@Size(min=3, max=10, message="3~10자로 입력하세요")
	private String password;
	private String tel;
	private String addr;
	private String addr1;
	private String email;
	private int type;
	private String ft;
	private String fp;
	private String userName;
	private String postcode;
	
	
	
	public String getFt() {
		return ft;
	}
	public void setFt(String ft) {
		this.ft = ft;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getFp() {
		return fp;
	}
	public void setFp(String fp) {
		this.fp = fp;
	}
	
	@Override
	public String toString() {
		return "User [userId=" + userId + ", password=" + password + ", tel=" + tel + ", addr=" + addr + ", addr1="
				+ addr1 + ", email=" + email + ", type=" + type + ", ft=" + ft + ", fp=" + fp + ", userName=" + userName
				+ ", postcode=" + postcode + "]";
	}
}
