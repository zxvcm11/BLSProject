package logic;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import logic.ItemSet;

public class Cart {
	
	private List<ItemSet> itemSetList = new ArrayList<ItemSet>();
	
	public List<ItemSet> getItemSetList() {
		return itemSetList;
	}
	public void push(ItemSet itemSet) {
		for(ItemSet is : itemSetList) {
			if(is.getItem().getId() == itemSet.getItem().getId()) {
				is.setQuantity(is.getQuantity() + itemSet.getQuantity());
				return;
			}
		}
		itemSetList.add(itemSet);
	}
	public void delete(Integer index) {
		for(ItemSet is : itemSetList) {
			if(is.getItem().getName().equals(index)) {
				itemSetList.remove(index);
				return;
			}
		}
	}

	public boolean isEmpty() {
		return itemSetList== null || itemSetList.size() == 0;
	}
	
	public int getTotalAmount()
	{
		int sum = 0;
		for(ItemSet is : itemSetList)
		{
			sum+= is.getItem().getPrice() *is.getQuantity();
		}
		return sum;
	}

	public void clearAll(HttpSession session) {
		itemSetList = new ArrayList<ItemSet>();
		session.setAttribute("CART", this);//???
	}
}
