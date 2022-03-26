package com.okpos.asp;

public class LinkedList {
	public int data;
	public LinkedList link;
	
	public LinkedList() {;}

	public LinkedList(int data) {
		this.data = data;
		this.link = null;
	}
	
	public LinkedList(int data, LinkedList link) {
		this.data = data;
		this.link = link;
	}
	
	public int getData() {
		return this.data;
	}
	
	public LinkedList getLink(int n) {
		LinkedList p = new LinkedList(this.data, this.link);
		
		if (n == 0) {
			return p;
		}
		
		LinkedList temp = new LinkedList();
		
		for (int i = 1; i < n; i++) {
			temp.data = p.link.data;
			temp.link = p.link.link;
			p = new LinkedList(temp.data, temp.link);
		}
		
		return p.link;
	}
}
