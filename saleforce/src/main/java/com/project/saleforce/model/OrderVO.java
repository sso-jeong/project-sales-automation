package com.project.saleforce.model;

public class OrderVO {
	String ordnum, orddt, dlvdt, itemcd, itemnm, divnm, comcd, comnm, projectnm, ordperson, remark, regdate, seq, insert_person, std, janqty;
	int qty, price, uprice, tax;
	
	public String getJanqty() {
		return janqty;
	}
	public void setJanqty(String janqty) {
		this.janqty = janqty;
	}
	public String getOrdnum() {
		return ordnum;
	}
	public String getStd() {
		return std;
	}
	public void setStd(String std) {
		this.std = std;
	}
	public void setOrdnum(String ordnum) {
		this.ordnum = ordnum;
	}
	public String getOrddt() {
		return orddt;
	}
	public void setOrddt(String orddt) {
		this.orddt = orddt;
	}
	public String getDlvdt() {
		return dlvdt;
	}
	public void setDlvdt(String dlvdt) {
		this.dlvdt = dlvdt;
	}
	public String getItemcd() {
		return itemcd;
	}
	public void setItemcd(String itemcd) {
		this.itemcd = itemcd;
	}
	public String getComcd() {
		return comcd;
	}
	public void setComcd(String comcd) {
		this.comcd = comcd;
	}
	public String getProjectnm() {
		return projectnm;
	}
	public void setProjectnm(String projectnm) {
		this.projectnm = projectnm;
	}
	public String getOrdperson() {
		return ordperson;
	}
	public void setOrdperson(String ordperson) {
		this.ordperson = ordperson;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getInsert_person() {
		return insert_person;
	}
	public void setInsert_person(String insert_person) {
		this.insert_person = insert_person;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getItemnm() {
		return itemnm;
	}
	public void setItemnm(String itemnm) {
		this.itemnm = itemnm;
	}
	public String getDivnm() {
		return divnm;
	}
	public void setDivnm(String divnm) {
		this.divnm = divnm;
	}
	public String getComnm() {
		return comnm;
	}
	public void setComnm(String comnm) {
		this.comnm = comnm;
	}
	public int getUprice() {
		return uprice;
	}
	public void setUprice(int uprice) {
		this.uprice = uprice;
	}
	public int getTax() {
		return tax;
	}
	public void setTax(int tax) {
		this.tax = tax;
	}
	
}
