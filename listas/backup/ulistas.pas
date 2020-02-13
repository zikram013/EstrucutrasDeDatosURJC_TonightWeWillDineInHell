unit uListas;

interface
 uses uelemento;
 type
     TNodo=record;
       info:Telemento;
       sig:TLista;
       end;
     TLista=^TNodo;
procedure CrearListaVacia(var lista:TLista);
function ListaVacia(lista:TLista):boolean;
procedure ConstruirLista(var lista:TLista;dato:Telemento);
procedure Primero (lista:Tlista;var elemento:Telemento);
procedure Resto(var lista:TLista);
function Pertenece(elemento:Telemento,lista:Tlista):boolean;
procedure Eliminar(var lista:Tlista;elemento:Telemento);

implementation
procedure CrearListaVacia(var lista:Tlista);
begin
  lista:=NIL;
end;

function ListaVacia(lista:Tlista):boolean;
begin
  ListaVacia:=lista=NIL;
end;

procedure ConstruirLista(var lista:TLista;dato:Telemento);
var
  pAux:TLista;
begin
  new(pAux);
  Asignar(e,aux^.info);
  pAux^.sig:=lista;
  lista:=pAux;
end;

procedure Primero (lista:Tlista;var elemento:Telemento);
begin
      primerElemento(elemento,lista^.elemento);
end;

//Eliminar primer elemento de la lista
procedure Resto (var lista:Tlista);
var
  pAux:Telemento;
begin
      if (NOT ListaVacia(lista))then
      begin
        if (lista^.sig=NIL)then
        begin
             dispose(lista);
             lista:=NIL;
        end;
        else
            begin
                 aux:=lista^.sig;
                 dispose(lista);
                 lista:=aux;
              end;
      end;
end;

function Pertenece(elemento:Telemento,lista:Tlista):boolean;
var
   iterator:Tlista;
   encontrado:boolean
begin
      pAux:=lista;
     encontrado:=false;
     while(encontrado=false)and(pAux<>NIL)do
       begin
            encontrado:=ElementosIguales(e,pAux);
            pAux:=lista^.siguiente;
       end;
     Pertenece:=encontrado;

end;

procedure Eliminar(var lista:Tlista;elemento:Telemento);
begin
end;
end.

