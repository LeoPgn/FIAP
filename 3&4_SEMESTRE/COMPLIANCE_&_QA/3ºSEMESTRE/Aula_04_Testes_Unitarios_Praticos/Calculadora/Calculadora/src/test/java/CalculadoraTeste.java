import Calculadora.Calculadora;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class CalculadoraTeste {

    private Calculadora calc;

    @BeforeEach
    public void inicializar(){
        this.calc = new Calculadora();
    }

    @Test
    void testeSomarDoisInteiros(){
        //Calculadora calc = new Calculadora();

        int a = 3;
        int b = 2;
        int resultado = calc.somar(a, b);

        assertEquals(a+b, resultado);
    }

    @Test
    void testeSubtrairInteiros(){
        //Calculadora calc = new Calculadora();

        int a = 3;
        int b = 5;
        int resultado = calc.subtrair(a, b);

        assertEquals(a-b,resultado);
    }

    @Test
    void testeMultiplicarInteiros(){
        //Calculadora calc = new Calculadora();

        int a = 3;
        int b = 3;
        int resultado = calc.multiplicar(a, b);

        assertEquals(a*b, resultado);
    }

    @Test
    void testDividirInteiros(){
        //Calculadora calc = new Calculadora();

        int a = 3;
        int b = 3;
        int resultado = calc.dividir(a, b);

        assertEquals(a/b, resultado);
    }

}
