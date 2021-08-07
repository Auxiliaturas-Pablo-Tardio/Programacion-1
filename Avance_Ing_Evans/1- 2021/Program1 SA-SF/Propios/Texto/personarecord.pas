unit PersonaRecord;

{$mode objfpc}{$H+}

interface
uses
  Classes, SysUtils;
type
         Persona=Record
           ci: integer;
           nom: String[30];
           app: String [40];
           sex:char;
         end;


implementation

end.

