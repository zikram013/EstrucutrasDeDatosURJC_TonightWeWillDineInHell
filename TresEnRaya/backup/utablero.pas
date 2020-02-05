unit uTablero;

interface
uses
 ujugador,ucoordenada;
 var
player1,player2:TJugador;
posicion:Tcoordenada;
x:integer;
y:integer;
ficha:char;
fichaX:char;
fichaY:char;
(*Cabeceras de los metodos*)
procedure iniciar(x:integer;y:integer);
//procedure iniciar();
procedure inicioJugadores(var player1:TJugador; var player2:TJugador);
procedure solicitarCoordenada(var posicion:Tcoordenada);
procedure ponerFicha(player1:TJugador;player2:TJugador;var posicion:Tcoordenada;msg:string);

implementation
(*Desarrollo de los metodos*)
procedure iniciar(x:integer;y:integer);
const
FICHA_VACIA = '-';
MAX = 3;
type
tTablero = ARRAY [1..MAX,1..MAX] OF TJugador;
var
  tablero:tTablero;
  fila,columna:integer;
  ocupado:boolean;
begin

for fila:=1 to MAX do
    begin
        for columna:=1 to MAX do
            begin
            if((tablero[fila,columna])<>FICHA_VACIA)and((tablero[fila,columna])<>'x') and ((tablero[fila,columna])<>'o')then
             begin
               tablero[fila,columna]:=FICHA_VACIA;
               write(tablero[fila,columna]);
               end;

            if((tablero[fila,columna])=FICHA_VACIA)then
              begin
                 if(fila=x)and(columna=y)then
                   begin
                    tablero[fila,columna]:=ficha;
                    write(tablero[fila,columna]);
                     end;

              end;
    end;
     writeln();
end;
end;

procedure inicioJugadores(var player1:TJugador; var player2:TJugador);

begin
    Crear('x',player1);
    Crear('o',player2);
end;

procedure solicitarCoordenada(var posicion:Tcoordenada);
begin

    repeat
           pedirCoordenada(posicion);
          coordenadaValida(posicion);
    until CoordenadaValida(posicion)=true;
     x:=dameFila(posicion);
     y:=dameColumna(posicion);
     write(iniciar(x,y));
    solicitarCoordenada(posicion);


end;

procedure ponerFicha(player1:TJugador;player2:TJugador;var posicion:Tcoordenada;msg:string);
begin
    CoordenadaParaPoner(player1,posicion,'Dame la coordenada para la ficha');
    ficha:=ColorFicha(player1);
    CoordenadaParaPoner(player2,posicion,'Dame la coordenada para la ficha');
    ficha:=ColorFicha(player2);

end;

end.

end.

