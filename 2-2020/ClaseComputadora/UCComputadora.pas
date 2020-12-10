unit UCComputadora;

interface
Type    Computadora=Class
Private
    //Atributos de la clase
    ram: integer;
    monitor: String;
    teclado: boolean;
    almacenamiento: Cardinal;
Public
     //constructor ComputadoraCreate;
     Function mostrarPantalla: String;
     //Function sonar: integer;
     Procedure setMonitor( nuevoMonitor: String);
End;

implementation
Procedure Computadora.setMonitor( nuevoMonitor: String);
begin
   monitor:=nuevoMonitor;
end;
Function Computadora.mostrarPantalla :String;
var s: String;
begin
   // El NOMBREDEMONITOR esta mostrando algo
   s:= 'El '+ monitor+ ' esta mostrando algo';
  Result:= s;
end;

end.
