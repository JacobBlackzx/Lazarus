unit uagenda;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TfrmAgenda }

  TfrmAgenda = class(TForm)
    btnIncluir: TButton;
    btnProximo: TButton;
    btnPrimeiro: TButton;
    btnAnterior: TButton;
    btnUltimo: TButton;
    btnNovo: TButton;
    edtComplemento: TEdit;
    edtTelefone_Res: TEdit;
    edtTelefone_Serv: TEdit;
    edtCelular: TEdit;
    edtEmail: TEdit;
    edtSobrenome: TEdit;
    edtNome: TEdit;
    edtEndereco: TEdit;
    edtCodigo: TEdit;
    labCodigo: TLabel;
    labComplemento: TLabel;
    labSobrenome: TLabel;
    labEmail: TLabel;
    labTelefone_Res: TLabel;
    labTelefone_Serv: TLabel;
    labCelular: TLabel;
    Nome: TLabel;
    labEndereco: TLabel;
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private

  public

  end;

var
  frmAgenda: TfrmAgenda;

implementation

{$R *.lfm}

{ TfrmAgenda }

procedure TfrmAgenda.btnSairClick(Sender: TObject);
begin
  ShowMessage('Contato Salvo com Sucesso!!!');
  Application.Terminate;
end;

procedure TfrmAgenda.btnCadastrarClick(Sender: TObject);
begin
  ShowMessage('Contato Cadastrado');
end;

end.

