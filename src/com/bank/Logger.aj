package com.bank;

import java.io.FileWriter;
import java.util.Calendar;
import java.util.GregorianCalendar;

public aspect Logger {
	
	 Calendar cal = new GregorianCalendar();
		
		pointcut success() : call(* moneyMake*(..)); 
	    after() : success() {   	
	    	try {
	    	FileWriter fw=new FileWriter("C:\\Users\\Hp\\Desktop\\COMP\\Diseño de software\\Taller2\\Taller-AOP\\src\\com\\bank\\log.txt", true); 
	    	fw.write("Deposito:  ");
	        fw.write(cal.get(Calendar.DAY_OF_MONTH)+"/"+cal.get(Calendar.MONTH)+"/"+cal.get(Calendar.YEAR)+"\n");

	        fw.close();    
	       }catch(Exception e){System.out.println(e);}    
	       System.out.println("Success...");   
	    }
	    
	    pointcut success2() :call(* moneyWith*(..)) ; 
	    after() : success2(){
	    	try {
	       FileWriter fw=new FileWriter("C:\\Users\\Hp\\Desktop\\COMP\\Diseño de software\\Taller2\\Taller-AOP\\src\\com\\bank\\log.txt", true); 
	    	
	       fw.write("Retiro:  ");
	       fw.write(cal.get(Calendar.DAY_OF_MONTH)+"/"+cal.get(Calendar.MONTH)+"/"+cal.get(Calendar.YEAR)+"\n");
	        
	       fw.close();
	       }catch(Exception e){System.out.println(e);}    
	       System.out.println("Success...");   
	    	
	    }

}
