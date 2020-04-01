UNIT uTarea;

INTERFACE
	USES uPrioridad;

	TYPE
		TTarea = RECORD
			nombre: string;
			prioridad: TPrioridad;
		END;

	(* Constructoras Generadoras *)
	PROCEDURE CrearTarea(VAR tarea: TTarea; nombre: string; prioridad: TPrioridad);
	PROCEDURE CopiarTarea(VAR destino: TTarea; origen: TTarea);

	(* Observadoras Selectoras *)
	PROCEDURE Nombre(VAR nombre: string; tarea: TTarea);
	FUNCTION Prioridad(tarea: TTarea): TPrioridad;

	(* Observadoras NO Selectoras *)
	FUNCTION SonTareasIguales(tarea1: TTarea; tarea2: TTarea): boolean;
	PROCEDURE MostrarTarea(tarea: TTarea);
IMPLEMENTATION
	(* Constructoras Generadoras *)
	PROCEDURE CrearTarea(VAR tarea: TTarea; nombre: string; prioridad: TPrioridad);
	BEGIN
		tarea.nombre := nombre;
		CopiarPrioridad(tarea.prioridad, prioridad);
	END;

	PROCEDURE CopiarTarea(VAR destino: TTarea; origen: TTarea);
	BEGIN
		destino.nombre := origen.nombre;
		CopiarPrioridad(destino.prioridad, origen.prioridad);
	END;

	(* Observadoras Selectoras *)
	PROCEDURE Nombre(VAR nombre: string; tarea: TTarea);
	BEGIN
		nombre := tarea.nombre;
	END;

	FUNCTION Prioridad(tarea: TTarea): TPrioridad;
	BEGIN
		Prioridad := tarea.prioridad;
	END;

	(* Observadoras NO Selectoras *)
	FUNCTION SonTareasIguales(tarea1: TTarea; tarea2: TTarea): boolean;
	BEGIN
		SonTareasIguales := tarea1.nombre = tarea2.nombre; {La prioridad es indiferente}
	END;

	PROCEDURE MostrarTarea(tarea: TTarea);
	BEGIN
		write(tarea.nombre);
		write('(');
		MostrarPrioridad(tarea.prioridad);
		write(')');
	END;
END.
