{
El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de las expensas de dichas oficinas. 
Implementar un programa modularizado que:
a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina se ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.
b. Ordene el vector, aplicando el método de inserción, por código de identificación de la oficina.
c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.
}
program ej2tp1;
const
	tope=300;
type
oficina = record
	codigo: integer;
	DNI: integer;
	valor: real;
end;

oficinasArr = array [1..tope] of oficina;

//----------------------------------------------------------------------
// PUNTO A | GENERAR VECTOR DE A LO SUMO 300
procedure cargarVector(var v:oficinasArr; var dL:integer);
	procedure leerOficina(var o:oficina);
	begin
		//writeln('Codigo oficina: ');
		//readln(o.codigo);
		o.codigo:=random(20)-1;
		//writeln(o.codigo);
		if(o.codigo <> -1)then begin
			//writeln('DNI: ');
			//readln(o.DNI);
			o.DNI:=random(20);
			//writeln(o.DNI);
			//writeln('Valor expensa: ');
			//readln(o.valor);
			o.valor:=random(20);
			//writeln(o.valor);
		end;
	end;
var
	ofis: oficina;
begin
	dL:=0;
	leerOficina(ofis);
	while(ofis.codigo <> -1)and(dL<tope) do begin
		dL:=dL+1;
		v[dL]:=ofis;
		leerOficina(ofis);
	end;
end;
//----------------------------------------------------------------------
// PUNTO B | ORDENAR VECTOR INSERCION 
procedure ordenarIns(var v:oficinasArr; dL:integer);
var
	i,j:integer;
	actual: oficina;
begin
	for i:=2 to dL do begin // va de 2 a dL para comenzar a comparar los primeros
		actual:=v[i]; //actual v[2]
		j:=i-1; // j = 1
		while(j>0)and(v[j].codigo>actual.codigo)do begin // si v[1] > v[2]
			v[j+1]:=v[j]; // v[2] = v[1]
			j:=j-1; // j = 0
		end;
		v[j+1]:=actual; // salido del if: v[1] = actual -> actual = v[2]
						// sin entrar al if: v[2] = v[2] (no se modifica)
	end;
end;
//----------------------------------------------------------------------
// PUNTO B | ORDENAR VECTOR POR SELECCION
procedure ordenarSel(var v:oficinasArr; dimL:integer);
var 
	i, j, pos: integer; item: oficina;		
begin
	for i:= 1 to dimL - 1 do begin // busca el mínimo y guarda en pos la posición
		pos := i;
		for j := i+1 to dimL do // comparamos con todos los elementos
			if (v[j].codigo < v[pos].codigo) then // si hay un codigo menor toma su posicion
				pos:=j;

		// intercambia v[i] y v[pos]
		item := v[pos];  
		v[pos] := v[i]; // cambiamos los elementos de lugar   
		v[i] := item; // terminamos de guardar
	end;
end;
//----------------------------------------------------------------------
procedure mostrarVec(v:oficinasArr;dL:integer);
var
	i:integer;
begin
	for i:=1 to dL do begin
		writeln('|-----------------------------------------------|');
		writeln('|	codigo	|	DNI	|	valor	|');
		writeln('|	',v[i].codigo,'	|	',v[i].DNI,'	|	',v[i].valor:2:2,'	|');
		if (i=dL) then
			writeln('|-----------------------------------------------|');
	end;
end;

var
	v:oficinasArr;
	dL:integer;
begin
	cargarVector(v,dL);
	mostrarVec(v,dL);
	writeln('Vector Cargado');
	ordenarIns(v,dL);
	writeln('Vector Ordenado');
	mostrarVec(v,dL);
	cargarVector(v,dL);
	mostrarVec(v,dL);
	writeln('Vector Cargado2');
	ordenarSel(v,dL);
	mostrarVec(v,dL);
	writeln('Vector Ordenado2');
end.
