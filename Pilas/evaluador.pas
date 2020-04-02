PROGRAM evaluador;

USES uPilaCaracteres, uPilaReales;

FUNCTION LeerNumStr(cadena: string; VAR pos: integer): string;
VAR
	numStr: string;
BEGIN
	{
	La sintaxis "['0'..'9']" sirve para declarar un conjunto con los
	elementos que van del '0' al '9'. El operador "IN" sirve para comprobar
	si un determinado elemento pertenece a un conjunto
	}

	{En primer lugar extraemos la parte entera del número, si es real, o el número entero en caso de ser entero}
	numStr := '';
	WHILE (pos <= length(cadena)) AND (cadena[pos] IN ['0'..'9']) DO BEGIN
		numStr := numStr + cadena[pos];

		pos := pos + 1;
	END;

	{En segundo lugar, al ser un número real, extraemos la parte decimal}
	IF (pos <= length(cadena)) AND (cadena[pos] = '.') THEN BEGIN
		numStr := numStr + '.';

		pos := pos + 1;
		WHILE (pos <= length(cadena)) AND (cadena[pos] IN ['0'..'9']) DO BEGIN
			numStr := numStr + cadena[pos];

			pos := pos + 1;
		END;
	END;

	LeerNumStr := numStr;
END;

FUNCTION NumStr2Real(str: string): real;
	FUNCTION Car2Num(car: char): integer;
	BEGIN
		Car2Num := ord(car) - ord('0');
	END;
VAR
	num: real;
	pos: integer;
	divisor: integer;
BEGIN
	{En primer lugar extraemos la parte entera del número, si es real, o el número entero en caso de ser entero}
	num := 0;
	pos := 1;
	WHILE (pos <= length(str)) AND (str[pos] IN ['0'..'9']) DO BEGIN
		num := num * 10 + Car2Num(str[pos]);

		pos := pos + 1;
	END;

	IF (pos <= length(str)) AND (str[pos] = '.') THEN BEGIN
		{En segundo lugar, al ser un número real, extraemos la parte decimal}
		pos := pos + 1;
		divisor := 10;
		WHILE (pos <= length(str)) AND (str[pos] IN ['0'..'9']) DO BEGIN
			num := num + (Car2Num(str[pos]) / divisor);
			divisor := divisor * 10;

			pos := pos + 1;
		END;
	END;

	NumStr2Real := num;
END;

{
Ejemplo: (15 * 2.5) + 7 - 4.75 / (2 ^ 7)

La notación anterior es "infija" ya que el operador se encuentra
entre dos operandos. La notación "postfija" implica situar el operador
después de los dos operandos que participan en la operación. La expresión
anterior en "postfija" sería:
15 2.5 * 7 + 4.75 2 7 ^ / -

* Nota: Los espacios en "postfija" son indispensables para que podamos separar
* unos números de otros, como por ejemplo entre el 15 y 2.5
}
PROCEDURE Infija2Postfija(infija: string; VAR postfija: string);
	FUNCTION PrioridadPila(operador: char): integer;
	BEGIN
		CASE operador OF
			'(':
				PrioridadPila := 0;
			'+', '-':
				PrioridadPila := 1;
			'*', '/':
				PrioridadPila := 2;
			'^':
				PrioridadPila := 3;
		END;
	END;

	FUNCTION PrioridadExpr(operador: char): integer;
	BEGIN
		CASE operador OF
			'(':
				PrioridadExpr := 5; {El paréntesis de apertura se apila siempre por encima de lo que haya en la pila de operadores}
			'+', '-':
				PrioridadExpr := 1;
			'*', '/':
				PrioridadExpr := 2;
			'^':
				PrioridadExpr := 4; {El operador de la potencia se apila siempre por encima de lo que haya en la pila de operadores, incluso de otro operador '^'}
		END;
	END;

VAR
	operadores: uPilaCaracteres.TPila;
	pos: integer;
	sacarOperador: boolean;
	operador: char;
BEGIN
	postfija := ''; {Inicializamos "postfija" a la cadena vacía}

	uPilaCaracteres.CrearPilaVacia(operadores);
	pos := 1;
	WHILE pos <= length(infija) DO BEGIN
		CASE infija[pos] OF
			'0'..'9':
				postfija := postfija + LeerNumStr(infija, pos) + ' ';
			'(', '+', '-', '*', '/', '^':
			BEGIN
				{
				Debemos sacar operadores de la pila de operadores hasta que
				la prioridad del operador, de la cima de la pila, sea inferior
				a la del operador a insertar. Para evaluar la prioridad debemos
				tener en cuenta la del operador dentro de la pila y
				en la expresión matemática
				}
				sacarOperador := TRUE;
				WHILE (sacarOperador) AND (NOT uPilaCaracteres.EsPilaVacia(operadores)) DO BEGIN
					uPilaCaracteres.Cima(operadores,operador);

					sacarOperador := PrioridadPila(operador) >= PrioridadExpr(infija[pos]);
					IF sacarOperador THEN BEGIN
						uPilaCaracteres.Desapilar(operadores);

						postfija := postfija + operador + ' ';
					END;
				END;
				uPilaCaracteres.Apilar(operadores,infija[pos]); {Una vez la pila está vacía, apilamos el nuevo operador habiendo desapilado previamente todos los que tienen una prioridad >= o, de inicio, estando la pila vacía}
				pos := pos + 1;
			END;
			')':
			BEGIN
				sacarOperador := TRUE;
				WHILE (sacarOperador) AND (NOT uPilaCaracteres.EsPilaVacia(operadores)) DO BEGIN
					uPilaCaracteres.Cima(operadores, operador);

					sacarOperador := operador <> '(';
					IF sacarOperador THEN BEGIN
						uPilaCaracteres.Desapilar(operadores);

						postfija := postfija + operador + ' ';
					END;
				END;
				uPilaCaracteres.Desapilar(operadores); {Sacamos de la pila el paréntesis de apertura '('}
				pos := pos + 1;
			END;
			' ':
				pos := pos + 1;
		END;
	END;

	{
	Al salir del bucle pueden quedar operadores aún en la pila. Solo
	debemos de sacarlos e incorporarlos en la expresión "postfija". Nunca
	habrá un paréntesis, salvo que la expresión estuviese mal formada
	}
	WHILE NOT uPilaCaracteres.EsPilaVacia(operadores) DO BEGIN
		uPilaCaracteres.Cima(operadores, operador);
		uPilaCaracteres.Desapilar(operadores);

		postfija := postfija + operador + ' ';
	END;
END;

{
El propósito es devolver el resultado de la expresión "postfija". Para ello,
cada vez que nos encontremos un número lo debemos apilar, como valor numérico,
en la pila "reales". Al encontrarnos un operador debemos sacar los dos primeros
números de la pila, calcular su resultado y volver a insertar el resultado en la
pila. Al finalizar quedará en la pila el resultado de la expresión
}
FUNCTION EvaluarPostfija(postfija: string): real;
	FUNCTION ResultadoOperacion(operando1: real; operador: char; operando2: real): real;
	BEGIN
		CASE operador OF
			'+':
				ResultadoOperacion := operando1 + operando2;
			'-':
				ResultadoOperacion := operando1 - operando2;
			'*':
				ResultadoOperacion := operando1 * operando2;
			'/':
				ResultadoOperacion := operando1 / operando2;
			'^':
				ResultadoOperacion := Exp(operando2 * Ln(operando1));
		END;
	END;

VAR
	reales: uPilaReales.TPila;
	pos: integer;
	operando1, operando2, num: real;
BEGIN
	uPilaReales.CrearPilaVacia(reales);

	pos := 1;
	WHILE pos <= length(postfija) DO BEGIN
		CASE postfija[pos] OF
			'0'..'9':
			BEGIN
				num := NumStr2Real(LeerNumStr(postfija, pos));
				uPilaReales.Apilar(reales,num);
			END;
			'+', '-', '*', '/', '^':
			BEGIN
				uPilaReales.Cima( reales,operando2); {Primero, más arriba, está el segundo operando}
				uPilaReales.Desapilar(reales);
				uPilaReales.Cima( reales,operando1); {Segundo, está el primer operando}
				uPilaReales.Desapilar(reales);

				uPilaReales.Apilar(reales, ResultadoOperacion(operando1, postfija[pos], operando2));
				pos := pos + 1;
			END;
			' ':
				pos := pos + 1;
		END;
	END;

	uPilaReales.Cima(reales,num);
	uPilaReales.Desapilar(reales); {Solo tenemos un elemento, el resultado}

	EvaluarPostfija := num;
END;

VAR
	infija, postfija: string;
BEGIN
	{
	infija := '(15 * 2.5) + 7 - 4.75 / (2 ^ 7)';

	writeln('Infija: ', infija);

	Infija2Postfija(infija, postfija);
	writeln('Postfija: ', postfija);
	}
	writeln('Introduzca una expresión infija: ');
	readln(infija);

	Infija2Postfija(infija, postfija);
	writeln('Postfija: ', postfija);
	writeln('Resultado: ', EvaluarPostfija(postfija):0:2);  {Mostramos el resultado con dos decimales para que no se vea tan "feo" por pantalla}
END.

