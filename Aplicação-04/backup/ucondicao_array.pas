unit ucondicao_array;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnProcessa: TButton;
    btnSair: TButton;
    edtData: TEdit;
    Label1: TLabel;
    Memo1: TMemo;
    procedure btnProcessaClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.btnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.btnProcessaClick(Sender: TObject);
var
  cNomeDiaDaSemana : array[1..7] of string = ('Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sabado');
  dData : TDateTime;

begin
  {
  Memo1.Lines.Add(cNomeDiaDaSemana[DayOfWeek(date)]);
  }
  dData:= StrToDate(edtData.Text);
  Memo1.Lines.Add('Dia da Semana: '+ cNomeDiaDaSemana[DayOfWeek(dData)]);
end;

end.

