
unit UListaE;
interface

   type 
   Pnodo = ^Nodo;
   Nodo = record
      Ele: Integer;
      Sig: Pnodo;
   end;

   Procedure CrearLista (Var L:Pnodo);
   FuncTion EsVacia (L:Pnodo):Boolean;
   Procedure InsertarPrimero (Var L:Pnodo;E:Integer);
   Function CantidadElementos(l:Pnodo):Integer;
   Procedure MostrarLista(L:Pnodo);
   Procedure INSERTARULTIMO(Var L:Pnodo;E:Integer);
   Procedure EliminarPrimero(Var L:Pnodo);
   Procedure EliminarElemento (var L:Pnodo;E:integer);

   Procedure MostrarListaVertical(L:Pnodo);
   function Primero(L:Pnodo):Integer;
   function Ultimo(L:Pnodo):Integer;
   Procedure InsertarPosicion(var L:Pnodo;E,pos:Integer);
   function Existe(L:Pnodo;E:Integer):Boolean;


 Implementation

 Procedure CrearLista (Var L:Pnodo);
   Begin
       L:=Nil;
   end;

FuncTion EsVacia (L:Pnodo):Boolean;
	Begin
		if L=nil then 
			Esvacia:= True
		else
			Esvacia:= false;
	end;

Procedure InsertarPrimero (Var L:Pnodo;E:Integer);
var
	N:Pnodo;
Begin
	if  Esvacia(L)=true then
		begin
			New(N);
			N^.Ele:=E;
			N^.sig:=Nil;
			L:=N;
		end
	else 
		begin
			New(N);
			N^.Ele:=E;
			N^.sig:=Nil;
			N^.Sig:=L;
			L:=N;
		end;
end;

Function CantidadElementos(l:Pnodo):Integer;
Var
	Aux:Pnodo;
	Cant:Integer;
Begin
	if EsVacia(L)=true then
		CantidadElementos:=0
	else
		begin
			Aux:=L;
			Cant:=0;
			While (Aux<>nil) do
				begin
					Cant:=Cant+1;
					Aux:=Aux^.sig;
				end;
			CantidadElementos:= cant;
		end;


end;


Procedure MostrarLista(L:Pnodo);
Var
   Aux:Pnodo;
Begin
	if EsVacia(L)=false then
       begin
       	 Aux:=L;
       	 While (aux<>nil) do
       	  begin
           write(Aux^.ele,'->');
       	  	aux:=aux^.sig;
       	  end;
       end
     ELSE
        WRITELN('LISTA VACIA');
end;


Procedure MostrarListaVertical(L:Pnodo);
Var
   Aux:Pnodo;
Begin
	if EsVacia(L)=false then
       begin
       	 Aux:=L;
       	 While (aux<>nil) do
       	  begin
            writeln(Aux^.ele);
       	  	aux:=aux^.sig;
       	  end;
       end;
end;


Procedure INSERTARULTIMO(Var L:Pnodo;E:Integer);
 var
    N,Aux:Pnodo;
 Begin
 	if Esvacia(L)=true then
 		InsertarPrimero(L,E)
    else
    	begin
    		New(N);
    		N^.Ele:=E;
    		N^.sig:=nil;
    		Aux:=L;
    		While (aux^.sig<>nil) do
    			aux:= aux^.sig;
    		aux^.sig:=N;		
    	end;
end;

Procedure EliminarPrimero(Var L:Pnodo);
var
	aux:Pnodo;
begin
	if Esvacia(L)=false then
		begin
		    aux:=L;
			L:=l^.sig;
			Dispose(aux);
		end;
end;

Procedure EliminarElemento (var L:Pnodo;E:integer);
Var
	Ant,Aux:Pnodo;
Begin
	if Esvacia(L)=true then
		writeln('La lista esta Vacia')
	else
	begin	
	if L^.ele=E then
		EliminarPrimero(L)
	else
		begin
			Aux:=L;
			While (aux^.ele<>E) and (aux^.sig<>nil) do
				begin
				    ant:=aux;
					aux:=aux^.sig;
			    end;
			if aux^.ele<>E then 
				writeln('El elemento no se encuentra en la Lista')
			else
			   begin
			   		ant^.sig:=aux^.sig;
			   		Dispose(aux);
			   end;
		end;
	end;
end;

Function Primero (L:Pnodo):Integer;
  begin
     if Not Esvacia(L) then
         Primero:= L^.Ele;
   end;

Function Ultimo(L:Pnodo):Integer;
var 
  Aux:Pnodo;
  begin
     if Not Esvacia(L) then
        begin
            aux:=L;
            While (aux^.sig<>Nil) do
               aux:= aux^.sig ;

            Ultimo := Aux^.ele;
       end;
  end;

 Procedure InsertarPosicion(var L:Pnodo;E,pos:Integer);
Var
  N,Ant,aux:Pnodo;
  x:integer;
Begin
     IF (Esvacia(L)=true) or (Pos<=1) then
         Insertarprimero(L,E)
     else
        if Pos> CantidadElementos(L) then
            InsertarUltimo(L,E)
        else
          begin
             Aux:=L;
             x:=1;
             while  (x<pos) do
               begin
                  ant:=aux;
                  aux:= aux^.sig;
                  x:=x+1;
               end;

               New(N);
               N^.ele:=E;
               ant^.sig:=N;
               n^.sig:=aux;

          end;
  end;
  function Existe(L:Pnodo;E:Integer):Boolean;
  var
    aux:Pnodo;
  begin
     Aux:=L;
     While (Aux<>Nil) and (aux^.ele<>E) do
        Aux:=aux^.sig;
     if  Aux^.ele = E then
         Existe:= true
     else
         Existe:=false;

  end;



Begin
end.
