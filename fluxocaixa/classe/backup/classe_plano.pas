unit classe_plano;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Controls, ExtCtrls, Dialogs, utabela, ZDataset;
//
  type

    { Tplano }

    Tplano = class

      private
        Fdescricao: String;
        Fid_plano: Integer;
        Ftipo: String;
        function retornaAI: Integer;

      public
        function incluir:Boolean;
        function localiza(codigo:Integer):Boolean;
      published

        property id_plano   : Integer read Fid_plano write Fid_plano;
        property descricao  : String read Fdescricao write Fdescricao;
        property tipo       : String read Ftipo write Ftipo;

    end;

implementation

{ Tplano }

function Tplano.retornaAI: Integer;
var qrAI: TZQuery;
begin
//
  qrAI := TZQuery.Create(nil);
  qrAI.Connection := TabGlobal.conexao;
  qrAI.SQL.Add('select coalesce(max(id_plano),0)+1 codigo ');
  qrAI.SQL.Add('from planos');
  qrAI.Open;
  Result := qrAI.FieldByName('codigo').Value;
//
  if Assigned(qrAI) then
     FreeAndNil(qrAI);
end;

function Tplano.incluir: Boolean;
//
var
  qrIncluir : TZQuery;
  cSQL      : String;
begin
//

cSQL:=  'INSERT INTO planos'+
        '(id_plano, descricao, tipo)'+
        'VALUES'+
        '(:id_plano, :descricao, :tipo)';

//
  qrIncluir            := TZQuery.Create(Nil);
  qrIncluir.Connection := TabGlobal.conexao;
  qrIncluir.SQL.Text:=cSQL;
//
  qrIncluir.ParamByName('id_plano').AsInteger:=retornaAI;
  qrIncluir.ParamByName('descricao').AsString:=descricao;
  qrIncluir.ParamByName('tipo').AsString:=tipo;
//
  try
    qrIncluir.ExecSQL;
    Result := True;
  Except
    on e: Exception do
       begin
         Result := False;
         ShowMessage('Erro ao incluir o plano'+sLineBreak+e.ClassName+sLineBreak+e.Message);
       end;
  end;
//
  if Assigned(qrIncluir) then
     FreeAndNil(qrIncluir);
end;

function Tplano.localiza(codigo: Integer): Boolean;
//
  var
    qrPesquisa: TZQuery;
  begin
  //
    qrPesquisa := TZQuery.Create(nil);
    qrPesquisa.Connection := TabGlobal.conexao;
    qrPesquisa.SQL.Add('select * from planos ');
    qrPesquisa.SQL.Add('where id_plano = :Ncodigo');
    qrPesquisa.ParamByName('Ncodigo').AsInteger:=codigo;
    qrPesquisa.Open;
    if qrPesquisa.RecordCount >= 1 then
       begin
         self.id_plano    := qrPesquisa.FieldByName('id_plano').AsInteger;
         self.descricao   := qrPesquisa.FieldByName('descricao').AsString;
         self.tipo        := qrPesquisa.FieldByName('tipo').AsString;
         Result := True;
       end
    else
        Result := False;
  //
    if Assigned(qrPesquisa) then
       FreeAndNil(qrPesquisa);
end;

end.

