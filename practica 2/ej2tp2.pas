{Realizar un programa que lea números hasta leer el valor 0 e imprima, para cada número leído, sus dígitos en el orden en que aparecen en el número. Debe implementarse un módulo recursivo que reciba el número e imprima lo pedido. Ejemplo si se lee el valor 256, se debe imprimir 2  5  6}
program ej2tp2;

procedure impEnOrden(n:integer);
var
	modu:integer;
begin
	if(n<>0)then begin
		modu:=n MOD 10; // me da el ultimo numero
		n:=n DIV 10; // me da el resto de numeros
		impEnOrden(n); // continuo la recursion
		write(modu,' '); // imprimo en orden inverso
	end;
end;

var
	n:integer;
begin
	readln(n);
	while(n<>0)do begin
		impEnOrden(n);
		writeln;
		readln(n);
	end;
end.
