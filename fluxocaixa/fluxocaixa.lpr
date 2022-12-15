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
ucad_planoconta
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TTabGlobal, TabGlobal);
  Application.CreateForm(Tfrmprincipal, frmprincipal);
  Application.CreateForm(Tfrmcad_padrao, frmcad_padrao);
  Application.CreateForm(Tfrmcad_planoconta, frmcad_planoconta);
  Application.Run;
end.

