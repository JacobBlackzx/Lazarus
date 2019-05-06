unit uaplica_2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnMostrarMensagem: TButton;
    chkMostrarSobrenome: TCheckBox;
    edtNome: TEdit;
    edtSobrenome: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure btnMostrarMensagemClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.btnMostrarMensagemClick(Sender: TObject);
begin
  if chkMostrarSobrenome.Checked then
     ShowMessage('Olá ' +edtNome.Text+ ' ' +edtSobrenome.Text)
  else
      ShowMessage('Olá ' +edtNome.Text);
end;

end.

