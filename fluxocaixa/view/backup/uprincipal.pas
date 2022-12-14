unit uprincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, uconfigurabanco, utabela, ucad_padrao, IniFiles;

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
    procedure ler_ini;

  public

  end;

var
  frmprincipal: Tfrmprincipal;
  cfg_arqINI, cfg_pathApp: String;
  cfg_banco, cfg_servidor, cfg_usuario, cfg_senha: String;
  cfg_porta: Integer;

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
  cfg_pathApp      := ExtractFilePath(ParamStr(0));

  //ShowMessage(cfg_arqINI);

end;

procedure Tfrmprincipal.FormShow(Sender: TObject);
begin
  if not FileExists(cfg_arqINI) then
     btnConfigura.Click;
  ler_ini;

  try
   TabGlobal.conexao.Connect;
   ShowMessage('Conectado !!!');
  except
    on e: Exception do
        ShowMessage('Erro ao conectar ao banco'+sLineBreak+e.ClassName+sLineBreak+e.Message);
  end;

end;

  procedure Tfrmprincipal.ler_ini;
var
  ArqINI: TIniFile;
begin
  ArqINI := TIniFile.Create(cfg_arqINI);
  try
    cfg_banco    := ArqINI.ReadString('ConexaoDB','Banco','');
    cfg_servidor := ArqINI.ReadString('ConexaoDB','Servidor','');
    cfg_porta    := ArqINI.ReadInteger('ConexaoDB','Porta',3306);
    cfg_usuario  := ArqINI.ReadString('ConexaoDB','Usuario','');
    cfg_senha    := ArqINI.ReadString('ConexaoDB','Senha','');
    cfg_odbc     := ArqINI.ReadString('ConexaoDB','ODBC','mariadb ODBC 3.1 Driver');
  finally
    ArqINI.Free;
  end;

end;








end.

