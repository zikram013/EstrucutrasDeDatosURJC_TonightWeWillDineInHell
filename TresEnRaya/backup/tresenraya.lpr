program tresenraya;
uses ucoordenada,ujugador,uTablero;
var
  player1:TJugador;
  player2:TJugador;
  posicion:Tcoordenada;
 // x,y:integer;
  msg:string;
  ficha:char;
  //fichaX:char;
 // fichaY:char;
begin

 iniciar();
  inicioJugadores(player1,player2);
  ponerFicha(player1,player2,posicion,msg);
  solicitarCoordenada(posicion,ficha);
  ponerFicha(player1,player2,posicion,msg);
  //victoria(player1,player2);
  fin();
  //empate();



end.

