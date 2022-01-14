unit URecordEmpleados;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;
  type
    Empleado=record
      nombre: String[50];
      sexo :char;
      cargo:String[50];
      sueldo:Real;
      moneda:String[50];
    end;

implementation

end.

