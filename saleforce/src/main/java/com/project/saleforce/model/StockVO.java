package com.project.saleforce.model;

public class StockVO {
	String itemcd,  itemnm, std, attdatnum, regdate, stktypenm, indt, outdt, remark, insert_person, de_regdate;
	int cqty, qty, inqty, outqty, seq;
	public String getItemcd() {
		return itemcd;
	}
	public int getCqty() {
		return cqty;
	}
	public void setCqty(int cqty) {
		this.cqty = cqty;
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
	public String getStd() {
		return std;
	}
	public void setStd(String std) {
		this.std = std;
	}
	public String getAttdatnum() {
		return attdatnum;
	}
	public void setAttdatnum(String attdatnum) {
		this.attdatnum = attdatnum;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getStktypenm() {
		return stktypenm;
	}
	public void setStktypenm(String stktypenm) {
		this.stktypenm = stktypenm;
	}
	public String getIndt() {
		return indt;
	}
	public void setIndt(String indt) {
		this.indt = indt;
	}
	public String getOutdt() {
		return outdt;
	}
	public void setOutdt(String outdt) {
		this.outdt = outdt;
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
	public String getDe_regdate() {
		return de_regdate;
	}
	public void setDe_regdate(String de_regdate) {
		this.de_regdate = de_regdate;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getInqty() {
		return inqty;
	}
	public void setInqty(int inqty) {
		this.inqty = inqty;
	}
	public int getOutqty() {
		return outqty;
	}
	public void setOutqty(int outqty) {
		this.outqty = outqty;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	
	
}
