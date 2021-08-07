unit UPersonaRecord;

{$mode objfpc}{$H+}

interface

uses
   SysUtils;
 type
     Persona=Record
       CI:integer;
       Reg:integer;
       Nombre:string[30];
       Domicilio:string[40];
       INF110,LIN100,MAT101,FIS101,INF119:Real;
     end;

implementation

end.

