UNIT uPerfilEstudiantes;
INTERFACE
TYPE
	asignaturaEstrella=RECORD
		codAsig:integer;
		calificacionFinal:real;
	END;
	tListaPerfilEstudiantes = ^tPerfilEstudiantes;
	tPerfilEstudiantes = RECORD
		codEstudiante:integer;
		ultimoCurso:integer;
		numSeleccionEP:integer;
		NEP:real;
		entPersonal:array [1..5] OF integer;
		estrellas:array[1..4]OF asignaturaEstrella;
		siguiente:tListaPerfilEstudiantes;
	END;
IMPLEMENTATION
END.
