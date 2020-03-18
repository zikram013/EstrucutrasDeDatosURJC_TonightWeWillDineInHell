unit listaInitFin
interface
uses 
    uElemento;
type
    TListaEnlazadaSimple=^TNodo
    TNodo = Record
        info:TElemento;
        sig:TListaEnlazadaSimple;
    end;
    TLista=Record
        ini,fin:TListaEnlazadaSimple;

procedure CrearListaVacia(var lista:TLista);
function EsListaVacia(lista:TLista):boolean;
procedure Construir(e:TElemento;var lista:TLista);
procedure Primero(var e:TElemento;lista:TLista);
procedure Resto(var lista:TLista);
function Pertenece(e:TElemento;var lista:TLista):boolean;
procedure Eliminar(e:TElemento;var lista:TLista);
procedure InsertarFinal(e:TElemento;var lista:TLista);

implementation

procedure CrearListaVacia(var lista:TLista);
begin
    lista^.ini:=NIL;
    lista^.fin:=NIL;
end;

function EsListaVacia(lista:TLista):boolean;
begin
    EsListaVacia:=lista.ini=NIL;
end;

procedure Construir(e:TElemento;var lista:TLista);
var
    aux:TListaEnlazadaSimple;
begin
    new(aux);
    Asignar(e,aux^.info);
    if(EsListaVacia(lista))then
        begin
            lista.fin:=aux;
        end;
    aux^.sig:=lista.ini;
    lista.ini:=aux;
end;

procedure Primero(var e:TElemento;lista:TLista);
begin
    if(not(EsListaVacia(lista)))then
    Asignar(lista.ini^.info,e);
end;

procedure Resto(var lista:TLista);
var
    aux:TListaEnlazadaSimple;
begin
    if not EsListaVacia(lista)then
    begin
        if lista.ini^.sig=NIL then
            begin
                dispose(lista^.ini);
                lista^.ini:=NIL;
                lista^.fin:=NIL;
            end;
        else
        begin
            aux:=lista.ini^sig;
            dispose(lista.ini);
            lista.ini:=aux;
        end;
    end;
end;

procedure InsertarFinal(e:TElemento;var lista:TLista);//complejidad o(1)
var
    aux:TListaEnlazadaSimple;
begin
    new(aux);
    Asignar(e,aux^.info);
    if(EsListaVacia(lista))then
        begin
            lista.ini:=aux;
        end;
    else
    begin
         lista.fin^.sig:=aux^.sig;
    end;
    aux^.sig:=NIL;
    lista.fin:=aux;
    
end;

end;