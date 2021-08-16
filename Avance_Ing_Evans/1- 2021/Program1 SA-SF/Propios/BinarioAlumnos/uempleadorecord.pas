unit UEmpleadoRecord;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;
  type
      Empleado=Record
        nombre:string[30];
        sexo:char;
        cargo:string[20];
        sueldo:real;
        moneda:string[10];
      end;

implementation

end.

