unit uPilaReales;
interface

	uses uElementoReal;
	type
		TPila=^TNodo;
		TNodo=record
			info:TElemento;
			sig:TPila;
	end;
procedure CrearPilaVacia(var pila:TPila);
function EsPilaVacia(pila:TPila):boolean;
procedure Apilar(var pila:TPila;e:TElemento);
procedure Cima(pila:TPila;var e:TElemento);
procedure Desapilar(var pila:TPila);
procedure copiarPila(var pilaNueva:TPila;pila:TPila);
procedure destruirPila(var pila:TPila);
procedure MostrarPila(pila:TPila);

implementation

procedure CrearPilaVacia(var pila:TPila);
begin
	pila:=nil;
end;

function EsPilaVacia(pila:TPila):boolean;
begin
	EsPilaVacia:=pila=nil;
end;

procedure Apilar(var pila:TPila;e:TElemento);
var
	aux:TPila;
begin
	new(aux);
	aux^.sig:=pila;
	Asignar(aux^.info,e);
	pila:=aux;
end;

procedure Cima(pila:TPila;var e:TElemento);
begin
	if (not(EsPilaVacia(pila)))then
		begin
			Asignar(e,pila^.info);
		end;
end;

procedure Desapilar(var pila:TPila);
var
	aux:TPila;
begin
	if (not(EsPilaVacia(pila)))then
		begin
			aux:=pila;
			pila:=pila^.sig;
			dispose(aux);
		end;
end;

procedure CopiarPila(var pilaNueva:TPila;pila:TPila);
var
	iteratorOrigen,iteratorDestino,aux:TPila;
begin


	if(not(EsPilaVacia(pila)))then
		begin
			iteratorOrigen:=pila;
			new(iteratorDestino);
			Asignar(iteratorDestino^.info,iteratorOrigen^.info);
			iteratorDestino^.sig:=nil;
			pilaNueva:=iteratorDestino;
			iteratorOrigen:=iteratorOrigen^.sig;
			while (iteratorOrigen<>nil)do
				begin
					aux:=iteratorDestino;
					new(iteratorDestino);
					Asignar(iteratorDestino^.info,iteratorOrigen^.info);
					iteratorDestino^.sig:=nil;
					aux^.sig:=iteratorDestino;
					iteratorOrigen:=iteratorOrigen^.sig;
				end;
		end;
end;

procedure DestruirPila(var pila:TPila);
begin
	while (not(EsPilaVacia(pila)))do
		begin
			Desapilar(pila);
		end;
end;

procedure MostrarPila(pila:TPila);
var
	aux:TPila;
begin
	if (not(EsPilaVacia(pila))) then
		begin
			aux:=pila;
			while(aux^.sig<>nil)do
				begin
					MostrarElemento(aux^.info);
					writeln;
					aux:=aux^.sig;
				end;
			MostrarElemento(aux^.info);
			writeln;
		end;
end;
end.
