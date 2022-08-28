{Implementar un módulo que realice una búsqueda dicotómica en un vector, utilizando el siguiente encabezado:
   	Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice); 

Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra en el vector.}
program ej5tp2;
const
	dF=20;
type
indice=-1..dF;
vector = array [indice] of integer;

//----------------------------------------------------------------------
// GEN VECTOR DEL PUNTO 4 Y ORDENAR 
procedure genVector(var v:vector;indice,dF:integer);
begin
	if(indice<=dF)then begin
		readln(v[indice]);
		writeln('[',indice,']: ',v[indice]);
		genVector(v,indice+1,dF);
	end;
end;
//----------------------------------------------------------------------

procedure busquedaDicotomica(v:vector; ini,fin:indice; dato:integer; var pos:indice);
var
	medio:indice;
begin
	//writeln(fin,'-',ini,': ',(fin-ini));
	if((fin-ini)>2)then begin
		if(ini<>1)then
			medio:=(fin DIV 2)+(ini DIV 2)
		else
			medio:=fin DIV 2;
		
		//writeln(medio);
		//readln;
			
		if(dato<>v[medio])then begin
			if(dato<v[medio])then
				busquedaDicotomica(v,ini,medio,dato,pos)
			else
				busquedaDicotomica(v,medio,fin,dato,pos);
		end else begin
			pos:=medio;
		end;
	end else begin
		// casos base extra
		if(v[ini]=dato)then
			pos:=ini
		else if (v[fin]=dato)then
			pos:=fin
		else if (v[ini+1]=dato)then
			pos:=ini+1
		else
			pos:=-1;
	end;
		
end;

var
	v:vector;
	i,dato:integer;
	pos:indice;
begin
	i:=1;
	genVector(v,i,dF);
	dato:=v[4];
	busquedaDicotomica(v,1,dF,dato,pos);
	writeln('Pos de ',dato,' en vector: ',pos);
end.
