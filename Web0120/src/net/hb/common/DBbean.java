package net.hb.common;

public class DBbean { 
	 //bean=다리역할=Data Value Object = Data Trans Object
			private  int sabun;
			private  String name;
			private  String title;
			private  java.util.Date  nalja;
			private  int  pay ; 
			//오.버=>source => Generate Getters and Setters...
			public int getSabun() {		return sabun;			}
			public void setSabun(int sabun) {			this.sabun = sabun;			}
			public String getName() {			return name;			}
			public void setName(String name) {			this.name = name;			}
			public String getTitle() {			return title;			}
			public void setTitle(String title) {				this.title = title;			}
			public java.util.Date getNalja() {		return nalja;			}
			public void setNalja(java.util.Date nalja) {	this.nalja = nalja;			}
			public int getPay() {			return pay;			}
			public void setPay(int pay) { this.pay = pay;			}
			
}//class end
