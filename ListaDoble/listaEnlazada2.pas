program ListaEnlazadaDoble;

uses crt;

type
	PNodo=^Nodo;
	Nodo = record
		Ele: Integer;
		Sig: PNodo;
		Ant: PNodo;
	END;


PROCEDURE CrearLista(VAR L:PNodo);
BEGIN
	L:=NIL;
END;
	
FUNCTION EsVacia(L:PNodo):Boolean;
BEGIN
	EsVacia:=L=NIL;
END;

PROCEDURE InsertarPrimero(VAR L:PNodo; E:Integer);
VAR
	N:PNodo;
BEGIN
	New(N);
	N^.Ele:=E;
	N^.Sig:=L;
	N^.Ant:=NIL;
	L:=N;
END;

PROCEDURE MostrarListaSig(VAR L:PNodo);
VAR
	Aux:PNodo;
BEGIN	
	Aux:=L;
	while(Aux<>NIL) do
	BEGIN
		write(Aux^.Ele,' -> ');
		Aux:=Aux^.Sig;
	END;
	writeLn('NIL');
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
BEGIN
	CREARLISTA(L);
	InsertarPrimero(L,1);
	InsertarPrimero(L,2);
	InsertarPrimero(L,3);
	InsertarPrimero(L,4);

	MostrarLista(L);

	writeln('La lista tiene : ', CantidadElementos(L));

	Writeln('Eliminando el primer Elemento...');
	EliminarPrimero(L);

	writeln('La lista tiene : ', CantidadElementos(L));
	MostrarLista(L);
	//Writeln('Eliminando el Elemento 4...');
	//EliminarElemento(L,3);

	mostrarLista(L);
END.
