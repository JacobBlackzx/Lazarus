unit uconfigurabanco;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, IniFiles;

type

  { Tfrmconfigurabanco }

  Tfrmconfigurabanco = class(TForm)
    btnSalvar: TButton;
    btnCancelar: TButton;
    edtBanco: TEdit;
    edtSenha: TEdit;
    edtUsuario: TEdit;
    edtServer: TEdit;
    edtPorta: TEdit;
    edtODBC: TEdit;
    lblSenha: TLabel;
    lblUsuario: TLabel;
    lblServidor: TLabel;
    lblBanco: TLabel;
    lblConfiguraBanco: TLabel;
    lblPorta: TLabel;
    lblDriverODBC: TLabel;
    shaLinhaCB: TShape;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
     procedure salva_ini;
     procedure ler_ini;
  public

  end;

var
  frmconfigurabanco: Tfrmconfigurabanco;

implementation
 uses uprincipal;

{$R *.lfm}

{ Tfrmconfigurabanco }

procedure Tfrmconfigurabanco.btnSalvarClick(Sender: TObject);
begin
  salva_ini;
  Close;
end;

procedure Tfrmconfigurabanco.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrmconfigurabanco.FormShow(Sender: TObject);
begin
  ler_ini;
end;

procedure Tfrmconfigurabanco.salva_ini;
// Criar Variavel
var
  ArqINI: TIniFile;
begin
  ArqINI := TIniFile.Create(cfg_arqINI);
  try
    ArqINI.WriteString('ConexaoDB','Banco',edtBanco.Text);
    ArqINI.WriteString('ConexaoDB','Servidor',edtServer.Text);
    ArqINI.WriteInteger('ConexaoDB','Porta',StrToIntDef(edtPorta.Text,3306));
    ArqINI.WriteString('ConexaoDB','Usuario',edtUsuario.Text);
    ArqINI.WriteString('ConexaoDB','Senha',edtSenha.Text);
    ArqINI.WriteString('ConexaoDB','ODBC',edtODBC.Text);
  finally
    ArqINI.Free;
  end;
end;

procedure Tfrmconfigurabanco.ler_ini;
var
  ArqINI: TIniFile;
begin
  ArqINI := TIniFile.Create(cfg_arqINI);
  try
    edtBanco.Text := ArqINI.ReadString('ConexaoDB','Banco','fluxo_caixa');
    edtServer.Text := ArqINI.ReadString('ConexaoDB','Servidor','localhost');
    edtPorta.Text := IntToStr(ArqINI.ReadInteger('ConexaoDB','Porta',3306));
    edtUsuario.Text := ArqINI.ReadString('ConexaoDB','Usuario','suporte');
    edtSenha.Text := ArqINI.ReadString('ConexaoDB','Senha','91V75h@91');
    edtODBC.Text := ArqINI.ReadString('ConexaoDB','ODBC','mariadb ODBC 3.1 Driver');
  finally
    ArqINI.Free;
  end;

end;

//





end.

