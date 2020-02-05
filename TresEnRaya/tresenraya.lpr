program tresenraya;
uses ucoordenada,ujugador,uTablero;
var
  player1:TJugador;
  player2:TJugador;
  posicion:Tcoordenada;
  x,y:integer;
  msg:string;
  ficha:char;
  fichaX:char;
  fichaY:char;
begin

  inicioJugadores(player1,player2);
  ponerFicha(player1,player2,posicion,msg);
  solicitarCoordenada(posicion);
  iniciar(x,y,ficha);
 // iniciar();


end.

