package logic;

import java.io.File;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.ItemDao; //Repository
import dao.SaleDao;
import dao.SaleItemDao;
import dao.UserDao;
import dao.BoardDao;
import dao.CommentDao;
import logic.Item; //Bean

@Service 
public class ShopService {
	 @Autowired
	 private ItemDao itemDao;
	 @Autowired
	 private BoardDao boardDao;
	 @Autowired
	 private CommentDao commentDao;

	public List<Item> getItemList() {
		return itemDao.list();
	}

	public Item getItem(String id) {
		return itemDao.getItem(id);
	}

	public void itemCreate(Item item, HttpServletRequest request) {

		if (item.getPicture() != null && !item.getPicture().isEmpty()) {
			uploadFileCreate(item.getPicture(), request,"picture");

			item.setPictureUrl(item.getPicture().getOriginalFilename());
		}
		itemDao.insert(item);
	}

	private void uploadFileCreate(MultipartFile picture, HttpServletRequest request,String path) {
		String uploadPath = request.getServletContext().getRealPath("/") + "/"+path+"/"; 
													
		String orgFile = picture.getOriginalFilename();
		try {

			picture.transferTo(new File(uploadPath + orgFile));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void itemUpdate(Item item, HttpServletRequest request) {
		if (item.getPicture() != null && !item.getPicture().isEmpty()) {
			uploadFileCreate(item.getPicture(), request,"picture");
			item.setPictureUrl(item.getPicture().getOriginalFilename());
		}
		itemDao.update(item);
	}

	public void delete(String id) {
		itemDao.delete(id);
	}

	@Autowired
	private UserDao userdao;

	public void userCreate(User user) {
		userdao.createuser(user);
	}

	public User selectUser(String userId) {	
		return userdao.selectuser(userId);
	}


	@Autowired
	private SaleDao saleDao;
	@Autowired
	private SaleItemDao saleItemDao;

	public Sale checkEnd(User loginUser, Cart cart) {
		Sale sale = new Sale();
		sale.setSaleId(saleDao.getMaxSaleId());
		sale.setUser(loginUser);
		sale.setUpdateTime(new Date());

		List<ItemSet> itemList = cart.getItemSetList();

		int i = 0;
		for (ItemSet is : itemList) {
			int saleItemId = ++i;
			SaleItem saleItem = new SaleItem(sale.getSaleId(), saleItemId, is, sale.getUpdateTime());
			sale.getItemList().add(saleItem);
		}
		saleDao.insert(sale);
		List<SaleItem> saleItemList = sale.getItemList();
		for (SaleItem is : saleItemList) {
			saleItemDao.insert(is);
		}
		return sale;
	}

	public List<Sale> getSaleList(String userId) {
		return saleDao.list(userId);
	}

	public List<SaleItem> getSaleItemList(Integer saleId) {
		return saleItemDao.list(saleId);
	}

	public void userUpdate(User user) {
		userdao.update(user);
	}

	public void userDelete(String id) {
		userdao.delete(id);
	}
	public List<User> userList() {
		User user = new User();
		return userdao.userlist();
	}
	public List<User> userList(String[] idchks) {
		return userdao.userList(idchks);
	}
	public Board getBoard(Integer num, HttpServletRequest request) {
		if(request.getRequestURI().contains("detail")) {
			boardDao.readcntadd(num);
		}
		return boardDao.select(num);
	}
	
	public int boardcount(String searchType, String searchContent) {
		return boardDao.count(searchType, searchContent);
	}
	public List<Board> boardlist(String searchType, String searchContent, Integer pageNum, int limit) {
		return boardDao.list(searchType, searchContent, pageNum, limit);
	}
	public void boardadd(Board board, HttpServletRequest request) {
		if (board.getFile1() != null && !board.getFile1().isEmpty()) {
			uploadFileCreate(board.getFile1(), request,"file");

			board.setFileurl(board.getFile1().getOriginalFilename());
		}
		int max = boardDao.maxnum();
		board.setNum(++max);
		board.setRef(max);
		boardDao.insert(board);
	}

		public void replyAdd(Board board) {

		Board b1 = boardDao.select(board.getNum());
		int max= boardDao.maxnum();

		board.setNum(++max);
		board.setRef(b1.getRef());
		board.setReflevel(b1.getReflevel()+1);
		board.setRefstep(b1.getRefstep()+1);
		boardDao.refstep(b1.getRef(),board.getRefstep());
		boardDao.insert(board);
	}

		public void UpdateBoard(Board board,HttpServletRequest request) {
			if (board.getFile1() != null && !board.getFile1().isEmpty()) {
				uploadFileCreate(board.getFile1(), request,"file");
				board.setFileurl(board.getFile1().getOriginalFilename());
			}
			boardDao.update(board);
			
		}

		public void deleteboard(Board board) {
			boardDao.delete(board.getNum());
			
		}

		public void commregster(Comment comment) {
		      int max= commentDao.maxnum();
		      comment.setComnum(++max);
		        commentDao.commentRegister(comment);
		     }

		public List<Item> getItemList_type(String type) {
			return itemDao.typeList(type);
		}

		public int getMaxnum() {
			return itemDao.Maxnum();
		}
}
