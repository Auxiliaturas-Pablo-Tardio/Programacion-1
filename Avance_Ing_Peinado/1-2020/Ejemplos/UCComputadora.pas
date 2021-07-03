unit UCComputadora;

interface
 uses Sysutils ;
 type
 Computadora = Class
   private
    ram : Word;
    procesador: String;
    disco: Word;
    marca : String;

    Public
    procedure cambiarTamDisco(nuevoDisco:Word);
    procedure aumentarRam(nuevaRam:Word);
    function verDisco();
    function verRam();
 End;


implementation

procedure Computadora.cambiarTamDisco(nuevoDisco:Word)  ;
begin
    disco:= nuevoDisco;
end;

function Computadora.verRam(): Word;
begin
 Result:=  ram;
end;

end.
