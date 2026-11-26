
package cl.automatizacion;

import org.junit.jupiter.api.Test;
import java.io.ByteArrayOutputStream;
import java.io.PrintStream;

import static org.junit.jupiter.api.Assertions.assertEquals;

class AppIT {

    @Test
    void debeEjecutarAplicacionYMostrarMensaje() {
        ByteArrayOutputStream salida = new ByteArrayOutputStream();
        PrintStream salidaOriginal = System.out;

        try {
            System.setOut(new PrintStream(salida));

            App.main(new String[]{});

            assertEquals("Hello World!", salida.toString().trim());

        } finally {
            System.setOut(salidaOriginal);
        }
    }
}
