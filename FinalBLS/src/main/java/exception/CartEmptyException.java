package exception;

public class CartEmptyException extends RuntimeException {

	private String url;

	public CartEmptyException(String msg,String url) {
		super(msg);	//Runtime에서 전달해줌
		this.url = url;
	}
	public String getUrl() {
		return url;
	}

}