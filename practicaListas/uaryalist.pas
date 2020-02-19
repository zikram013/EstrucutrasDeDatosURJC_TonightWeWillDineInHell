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

        procedure CrearListaVacia();
        function ListaVacia():boolean;
        procedure ConstruirLista();
        procedure Primero();
        procedure Resto();
        function Pertenece():boolean;
        procedure Eliminar();
implementation

end.

