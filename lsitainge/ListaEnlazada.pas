program ListaE;

uses crt;

type 
   Pnodo = ^Nodo;
   Nodo = record
      Ele: Integer;
      Sig: Pnodo;
   end;

//  OPERACIONES DE LA LISTA

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

Procedure EliminarUltimo(var L:PNodo);
var
  Ant,aux:Pnodo;
begin
    if Esvacia(L) then
    else
      begin
        aux:=L;
        while (aux^.sig<>nil ) do
           begin
              ant:=aux;
              aux:=aux^.sig;
           end;
        ant^.sig:=nil;
        dispose(aux);   
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

Procedure EliminarPosicion(var L:Pnodo;Pos:integer);
Var
	Ant,Aux:Pnodo;
	i:integer;
Begin
	if Esvacia(L)=true then
		writeln('La lista esta Vacia')
	else
	 Begin
          if pos=1 then
              Eliminarprimero(L)
          else 
              if  pos>=cantidadelementos(L) then
                  EliminarUltimo(L)
              else
                 begin
                 Aux:=L;
                 i:=1;
			      While (i<pos)  do
				    begin
				       ant:=aux;		
					   aux:=aux^.sig;
					   i:=i+1;
			        end;
			        ant^.sig:=aux^.sig;
			   		Dispose(aux);
                 end;
	 end;
end;



// HASTA AQUI SON LAS OPERACIONES DE LA LISTA

Var
  L:Pnodo;
  e:integer;
BEGIN
   crearLista(L);
   InsertarPrimero(L,5);
   Insertarultimo(L,8);
   INsertarPrimero(L,2);
   InsertarUltimo(L,1);

   MostrarLIsta(L);

   write('Que elemento desea elimina?: ');
   readln(e);

   EliminarElemento(L,e);
   
   MostrarLista(L);


   write('Que posicion desea eliminar?: ');
   readln(e);

   EliminarPosicion(L,e);
   MostrarLista(L);

   readln;
END.

