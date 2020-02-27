UNIT UListaIniFin;
INTERFACE
uses
    uElemento;
TYPE
    Tlista=^TNodo;
    TNodo=Record
        info:TElemento;
        sig:TLista;
    end;
    
    TListaIniFin=Record 
        ini,fin:TLista;
    end;