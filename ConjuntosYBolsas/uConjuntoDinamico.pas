unit uConjuntoDinamico;

interface
uses
	uElemento;
type
	TConjunto=array[TElemento]of boolean;

procedure CrearConjuntoVacio(var conjunto:TConjunto);
procedure Poner (var conjunto:TConjunt;elemento:TElemento);
procedure Elegir(conjunto:TConjunto;var elemento:TElemento);
function EsConjuntoVacio(conjunto:TConjunto):boolean;
function EsSubconjunto(conjuntoA,conjuntoB:TConjunto):boolean;
function Pertenece(conjunto:TConjunto;elemento:TElemento):boolean;
function Cardinal(conjunto:TConjunto):integer;
function SonConjuntosIguales(conjuntoA,conjuntoB:TConjunto):boolean;
procedure MostrarConjunto(conjunto:TConjunto);
procedure Quitar(var conjunto:TConjunto,elemento:TElemento);
procedure Union(conjuntoA,conjuntoB:TConjunto;var resultado);
procedure Interseccion(conjuntoA,conjuntoB:TConjunto;var resultado);
procedure Diferencia(conjuntoA,conjuntoB:TConjunto;var resultado);
procedure CopiarConjunto(origen:TConjunto;var destino:TConjunto);
procedure DestruirConjunto(var conjunto:TConjunto);

implementation

procedure CrearConjuntoVacio(var conjunto:TConjunto);
var
	elemento:TElemento;
begin
	for elemento:=MIN to MAX do
		begin
			conjunto[elemento]:=false;
		end;
end;

procedure Poner(var conjunto:TConjunto;elemento:TElemento);
begin
	conjunto[elemento]:=true;
end;

procedure Elegir(conjunto:TConjunto;var elemento:TElemento);
var
	encontrado:boolean;
	pos,i:integer;
begin
	Randomize;
	if(not(EsConjuntoVacio(conjunto)))then
		begin
			encontrado:=false;
			while (not(encontrado))do
				begin
					pos:=Random((ord(MAX-or(MIN))+1)+1;
					elemento:=MIN;
					for i:=1 to pos-1 do
						begin
							elemento:=succ(elemento);
						end;
					encontrado:=conjunto[elemento];
				end;
		end;
end;

function EsConjuntoVacio(conjunto:TConjunto):boolean;
begin
	EsConjuntoVacio:=Cardinal(conjunto)=0;
end;


function Pertenece(conjunto:TConjunto;elemento:TElemento);
begin
	Pertenece:=conjunto[elemento];
end;

function Cardinal(conjunto:TConjunto):integer;
var
	contador:integer;
	elemento:TElemento;
begin
	contador:=0;
	for elemento:=MIN to MAX do
		begin
			if(pertenece(conjunto,elemento))then
				begin
					contador:=contador+1;
				end;
			Cardinal:=contador;
		end;
end;

function EsSubconjunto(conjuntoA,conjuntoB:TConjunto9:boolean;
var
	pertenece:boolean;
	elemento:TElemento;
begin
	if(EsConjuntoVacio(conjuntoA))then
		begin
			EsSubconjunto:=true;
		end
	else
		begin
			pertenece:=true;
			elemento:=MIN;
			while((pertenece)and(elemento<MAX))do
				begin
					if(Pertenece(conjuntoA,elemento)then
						begin
							es:=Pertenece(conjuntoB,conjuntoA);
						end;
					elemento:=succ(elemento);
				end;
			if pertenece then
				begin
					if (Pertence(conjuntoA,MAX))then
						begin
							pertenece:=Pertenece(conjuntoB,elemento);
						end;
					EsSubconjunto:=es;
				end;
end;

FUNCTION SonConjuntosIguales(conjuntoA, conjuntoB: TConjunto): boolean;
	VAR
		sonIguales: boolean;
		elemento: TElemento;
	BEGIN
		IF Cardinal(conjuntoA) = Cardinal(conjuntoB) THEN BEGIN
			sonIguales := TRUE;
			elemento := MIN;
			WHILE (sonIguales) AND (elemento < MAX) DO BEGIN
				IF Pertenece(conjuntoA, elemento) THEN
					sonIguales := Pertenece(conjuntoB, elemento)
				ELSE
					sonIguales := NOT Pertenece(conjuntoB, elemento);
				elemento := succ(elemento);
			END;
			IF (sonIguales) THEN
				IF (Pertenece(conjuntoA, MAX)) THEN
					sonIguales := Pertenece(conjuntoB, MAX)
				ELSE
					sonIguales := NOT Pertenece(conjuntoB, MAX);
			SonConjuntosIguales := sonIguales;
		END
		ELSE
			SonConjuntosIguales := FALSE;
	END;

procedure quitar(var conjutno:TConjunto;elemento:TElemento);
begin
	conjunto[elemento]:=false;
end;

procedure Union(conjuntoA,conjuntoB:TConjunto;var resultado);
var
	elemento:TElemento;
begin
	CopiarConjunto(conjuntoB,resultado);
	if(not(EsConjuntoVacio(conjuntoA))then
		begin
			for elemento:=MIN to MAX do
				begin
					if(Pertenece(conjuntoA,elemento))then
						begin
							Poner(resultado,elemento);
						end;
				end;
		end;
end;

procedure Interseccion(conjuntoA,conjuntoB:TConjunto;var resultado);
var
	elemento:TElemento;
begin
	CrearConjuntoVacio(resultado);
	if(not(EsConjuntoVacio(conjuntoA))then
		begin
			for elemento:=MIN to MAX do
				begin
					if(Pertenece(conjuntoA,elemento)and Pertenece(conjuntoB,elemento))then
						begin
							Poner(resultado,elemento);
						end;
				end;
		end;
end;

procedure Diferencia(conjuntoA,conjuntoB:TConjunto;var resultado);
var
	elemento:TElemento;
begin
	CopiarConjunto(conjuntoA,resultado);
	for elemento:=MIN to MAX do
		begin
			if(Pertenece(conjuntoB,elemento) and Pertenece(conjuntoA,elemento))then
				begin
					Quitar(resultado,elemento);
				end;
		end;
end;

procedure CopiarConjunto(origen:TConjunto;var destino:TConjunto);
var
	elemento:TElemento;
begin
	CrearConjuntoVacio(destino);
	for elemento:=MIN to MAX do
		begin
			if(Pertence(origen,destino))then
				begin
					poner(origen,destino);
				end;
		end;
end;

procedure DestruirConjunto(var conjunto:TConjunto);
begin
	CrearConjuntoVacio(conjunto);
end;
end.

