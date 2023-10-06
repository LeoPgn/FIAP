import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import Calculadora.Calculadora;

import javax.swing.*;

import static org.junit.jupiter.api.Assertions.*;

public class CalculadoraTeste {
	
	private Calculadora calc;

	@BeforeEach
	public void inicializar() {
		this.calc = new Calculadora();
	}
	
	@Test
	void testSomar() {
		
		int a = 3;
		int b = 2;
		int resultado = calc.somar(a, b);
		
		assertEquals(a+b, resultado);
	}

	@Test
	void testSubtrair() {
		
		//Calculadora calc = new Calculadora();
		
		int a = 3;
		int b = 2;
		int resultado = calc.subtrair(a, b);
		
		assertEquals(a-b, resultado);
	}
	
	@Test
	void testMultiplicar() {
		
		//Calculadora calc = new Calculadora();
		
		int a = 3;
		int b = 2;
		int resultado = calc.multiplicar(a, b);
		
		assertEquals(a*b, resultado);
	}
	
	@Test
	void testDividir() {
		
		//Calculadora calc = new Calculadora();
		
		int a = 3;
		int b = 2;
		int resultado = calc.dividir(a, b);
		
		assertEquals(a/b, resultado);
	}

	@Test
	void testeDeveRetornarExceptionQuandoDividirPorZero(){

		int a = 5;
		int b = 1;

		try{
			calc.dividir(a, b);
			fail("TESTE FALHOU: Não retornou Exception");
		} catch (Exception e){
			assertEquals(ArithmeticException.class, e.getClass());
		}
	}

	@Test
	void testeDeveRetornarExceptionUsandoLambda(){
		int a = 5;
		int b = 0;

		assertThrows(ArithmeticException.class, () -> calc.dividir(a, b));
	}

	@Test
	void mediaReturnDoisNumeros(){
		int a = 6;
		int b = 4;
		float resultado = calc.mediaDoisNumeros(a, b);

		assertEquals(5, resultado);
	}

	@Test
	void mediaValoresIndeterminados(){
		int[] numeros = {1, 2, 3, 4, 5};

		float resultado = calc.mediaVariosNumeros(numeros);
		assertEquals(15/5, resultado);
	}
	
}
