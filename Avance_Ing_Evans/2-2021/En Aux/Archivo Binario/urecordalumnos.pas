unit URecordAlumnos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;
  type

    { Alumnos }

    Alumno =Record
            ci:Integer;
            registro:Integer;
            nombre: String[50];
            sexo: char;
            domicilio  :String[100];
            INF110,LIN100,MAT101,FIS101,INF119: Real;
    end;

implementation

end.

