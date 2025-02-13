/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import java.io.BufferedReader;
import java.io.FileReader;
import java.util.Scanner;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
/**
 *
 * @author rober
 */
public class Clasificador_Archivo {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // El usuario ingresa la ruta
        System.out.print("Ingrese la ruta del archivo de texto: ");
        String archivo = scanner.nextLine();

        String linea = "";

     
        try (BufferedReader br = new BufferedReader(new FileReader(archivo))) {
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) {
                sb.append(line).append("\n");
            }
            linea = sb.toString();
        } catch (IOException e) {
            System.out.println("Error al leer el archivo: " + e.getMessage());
            return; //Sale del programa si hay error
        }
        
        int totalCaracteresConEspacios = linea.length();
        int totalCaracteresSinEspacios = linea.replaceAll("\\s", "").length();

        String[] lexemas = linea.split("\\s+");
        int totalLexemas = lexemas.length;

        int totalPalabras = 0;
        int totalNumeros = 0;
        int totalCombinadas = 0;

        Pattern palabraPattern = Pattern.compile("[a-zA-Z]+");
        Pattern numeroPattern = Pattern.compile("\\d+");
        Pattern combinadaPattern = Pattern.compile("[a-zA-Z]+\\d+|\\d+[a-zA-Z]+");

        for (String lexema : lexemas) {
            Matcher palabraMatcher = palabraPattern.matcher(lexema);
            Matcher numeroMatcher = numeroPattern.matcher(lexema);
            Matcher combinadaMatcher = combinadaPattern.matcher(lexema);

            if (palabraMatcher.matches()) {
                totalPalabras++;
            } else if (numeroMatcher.matches()) {
                totalNumeros++;
            } else if (combinadaMatcher.matches()) {
                totalCombinadas++;
            }
        }

        // Mostrar resultados
        System.out.println("\nResultados:");
        System.out.println("Total de caracteres (con espacios): " + totalCaracteresConEspacios);
        System.out.println("Total de caracteres (sin espacios): " + totalCaracteresSinEspacios);
        System.out.println("Total de lexemas: " + totalLexemas);
        System.out.println("Total de palabras: " + totalPalabras);
        System.out.println("Total de números: " + totalNumeros);
        System.out.println("Total de combinadas: " + totalCombinadas);

        scanner.close();
    }
}
