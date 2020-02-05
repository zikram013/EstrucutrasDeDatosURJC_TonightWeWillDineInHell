unit uTablero;

interface
uses
 ujugador,ucoordenada;
var
player1,player2:ujugador;
posicion:ucoordenada
(*Cabeceras de los metodos*)
procedure iniciar();
procedure inicioJugadores(var player1:ujugador, var player2:ujugador);
procedure solicitarCoordenada(var pos:ucoordenada);

implementation
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

procedure inicioJugadores(var player1:ujugador, var player2:ujugador);
begin
    Crear('x',player1);
    Crear('o',player2);
end;

procedure solicitarCoordenada(var pos:ucoordenada);
begin

    repeat
           pedirCoordenada(pos);
          coordenadaValida(pos)
      until CoordenadaValida(pos)=true;

end.

