unit uListaCircular;
interface
	uses uElemento;
type
	TLista=^TNodo;
	TNodo=record
		info:TElemento;
		sig:TLista;
	end;

procedure CrearListaVacia(var lista:TLista);
function EsListaVacia(lista:TLista):boolean;
procedure Construir(var lista:TLista;e:TElemento);
procedure InsertarFinal(var lista:TLista;e:TElemento);
function Pertenece(var lista:TLista;e:TElemento):boolean;
procedure Eliminar(var lista:TLista;e:TElemento);

implementation

procedure CrearListaVacia(var lista:TLista);
begin
	lista:=NIL;
end;

function EsListaVacia(lista:TLista):boolean;
begin
	EsListaVacia:=lista=NIL;
end;

procedure Construir(var lista:TLista;e:TElemento);
var
	aux:TLista;
begin
	new(aux);
	Asignar(e,aux^.info);
(*Comprobar si la lista esta vacia*)
	if not(EsListaVacia(lista))then
		begin
			aux^.sig := lista^.sig;
			lista^.sig:=aux;
		end
	else
		begin
			aux^.sig:=aux;
			lista := aux;
		end;
end;

procedure Resto(var lista:TLista);(*Pasarlo siempre por referencia o(1)*)
var
	aux:TLista;
begin
	if(not(EsListaVacia(lista)))then
		begin
			if(lista^.sig=lista)then
				begin
					dispose(lista);
					lista:=NIL;
				end
			else
				begin
					aux:=lista^.sig;
					lista^.sig:=aux^.sig;
					dispose(aux);
				end;
		end;

(*procedure resto(lista:TLista;var res:TLista);
var
e:TElem;
if not esListaVacia(lista))then
begin
	copiarLista(res,lista);
	primero(res,elem);
	borrarElemento(res,elem);
end*)
end;

procedure InsertarFinal(var lista:TLista;e:TElemento);
var
	aux:TLista;
begin
	if esListaVacia(lista)then
		begin
			Construir(lista,e);
		end
	else
		begin
			new(aux);
			Asignar(e,aux^.info);
			aux^.sig:=lista^.sig;
			lista^.sig:=aux;
			lista:=aux;
		end;

end;

function Pertenece(var lista:TLista;e:TElemento):boolean;
var
	iterator:TLista;
begin
	if(EsListaVacia(lista))then
	begin
		Pertenece:=false;
	end
	else
	begin
		iterator:=lista^.sig;
		while((iterator <> lista) and not(EsIgual(e,iterator^.info)))do
		begin
			iterator:=iterator^.sig;
		end;
		Pertenece:=EsIgual(e,iterator^.info);
	end;
	iterator:=lista;
end;

procedure Eliminar(var lista:TLista;e:TElemento);
var
	iterator:TLista;
	itNext:TLista;
begin
	if(not (EsListaVacia(lista)))then
		begin
			iterator:=lista;
			itNext:=iterator^.sig;
			while((itNext <> lista) and not(EsIgual(e,itNext^.info)))do
				begin
					iterator:=itNext;
					itNext:=iterator^.sig;
				end;
				if(EsIgual(e,itNext^.info))then
				begin
					iterator^.sig:=itNext^.sig;

					if(itNext=lista)then
						begin
						if(itNext=iterator)then
							begin
								lista:=nil;
							end
						else
							begin
							lista:=iterator;
							end;

						end;
					dispose(itNext);
				end;
		end
	else
		begin
		end;
end;

(*procedure Eliminar(e:TElemento;var l:TLista);
var
	aux:TLista;
	itNext:TLista;
begin
	aux:=l^.sig;
	if not EsListaVacia(l)then
		begin
			if(EsIgual(aux^.info,e))then
				begin
					resto(l);
				end
			else
				begin
					itNext:=aux^.sig;
					while not EsIgual(aux^.sig.info,e)do
						aux:=aux^.sig;
					if aux^.sig=l then
						begin
							l:=aux;
						end;
					aux^.sig:=aux^.sig^.sig;
					dispose(aux);
				end;
		end;
end;*)

end.
