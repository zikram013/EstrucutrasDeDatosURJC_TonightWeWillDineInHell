unit uAryaList;

interface

uses
    uPersona;


	TYPE
		TPuntero = ^TNodo;
		TNodo = RECORD
			persona: TPersona;
			sig: TPuntero;
		END;

		TListaArya = RECORD
			ini: TPuntero;
			fin: TPuntero;
			lon: integer;
		END;

        procedure CrearListaVacia(var listaArya:TListaArya);
        function EsListaVacia(listaArya:TListaArya):boolean;
        function Pertenece(var listaArya:TListaArya;persona:TPersona):boolean;
        procedure Add(var listaArya:TListaArya;persona:Tpersona);
        procedure Eliminar(var listaArya:TlistaArya;persona:TPersona);
        function EliminarPosicion(var listaArya:TListaArya;posicion:integer):boolean;
        function EliminarPersonaEdad(var listaArya:TListaArya;posicion:integer;age:integer):boolean
        function EliminarRangoListaArya(var listaArya:TListaArya;posicionInicial:integer;posicionFinal:integer):boolean;
        procedure MostrarListaDeArya(listaArya:TlistaArya);
implementation

  procedure CrearListaVacia(var listaArya:TListaArya);
  begin
    listaArya.ini:= NIL;
    listaArya.fin:=NIL;
    listaArya.lon:=0;
  end;

  function EsListaVacia(listaArya:TListaArya):boolean;
  begin
    if(listaArya.ini=NIL) nad (listaArya.fin=NIL)AND(listaArya.lon=0)then
    begin
      EsListaVacia:=true;
    end;
  end;

  procedure Add(var listaArya:TListaArya;persona:TPersona);
  var
    sile:boolean;
    aux:TPuntero;
    nuevo:TPuntero;
  begin
       sile:=false;
       aux:=listaArya.ini;
       while(not sile) and(pAux<>NIL do
       begin
            sile:=MismaPersona(persona,aux^.persona);
            aux:=aux^.sig;
       end;

       if (sile=false)then
       begin
         new(nuevo);
       end;
  end;

end.

