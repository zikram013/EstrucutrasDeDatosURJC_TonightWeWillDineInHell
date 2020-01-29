program punteros;
CONST
  maxEmpleados=4;
type
  tEmpleado = record
    nombreEmpleado: STRING;
    salarioEmpleado: INTEGER;
    edadEmpleado:INTEGER;
  end;
  tPtrEmpleado = ^tEmpleado;
  tEmpresa=ARRAY[1..maxEmpleados] of tPtrEmpleado;

VAR
  punteroEmpleado : tPtrEmpleado;
  opcion:STRING;

PROCEDURE menu();
BEGIN
  writeln('1-Crear empleado');
  writeln('2-Mostrar');
  writeln('8-salir');
END;

PROCEDURE crearEmpleado((*VAR creacion: tPtrEmpleado*));
VAR
   i: INTEGER;
BEGIN
   new(punteroEmpleado);
   for i:=1 to maxEmpleados do
       begin
         writeln('Escriba el nombre del empleado',i);
         readln(punteroEmpleado^.nombreEmpleado);
         writeln('Escriba el salario del empleado',i);
         readln(punteroEmpleado^.salarioEmpleado);
         writeln('Escriba la edad del empleado',i);
         readln(punteroEmpleado^.edadEmpleado);
       end;
    ;
END;

PROCEDURE mostrarEmpleado();
VAR
   i:INTEGER;
BEGIN
    for i:= 1 to maxEmpleados do
        begin
           writeln('El nombre del empleado',i,'es', punteroEmpleado^.nombreEmpleado);
           writeln('El salario del empleado',i,'es', punteroEmpleado^.salarioEmpleado);
           writeln('La edad del empleado',i,'es', punteroEmpleado^.edadEmpleado);
        end;

END;

BEGIN
repeat
   menu;
   readln(opcion);
   case opcion of
        '1':
          //new(punteroEmpresa);
          crearEmpleado((*punteroEmpresa*));
          //dispose(punteroEmpresa);
        '2':
          mostrarEmpleado();
        end;

   until opcion='8';
   dispose(punteroEmpleado);
END.

