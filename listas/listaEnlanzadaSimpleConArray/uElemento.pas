unit Uelemento;

CONST
    N:

TYPE
    TRangoApuntadores: array[0..N];
    TRangoArray:array[1..N];
    TElemento:
    TNodo:Record
        info:TElemento
        sig:TRangoApuntadores;
end;

TAlmacen=ARRAY[TRangoArray]of TNodo;

TYPE
    TLista=Record
        dato:TAlmacen;
        ocupados:TRangoApuntadores;
        libres:TRangoApuntadores;
    end;

procedure CrearListaVacia(var lista:TLista);
var
    i:TRangoArray;
begin
    lista.ocupados:=0
    lista.libres:=1
    for i:=1 to N do 
        begin
            lista.data[i].sig:=i+1;
       end;
       lista.data[N].sig:=0;
end;

function EslistaVacia(lista:TLista):boolean;
begin
    EslistaVacia:=lista.ocupados=0;
end;

procedure Construir(var lista:TLista;nuevoDato:TElemento);
var
    indiceNuevoNodo:TRangoApuntadores;
begin
    indiceNuevoNodo:=lista.libres;
    lista.libres:=lista.data[lista.libres].sig;
    lista.data[indiceNuevoNodo].sig:=lista.ocupados;
    lista.ocupados:=indiceNuevoNodo;
    lista.data[lista.ocupados].info:=nuevoDato;
end;

procedure Primero(lista:TLista,var elem:TElemento);
begin
    elem:=lista.data[lista.ocupados].info;
end;

procedure Resto(var lista:Tlista);
var
    indicePrimerOcupado:TRangoApuntadores;
begin
    indicePrimerOcupado:=lista.ocupados;
    lista.ocupados:=lista.data[lista.ocupados].sig;
    lista.data[indicePrimerOcupado].sig:=lista.libres;
    lista.libres:=indicePrimerOcupado;
end;

function Pertenece(lista:TLista;elem:TElemento):boolean;
var
    iterator:TRangoApuntadores;
    encontrado:boolean;
begin
    encontrado=false;
    iterator:=lista.ocupados;
    while(iterator<>0 and not encontrado) do
    begin
        if(elem=lista.data[iterator].info.libres)then
        begin 
            encontrado:=true;
            iterator:=listas.data[iterator].sig;
        end;
    Pertenece:=encontrado;
end;

procedure Eliminar(var lista:TLista;elem:TElemento);
var
    actual,anterior:TRangoApuntadores;
begin
    actual:=lista.ocupados;
    anterior:=0;
    while(actual<>0)do 
    begin
        if(lista.data[actual].info=elem)then
            begin
                if(anterior=0)then
                    begin
                        lista.ocupados:=lista.data[lista.ocupados].sig;
                        lista.data[actual].sig:=lista.libres;
                        lista.libres:=actual;
                    end;
                else 
                    begin
                lista.data[anterior].sig:=lista.data[actual].sig;
                lista.data[actual].sig:=lista.libres;
                lista.libres:=actual;
                anterior:=actual;
                actual:=lista.data[actual].sig;
                    end;
            end;
        else
            begin
                anterior:=actual;
                actual:=lista.data[actual].sig;
            end;
    end;
end;