unit uTablero;

interface
uses
 ujugador,ucoordenada;
const
FICHA_VACIA = '-';
MAX = 3;
MAX_FICHAS=5;
type
tTablero = ARRAY [1..MAX,1..MAX] OF TJugador;
 var
 msg:string;
 tablero:tTablero;
 fila,columna:integer;
player1,player2:TJugador;
posicion:Tcoordenada;
x:integer;
y:integer;
ficha:char;
fichaX:char;
fichaY:char;
(*Cabeceras de los metodos*)
//procedure iniciar(x:integer;y:integer;ficha:char);
procedure iniciar();
procedure inicioJugadores(var player1:TJugador; var player2:TJugador);
procedure solicitarCoordenada(var posicion:Tcoordenada;var ficha:char);
procedure ponerFicha(player1:TJugador;player2:TJugador;var posicion:Tcoordenada;msg:string);
//procedure victoria(player1:TJugador;player2:TJugador);
procedure fin();
procedure empate();

implementation
(*Desarrollo de los metodos*)
procedure iniciar();
begin

for fila:=1 to MAX do
    begin
        for columna:=1 to MAX do
             begin
                // if((tablero[fila,columna])<>ficha)then
                 //begin
                   tablero[fila,columna]:=FICHA_VACIA;
                 write(tablero[fila,columna]);
                // end;

               end;
     writeln();
    end;

end;

procedure inicioJugadores(var player1:TJugador; var player2:TJugador);

begin
    Crear('x',player1);
    Crear('o',player2);
end;

procedure solicitarCoordenada(var posicion:Tcoordenada;var ficha:char);
var
fil:integer;
column:integer;
valida:boolean;
contadorX:integer;
contadorO:integer;
ganador:boolean;
buenaCoordenada:boolean;
begin
        ganador:=false;
        contadorX:=0;
        contadorO:=0;
     fil:=DameFila(posicion);
     column:=DameColumna(posicion);

     if(fil>0)and(fil<4)and(column>0)and(column<4)then
     begin
         valida:=CoordenadaValida(posicion);
     end;


            for fila:=1 to MAX do
    begin
        for columna:=1 to MAX do
             begin
                if (fil=fila)and(column=columna)and (tablero[fila,columna]=FICHA_VACIA) then
                begin
                    tablero[fila,columna]:=ficha;

                end;




                if (fil<>fila)and(column<>columna)and(tablero[fila,columna]<>'o')and(tablero[fila,columna]<>'x')then
                begin
                 tablero[fila,columna]:=FICHA_VACIA;

                end;

                 write(tablero[fila,columna]);
               end;
     writeln();
    end;

    for fila:=1 to MAX do
         begin
          for columna:=1 to MAX do
               begin
                if (tablero[fila,columna]='x')then
                begin
                 contadorX:=contadorX+1;

                   end;

                if (tablero[fila,columna]='o')then
                begin
                      contadorO:=contadorO+1;
                end;


               end;
         end;



    //condition vicotry

        if(contadorX=3) or(contadorO=3)then
        begin
              //filas
              for fila:=1 to MAX do
                   begin
                    if(tablero[fila,1]='x')and(tablero[fila,2]='x')and(tablero[fila,3]='x')then
                    begin
                        CantarVictoria(player1);
                        ganador:=true;
                    end;
                       if(tablero[fila,1]='o')and(tablero[fila,2]='o')and(tablero[fila,3]='o')then
                       begin
                         CantarVictoria(player2);
                         ganador:=true;
                       end;

                   end;
               //columnas
              for columna:=1 to MAX do
                   begin
                    if(tablero[1,columna]='x')and(tablero[2,columna]='x')and(tablero[3,columna]='x')then
                    begin
                       CantarVictoria(player1);
                       ganador:=true;
                    end;
                       if(tablero[1,columna]='o')and(tablero[2,columna]='o')and(tablero[3,columna]='o')then
                       begin
                       CantarVictoria(player2);
                       ganador:=true;
                       end;

                   end;
              //diagonales
              if(tablero[1,1]='x')and(tablero[2,2]='x')and(tablero[3,3]='x')then
              begin
                   CantarVictoria(player1);
                   ganador:=true;
              end;
              if(tablero[1,1]='o')and(tablero[2,2]='o')and(tablero[3,3]='o')then
              begin
                   CantarVictoria(player2);
                   ganador:=true;
              end;
              if(tablero[1,3]='o')and(tablero[2,2]='o')and(tablero[3,1]='o')then
              begin
                   CantarVictoria(player2);
                   ganador:=true;
              end;
              if(tablero[1,3]='x')and(tablero[2,2]='x')and(tablero[3,1]='x')then
              begin
                   CantarVictoria(player1);
                   ganador:=true;
              end;

        end;

        if(ganador=true)then
        begin
             fin();
        end;

        if(ganador=false)and(contadorX=3)and(contadorO=3)then
        begin
             empate();
        end;

end;

procedure ponerFicha(player1:TJugador;player2:TJugador;var posicion:Tcoordenada;msg:string);
var
turnos:integer;

begin

     for turnos:=1 to MAX_FICHAS do
          begin
     CoordenadaParaPoner(player1,posicion,'Dame la coordenada para la ficha');
    ficha:=ColorFicha(player1);
    solicitarCoordenada(posicion,ficha);
    CoordenadaParaPoner(player2,posicion,'Dame la coordenada para la ficha');
    ficha:=ColorFicha(player2);
    solicitarCoordenada(posicion,ficha);

    end;

   // victoria(player1,player2);

end;

(*procedure victoria(player1:TJugador;player2:TJugador);
begin

     CantarVictoria(player1);
     CantarVictoria(player2);
end;  *)

procedure fin();
begin
     writeln('fin del juego');
     readln();
     iniciar();
end;

procedure empate();
begin
     writeln('empate');
     readln();

end;

end.

