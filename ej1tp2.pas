{Implementar un programa que invoque a los siguientes módulos.
a. Implementar un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y los almacene en un vector con dimensión física igual a 10.
b. Implementar un módulo que imprima el contenido del vector.
c. Implementar un módulo recursivo que imprima el contenido del vector.
d. Implementar un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y retorne la cantidad de caracteres leídos. 
El programa debe informar el valor retornado.
e. Implementar un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y retorne una lista con los caracteres leídos.
f. Implemente un módulo recursivo que reciba la lista generada en d. e imprima los valores de la lista en el mismo orden que están almacenados.
g. Implemente un módulo recursivo que reciba la lista generada en d. e imprima los valores de la lista en orden inverso al que están almacenados.
}
program ej1tp2;
const
	dimF=10;
type

vec10 = array [1..dimF] of char;

lista = ^nodo;
nodo = record
	car:char;
	sig:lista;
end;

//----------------------------------------------------------------------
// PUNTO A | MODULO RECURSIVO QUE LEE SECUENCIA CHAR TERMINADA EN PUNTO Y GUARDA EN UN VECTOR DE DIMF = 10
procedure leerCaracteres(var v:vec10; var dL:integer);
var
	c:char;
begin
	if(dL<10)then begin
		readln(c);
		dL:=dL+1;
		v[dL]:=c; // el punto tambien se guarda ?
		if(c<>'.')then begin
			leerCaracteres(v,dL);
		end;
	end;
end;
//----------------------------------------------------------------------
// PUNTO B | MODULO QUE IMPRIME EL CONTENIDO DEL VECTOR
procedure impVec(v:vec10;dL:integer);
var
	i:integer;
begin
	for i:=1 to dL do
		writeln('[',i,']: ',v[i]);
end;
//----------------------------------------------------------------------
// PUNTO C | MODULO RECURSIVO QUE IMPRIME EL CONTENIDO DEL VECTOR
procedure impVecRecursivo(v:vec10;dL:integer);
begin
	if(dL>0)then begin
		writeln('[',dL,']: ',v[dL]);
		dL:=dL-1;
		impVecRecursivo(v,dL);
	end;
end;
//----------------------------------------------------------------------
// PUNTO D | MODULO QUE LEE SECUENCIA DE CHAR TERMINADA EN PUNTO Y RETORNA CANTIDAD LEIDOS
procedure contarCaracteres(var cant:integer);
var
	c:char;
begin
	readln(c);
	cant:=cant+1; // el punto tambien se cuenta ?
	if(c<>'.')then begin
		contarCaracteres(cant);
	end;
end;
//----------------------------------------------------------------------
// PUNTO E | MODULO QUE LEE SECUENCIA DE CHAR TERMINADA EN PUNTO Y RETORNA LISTA
procedure leerCaracteresLista(var l:lista);
	procedure agregarAdelante(var l:lista;c:char);
	var
		nue:lista;
	begin
		new(nue); nue^.car:=c; nue^.sig:=l;
		l:=nue;
	end;

var
	c:char;
begin
	readln(c);
	agregarAdelante(l,c); // el punto tambien se guarda ?
	if(c<>'.')then begin
		leerCaracteresLista(l);
	end;
end;
//----------------------------------------------------------------------
// PUNTO F | MODULO RECURSIVO Q IMPRIMA LISTA EN ORDEN DE ALMACENADO
procedure impLista(l:lista);
begin
	if(l<>nil)then begin
		writeln(l^.car);
		l:=l^.sig;
		impLista(l);
	end;
end;
//----------------------------------------------------------------------
// PUNTO G | MODULO RECURSIVO Q IMPRIMA LISTA EN ORDEN INVERSO DE ALMACENADO
procedure impListaInv(l:lista);
begin
	if(l<>nil) then begin
		impListaInv(l^.sig);
		writeln(l^.car);
	end;
end;
//----------------------------------------------------------------------
//PP
var
	v:vec10; dL,cant:integer;
	l:lista;
begin
	leerCaracteres(v,dL); // A
	impVec(v,dL); // B
	impVecRecursivo(v,dL); // C
	contarCaracteres(cant); // D
	writeln('caracteres leidos: ',cant);
	leerCaracteresLista(l); // E
	impLista(l); // F
	impListaInv(l); // G
end.
