import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;

public aspect Logger {
    Calendar cal = Calendar.getInstance();
    //Aspecto: Deben hacer los puntos de cortes (pointcut) para crear un log con los tipos de transacciones realizadas.
    pointcut success() : call(* moneyMake*(..) );
    after() : success() {
    	escribir("    DEPOSITO\n",cal);
    }
    pointcut success2(): call(* moneyWithd*(..) );
    after() : success2(){
    	escribir("    RETIRO\n",cal);
    }
    
    public static void escribir(String tipo,Calendar cal) {
    	File file = new File("log.txt");
    	FileWriter archivo;
		try {
			archivo = new FileWriter(file,true);
			archivo.write(cal.getTime()+tipo);
			archivo.close();
		} catch (IOException e) {
			System.out.println(e);
		}
    }
}