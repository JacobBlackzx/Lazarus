unit uprincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons;

type

  { Tfrmprincipal }

  Tfrmprincipal = class(TForm)
    lblFluxoCaixa: TLabel;
    pnpEsquerda: TPanel;
    shaLinha: TShape;
    btnContas: TSpeedButton;
    btnPlanos: TSpeedButton;
    btnLancamento: TSpeedButton;
    btnSair: TSpeedButton;
    btnConfigura: TSpeedButton;
    procedure btnSairClick(Sender: TObject);
  private

  public

  end;

var
  frmprincipal: Tfrmprincipal;

implementation

{$R *.lfm}

{ Tfrmprincipal }

procedure Tfrmprincipal.btnSairClick(Sender: TObject);
begin
// Construtor para habilitar evento sair do botão Sair da Tela Principal
  ShowMessage('Até Breve !!!');
  Application.Terminate;
end;

end.

