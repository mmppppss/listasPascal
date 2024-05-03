program ListaEnlazada;

uses crt;

type
	PNodo=^Nodo;
	Nodo = record
		Ele: Integer;
		Sig: PNodo;
	END;


PROCEDURE CrearLista(VAR L:PNodo);
BEGIN
	L:=NIL;
END;
	
FUNCTION esVacia(L:PNodo):Boolean;
BEGIN
	esVacia:=L=NIL;
END;

PROCEDURE InsertarPrimero(VAR L:PNodo; E:Integer);
VAR
	N:PNodo;
BEGIN
	if esVacia(L) then
	BEGIN
		New(N);
		N^.Ele:=E;
		N^.Sig:=NIL;
		L:=N;
	END
	else
	BEGIN
		New(N);
		N^.Ele:=E;
		N^.Sig:=NIL;
		N^.Sig:=L;
		L:=N;
	END;
END;

PROCEDURE MostrarLista(VAR L:PNodo);
VAR
	Aux:PNodo;
BEGIN
	if esVacia(L) then
		write('NIL')
	else
	BEGIN
		Aux:=L;
		while(Aux<>NIL) do
		BEGIN
			write(Aux^.Ele,' -> ');
			Aux:=Aux^.Sig;
		END;
		writeLn('NIL');
	END;
END;

PROCEDURE intercalar(L1:PNodo; L2:PNodo; var L3:PNodo);
BEGIN
	while(L1<>NIL) or (L2<>NIL) do
	BEGIN
		if L1<>NIL then
		BEGIN
			InsertarPrimero(L3,L1^.Ele);
			L1:=L1^.Sig;
		END;

		if L2<>NIL then
		BEGIN
			InsertarPrimero(L3,L2^.Ele);
			L2:=L2^.Sig;
		END;
	END;
END;


FUNCTION CantidadElementos(VAR L:PNodo):Integer;
VAR
	Aux:PNodo;
	Cont:Integer;
BEGIN
	Cont:=0;
	Aux:=L;
	while(Aux<>NIL) do
	BEGIN
		Cont:=Cont+1;
		Aux:=Aux^.Sig;
	END;
	CantidadElementos:=Cont;
END;




PROCEDURE InsertarElementos (VAR L:PNodo; E:Integer);
VAR
	N,Aux:PNodo;
BEGIN
	if esVacia(L) then
		InsertarPrimero(L,E)
	else
	BEGIN
		New(N);
		N^.Ele:=E;
		N^.Sig:=NIL;
		Aux:=L;
		while(Aux^.Sig<>NIL) do
			Aux:=Aux^.Sig;
		Aux^.Sig:=N;
	END;
END;


PROCEDURE EliminarPrimero (VAR L:PNodo);
VAR
	Aux:PNodo;
BEGIN
	if EsVacia(L) then
		write('Lista Vacia')
	else
	BEGIN
		Aux:=L;
		L:=L^.Sig;
		Dispose(Aux)
	END;
END;

FUNCTION sumarElementos(VAR L:PNodo):Integer;
VAR
	Cont:Integer;
BEGIN
	Cont:=0;
	while(L<>NIL) do
	BEGIN
		Cont:=Cont+L^.Ele;
		L:=L^.Sig;
	END;
	sumarElementos:=Cont;
END;

PROCEDURE EliminarElemento(VAR L:PNodo; E:Integer);
VAR
	Aux:PNodo;
	Ant:PNodo;
BEGIN
	if esVacia(L) then
		EliminarPrimero(L)
	else
	BEGIN
		Aux:=L;
		while(E<>Aux^.Ele) and (Aux^.Sig<>NIL) do
		BEGIN
			Ant:=Aux;
			Aux:=Aux^.Sig;
		END;
		if E=Aux^.Ele then
		BEGIN
			Ant^.Sig:=Aux^.Sig;
			Dispose(Aux);
		END
	END;
END;


VAR
	L:Pnodo;
	L2,L3:PNodo;
	e:integer;
BEGIN
	CREARLISTA(L);
	InsertarPrimero(L,20);
	InsertarPrimero(L,30);
	InsertarPrimero(L,40);
	InsertarPrimero(L,50);
	InsertarPrimero(L,60);
	InsertarPrimero(L,70);
	InsertarPrimero(L,80);
	InsertarPrimero(L,90);
	InsertarPrimero(L,100);
	
	CREARLISTA(L2);
	InsertarPrimero(L2,1);
	InsertarPrimero(L2,2);
	InsertarPrimero(L2,3);
	InsertarPrimero(L2,4);
	InsertarPrimero(L2,5);
	InsertarPrimero(L2,6);

	MostrarLista(L);
	MostrarLista(L2);
	CrearLista(L3);
	intercalar(L,L2,L3);
	MostrarLista(L3);
	writElN('SUMA: ',sumarElementos(L));
	MostrarLista(L);
{	writeln('La lista tiene :', CantidadElementos(L));

	Writeln('Eliminando el primer Elemento...');
	EliminarPrimero(L);

	MostrarLista(L);
	Writeln('Eliminando el Elemento 4...');
	EliminarElemento(L,4);

	mostrarLista(L);}
END.
