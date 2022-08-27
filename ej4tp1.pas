{Una librería requiere el procesamiento de la información de sus productos. De cada producto se conoce el código del producto, código de rubro (del 1 al 8) y precio. 
Implementar un programa modularizado que:
a. Lea los datos de los productos y los almacene ordenados por código de producto y agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos finaliza cuando se lee el precio 0.
b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.
c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que puede haber más o menos de 30 productos del rubro 3. Si la cantidad de productos del rubro 3 es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto. 
d. Ordene, por precio, los elementos del vector generado en b) utilizando alguno de los dos métodos vistos en la teoría. 
e. Muestre los precios del vector ordenado.}
program ej4tp1;
const
	tope1=8;
	tope2=30;
type
rango1=1..tope1;
rango2=1..tope2;

prod = record
	cod_prod:integer;
	cod_rub:rango1;
	precio:real;
end;

lista = ^nodo;
nodo = record
	elem:prod;
	sig:lista;
end;

arrRubros = array [rango1] of lista;

arrProds = array [rango2] of prod;

//----------------------------------------------------------------------
// PUNTO A | LEER Y ALMACENAR ORDENADOS POR COD_PROD AGRUPADO POR RUBRO EN ArrRubros
procedure cargarProductos(var v:arrRubros);
	procedure initVec(var v:arrRubros);
	var
		i:integer;
	begin
		for i:=1 to tope1 do
			v[i]:=nil;
	end;

	procedure leerProd(var p:prod);
	begin
		//readln(p.precio);
		p.precio:=random(100);
		if(p.precio<>0)then begin
			//readln(p.cod_prod);
			p.cod_prod:=random(10);
			//readln(p.cod_rub);
			p.cod_rub:=random(tope1-1)+1;
		end;
	end;
	
	procedure guardarProd(var v:arrRubros;p:prod);
	var
		nue:lista;
	begin
		new(nue); nue^.elem:=p; nue^.sig:=v[p.cod_rub];
		v[p.cod_rub]:=nue;
	end;

var
	pr:prod;
begin
	initVec(v);
	leerProd(pr);
	while(pr.precio<>0)do begin
		guardarProd(v,pr);
		leerProd(pr);
	end;
end;

//----------------------------------------------------------------------
// PUNTO B | MOSTRAR CODIGOS DE LOS PROD DE CADA RUBRO
procedure mostrarCodigos(v:arrRubros);
var
	i:rango1;
	actual:lista;
begin
	for i:=1 to tope1 do begin
		actual:=v[i];
		writeln('Rubro [',i,']');
		while(actual<>nil) and (actual^.elem.cod_rub=i) do begin
			writeln('Codigo: ',actual^.elem.cod_prod);
			actual:=actual^.sig;
		end;
		writeln('|--------------------------------|');
	end;
end;

//----------------------------------------------------------------------
// PUNTO C | VECTOR DE A LO SUMO 30 DEL RUBRO 3 SI HAY MAS DE 30 PRODS, IGNORARLOS
procedure tomarProductos(var vn:arrProds;var dL:integer;l:lista);
begin
	dL:=0;
	while (l<>nil) and (dL<tope2) do begin
		dL:=dL+1;
		vn[dL]:=l^.elem;
		l:=l^.sig;
	end;
end;
//----------------------------------------------------------------------
// PUNTO D | ORDENAR POR PRECIO EL VECTOR DEL PUNTO C
procedure ordenarPrecio(var v:arrProds; dL:integer);
var
	actual:prod;
	j,i:integer;
begin
	for i:=2 to dL do begin
		actual:=v[i]; // actual = v[2]
		j:=i-1;	// j = 1
		while(j>0)and(v[j].precio>actual.precio)do begin // mientras v[1] es mayor a v[2] entonces cambiar
			v[j+1]:= v[j]; // desplazamos de adelante hacia atras
			j:=j-1;
		end;
		v[j+1]:=actual;
	end;
end;
//----------------------------------------------------------------------
// PUNTO E | MOSTRAR VECTOR DE PRECIOS ORDENADO
procedure mostrarVec(v:arrProds;dL:integer);
var
	i:integer;
begin
	for i:=1 to dL do begin
		writeln('|-----------------------------------------------|');
		writeln('|	prod	|	rubro	|	precio	|');
		writeln('|	',v[i].cod_prod,'	|	',v[i].cod_rub,'	|	',v[i].precio:2:2,'	|');
		if(i=dL)then
			writeln('|-----------------------------------------------|');
	end;
end;
//----------------------------------------------------------------------
// PP 
var
	vR:arrRubros;
	vP:arrProds;
	dL:integer;
begin
	cargarProductos(vR);
	mostrarCodigos(vR);
	tomarProductos(vP,dL,vR[3]);
	writeln('ORIGINAL');
	mostrarVec(vP,dL);
	ordenarPrecio(vP,dL);
	writeln('ORDENADO POR PRECIO');
	mostrarVec(vP,dL);
end.
