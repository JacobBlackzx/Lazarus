unit ucadastro_de_clientes;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TCadastro }

  TCadastro = class(TForm)
    btnCadastrar: TButton;
    btnLimpar: TButton;
    btnSair: TButton;
    edtMatricula: TEdit;
    edtNome: TEdit;
    edtSobrenome: TEdit;
    edtEndereco: TEdit;
    edtIdade: TEdit;
    edtDataDeNascimento: TEdit;
    labCadastroDeFuncionarios: TLabel;
    labSobrenome: TLabel;
    labMatricula: TLabel;
    labNome: TLabel;
    labEndereco: TLabel;
    labIdade: TLabel;
    labDataDeNascimento: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure labCadastroDeFuncionariosClick(Sender: TObject);
  private

  public

  end;

var
  Cadastro: TCadastro;

implementation

{$R *.lfm}

{ TCadastro }

procedure TCadastro.labCadastroDeFuncionariosClick(Sender: TObject);
begin

end;

procedure TCadastro.FormCreate(Sender: TObject);
begin

end;

end.

