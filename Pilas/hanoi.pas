program prog;
uses
	uElemento,uPila;
procedure TorresHanoi(NumDiscos:integer;var origen,aux,destino:TPila;var movimientos:integer);
var
	disco:integer;
begin
	if (NumDiscos=1)then
		begin
			Cima(origen,disco);
			Desapilar(origen);
			Apilar(destino,disco);
			movimientos:=movimientos+1;
		end
	else
		begin
			TorresHanoi(NumDiscos-1,origen,destino,aux,movimientos);
			Cima(origen,disco);
			Desapilar(origen);
			Apilar(destino,disco);
			movimientos:=movimientos+1;
			TorresHanoi(NumDiscos-1,aux,origen,destino,movimientos);
		end;
end;

var
	TorreA,TorreB,TorreC:TPila;
	totalDiscos,disco,movimientos:integer;
begin
	CrearPilaVacia(TorreA);
	CrearPilaVacia(TorreB);
	CrearPilaVacia(TorreC);

	writeln('Discos');
	readln(totalDiscos);

	for disco:=totalDiscos downto 1 do
		begin
			Apilar(TorreA,disco);
		end;

	movimientos:=0;
	TorresHanoi(totalDiscos,TorreA,TorreB,TorreC,movimientos);
	writeln('Se han realizado ', movimientos, ' movimientos');
	writeln('A: ');
	MostrarPila(TorreA);
	writeln('B: ');
	MostrarPila(TorreB);
	writeln('C: ');
	MostrarPila(TorreC);

end.
