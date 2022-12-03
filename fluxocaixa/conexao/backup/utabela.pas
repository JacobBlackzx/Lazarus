unit utabela;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, ZConnection;

type

  { TTabGlobal }

  TTabGlobal = class(TDataModule)
    conexao: TZConnection;
    procedure conexaoBeforeConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private

  public

  end;

var
  TabGlobal: TTabGlobal;

implementation

{$R *.lfm}

{ TTabGlobal }

procedure TTabGlobal.DataModuleCreate(Sender: TObject);
begin

end;

procedure TTabGlobal.conexaoBeforeConnect(Sender: TObject);
begin
  conexao.Database     :=cfg_banco;
  conexao.HostName     :=cfg_servidor;
  conexao.User         :=cfg_usuario;
  conexao.Password     :=cfg_senha;
  conexao.Port         :=cfg_porta;

  conexao.AutoCommit   :=True;
// Estrutura para conexão a banco de dados Microsoft
  {$IFDEF WINDOWS}
          conexao.LibraryLocation := cfg_pathApp+'libmariadb.dll';
  {$ENDIF}
end;

end.

