unit uconfigurabanco;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons, IniFiles;

type

  { TfrmConfiguraBanco }

  TfrmConfiguraBanco = class(TForm)
    edtBanco: TEdit;
    edtODBC: TEdit;
    edtPorta: TEdit;
    edtUsuario: TEdit;
    edtServidor: TEdit;
    edtSenha: TEdit;
    lblBanco: TLabel;
    lblDriverODBC: TLabel;
    lblPorta: TLabel;
    lblUsuario: TLabel;
    lblServidor: TLabel;
    lblConfiguraBanco: TLabel;
    lblSenha: TLabel;
    Shape1: TShape;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
// Criação de procedure para SA
      procedure  salva_ini;
      procedure ler_ini;
  public

  end;

var
  frmConfiguraBanco: TfrmConfiguraBanco;

implementation
// Implementar form uprincipal no uconfigurabanco
  uses uprincipal;

{$R *.lfm}

{ TfrmConfiguraBanco }

procedure TfrmConfiguraBanco.btnSalvarClick(Sender: TObject);
begin
  salva_ini;
  Close;
end;

procedure TfrmConfiguraBanco.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConfiguraBanco.FormShow(Sender: TObject);
begin
// Habilitar a leitura do INI Conexão leitura e gravação
  ler_ini;
end;

// Função para Salvar - Inicio
procedure TfrmConfiguraBanco.salva_ini;
// Declaração de variavel
var
  ArqINI : TIniFile;
begin
  ArqINI := TIniFile.Create(cfg_arqINI);
  try

// Paramentros para a conexao e leitura do DB
    ArqINI.WriteString('ConexaoDB','Banco',edtBanco.Text); // Ler String
    ArqINI.WriteString('ConexaoDB','Servidor',edtServidor.Text);
    ArqINI.WriteInteger('ConexaoDB','Porta', StrToIntDef(edtPorta.Text,3306)); // Diferente ler Inteiro
    ArqINI.WriteString('ConexaoDB','Usuario',edtUsuario.Text);
    ArqINI.WriteString('ConexaoDB','Senha',edtSenha.Text);
    ArqINI.WriteString('ConexaoDB','ODBC',edtODBC.Text);
  finally
    ArqINI.Free;
  end;
end;

// Função para Salvar - Final

// Função para Ler Dados - Inicio
procedure TfrmConfiguraBanco.ler_ini;
// Declarar leitura
var
  ArqINI : TIniFile;
begin
// Habilitar leitura da procedure declarada
   ArqINI    := TIniFile.Create(cfg_arqINI);

// Paramentros para a conexao e gravação do DB
   try
     edtBanco.Text    := ArqINI.ReadString('ConexaoDB','Banco',''); // Gravar String
     edtServidor.Text := ArqINI.ReadString('ConexaoDB','Servidor','');
     edtPorta.Text    := IntToStr(ArqINI.ReadInteger('ConexaoDB','Porta',3306)); // Gravar Inteiro
     edtUsuario.Text  := ArqINI.ReadString('ConexaoDB','Usuario','');
     edtSenha.Text    := ArqINI.ReadString('ConexaoDB','Senha','');
     edtODBC.Text     := ArqINI.ReadString('ConexaoDB','ODBC','');
   finally
     ArqINI.Free;
   end;
end;

// Função para Ler Dados - Final







end.

