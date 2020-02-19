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
        procedure EliminarRangoListaArya(var listaArya:TListaArya;posicionInicial:integer;posicionFinal:integer);
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
  end;

  procedure Eliminar(var listaArya:TListaArya;persona:TPersona);
  var

    existe:boolean;
    pbusqueda:TPuntero;
    panterior:TPuntero;
 begin
      existe:=false;
      pbusqueda:=listaArya.ini;
      panterior:=NIL;
      while(encontrada=false)and (pbusqueda<>NIL)do
      begin
        existe:=MismaPersona(persona,pbusqueda^.persona);
        if (encontrada=false)then
        begin
          panterior:=pbusqueda;
          pbusqueda:=pbusqueda^.sig;
        end;

        if(encontrada=true)then
        begin
          if(panterior=NIL)then
             begin
               listaArya.ini:=listaArya.ini^.sig;
               if(listaArya.ini=NIL)then
                  listaArya.fin:=NIL;
             end;
          else
              begin
                panterior^.sig:=pbusqueda^.sig;
                if (pbusqueda=listaArya.fin) then
                   listaArya.fin:=pbusqueda;
              end;
              dispose(pbusqueda);
              listaArya.lon:=listaArya.lon-1;
        end;
      end;

  function Pertenece(var listaArya:TListaArya;persona:TPersona):boolean;
  var
     encontrado:boolean;
     paux:tPuntero;
  begin
    encontrado:=false;
    paux:=listaArya.ini;
    while(encontrado=false)and(paux<>NIL)do
    begin
      encontrado:=MismaPersona(persona,paux^.persona);
      paux:=paux^.sig;
    end;
    pertenece:=encontrado;
    end;
  end;

  procedure MostrarListaDeArya(listaArya:TListaArya);
  var
     paux:TPuntero;
  begin
    if not (EsListaVacia(listaArya))then
       begin
         paux:=listaArya.ini;
         while(paux^sig<>NIL)do
         begin
           MostrarPersona(paux^.persona);
           paux:=paux^.sig;
         end;
         MostrarPersona(paux^.persona);
       end;
  end;

  procedure EliminarRangoListaArya(var listaArya:TListaArya;posicionInicial:integer;posicionFinal:integer);
  var
     paux:TPuntero;
     i:integer;
     rango:integer;
     persona:TPersona;
  begin
    if(posicionInicial>=1)and(posicionInicial<=posicionFinal)and(posicionFinal<=listaArya.lon)then
       begin
         rango:=(posicionFinal-posicionInicial)+1;
         paux:=listaArya.ini;
         for i:=1 to posicionInicial-1 do
         begin
           paux:=paux^.sig;
         end;
         while rango<>0 do
         begin
           paux:=paux^.sig;
           Eliminar(listaArya,persona);
           rango:=rango-1;
         end;
       end;
  end;

  procedure EliminarPosicion(var listaArya:TListaArya;posicion:integer);
  var
     panterior:TPuntero;
     pbuscar:TPuntero;
     i:integer;
  begin
    if(posicion>=1)and(posicion<=listaArya.lon)then
       begin
         panterior:=NIL;
         pbuscar:=listaArya.ini;
         for i:=1 to posicion-1 do
         begin
           panterior:=pbuscar;
           pbuscar:=pbuscar^.sig;
         end;
         if panterior=NIL then
            begin
              listaArya.ini:=listaArya.ini^.sig;
              if listaArya.ini=nil then
                 begin
                   listaArya.fin:=NIL;
                 end;
            end;
         else
             begin
                  panterior^.sig:=pbuscar^.sig;
                  if (pbuscar=listaArya.fin)then
                     begin
                       listaArya.fin:=panterior;
                     end;
             end;
       end;
    dispose(panterior);
    listaArya.long:=listaArya.lon-1;
  end;

  procedure EliminarPersonaEdad(var listaArya:TListaArya;edad:integer);
  paux:TPuntero;
  persona:TPersona;
  begin
    paux:=listaArya.ini;
    while(paux<>NIL) do
    begin
         if (edad=DameEdad(paux^.persona))then
            begin
              paux:=paux^.sig;
              Eliminar(listaArya,persona);
            end;
         else
             begin
             end;
    end;
  end;
end.

