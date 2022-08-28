{Escribir un programa que:
a. Implemente un módulo recursivo que genere un vector de 20 números enteros “random” mayores a 0 y menores a 100. 
b. Implemente un módulo recursivo que devuelva el máximo valor del vector. 
c. Implementar un módulo recursivo que devuelva la suma de los valores contenidos en el vector.}
program ej4tp2;
const
	tope1=20;
type

vector = array [1..tope1] of integer;

//----------------------------------------------------------------------
// PUNTO A | GENERAR VECTOR DE 20 NUMEROS ALEATORIOS 0 < N < 100 CON RECURSIVIDAD
procedure genVector(var v:vector;indice,dF:integer);
begin
	if(indice<=dF)then begin
		v[indice]:=random(98)+1;
		writeln('[',indice,']: ',v[indice]);
		genVector(v,indice+1,dF);
	end;
end;
//----------------------------------------------------------------------
// PUNTO B | HALLAR MAXIMO CON RECURSIVIDAD EN VECTOR
function maxV(v:vector;indice,dF:integer):integer;
var
	ant:integer;
begin
	if(indice<=dF)then begin
		ant:=maxV(v,indice+1,dF);
		if(v[indice]>ant)then begin
			maxV:=v[indice];
			//writeln('Max: ',ant)
		end else begin
			//writeln('Max: ',ant);
			maxV:=ant;
		end;
	end;
end;

//----------------------------------------------------------------------
// PUNTO C | RETORNAR SUMA RECURSIVA DE LOS ELEMENTOS
function sumarV(v:vector;indice,dF:integer):integer;
begin
	if(indice<dF)then
		sumarV:=v[indice]+sumarV(v,indice+1,dF)
	else
		sumarV:=v[indice];
end;

//----------------------------------------------------------------------
// PP
var
	v:vector;
	max,i,suma:integer;
begin
	i:=1;
	genVector(v,i,tope1); // A
	i:=1;
	max:=maxV(v,i,tope1); // B
	writeln('Max: ',max);
	i:=1;
	suma:=sumarV(v,i,tope1); // C
	writeln('Suma: ',suma);
end.
