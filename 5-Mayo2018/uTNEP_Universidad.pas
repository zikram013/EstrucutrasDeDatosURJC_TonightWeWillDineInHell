UNIT uTNEP_Universidad;
INTERFACE
USES uCentro, uTitulacion;
TYPE
TNEP_UNIVERSIDAD = tListaCentros;

PROCEDURE InsertarAlumno (urjc:TNEP_UNIVERSIDAD; codTit:integer; codEst:integer);
IMPLEMENTATION

PROCEDURE InsertarAlumno (urjc:TNEP_UNIVERSIDAD; codTit:integer; codEst:integer);
VAR
	auxTit:tTitulacion;
BEGIN
	WHILE(urjc<>NIL) DO	
		BEGIN
			auxTit:= urjc^.titulacion;		
			WHILE(auxTit<>NIL)DO	
				BEGIN
					IF(codTit = auxTit^.tit)THEN 
						construirAlumno(auxTit^.estudiante); 
						//asignar 0.25
						//falta avanzar etc
END;
END.
