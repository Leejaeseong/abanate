package com.abanate.test;

public class Test {
	
	public static void main(String[] args) {

		/*
		 try {
		 	System.out.println(SecureUtil.sha256("test2"));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		*/
		
		/*
		String str = "223.123";		
		System.out.println( str.indexOf(".") == -1 ? str : str.substring(0, str.indexOf( "." ) ) );
		*/
		
		//System.out.println( rValue() );
		
		/*
		String a = "2020-02-01";
		System.out.println( a.replaceAll( "\\.", "" ).replaceAll( "-", "" ) );
		*/
		
		//System.out.println( CmStor.SavTp.C + ", " + CmStor.SavTp.C.toString().equals( "C" ) );
		
		//System.out.println( System.getProperty("os.name").toLowerCase() );
		
		System.out.println( "k.123".substring( 2 ) );
		
	}
	
	public static String rValue() {
		String a = "aaa";
		String b = "bbb";
		return a + b!=null?"ccc":"ddd";
	}

	

}