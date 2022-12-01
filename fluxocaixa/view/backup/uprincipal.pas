unit uprincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, uconfigurabanco;

type

  { Tfrmprincipal }

  Tfrmprincipal = class(TForm)
    lblFluxoCaixa: TLabel;
    pnpEsqueda: TPanel;
    shaLinhaPrincipal: TShape;
    btnContas: TSpeedButton;
    btnPlanos: TSpeedButton;
    btnLancamentos: TSpeedButton;
    btnSair: TSpeedButton;
    btnConfigura: TSpeedButton;
    procedure btnConfiguraClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  frmprincipal: Tfrmprincipal;
  cfg_arqINI: String;

implementation

{$R *.lfm}

{ Tfrmprincipal }

procedure Tfrmprincipal.btnSairClick(Sender: TObject);
begin
// Construtor sair do botão Tela Principal
  ShowMessage('Até Breve !!!');
  Application.Terminate;
end;

procedure Tfrmprincipal.btnConfiguraClick(Sender: TObject);
begin
  frmconfigurabanco := Tfrmconfigurabanco.Create(Self);
  try
    frmconfigurabanco.ShowModal;
  finally
    FreeAndNil(frmconfigurabanco);
  end;
end;

procedure Tfrmprincipal.FormCreate(Sender: TObject);
begin
// Formatação de Compatibilidade Microsoft e Linux
  {$IFDEF LINUX}
  // Formatação de Moedas
  CurrencyString    := 'R$';
  CurrencyFormat    := 2;
  DecimalSeparator  := ',';
  ThousandSeparator := '.';

  // Formatação de Datas
  DateSeparator     := '/';
  ShortDateFormat   := 'dd/mm/yyyy';
  {$ENDIF}

// Estrutura CFG
  cfg_arqINI       := ChangeFileExt(ParamStr(0),'ini');
  //ShowMessage(cfg_arqINI);

end;

procedure Tfrmprincipal.FormShow(Sender: TObject);
begin
  if not FileExists(cfg_arqINI) then
     btnConfigura.Click;

end;

  procedure Tfrmprincipal.ler_ini;
var
  ArqINI: TIniFile;
begin
  ArqINI := TIniFile.Create(cfg_arqINI);
  try
    edtBanco.Text := ArqINI.ReadString('ConexaoDB','Banco','');
    edtServer.Text := ArqINI.ReadString('ConexaoDB','Servidor','');
    edtPorta.Text := IntToStr(ArqINI.ReadInteger('ConexaoDB','Porta',3306));
    edtUsuario.Text := ArqINI.ReadString('ConexaoDB','Usuario','');
    edtSenha.Text := ArqINI.ReadString('ConexaoDB','Senha','');
  finally
    ArqINI.Free;
  end;

end;








end.

