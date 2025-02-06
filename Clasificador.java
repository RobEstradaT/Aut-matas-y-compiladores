/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import java.io.PrintStream;
import java.util.Scanner;

public class Clasificador {
    public static void main(String[] args) throws Exception {
        // Configurar la salida de la consola en UTF-8
        System.setOut(new PrintStream(System.out, true, "UTF-8"));
        Scanner scanner = new Scanner(System.in, "UTF-8");

        System.out.println("****Clasificador de cadenas****");
        System.out.println("Escriba 'salir' para terminar");

        while (true) {
            System.out.print("\nIngrese las cadenas de caracteres: ");
            String entrada = scanner.nextLine();

            // Salir si el usuario escribe "salir"
            if (entrada.equalsIgnoreCase("salir")) {
                System.out.println("Fin del programa. Gracias :)");
                break;
            }

            // Dividir la entrada en palabras separadas por espacios
            String[] palabras = entrada.split("\\s+"); 

            int countPalabras = 0, countEnteros = 0, countCompuestas = 0;

            // Recorrer cada palabra y clasificarla
            for (String palabra : palabras) {
                String tipo = clasificarCadena(palabra);

                switch (tipo) {
                    case "PALABRA":
                        countPalabras++;
                        break;
                    case "NÚMERO ENTERO":
                        countEnteros++;
                        break;
                    case "COMPUESTA":
                        countCompuestas++;
                        break;
                }
            }
            System.out.println(countEnteros + " número entero, " + countPalabras + " palabra, " + countCompuestas + " compuesta");
        }

        scanner.close();
    }

    // Método para clasificar una cadena
    public static String clasificarCadena(String cadena) {
        boolean tieneLetras = false;
        boolean tieneNumeros = false;

        if (cadena.isEmpty()) {
            return "VACÍA";
        }

        for (int i = 0; i < cadena.length(); i++) {
            char c = cadena.charAt(i);

            if (Character.isLetter(c)) {
                tieneLetras = true;
            } else if (Character.isDigit(c)) {
                tieneNumeros = true;
            } else {
                return "COMPUESTA"; // Contiene otros caracteres (símbolos, espacios, etc.)
            }
        }

        if (tieneLetras && !tieneNumeros) {
            return "PALABRA";
        } else if (tieneNumeros && !tieneLetras) {
            return "NÚMERO ENTERO";
        } else {
            return "COMPUESTA";
        }
    }
}
