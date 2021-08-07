unit unitTextoGUI;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,uTexto,UCadena;

type

  { TForm1 }

  TForm1 = class(TForm)
    Ejercicio7: TButton;
    cargarArchivoTexto: TButton;

    procedure Ejercicio7Click(Sender: TObject);
    procedure cargarArchivoTextoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public
      miAT:Texto;
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.cargarArchivoTextoClick(Sender: TObject);
begin
  miAT.abrir();

  while (not miAT.fin())do
        ShowMessage(miAT.leerLinea());
  miAT.cerrar
end;

procedure TForm1.Ejercicio7Click(Sender: TObject);
var s:string;
    cad:Cadena;
    c:char ;
    i,sc,sp,mayorPal,lineaMayorPal,mayorTermi,lineaMayorTermi:integer;
    sprom:Real;
    archivoInforma:Texto;

begin
  cad:=Cadena.crear();
  archivoInforma:=Texto.create();
   archivoInforma.setNom('Informe');
   archivoInforma.setExt('txt');
  archivoInforma.crear();
   archivoInforma.escribirLinea('línea  tot.car.  tot.Palabras   long.media  term.1ªPal.   igualTermin.');

 miAT.abrir();
 i:=1;
 sc:=0;
 sp:=0;
 sprom:=0;
 mayorPal:=-1;
 mayorTermi:=-1;
 while(not miAT.fin()) do
   begin
      s:=miAT.leerLinea();
      cad.cargarString(s);
       c:=cad.extraerUltCaracter();
       sc:=sc+cad.nroCaracteres();
       sp:=sp+cad.CantPal();
       archivoInforma.escribirLinea(IntToStr(i)+' '+IntToStr(cad.nroCaracteres())+' '+IntToStr(cad.contarPal())+' '+FloatToStr(cad.longitudMediaPal())+' '+c+' '+IntToStr(cad.nroPalabrasFinLetra(c)));
       sprom:=sprom+cad.longitudMediaPal();
       //Encontramos el mayor
       if(cad.CantPal()>mayorPal) then
         begin
           lineaMayorPal:=i;
           mayorPal:=cad.CantPal();
         end;
       if(cad.nroPalabrasFinLetra(c)>mayorTermi)then
        begin
           mayorTermi:=cad.nroPalabrasFinLetra(c);
           lineaMayorTermi:=i;
        end;

    //  ShowMessage(cad.mytoString());
     // ShowMessage(IntToStr(cad.nroCaracteres()));
      //ShowMessage(IntToStr(cad.contarPal()));
      // ShowMessage('Promedio de longitudes: '+FloatToStr(cad.longitudMediaPal()));

     ShowMessage('UltimoCaracter de la primer Palabra: '+c);
     ShowMessage('Palabras que finalizan en eso: '+IntToStr(cad.nroPalabrasFinLetra(c)));
     i:=i+1;
   end;

 archivoInforma.escribirLinea('total:'+IntToStr(i-1)+' líneas, '+IntToStr(sc)+' caracteres y '+IntToStr(sp)+' palabras. Long. media palabra = '+FloatToStr(sprom/(i-1)));
  archivoInforma.escribirLinea('Linea con más palabras: la nº '+IntToStr(lineaMayorPal)+' con ' +IntToStr(mayorPal)+' palabras ');
  archivoInforma.escribirLinea('La línea nº '+IntToStr(lineaMayorTermi)+' tiene el mayor nº de palabras que terminan como la primera: '+IntToStr(mayorTermi)+'.');

 archivoInforma.cerrar();
 miAT.cerrar();
end;



procedure TForm1.FormCreate(Sender: TObject);
begin
   miAT:=Texto.create();
   miAT.setNom('MiTEXTO');
   miAT.setExt('txt');
   miAT.crear();
    miAT.escribirLinea('Juan Perez');
    miAT.escribirLinea('Juan Pereza aterra');
    miAT.escribirLinea('Juan Holan que tal');
    miAT.cerrar();
end;

end.

