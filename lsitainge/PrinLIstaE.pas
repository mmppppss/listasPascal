Program Prin_ListaE;
uses UlistaE;

var
  L:Pnodo;
Begin
    CrearLista(L);
    InsertarPrimero(L,2);
    InsertarUltimo(L,5);
    INsertarPosicion(L,4,2);

    MostrarLista(L);

    readln;
end.
