unit UArchivoFicheroReal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;
  type

    { ArchivoReal }

    ArchivoReal=class
       f:file of Real;
       nom,ext:string;
       modo:integer;
      public
         constructor crear(nombre:string;extNueva:string);
                 procedure abrir();
                 procedure cerrar();
                 procedure setNombre(nombre:string);
                 procedure setExt(extensionNueva:string);
                 procedure escribirReal(r:Real);
                 function getNombreCompleto():string;
                 function getExt():string;
                 function leerReal():Real;
                 function fin():boolean;
                 function copiar():ArchivoReal;
                 procedure eliminar();
                 function mostrarDatos(cantidadPorLinea:Integer):String;
    end;


implementation

{ ArchivoReal }

constructor ArchivoReal.crear(nombre: string; extNueva: string);
begin
         //0:=LECTURA
       //1:=Escritura
   nom:=nombre;
   ext:=extNueva;
   modo:=3;
   assign(f,getNombreCompleto());
    {$I-}
       rewrite(f); //rewrite= si existe un archivo con el mismo nombre, lo sobreescribe (no debe estar abierto)
                 //SI NO EXISTE lo crea
    {$I+}
    if(IOResult<>0)then
    begin
         WriteLn('ERROR AL CREAR EL ARCHIVO DE REAL :'+ getNombreCompleto());

    end;

    modo:=0 //LECTURA
end;

procedure ArchivoReal.abrir();
begin
  assign(f,getNombreCompleto());
  {$I-}
       reset(f);
  {$I+}
     if(IOResult<>0)then
    begin
         WriteLn('ERROR AL LEER/ABRIR EL ARCHIVO DE TEXTO :'+ getNombreCompleto());
         exit;
    end;
    modo:=1 //Escritura
end;

procedure ArchivoReal.cerrar();
begin
 close(f);
  modo:=0;
end;

procedure ArchivoReal.setNombre(nombre: string);
begin
   nom:=nombre;
end;

procedure ArchivoReal.setExt(extensionNueva: string);
begin
  ext:=extensionNueva;
end;

procedure ArchivoReal.escribirReal(r: Real);
begin
    write(f,r);
end;

function ArchivoReal.getNombreCompleto(): string;
begin
   Result:=nom+'.'+ext;
end;

function ArchivoReal.getExt(): string;
begin
      Result:=ext;
end;

function ArchivoReal.leerReal(): Real;
var r:Real;
  begin
         if(modo=1)then
         begin
              read(f,r); //s:=leerLinea(archivo );
              Result:=r;

         end
         else
         begin
            Result:=null;

         end;

end;

function ArchivoReal.fin(): boolean;
begin
  Result:=EOF(f);
end;

function ArchivoReal.copiar(): ArchivoReal;
begin

end;

procedure ArchivoReal.eliminar();
begin

end;

function ArchivoReal.mostrarDatos(cantidadPorLinea: Integer): String;
var s:string;
  r:Real;
  c:integer;
begin
c:=0;
abrir();
  while (not fin())do
  begin
       r:=leerReal();
       s:=s+FloatToStr(r)+'│'; //alt+179
       c:=c+1;
       if(c=cantidadPorLinea)then
       begin
         s:=s+Chr(10)+Chr(13);
       end;

  end;
cerrar();
 Result:=s;
end;

end.

