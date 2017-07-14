package entity;
//创建为购物车类

import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

public class Cart {
	private HashMap<Items, Integer> goods;
	private double totalPrice;

	public Cart() {
		goods = new HashMap<Items, Integer>();
		totalPrice = 0.0;
	}

	// 添加商品进入购物车
	public boolean addGoodsInCart(Items item, int number) {
		if (goods.containsKey(item)) {
			goods.put(item, goods.get(item) + number);
		} else {
			goods.put(item, number);
		}
		calTotalPrice();
		return true;
	}

	// 删除购物车中的商品
	public boolean removeGoodsFromCart(Items item) {
		goods.remove(item);
		calTotalPrice();
		return true;
	}

	// 更改金额
	public double calTotalPrice() {
		Set<Items> keys = goods.keySet();
		Iterator<Items> it = keys.iterator();
		double sum = 0.0;
		while (it.hasNext()) {
			Items i = it.next();
			sum += i.getPrice() * goods.get(i);
		}
		this.setTotalPrice(sum);
		return this.getTotalPrice();
	}

	public HashMap<Items, Integer> getGoods() {
		return goods;
	}

	public void setGoods(HashMap<Items, Integer> goods) {
		this.goods = goods;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

}
