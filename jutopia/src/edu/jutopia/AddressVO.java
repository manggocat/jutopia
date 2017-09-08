package edu.jutopia;

import java.io.Serializable;

public class AddressVO implements Serializable{
	private String Address, Address_Jibun;
	
	public AddressVO()
	{
		
	}

	public String getAddress() {
		System.out.println(Address);
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	public String getAddress_Jibun() {
		return Address_Jibun;
	}

	public void setAddress_Jibun(String address_Jibun) {
		Address_Jibun = address_Jibun;
	}
	
	
}
