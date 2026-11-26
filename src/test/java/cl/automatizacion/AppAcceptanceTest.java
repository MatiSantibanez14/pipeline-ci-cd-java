
package cl.automatizacion;

import org.junit.jupiter.api.Test;
import java.io.ByteArrayOutputStream;
import java.io.PrintStream;

import static org.junit.jupiter.api.Assertions.assertEquals;

class AppAcceptanceTest {

    @Test
    void debeCumplirElComportamientoEsperadoDeLaAplicacion() {
        ByteArrayOutputStream salida = new ByteArrayOutputStream();
        PrintStream salidaOriginal = System.out;

        try {
            System.setOut(new PrintStream(salida));

            App.main(new String[]{});

            assertEquals(
                "Hello World!",
                salida.toString().trim(),
                "La aplicacion debe mostrar el mensaje esperado"
            );

        } finally {
            System.setOut(salidaOriginal);
        }
    }
}
