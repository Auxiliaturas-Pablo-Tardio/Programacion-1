unit UVector;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;
const MAX_ELE = 1200;
type

{ vector }

vector = class
  private
     dim :integer;
     elem :array [1..MAX_ELE] OF integer;
  public
      constructor crear;
       procedure ordenar;
       procedure ordenarInicioFin(posa,posb:integer);
       procedure setDim(newDim:integer);
       function getDim():integer;
       procedure setEle(pos:integer;newElem:integer);
       function getEle(pos:integer):integer;
        procedure intercambiar(posa,posb:integer);
        function myToString():string;
        procedure intercalar(a,b,c:vector);
        procedure intercalarOrdenado(a,b:vector);
        procedure intercalarOrdenadoV2(a, b: vector);
       end;
implementation
        constructor vector.crear;
    var i :integer;
    begin
         for i:=1 to MAX_ELE do
         begin
             elem[i]:=0;
         end;
         dim:=0;
    end;
    function vector.getDim():integer;
    begin
         Result:=dim;
    end;

    procedure vector.setDim(newDim:integer);
    begin
         dim:=newDim;
    end;
    procedure vector.setEle(pos:integer;newElem:integer);
    begin
         elem[pos]:=newElem;
    end;

    function vector.getEle(pos: integer): integer;
    begin
      Result:=elem[pos];
    end;

    procedure vector.ordenar;
    var i,j,x: integer;
    begin
       for i:=1 to dim-1 do
       begin
          for j:=i+1 to dim do
          begin
             if (elem[i]<elem[j])then
              begin
                intercambiar(i,j);
              end;
          end;
       end;
    end;
    procedure vector.ordenarInicioFin(posa,posb:integer);
    var i,j,x: integer;
    begin
       if ((posa<dim) and (posb<=dim) and (posa<posb))then
       begin


       for i:=posa to posb-1 do
       begin
          for j:=i+1 to posb do
          begin
             if (elem[i]<elem[j])then
              begin
                intercambiar(i,j);
              end;
          end;
       end;
       end;
    end;
    procedure vector.intercambiar(posa,posb:integer);
    var x:integer;
    begin
         x:=elem[posa];
         elem[posa]:=elem[posb];
         elem[posb]:=x;
    end;

    function vector.myToString():string;
    var s:string; i:integer;
    begin
        s:='';
        for i:=1 to dim do
        begin
           s:=s+IntToStr(elem[i])+',';
        end;
        Result:=s;
    end ;

    procedure vector.intercalar(a,b,c:vector);
    var mayorI,i,ri,sumaDim:integer;

    begin
         crear();
          sumaDim:=a.getDim()+b.getDim()+c.getDim();
          setDim(sumaDim);
         if ( (a.getDim()>b.getDim()) and (a.getDim()>c.getDim())) then

            mayorI:=a.getDim();
         if ( (b.getDim()>a.getDim()) and (b.getDim()>c.getDim())) then
          mayorI:=b.getDim();
         if ( (c.getDim()>a.getDim()) and (c.getDim()>b.getDim())) then
          mayorI:=c.getDim();
         ri:=1;

         for i:=1 to mayorI do
         begin
            if(i<=c.getDim())then
             begin
               setEle(ri,c.getEle(i));
               ri:=ri+1;
             end;

            if(i<=a.getDim())then
             begin
               setEle(ri,a.getEle(i));
               ri:=ri+1;
             end;
            if(i<=b.getDim())then
             begin
               setEle(ri,b.getEle(i));
               ri:=ri+1;
             end;
         end;

    end;

    procedure vector.intercalarOrdenado(a, b: vector);
     var dimMayor,i,j,ir,elemActual:integer;
         esValidoA,esValidoB:boolean;
    begin
         ir:=1;
         dim:=a.getDim()+b.getDim();
         j:=1;
         i:=1;
       while ((i <= a.getDim()) or (j<=b.getDim()) ) do
       begin
          //Ambos elementos existen
          if((i<=a.getDim()) and (j<=b.getDim()))then
          begin
               if( (a.getEle(i))>(b.getEle(j)))then
                begin
                   elemActual:=a.getEle(i);
                   while((elemActual=a.getEle(i)) and (i<=a.getDim()) ) do
                   begin
                     elem[ir]:=a.getEle(i);
                     ir:=ir+1;
                     i:=i+1;
                   end;
                   elemActual:=b.getEle(j);
                   while((elemActual=b.getEle(j)) and (j<=b.getDim()) ) do
                   begin
                     elem[ir]:=b.getEle(j);
                     ir:=ir+1;
                     j:=j+1;
                   end;
                end else
                begin
                  elemActual:=b.getEle(j);
                   while((elemActual=b.getEle(j)) and (j<=b.getDim()) ) do
                   begin
                     elem[ir]:=b.getEle(j);
                     ir:=ir+1;
                     j:=j+1;
                   end;

                   elemActual:=a.getEle(i);
                    while((elemActual=a.getEle(i)) and (i<=a.getDim()) ) do
                   begin
                     elem[ir]:=a.getEle(i);
                     ir:=ir+1;
                     i:=i+1;
                   end;
                end;

          end

          else if(i<=a.getDim() ) then
          begin
             // a tiene elementos
               elem[ir]:=a.getEle(i);
               ir:=ir+1;
                 i:=i+1;
          end
          else if (j<=b.getDim() )then
          begin
          // b tiene elementos
             elem[ir]:=b.getEle(j);
             ir:=ir+1;
             j:=j+1;
          end;



       end;
    end;

    procedure vector.intercalarOrdenadoV2(a, b: vector);
    var i,j,ir:integer;
    begin
      ir:=1;
      j:=1;
      i:=1;
      dim:=a.getDim()+b.getDim();
     while((i<=a.getDim()) or (j<=b.getDim())) do
     begin
     //Existen ambos
     if((i<=a.getDim()) and (j<=b.getDim()))then
     begin

        if((a.getEle(i))>(b.getEle(j)))  then
        begin
          elem[ir]:=a.getEle(i);
          i:=i+1;
          ir:=ir+1;
        end
        else
        begin
          elem[ir]:=b.getEle(j);
          j:=j+1;
          ir:=ir+1
        end;

     end
        else if(i<=a.getDim() ) then
          begin
             // a tiene elementos
               elem[ir]:=a.getEle(i);
               ir:=ir+1;
                 i:=i+1;
          end
          else if (j<=b.getDim() )then
          begin
          // b tiene elementos
             elem[ir]:=b.getEle(j);
             ir:=ir+1;
             j:=j+1;
          end;
    end;

     end;

end.

