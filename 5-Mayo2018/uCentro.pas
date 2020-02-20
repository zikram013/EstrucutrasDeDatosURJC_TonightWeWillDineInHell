UNIT uCentro;
INTERFACE
USES uTitulacion;
TYPE
	tListaCentros = ^tCentro;
	tCentro = RECORD
		nombre:string;
		titulacion: tListaTitulacion;
		siguiente: tListaCentros;
	END;
IMPLEMENTATION
END.

