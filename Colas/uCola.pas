unit uCola;
interface
uses
	uElemento
type
	TPuntero=^TNodo;
	TNodo=record
		info:tElemento
		sig:TPuntero;
	end;

	TCola=record
		principio,fin:TPuntero;
	end;

procedure CrearColaVacia(var cola:TCola);
procedure Insertar(var cola:TCola;elemento:tElemento);
procedure PrimeroCola(var elemento:tElemento;cola:TCola);
procedure Eliminar(var cola:TCola);
function EsColaVacia(cola:TCola):boolean;
function SonColasIguales(cola1,cola2:TCola):boolean;
procedure  MostrarCola(cola:TCola);
procedure CopiarCola(var destino:TCola;cola:TCola);
procedure DestruirCola(var cola:TCola);

implementation

procedure CrearColaVacia(var cola:TCola):
begin
	cola^.principio:=nil;
	cola^.fin:=nil;
end;

procedure Insertar(var cola:TCola;elemento:tElemento);
var
	aux:TPuntero;
begin
	new(aux);
	CopiarElemento(aux^.info,elemento);
	aux^.siguiente:=nil;
	if(EsColaVacia(cola))then
		begin
			cola.principio:=aux;
		end
	else
		begin
			cola.fin^.siguiente:=aux;
		end;
	cola.fin:=aux;
end;

procedure PrimeroCola(var elemento:tElemento;cola:TCola);
begin
	if (not(EsColaVacia(cola)))then
		begin
			CopiarElemento(elemento,cola.principio^.elemento);
		end;
end;

procedure Eliminar(var cola:TCola);
var
	aux:TPuntero;
begin
	if not(EsColaVacia(cola)))then
		begin
			aux:=cola.principio;
			cola.principio:=cola.principio^.sig;
			if(cola.principio=nil)then
				begin
					cola.fin:=nil;
				end;
			dispose(aux);
		end;
end;

function EsColaVacia(cola:TCola):boolean;
begin
	EsColaVacia:=(cola.principio=nil) and (cola.fin=nil);
end;

function SonColasIguales(cola1,cola2:TCola);
var
	sonIguales:boolean;
	pCola1,pCola2:TPuntero;
begin
	sonIguales:=true;
	pCola1:=cola1.principio;
	pCola2:=cola2.principio;
	while(sonIguales)and(pCola1<>nil)and(pCola2<>nil)do
		begin
			sonIguales:=SonElementosIguales(pCola1^.info,pCola2^.info);
			pCola1:=pCola1^.sig;
			pCola2:=pCola2^.sig;
		end;
	SonColaIguales:=(sonIguales)and(pCola1=nil)and(pCola2=nil);
end;

procedure MostrarCOla(cola:TCola);
var
	aux:TPuntero;
begin
	if (not(EsColaVacia(cola)))then
		begin
			aux:=cola.principio;
			while(aux^.sig<>nil)do
				begin
					MostrarElemento(aux^.info);
					aux:=aux^.sig;
				end;
			MostrarElemento(aux^.info);
		end;
end;

procedure CopiarCola(var destino:TCola,origen:TCola);
var
	aux:TPuntero;
begin
	CrearColaVacia(destino);
	aux:=origen.principio;
	while(aux<>nil)do
		begin
			Insertar(destino,aux^.info);
			aux:=aux^.sig;
		end;
end;

procedure DestruirCola(var cola:TCola);
begin
	while(not(EsColaVacia(cola)))do
		begin
			Eliminar(cola);
		end;
end;

