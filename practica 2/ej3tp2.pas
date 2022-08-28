{Escribir un programa que:
a. Implemente un módulo recursivo que genere una lista de números enteros “random” mayores a 0 y menores a 100. Finalizar con el número 0.
b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista. 
c. Implemente un módulo recursivo que devuelva el máximo valor de la lista. 
d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado se encuentra en la lista o falso en caso contrario. }
program ej3tp2;
type

lista= ^nodo;
nodo=record
	elem:integer;
	sig:lista;
end;

//----------------------------------------------------------------------
// PUNTO A | MODULO RECURSIVO Q GENERA LISTA DE NUMEROS RANDOM 0 < N < 100 (TERMINA EN 0; SE PROCESA?)
procedure generarLista(var l:lista);
	procedure addFront(var l:lista; n:integer);
	var
		nue:lista;
	begin
		new(nue); nue^.elem:=n; nue^.sig:=l;
		l:=nue;
	end;
var
	n:integer;
begin
	n:=random(99);
	if(n<>0)then begin // genLista->addFront = lista ordenada como agregar atras
		generarLista(l); // addFront->genLista = lista ordenada como agregar adelante
		addFront(l,n);
		writeln('[',n,']');
	end;
end;

//----------------------------------------------------------------------
// PUNTO B | RETORNAR EL MINIMO DE LA LISTA GENERADA
{procedure minL(l:lista; var min:integer);
begin
	if(l<>nil)then begin
		if(l^.elem<min)then
			min:=l^.elem;
		minL(l^.sig,min);
	end;
end;}

function minL(l:lista):integer;
var
	n:integer;
begin
	if(l<>nil)then begin
		n:=minL(l^.sig);
		if(l^.elem < n) then
			minL:=l^.elem
		else
			minL:=n;
	end 
	else begin
		minL:=9999;
	end
end;
//----------------------------------------------------------------------
// PUNTO C | RETORNAR EL MAXIMO DE LA LISTA GENERADA
{procedure maxL(l:lista; var max:integer);
begin
	if(l<>nil)then begin
		if(l^.elem>max)then
			max:=l^.elem;
		maxL(l^.sig,max);
	end;
end;}

function maxL(l:lista):integer;
var
	n:integer;
begin
	if(l<>nil)then begin
		n:=maxL(l^.sig);
		if(l^.elem > n) then
			maxL:=l^.elem
		else
			maxL:=n;
	end 
	else begin
		maxL:=-1;
	end
end;
//----------------------------------------------------------------------
// PUNTO D | RETORNAR VERDADERO SI UN VALOR SE ENCUENTRA EN LA LISTA
{procedure existe(l:lista;n:integer;var si:boolean);
begin
	if(l<>nil) and (si<>TRUE)then
		if(l^.elem<>n)then
			existe(l^.sig,n,si)
		else
			si:=TRUE;
end;}

function existe(l:lista;n:integer):boolean;
begin
	if(l<>nil)then begin
		if (existe(l^.sig,n)<>TRUE) then begin
			if(n=l^.elem)then
				existe:=TRUE;
		end else
			existe:=TRUE;
	end;
end;
//----------------------------------------------------------------------
// PP
var
	l:lista;
	min,max,a:integer;
	exist:boolean;
begin
	l:=nil; max:=0; min:=9999;
	generarLista(l); // A
	//minL(l,min); // B
	min:=minL(l); 
	//maxL(l,max); // C
	max:=maxL(l);
	writeln('Min: ',min,' | Max: ',max);
	exist:=FALSE;
	while(exist<>TRUE)do begin
		a:=random(10)+1;
		exist:=existe(l,a); // D
		writeln(a,' = ',exist);
		//existe(l,a,exist);
	end;
	writeln(a,' = ',exist);
	
end.
