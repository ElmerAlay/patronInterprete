package principal;

import com.compi2.usac.analizadores.Scanner;
import com.compi2.usac.analizadores.Parser;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.StringReader;

/**
 * @author Elmer Alay
 * @version 1.0
 * @since 5-12-2018
 */
public class main {
    public static void main(String args[]){
        try{
           String lectura = lecturaArchivo("src\\com\\compi2\\usac\\archivos\\ejemplo.txt");
           ejecutar(lectura);
       }catch(Exception ex){
           
       }
    }
    
    public static String  lecturaArchivo(String archivo) throws FileNotFoundException, IOException{
        String cadena;
        String auxcadena = "";
        FileReader f = new FileReader(archivo);
        BufferedReader b = new BufferedReader(f);
        
        while((cadena = b.readLine()) != null){
            auxcadena = auxcadena + cadena+ "\n";
        }
        
        return auxcadena;
    }
    
    public static void ejecutar(String entrada){
        try {   
        Scanner lexer = new Scanner(new StringReader(entrada));
        Parser parser = new Parser(lexer);
        parser.parse();
        
        } catch (Exception e) {
            System.out.println("Error de tipo: " + e.getMessage());
        }
    }
}
