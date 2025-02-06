/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import java.util.Scanner;

public class Clasificador {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String entrada;

        System.out.println("***** Clasificador de cadenas *****");
        System.out.println("Escribe 'salir' para terminar");

        while (true) {
            System.out.print("\nIngresa una cadena: ");
            entrada = scanner.nextLine();

            // Sale de bucle si se escribe "salir"
            if (entrada.equalsIgnoreCase("salir")) {
                System.out.println("Fin del programa. Gracias :)");
                break;
            }

            // Clasificamos la entrada y mostramos el resultado
            String tipo = clasificarCadena(entrada);
            System.out.println("La cadena es: " + tipo);
        }

        scanner.close();
    }

    public static String clasificarCadena(String cadena) {
        boolean tieneLetras = false;
        boolean tieneNumeros = false;

        //Por si es cadena vacía
        if (cadena.isEmpty()) {
            return "VACIA";
        }

        // Recorre la cadena caracter por caracter
        for (int i = 0; i < cadena.length(); i++) {
            char c = cadena.charAt(i); //es un método de la clase String en Java que se 
            //usa para obtener un carácter en una posición específica dentro de una cadena.

            if (Character.isLetter(c)) {
                tieneLetras = true;
            } else if (Character.isDigit(c)) {
                tieneNumeros = true;
            } else {
                return "COMPUESTA"; // Si tiene otro carácter, ya es compuesta
            }
        }

        // Clasifiación según las banderas
        if (tieneLetras && !tieneNumeros) {
            return "PALABRA";
        } else if (tieneNumeros && !tieneLetras) {
            return "NUMERO ENTERO";
        } else {
            return "COMPUESTA";
        }
    }
}
