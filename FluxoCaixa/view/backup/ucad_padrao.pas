unit ucad_padrao;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  ComCtrls, StdCtrls;

type
// Estrutura para Clique nos Botões
  TCliqueBotao = (cbIncluir, cbAlterar, cbNone);

  { Tfrmcad_padrao }

  Tfrmcad_padrao = class(TForm)
    edtPesquisa: TEdit;
    pgc: TPageControl;
    pnpPesquisar: TPanel;
    pnpRodape: TPanel;
    pnpSuperior: TPanel;
    btnIncluir: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnRemover: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnPesquisar: TSpeedButton;
    tsPesquisa: TTabSheet;
    tsCadastro: TTabSheet;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure botao_edicao(lFLAG:boolean);
  public

  end;

var
  frmcad_padrao: Tfrmcad_padrao;
  cliqueBotao: TCliqueBotao;

implementation

{$R *.lfm}

{ Tfrmcad_padrao }

procedure Tfrmcad_padrao.FormShow(Sender: TObject);
begin
  botao_edicao(False);
end;

procedure Tfrmcad_padrao.btnIncluirClick(Sender: TObject);
begin
  botao_edicao(True);
  cliqueBotao:=cbIncluir;
end;

procedure Tfrmcad_padrao.btnRemoverClick(Sender: TObject);
begin
  botao_edicao(False);
end;

procedure Tfrmcad_padrao.btnSalvarClick(Sender: TObject);
begin
  botao_edicao(False);
end;

procedure Tfrmcad_padrao.btnAlterarClick(Sender: TObject);
begin
  botao_edicao(True);
  cliqueBotao:=cbAlterar;
end;

procedure Tfrmcad_padrao.btnCancelarClick(Sender: TObject);
begin
  botao_edicao(False);
end;

procedure Tfrmcad_padrao.botao_edicao(lFLAG: boolean);
begin
  btnIncluir.Visible:=not lFLAG;
  btnAlterar.Visible:=not lFLAG;
  btnRemover.Visible:=not lFLAG;
  btnSalvar.Visible:=     lFLAG;
  btnCancelar.Visible:=   lFLAG;
end;

end.

