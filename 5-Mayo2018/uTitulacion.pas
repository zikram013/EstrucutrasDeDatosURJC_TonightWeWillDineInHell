UNIT uTitulacion;
INTERFACE
USES uPerfilEstudiantes;
TYPE
	tListaTitulacion = ^tTitulacion;
	tTitulacion = RECORD
		codigoTit: integer;
		estudiandes:tListaPerfilEstudiantes;
		siguiente:tListaTitulacion;
	END;
	
IMPLEMENTATION
END.
