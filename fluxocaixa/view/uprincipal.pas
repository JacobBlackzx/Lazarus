unit uprincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons;

type

  { Tfrmprincipal }

  Tfrmprincipal = class(TForm)
    Label1: TLabel;
    pnpEsquerda: TPanel;
    Shape1: TShape;
    btnContas: TSpeedButton;
    btnPlanos: TSpeedButton;
    btnLancamentos: TSpeedButton;
    btnSair: TSpeedButton;
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  frmprincipal: Tfrmprincipal;

implementation

{$R *.lfm}

{ Tfrmprincipal }

procedure Tfrmprincipal.FormCreate(Sender: TObject);
begin
    {$IFDEF LINUX}
    // Formatação de moeda
    CurrencyString := 'R$';
    CurrencyFormat := 2;
    DecimalSeparator := ',';
    ThousandSeparator := '.';

    // Formatação de datas
    DateSeparator := '/';
    ShortDateFormat := 'dd/mm/yyyy';
    {$ENDIF}
end;

procedure Tfrmprincipal.btnSairClick(Sender: TObject);
begin
    ShowMessage('Até Breve!!!');
    Application.Terminate;
end;





end.

