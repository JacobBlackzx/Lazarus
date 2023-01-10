program fluxocaixa;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, zcomponent, uprincipal, uconfigurabanco, utabela, ucad_padrao, 
ucad_planoconta, classe_plano, classe_plano;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TTabGlobal, TabGlobal);
  Application.CreateForm(Tfrmprincipal, frmprincipal);
  Application.Run;
end.

