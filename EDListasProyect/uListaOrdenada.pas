(*Vamos a ordenarla de menor a mayor*)
unit uListaOrdenada;
interface
uses uElement;
type
	TLista=^TNodo;
	 TNodo=record
	 	info:TElemento;
	 	sig:TLista;
	 end;
procedure crearListaVacia(var lista:TLista);
function esListaVacia(lista:TLista):boolean;
procedure insertar(var lista:TLista; elemento:TElemento);
procedure primero(var elemento:TElemento;lista:TLista);
procedure borrar(var lista:TLista;elemento:Telemento);

implementation
procedure crearListaVacia(var lista:TLista);
begin
	lista:=nil;
end;

procedure esListaVacia(lista:TLista);
begin
	esListaVacia:=lista=nil;
end;

procedure insertar(var lista:TLista; elemento:TElemento)
var
	aux,iterator,itNext:TLista;
begin
	new(aux);
	Asignar(e,aux^.info);
	if (esListaVacia(lista)) then(*Realizar*)
		begin
			lista:=aux;
			lista^.sig:=nil;
		end
	else
		begin
			iterator:=lista;
			itNext:=iterator^.sig;
			while((itNext<>nil) and (not(esMayor(e,itNext^.info)))do
				begin
					iterator:=iterator^.sig;
					itNext:=iterator^.sig;
				end;
			iterator^.sig:=aux;
			aux^.sig:=itNext;
		end;
end;

procedure borrar(var lista:Tlista;elemento:TElemento;
begin

end;
end.
