package com.kh.fifteenGG.champion.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class TipBoard implements Serializable {

		private int tipBno;
		private String championName;
		private String tipTitle;
		private int	tipWriter;
		private String tipContent;
		private String nickName;
		private Date tipDate;
		private int	tipreadCount;
		
		
		public TipBoard() {
			super();
		
		}


		public TipBoard(int tipBno, String chmapionName, String tipTitle, int tipWriter, String tipContent,
				Date tipDate, int tipreadCount) {
			super();
			this.tipBno = tipBno;
			this.championName = chmapionName;
			this.tipTitle = tipTitle;
			this.tipWriter = tipWriter;
			this.tipContent = tipContent;
			this.tipDate = tipDate;
			this.tipreadCount = tipreadCount;
		}


		public String getChampionName() {
			return championName;
		}


		public void setChampionName(String championName) {
			this.championName = championName;
		}


		public int getTipBno() {
			return tipBno;
		}


		public void setTipBno(int tipBno) {
			this.tipBno = tipBno;
		}

		public String getTipTitle() {
			return tipTitle;
		}


		public void setTipTitle(String tipTitle) {
			this.tipTitle = tipTitle;
		}


		public int getTipWriter() {
			return tipWriter;
		}


		public void setTipWriter(int tipWriter) {
			this.tipWriter = tipWriter;
		}


		public String getTipContent() {
			return tipContent;
		}


		public void setTipContent(String tipContent) {
			this.tipContent = tipContent;
		}


		public Date getTipDate() {
			return tipDate;
		}


		public void setTipDate(Date tipDate) {
			this.tipDate = tipDate;
		}


		public int getTipreadCount() {
			return tipreadCount;
		}


		public void setTipreadCount(int tipreadCount) {
			this.tipreadCount = tipreadCount;
		}

		

		public String getNickName() {
			return nickName;
		}


		public void setNickName(String nickName) {
			this.nickName = nickName;
		}


		@Override
		public String toString() {
			return "TipBoard [tipBno=" + tipBno + ", championName=" + championName + ", tipTitle=" + tipTitle
					+ ", tipWriter=" + tipWriter + ", tipContent=" + tipContent + ", tipDate=" + tipDate
					+ ", tipreadCount=" + tipreadCount + "]";
		}

		
		

		
}
