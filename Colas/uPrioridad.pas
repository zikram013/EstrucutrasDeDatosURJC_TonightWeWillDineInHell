UNIT uPrioridad;

INTERFACE
	CONST
		MAX_PRIORIDAD = 5;
		MIN_PRIORIDAD = 1;

	TYPE
		TPrioridad = MIN_PRIORIDAD..MAX_PRIORIDAD;

	PROCEDURE CopiarPrioridad(VAR destino: TPrioridad; origen: TPrioridad);
	FUNCTION EsMenorOIgualPrioridad(prioridad1: TPrioridad; prioridad2: TPrioridad): boolean;
	FUNCTION EsIgualPrioridad(prioridad1: TPrioridad; prioridad2: TPrioridad): boolean;
	FUNCTION EsMayorPrioridad(prioridad1: TPrioridad; prioridad2: TPrioridad): boolean;
	PROCEDURE MostrarPrioridad(prioridad: TPrioridad);
IMPLEMENTATION
	PROCEDURE CopiarPrioridad(VAR destino: TPrioridad; origen: TPrioridad);
	BEGIN
		destino := origen;
	END;

	FUNCTION EsMenorOIgualPrioridad(prioridad1: TPrioridad; prioridad2: TPrioridad): boolean;
	BEGIN
		EsMenorOIgualPrioridad := prioridad1 <= prioridad2;
	END;

	FUNCTION EsIgualPrioridad(prioridad1: TPrioridad; prioridad2: TPrioridad): boolean;
	BEGIN
		EsIgualPrioridad := prioridad1 = prioridad2;
	END;

	FUNCTION EsMayorPrioridad(prioridad1: TPrioridad; prioridad2: TPrioridad): boolean;
	BEGIN
		EsMayorPrioridad := prioridad1 > prioridad2;
	END;

	PROCEDURE MostrarPrioridad(prioridad: TPrioridad);
	BEGIN
		write(prioridad);
	END;
END.
