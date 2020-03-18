unit uPersona;

interface
TYPE
    TPersona = RECORD
	    nombre, apellidos: string;
	    edad: integer;
    END;

    procedure CrearPersona (var persona:TPersona;nombre:string;apellidos:string,edad:integer);
    function DameEdad(persona:Tpersona):integer;
    function MismaPersona(persona1:TPersona;persona2:TPersona):boolean;
    procedure Mostrar(var persona:Tpersona);

implementation

    procedure CrearPersona(var persona:Tpersona;nombre:string;apellidos:string,edad:integer);
    begin
      persona.nombre:=nombre;
      persona.apellidos:=apellidos;
      persona.edad:=edad;
    end;


    function DameEdad(persona:Tpersona):integer;
    begin
        DameEdad:=persona.edad;
    end;

    function MismaPersona(persona1:tPersona;persona2:Tpersona):boolean;
    begin
         if(persona1.nombre = persona2.nombre) and(persona1.apellidos = persona2.apellidos) and (persona1.edad = persona2.edad) then
            begin
                 MismaPersona:=true;
              end;
    end;

    procedure Mostrar(var persona:Tpersona);
    begin
        writeln(persona.nombre);
        writeln(persona.apellidos);
        writeln(persona.edad);
    end;
end.

