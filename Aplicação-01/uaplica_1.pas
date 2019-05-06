unit uAplica_1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnLimpar: TButton;
    btnInserir: TButton;
    btnSair: TButton;
    txtCaixa: TEdit;
    Label1: TLabel;
    procedure btnInserirClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure txtCaixaChange(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.txtCaixaChange(Sender: TObject);
begin

end;

procedure TForm1.btnLimparClick(Sender: TObject);
begin
  txtCaixa.text:='Limpar Caixa de Texto';
end;

procedure TForm1.btnSairClick(Sender: TObject);
begin
  ShowMessage('Até Breve !');
  Application.Terminate;
end;

procedure TForm1.btnInserirClick(Sender: TObject);
begin
  txtCaixa.text:='Inserir Dados na Caixa de Texto';
end;

end.

