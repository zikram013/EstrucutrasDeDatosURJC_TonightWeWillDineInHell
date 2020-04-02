UNIT uBolsaDinamica;

INTERFACE
	USES uElementoBolsa;

	TYPE
        TBolsa = ^TNodo;
        TNodo = RECORD
			elemento: TElemento;
			repeticiones: integer;
			siguiente: TBolsa;
		END;

	(* Constructoras Generadoras *)
   	PROCEDURE CrearBolsaVacia(VAR bolsa: TBolsa);
   	PROCEDURE Poner(VAR bolsa: TBolsa; elemento: TElemento);

   	(* Observadoras Selectoras *)
   	PROCEDURE Elegir(bolsa: TBolsa; VAR elemento: TElemento);

   	(* Observadoras NO Selectoras *)
   	FUNCTION EsBolsaVacia(bolsa: TBolsa): boolean;
   	FUNCTION EsSubBolsa(bolsaA: TBolsa; bolsaB: TBolsa): boolean;
   	FUNCTION Pertenece(bolsa: TBolsa; elemento: TElemento): boolean;
   	FUNCTION Cardinal(bolsa: TBolsa): integer;
   	FUNCTION Multiplicidad(bolsa: TBolsa; elemento: TElemento): integer;
	FUNCTION SonBolsasIguales(bolsaA, bolsaB: TBolsa): boolean;
	PROCEDURE MostrarBolsa(bolsa: TBolsa);

   	(* Constructoras NO Generadoras *)
   	PROCEDURE Quitar(VAR bolsa: TBolsa; elemento: TElemento);
	PROCEDURE DestruirBolsa(VAR bolsa: TBolsa);
IMPLEMENTATION
	(* Constructoras Generadoras *)
   	PROCEDURE CrearBolsaVacia(VAR bolsa: TBolsa);
   	BEGIN
   		bolsa := NIL;
   	END;

   	PROCEDURE Poner(VAR bolsa: TBolsa; elemento: TElemento);
	VAR
		encontrado: boolean;
		pAux, pNuevo: TBolsa;
   	BEGIN
		encontrado := FALSE;
		pAux := bolsa;
		WHILE (NOT encontrado) AND (pAux <> NIL) DO BEGIN
			encontrado := SonElementosIguales(elemento, pAux^.elemento);
			IF (encontrado) THEN
				pAux^.repeticiones := pAux^.repeticiones + 1
			ELSE
				pAux := pAux^.siguiente;
		END;

		IF NOT encontrado THEN BEGIN
			new(pNuevo);
			CopiarElemento(pNuevo^.elemento, elemento);
			pNuevo^.repeticiones := 1;
			pNuevo^.siguiente := bolsa;
			bolsa := pNuevo;
		END;
   	END;

   	(* Observadoras Selectoras *)
   	PROCEDURE Elegir(bolsa: TBolsa; VAR elemento: TElemento);
   	VAR
		pos, i: integer;
		pAux: TBolsa;
   	BEGIN
		Randomize;

   		IF NOT EsBolsaVacia(bolsa) THEN BEGIN
			pos := Random(Cardinal(bolsa)) + 1;

			i := 1;
			pAux := bolsa;
			WHILE (i <> pos) AND (pAux <> NIL) DO BEGIN
				i := i + 1;
				pAux := pAux^.siguiente;
			END;

			CopiarElemento(elemento, pAux^.elemento);
   		END;
   	END;

   	(* Observadoras NO Selectoras *)
   	FUNCTION EsBolsaVacia(bolsa: TBolsa): boolean;
  	BEGIN
  		EsBolsaVacia := bolsa = NIL;
  	END;

	FUNCTION EsSubBolsa(bolsaA: TBolsa; bolsaB: TBolsa): boolean;
   	VAR
		es: boolean;
		pAux: TBolsa;
   	BEGIN
   		es := TRUE;
   		pAux := bolsaA;
   		WHILE (es) AND (pAux <> NIL) DO BEGIN
			es := Multiplicidad(bolsaB, pAux^.elemento) >= pAux^.repeticiones;
			IF es THEN
				pAux := pAux^.siguiente;
   		END;

   		EsSubBolsa := (es) AND (pAux = NIL);
   	END;

   	FUNCTION Pertenece(bolsa: TBolsa; elemento: TElemento): boolean;
   	VAR
		encontrado: boolean;
		pAux: TBolsa;
   	BEGIN
		encontrado := FALSE;
		pAux := bolsa;
		WHILE (NOT encontrado) AND (pAux <> NIL) DO BEGIN
			encontrado := SonElementosIguales(elemento, pAux^.elemento);
			IF NOT encontrado THEN
				pAux := pAux^.siguiente;
		END;

		Pertenece := encontrado;
   	END;

   	FUNCTION Cardinal(bolsa: TBolsa): integer;
   	VAR
		contador: integer;
		pAux: TBolsa;
   	BEGIN
   		contador := 0;
   		pAux := bolsa;
   		WHILE pAux <> NIL DO BEGIN
			contador := contador + 1;

			pAux := pAux^.siguiente;
   		END;

   		Cardinal := contador;
   	END;

   	FUNCTION Multiplicidad(bolsa: TBolsa; elemento: TElemento): integer;
	VAR
		contador: integer;
		encontrado: boolean;
		pAux: TBolsa;
	BEGIN
		contador := 0;

		encontrado := FALSE;
		pAux := bolsa;
		WHILE (NOT encontrado) AND (pAux <> NIL) DO BEGIN
			encontrado := SonElementosIguales(elemento, pAux^.elemento);
			IF encontrado THEN
				contador := pAux^.repeticiones
			ELSE
				pAux := pAux^.siguiente;
		END;

		Multiplicidad := contador;
	END;

	FUNCTION SonBolsasIguales(bolsaA, bolsaB: TBolsa): boolean;
	VAR
		sonIguales: boolean;
		pAux: TBolsa;
	BEGIN
		IF Cardinal(bolsaA) = Cardinal(bolsaB) THEN BEGIN
			sonIguales := TRUE;
			pAux := bolsaA;
			WHILE (sonIguales) AND (pAux <> NIL) DO BEGIN
				sonIguales := pAux^.repeticiones = Multiplicidad(bolsaB, pAux^.elemento);
				pAux := pAux^.siguiente;
			END;
			SonBolsasIguales := (sonIguales) AND (pAux = NIL);
		END
		ELSE
			SonBolsasIguales := FALSE;
	END;

	PROCEDURE MostrarBolsa(bolsa: TBolsa);
	VAR
		pAux: TBolsa;
	BEGIN
		write('[');
		IF NOT EsBolsaVacia(bolsa) THEN BEGIN
			pAux := bolsa;
			WHILE pAux^.siguiente <> NIL DO BEGIN
				MostrarElemento(pAux^.elemento);
				write('(', pAux^.repeticiones, '), ');

				pAux := pAux^.siguiente;
			END;
			MostrarElemento(pAux^.elemento);
			write('(', pAux^.repeticiones, ')');
		END;
		writeln(']');
	END;

   	{ CONSTRUCTORAS NO GENERADORAS }
   	PROCEDURE Quitar(VAR bolsa: TBolsa; elemento: TElemento);
   	VAR
		encontrado: boolean;
		pAnterior, pExplorador: TBolsa;
   	BEGIN
		encontrado := FALSE;
		pAnterior := NIL;
		pExplorador := bolsa;
		WHILE (NOT encontrado) AND (pExplorador <> NIL) DO BEGIN
			encontrado := SonElementosIguales(elemento, pExplorador^.elemento);
			IF NOT encontrado THEN BEGIN
				pAnterior := pExplorador;
				pExplorador := pExplorador^.siguiente;
			END;
		END;

		IF encontrado THEN
		BEGIN
			IF pAnterior = NIL THEN
				bolsa := bolsa^.siguiente
			ELSE
				pAnterior^.siguiente := pExplorador^.siguiente;

			dispose(pExplorador);
		END;
   	END;

	PROCEDURE DestruirBolsa(VAR bolsa: TBolsa);
	VAR
		pAux: TBolsa;
	BEGIN
		WHILE NOT EsBolsaVacia(bolsa) DO BEGIN
			pAux := bolsa;
			bolsa := bolsa^.siguiente;
			dispose(pAux);
		END;
	END;
END.
