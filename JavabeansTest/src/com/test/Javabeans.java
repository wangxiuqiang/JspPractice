package com.test;


//javabeans原则
/**
 * @author wxq
 *1.类公有
 *2.属性私有化
 *3.默认的构造函数  无形参
 *4.用getter 和 setter 方法访问  私有属性
 */
public class Javabeans {
	private String name, passwd;

	public Javabeans() {
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

}
