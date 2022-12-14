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
    lblSenha: TLabel;
    lblUsuario: TLabel;
    lblServidor: TLabel;
    lblBanco: TLabel;
    lblConfiguraBanco: TLabel;
    lblPorta: TLabel;
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
    edtBanco.Text := ArqINI.ReadString('ConexaoDB','Banco','');
    edtServer.Text := ArqINI.ReadString('ConexaoDB','Servidor','');
    edtPorta.Text := IntToStr(ArqINI.ReadInteger('ConexaoDB','Porta',3306));
    edtUsuario.Text := ArqINI.ReadString('ConexaoDB','Usuario','');
    edtSenha.Text := ArqINI.ReadString('ConexaoDB','Senha','');
  finally
    ArqINI.Free;
  end;

end;

//





end.

