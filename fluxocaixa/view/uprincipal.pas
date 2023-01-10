unit uprincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, IniFiles, uconfigurabanco, ucad_padrao, utabela;

type

  { Tfrmprincipal }

  Tfrmprincipal = class(TForm)
    lblFluxoDeCaixa: TLabel;
    pnpEsquerda: TPanel;
    Shape1: TShape;
    btnContas: TSpeedButton;
    btnPlanos: TSpeedButton;
    btnLancamentos: TSpeedButton;
    btnSair: TSpeedButton;
    btnConfigura: TSpeedButton;
    procedure btnConfiguraClick(Sender: TObject);
    procedure btnContasClick(Sender: TObject);
    procedure btnPlanosClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure ler_ini;

  public

  end;

var
  frmprincipal: Tfrmprincipal;
// Declaração de variavel para btns
  cfg_arqINI, cfg_pathApp: String;
// Variaveis para conexao ao banco de dados
  cfg_banco, cfg_servidor, cfg_usuario, cfg_senha, cfg_odbc: String;
  cfg_porta: Integer;

implementation

uses ucad_planoconta;

{$R *.lfm}

{ Tfrmprincipal }

procedure Tfrmprincipal.btnSairClick(Sender: TObject);
begin
  // Botão Sair do uprincipal
  ShowMessage('Até Breve !!!');
  Application.Terminate;
end;

procedure Tfrmprincipal.btnConfiguraClick(Sender: TObject);
begin
  // Habilitar tela uconfigurabanco
  frmConfiguraBanco := TfrmConfiguraBanco.Create(Self);
  try
    frmConfiguraBanco.ShowModal;
  finally
    FreeAndNil(frmConfiguraBanco);
  end;
end;

procedure Tfrmprincipal.btnContasClick(Sender: TObject);
begin
// Integrar Tela ucad_padrao
  frmcad_padrao := Tfrmcad_padrao.Create(Self);
  try
    frmcad_padrao.ShowModal;
  finally
    FreeAndNil(frmcad_padrao);
  end;
end;

procedure Tfrmprincipal.btnPlanosClick(Sender: TObject);
begin
  frmcad_planoconta := Tfrmcad_planoconta.Create(Self);
  try
    frmcad_planoconta.ShowModal;
  finally
    FreeAndNil(frmcad_planoconta);
  end;
end;

procedure Tfrmprincipal.FormCreate(Sender: TObject);
begin
// Compatibilidade via Microsoft e Linux
  {$IFDEF LINUX}
  // Formatação de moedas
  CurrencyString    :=  'R$';
  CurrencyFormat    :=     2;
  DecimalSeparator  :=   ',';
  ThousandSeparator :=   '.';
  // Formatação de datas
  DateSeparator     :=   '/';
  ShortDateFormat   := 'dd/mm/yyyy';
  {$ENDIF}

// Implementação de recursos
  cfg_arqINI     := ChangeFileExt(ParamStr(0),'.ini');
// Implementação de DLL para conexão ao banco MS
  cfg_pathApp    := ExtractFilePath(ParamStr(0));

end;

procedure Tfrmprincipal.FormShow(Sender: TObject);
begin
// Abrir Tela do Configura banco caso não configurado
  if not FileExists(cfg_arqINI) then
  btnConfigura.Click;
// Adicionar ini para ler os dados do banco
   ler_ini;

// Criar uma conexão ao banco de dados
   try
      TabGlobal.conexao.Connect;
      //ShowMessage('Conectado ...');
   except
     on e: Exception do
        ShowMessage('Erro ao Conectar ao banco'+sLineBreak+e.ClassName+sLineBreak+e.Message);
   end;

end;

// Função para Ler Dados - Inicio
procedure Tfrmprincipal.ler_ini;
// Declarar leitura
var
  ArqINI : TIniFile;
begin
// Habilitar leitura da procedure declarada
   ArqINI    := TIniFile.Create(cfg_arqINI);

// Paramentros para a conexao e gravação do DB
   try
     cfg_banco    := ArqINI.ReadString('ConexaoDB','Banco',''); // Gravar String
     cfg_servidor := ArqINI.ReadString('ConexaoDB','Servidor','');
     cfg_porta    := ArqINI.ReadInteger('ConexaoDB','Porta',3306); // Gravar Inteiro
     cfg_usuario  := ArqINI.ReadString('ConexaoDB','Usuario','');
     cfg_senha    := ArqINI.ReadString('ConexaoDB','Senha','');
     cfg_odbc     := ArqINI.ReadString('ConexaoDB','ODBC','mariadb ODBC 3.1 Driver');
   finally
     ArqINI.Free;
   end;
end;

end.

