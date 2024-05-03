
Program Principal_ListaE;



uses
  Estructura2;

var
  L:Pnodo;
begin
   CrearLista (L);
   InsertarPrimero(L,4);
   InsertarPrimero(L,8);
   InsertarUltimo(L,6);
   InsertarUltimo(L,2);
   
   MostrarLista(L);

   writeln('La lista tiene :', CantidadElementos(L));

   Writeln('Eliminando el primer Elemento...');
   Eliminarprimero(L);

   MostrarLista(L);
   Writeln('Eliminando el Elemento 6...');
   EliminarElemento(L,6);

   MostrarLista(L);

   readln;
end.
