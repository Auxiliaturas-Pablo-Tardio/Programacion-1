program Sueldos;
var horario,horas,horasExtra:integer;
    tarifaN,tarifaE,sueldoExtra,sueldoNormal,sueldo:Real;

begin
  writeln('Introduzca Horario, nocturno=0 ,diurno=1');
   readln(horario) ;
   writeln ('Cuantas horas trabajo?');
   readln(horas);
   case horario of
        0: begin
            tarifaN:=1.8;
            tarifaE:=2.5;
        end;
        1: begin
            tarifaN:=1.3;
            tarifaE:=2.1;
        end;
   end;
   if( horas>8) then
   begin
       horasExtra:=horas-8;
        sueldoExtra:=horasExtra*tarifaE;
        sueldoNormal:=8*tarifaN;
        sueldo:=sueldoExtra+sueldoNormal;
   end
   else
   begin
      sueldo:=horas*tarifaN;
   end;
writeln ('El sueldo es: ',sueldo:10:2);
readln;
end.

