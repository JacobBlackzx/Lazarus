unit ucad_padrao;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons;

type

  { Tfrmcad_padrao }

  Tfrmcad_padrao = class(TForm)
    btnAlterar: TSpeedButton;
    btnIncluir2: TSpeedButton;
    btnIncluir3: TSpeedButton;
    btnRemover: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    pnpTop: TPanel;
    pnpInferior: TPanel;
    btnIncluir: TSpeedButton;
  private

  public

  end;

var
  frmcad_padrao: Tfrmcad_padrao;

implementation

{$R *.lfm}

end.

