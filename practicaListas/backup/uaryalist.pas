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
        function ListaVacia(listaArya:TListaArya):boolean;
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
  end;

end.

