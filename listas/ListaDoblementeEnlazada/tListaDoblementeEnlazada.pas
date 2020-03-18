unit uListaDoblementeEnlazada;
interface
uses uelemento;
type
    tListaDoblementeEnlazada=^TNodo;
    TNodo=RECORD
        info:telemento;
        sig,ant:tListaDoblementeEnlazada;
    end;

procedure CrearListaVacia(var lista:TListaDoblementaEnlazada);
function EsListaVacia(lista:TListaDoblementaEnlazada):boolean;
procedure Construir (var lista:TListaDoblementaEnlazada; e:telemento);
procedure Resto(Var lista:TListaDoblementaEnlazada);
procedure BorrarElemento(var lista:TListaDoblementaEnlazada;e:telemento);

implementation
procedure CrearListaVacia(var lista:TListaDoblementaEnlazada);
begin
   lista:=NIL; 
end;

function EsListaVacia(lista:TListaDoblementaEnlazada):boolean;
begin
    EsListaVacia=lista:=NIL
end;

procedure Construir(var lista:TListaDoblementaEnlazada; e:telemento);
var
    aux:TListaDoblementaEnlazada;
begin
    new(aux);
    Asignar(e,aux^.info);
    aux^.sig:=lista;
    aux^.ant:=NIL;
    if (not(EsListaVacia(lista)))then
    begin
        lista^.ant:=aux;
    end;
    lista:=aux;
end;

procedure Resto(var lista:TListaDoblementaEnlazada);
var
    aux:TListaDoblementaEnlazada;
begin
    if (not(EsListaVacia(lista)))then
    begin
        aux:=lista;
        lista:=lista^.sig;
        dispose(aux);
        if(lista<>NIL)then
            lista^.ant:=NIL;
    end;

   
end;


procedure BorrarElemento(var lista:TListaDoblementaEnlazada;e:telemento);//para la primera ocurrencia
var
    iterator:TListaDoblementaEnlazada;
begin
    if(not(EsListaVacia(lista)))then
    begin
        if(EsIgual(e,lista^.info))then
            begin
                Resto(lista);
            end;
        else
            begin
               iterator:=lista^.sig;
               while(iterator<>NIL and not(EsIgual(iterator^.info,e))do 
                begin
                    iterator:=iterator^.sig;
                end;
                if(iterator<>NIL)then
                begin
                    iterator^.ant^.sig:=iterator^.sig;
                    if(iterator^.sig<>NIL)then
                        begin
                            iterator^.sig^.ant:=iterator^.ant;
                        end;
                     dispose(iterator);
                end;
            end;
    end;
end;

end.
