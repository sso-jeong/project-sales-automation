package com.project.saleforce.model;

public class ItemVO {
	private String itemcd, itemnm, itemdiv, itemgrp, std, remark, insert_person, regdate, attdatnum, seq, itemdivname, itemgrpname, itemPhoto, photoName, qty;
	private int price;
	
	public String getQty() {
		return qty;
	}
	public void setQty(String qty) {
		this.qty = qty;
	}
	public String getPhotoName() {
		return photoName;
	}
	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}
	public String getItemPhoto() {
		return itemPhoto;
	}
	public void setItemPhoto(String itemPhoto) {
		this.itemPhoto = itemPhoto;
	}
	public String getItemcd() {
		return itemcd;
	}
	public void setItemcd(String itemcd) {
		this.itemcd = itemcd;
	}
	public String getItemnm() {
		return itemnm;
	}
	public void setItemnm(String itemnm) {
		this.itemnm = itemnm;
	}
	public String getItemdiv() {
		return itemdiv;
	}
	public void setItemdiv(String itemdiv) {
		this.itemdiv = itemdiv;
	}
	public String getItemgrp() {
		return itemgrp;
	}
	public void setItemgrp(String itemgrp) {
		this.itemgrp = itemgrp;
	}
	public String getStd() {
		return std;
	}
	public void setStd(String std) {
		this.std = std;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getInsert_person() {
		return insert_person;
	}
	public void setInsert_person(String insert_person) {
		this.insert_person = insert_person;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getAttdatnum() {
		return attdatnum;
	}
	public void setAttdatnum(String attdatnum) {
		this.attdatnum = attdatnum;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getItemdivname() {
		return itemdivname;
	}
	public void setItemdivname(String itemdivname) {
		this.itemdivname = itemdivname;
	}
	public String getItemgrpname() {
		return itemgrpname;
	}
	public void setItemgrpname(String itemgrpname) {
		this.itemgrpname = itemgrpname;
	}
}
