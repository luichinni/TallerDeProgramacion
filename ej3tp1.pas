{
Netflix ha publicado la lista de películas que estarán disponibles durante el mes de diciembre de 2022. De cada película se conoce: código de película, código de género (1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado por las críticas. 
Implementar un programa modularizado que:
a. Lea los datos de películas y los almacene por orden de llegada y agrupados por código de género, en una estructura de datos adecuada. La lectura finaliza cuando se lee el código de la película -1. 
b. Una vez almacenada la información, genere un vector que guarde, para cada género, el código de película con mayor puntaje obtenido entre todas las críticas.
c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos métodos vistos en la teoría. 
d. Luego de ordenar el vector, muestre el código de película con mayor puntaje y el código de película con menor puntaje.
}
program ej3tp1;
const
	tope1=8;
type
rango1 = 1..tope1;

pelicula = record
	codigo_peli: integer;
	codigo_gen: rango1;
	puntaje: real;
end;

lista = ^nodo;
nodo = record
	elem: pelicula;
	sig: lista;
end;

vector = array [rango1] of lista;
vecMejores = array [rango1] of real;

//----------------------------------------------------------------------
// PUNTO A | ALMACENAR EN ORDEN DE LLEGADA Y POR CODIGO DE GENERO
procedure cargarPelis(var v:vector);
	procedure leerPeli(var p:pelicula);
	begin
		//readln(p.codigo_peli);
		p.codigo_peli:=random(10)-1;
		if(p.codigo_peli<>-1) then begin
			//readln(p.codigo_gen);
			p.codigo_gen:=random(7)+1;
			//readln(p.puntaje);
			p.puntaje:=random(10);
			writeln('|---------------------------------------------------------------|');
			writeln('|	codigo_p	|	codigo_g	|	puntaje	|');
			writeln('|		',p.codigo_peli,'	|	',p.codigo_gen,'		|	',p.puntaje:2:2,'	|');
		end;
	end;
	
	procedure insertarAdelante(var v:vector; p:pelicula);
	var
		nue:lista;
	begin
		new(nue); nue^.elem:=p; nue^.sig:=v[p.codigo_gen];
		v[p.codigo_gen]:=nue;
	end;
	
var
	p:pelicula;
begin
	leerPeli(p);
	while(p.codigo_peli<>-1)do begin
		insertarAdelante(v,p);
		leerPeli(p);
		if(p.codigo_peli=-1)then
			writeln('|---------------------------------------------------------------|');
	end;
end;
//----------------------------------------------------------------------
// PUNTO B | GUARDAR DE CADA GENERO EL CODIGO DE LA PELICULA CON MAYOR PUNTAJE
procedure mejoresPelis(var v:vecMejores; vP:vector);
	function buscarMejor(l:lista):real;
	var
		mejor:real;
	begin
		mejor:=-1;
		while (l<>nil) do begin
			if(l^.elem.puntaje>mejor)then begin
				mejor:=l^.elem.puntaje;
				writeln(mejor:2:2);
			end;
			l:=l^.sig;
		end;
		buscarMejor:=mejor;
	end;
var
	i:rango1;
begin
	for i:=1 to tope1 do begin
		v[i]:=buscarMejor(vP[i]);
	end;
end;
//----------------------------------------------------------------------
// PUNTO C | ORDENAR LAS MEJORES PELICULAS DE MENOR A MAYOR CON UNO DE LOS DOS METODOS VISTOS
// insercion
procedure ordenarMejores(var v:vecMejores);
var
	i,j:integer;
	actual: real;
begin
	for i:=2 to tope1 do begin // va de 2 a dL para comenzar a comparar los primeros
		actual:=v[i]; //actual v[2]
		j:=i-1; // j = 1
		while(j>0)and(v[j]>actual)do begin // si v[1] > v[2]
			v[j+1]:=v[j]; // v[2] = v[1]
			j:=j-1; // j = 0
		end;
		v[j+1]:=actual; // salido del if: v[1] = actual -> actual = v[2]
						// sin entrar al if: v[2] = v[2] (no se modifica)
	end;
end;
//----------------------------------------------------------------------
// PUNTO D | MOSTRAR CODIGO DE PELICULA DE MEJOR PUNTAJE Y DE MENOR PUNTAJE
procedure mostrarMejores(v:vecMejores);
	function buscarMenor(v:vecMejores):real;
	var
		i:integer; menor:real;
	begin
		menor:=9999;
		for i:=1 to tope1 do begin
			if(v[i]<menor) and (v[i]<>-1)then
				menor:=v[i]
		end;
		buscarMenor:=menor;
	end;

var
	menor:real;
begin
	menor:=buscarMenor(v);
	writeln('|-------------------------------|');
	writeln('|	Mayor	|	Menor	|');
	writeln('|	',v[tope1]:2:2,'	|	',menor:2:2,'	|');
	writeln('|-------------------------------|');
end;
//----------------------------------------------------------------------
// PP
var
	v:vector;
	vM:vecMejores;
	i:integer;
begin
	cargarPelis(v);
	mejoresPelis(vM,v);
	ordenarMejores(vM);
	for i:=1 to tope1 do begin
		writeln(vM[i]:2:2);
	end;
	mostrarMejores(vM);
end.
