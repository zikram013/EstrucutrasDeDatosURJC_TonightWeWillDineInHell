unit uTablero;



interface
uses
 ujugador,ucoordenada;
var ficha:char;
jugador1,jugador2:ujugador;
(*Cabeceras de los metodos*)
procedure iniciar();
procedure inicioJugadores(var jugador1:ujugador; var jugador2:ujugador);

implementation
uses
 ujugador,ucoordenada;
(*Desarrollo de los metodos*)
procedure iniciar();
const
FICHA_VACIA = '-';
MAX = 3;
type
tTablero = ARRAY [1..MAX,1..MAX] OF TJugador;
var
  tablero:tTablero;
  fila,columna:integer;
begin
for fila:=1 to MAX do
    begin
        for columna:=1 to MAX do
           begin
               tablero[fila,columna]:=FICHA_VACIA;
               write(tablero[fila,columna]);
           end;
        writeln();
    end;

end;

procedure inicioJugadores(var jugador1:ujugador;var jugador2:ujugador);
begin
    Crear('x',jugador1);
    Crear('o',jugador2);
end;

end.

