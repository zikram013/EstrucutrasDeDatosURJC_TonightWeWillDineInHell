unit uColaPrioridad;
interface
	uses uPrioridad,uTarea;
	type
		TPuntero=^TNodo;
		TNodo=record
			anterior:TPuntero;
			tarea:TTarea;
			siguiente:TPuntero;
		end;
		TColaPrioridad=TPuntero;

procedure CrearColaVacia(var cola:TColaPrioridad);
procedure Insertar(var cola:TColaPrioridad; tarea:TTarea);
procedure PrimeroCola (var tarea:TTarea;cola:TColaPrioridad);
procedure Eliminar(var cola:TcolaPrioridad);
function EsColaVacia(cola:TColaPrioridad):boolean;
function SonColasIguales(cola1,cola2:TColaPrioridad):boolean;
procedure MostrarCola(cola:TcolaPrioridad);
procedure Copiarcola(var destino:TColaPrioridad;origen:TColaPrioridad);
procedure DestruirCola(var cola:TColaPrioridad);

implementation

procedure CrearColaVacia(var cola:TColaPrioridad);
begin
	cola:=nil;
end;

procedure Insertar(var cola:TColaPrioridad;tarea:TTarea);
var
	pAnterior,pExplorador:TPuntero;
	pNuevo:TPuntero;
begin
	new(pNuevo);
	CopiarTarea(pNuevo^.tarea,tarea);
	if(EsColaVacia(cola))then
		begin
			pNuevo^.anterior:=pNuevo;
			pNuevo^.siguiente:=pNuevo;
			cola:=pNuevo;
		end
	else
		begin
			pAnterior:=nil;
			pExplorador:=cola;
			while(EsMenorOIgualPrioridad(prioridad(tarea),Prioridad(pExplorador^.tarea))or (pExplorador=cola))do
				begin
					if(EsMayorPrioridad(Prioridad(tarea),Prioridad(pExplorador^.tarea))then
						begin
							pAnterior:=pExplorador;
							pExplorador:=pExplorador^.anterior;
						end;
				end;
			pNuevo^.anterior:=pExplorador;
			if(pAnterior=nil)then
				begin
					pNuevo^siguiente:=cola^.siguiente;
					cola^.siguiente^.anterior:=pNuevo;
					cola^.siguiente:=pNuevo;
					cola:=pNuevo;
				end
			else
				begin
					pNuevo^.siguiente:=pAnterior;
					pExplorador^.siguiente:=pNuevo;
					pAnterior^.anterior:=pNuevo;
				end;
		end;
end;

procedure PrimeroCola(var tarea:TTarea;cola:TColaPrioridad);
begin
	if (not(EsColaVacia(cola)))then
		begin
			CopiarTarea(tarea,cola^.siguiente^.tarea);
		end;
end;

procedure Eliminar(var cola:TColaPrioridad);
var
	pAux:TPuntero;
begin
	if (not(EscolaVacia(cola)))then
		begin
			pAux:=cola^.siguiente;
			if(pAux=cola)then
				begin
					cola:=nil;
				end
			else
				begin
					pAux:=cola^.siguiente;
					pAux^.siguiente^.anterior:=pAux^.anterior;
					cola^.siguiente:=pAux^.siguiente;
				end;
			dispose(pAux);
		end;
end;

function EsColaVacia(cola: TColaPrioridad): boolean;
	begin
		EsColaVacia := cola = nil;
	end;
PROCEDURE CopiarCola(VAR destino: TColaPrioridad; origen: TColaPrioridad);
	VAR
		pAux: TPuntero;
	BEGIN
		CrearColaVacia(destino);

		IF NOT EsColaVacia(origen) THEN BEGIN
			pAux := origen^.siguiente;
			REPEAT
				Insertar(destino, pAux^.tarea);

				pAux := pAux^.siguiente;
			UNTIL pAux = origen^.siguiente;
		END;
	END;

	PROCEDURE DestruirCola(VAR cola: TColaPrioridad);
	BEGIN
		WHILE NOT EsColaVacia(cola) DO
			Eliminar(cola);
	END;
