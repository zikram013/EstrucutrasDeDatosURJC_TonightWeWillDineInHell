unit uListaCircularEstatica;
interface
uses uElemento;
type
	TLista=record;
		datos:array[1..10]of TElemento;
		ini:integer;
		fin:integer;
		tam:integer;
	end;
procedure crearVacia(var lista:TLista);
procedure construir(var lista:TLista;e:TElemento);
procedure resto(var lista:TLista);

implementation
procedure crearVacia(var lista:TLista);
begin
	lista.ini:=1;
	lista.fin:=lista.ini;
	lista.tam:=0;
end;

procedure construir(var lista:TLista,e:TElemento);
begin
	if (lista.tam<N)then
		begin
			if(lista.tam=0)then/*Esto comprueba si la lista esta vacia*/
				begin
					Asignar(l.datos[l.ini],e);
					lista.tam:=lista.tam+1;
				end
			else
				begin
					lista.ini:=(lista.ini)mod N+1;
					lista.tam:=lista.tam+1;
					Asignar(l.datos[l.ini],e);
				end;
		end;

end;

procedure resto(var lista:TLista);
begin
	if(lista.tam<>0)then
	begin
		lista.ini=(lista.ini + N - 1)mod N;
		if (lista.ini=0)then
			begin
				lista.ini:=N;
			end;
		lista.tam=lista.tam-1;
	end;
end;
end.
