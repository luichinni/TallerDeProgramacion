{Realizar un programa que lea números y que utilice un procedimiento recursivo que escriba el equivalente en binario de un número decimal. El programa termina cuando el usuario ingresa el número 0 (cero). }
program ej6tp2;

procedure convertirBinario(num:integer);
var
	resto:integer;
begin
	if(num<>1)then begin // comparamos si es el numero es 1
		resto:=num MOD 2; // Obtenemos el resto (bit de la cadena)
		num:=num DIV 2; // obtenemos siguiente numero a evaluar
		convertirBinario(num); // obtenemos los siguientes bits
		write(resto); // los imprimimos en orden inverso
	end else begin
		write('1'); // si es el numero es 1 no se divide, se toma como está
	end;
end;

// PP
var
	n:integer;
begin
	readln(n);
	convertirBinario(n);
end.
