unit uvariaveis;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TfrmVariaveis }

  TfrmVariaveis = class(TForm)
    btnProcessa: TButton;
    Memo1: TMemo;
    procedure btnProcessaClick(Sender: TObject);
  private

  public

  end;

var
  frmVariaveis: TfrmVariaveis;

implementation

{$R *.lfm}

{ TfrmVariaveis }

procedure TfrmVariaveis.btnProcessaClick(Sender: TObject);
var
  cNome : string;
  nIdade : integer;
  lMaiorIdade : boolean;
begin
     cNome := 'Vitor Hugo';
     nIdade:= 31;
     Memo1.Lines.Add('Nome= '+cNome+' Idade='+ IntToStr(nIdade));

     if nIdade >= 18 then
        Memo1.Lines.Add('Vitor Hugo é maior de Idade !')
     else
         Memo1.Lines.Add('Vitor Hugo é menor de Idade !');
end;

end.

