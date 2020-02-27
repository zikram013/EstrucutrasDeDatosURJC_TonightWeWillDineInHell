UNIT uListaDoblementeEnlazada;
INTERFACE  
USES
    uElemento;
TYPE
    TListaDoble=^TNodo;
        TNodo=RECORD
            info:TElemento;
            ant,sig:TListaDoble;
        END;

    