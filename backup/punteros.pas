program punteros;
CONST
  maxEmpleados=3;
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
  punteroAuxiliarMostrar: tPtrEmpleado;
  listaEmpresa:tEmpresa;
  opcion:STRING;

PROCEDURE menu();
BEGIN
  writeln('1-Crear empleado');
  writeln('2-Mostrar');
  writeln('3-Ordenacion');
  writeln('4-Eliminar');
  writeln('8-salir');
END;

PROCEDURE crearEmpleado( var listado:tEmpresa);
VAR
   i: INTEGER;
BEGIN
   //new(punteroEmpleado);
   for i:=1 to maxEmpleados do
       begin
         new(punteroEmpleado);
         writeln('Escriba el nombre del empleado',i);
         readln(punteroEmpleado^.nombreEmpleado);
         writeln('Escriba el salario del empleado',i);
         readln(punteroEmpleado^.salarioEmpleado);
         writeln('Escriba la edad del empleado',i);
         readln(punteroEmpleado^.edadEmpleado);
         listado[i]:=punteroEmpleado;
       end;
    ;
END;

PROCEDURE mostrarEmpleado(var listado:tEmpresa);
VAR
   i:INTEGER;
BEGIN
   for i:=1 to maxEmpleados do
        begin
          if (listado[i]<>NIL) then
          begin
           writeln('El nombre del empleado',i,'es', listado[i]^.nombreEmpleado);
           writeln('El salario del empleado',i,'es', listado[i]^.salarioEmpleado);
           writeln('La edad del empleado',i,'es', listado[i]^.edadEmpleado);
          end;
        end;

END;

PROCEDURE ordenar(var listado:tEmpresa);
VAR
   punteroAuxiliarMostrar:tPtrEmpleado;
   i:integer;
   j:integer;
BEGIN
   //new(punteroAuxiliarMostrar);
     for i:=1 to maxEmpleados do
         begin
            for j:=0 to maxEmpleados-i do
            begin
               if(listado[i]^.salarioEmpleado > listado[i+1]^.salarioEmpleado)then
               begin
                       punteroAuxiliarMostrar:=listado[i];
                       listado[i]:=listado[i+1];
                       listado[i+1]:=punteroAuxiliarMostrar;
                 end;

               end;
            end;
END;

PROCEDURE eliminarEmpleado (var listado:tEmpresa);
VAR
   sueldoEliminar:integer;
   i:integer;
BEGIN
   writeln('Sueldo base a partir del cual eliminar');
   readln(sueldoEliminar);
   for i:=1 to maxEmpleados do
       begin
            if(listado[i]^.salarioEmpleado > sueldoEliminar)then
            begin
                    dispose(listado[i]);
                    listado[i]:=NIL;
            end
            else
            begin

            end;

       end;
   (* for i:=1 to maxEmpleados do
        begin
           writeln('El nombre del empleado',i,'es', listado[i]^.nombreEmpleado);
           writeln('El salario del empleado',i,'es', listado[i]^.salarioEmpleado);
           writeln('La edad del empleado',i,'es', listado[i]^.edadEmpleado);
        end;      *)
END;

BEGIN
repeat
   menu;
   readln(opcion);
   case opcion of
        '1':
          //new(punteroEmpresa);
          crearEmpleado(listaEmpresa);
          //dispose(punteroEmpresa);
        '2':
          mostrarEmpleado(listaEmpresa);
        '3':
            ordenar(listaEmpresa);
        '4':
            eliminarEmpleado(listaEmpresa);
        end;

   until opcion='8';
   dispose(punteroEmpleado);
   //dispose(punteroAuxiliarMostrar);
END.

