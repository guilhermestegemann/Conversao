unit uClassInformacaoAdicional;

interface

uses
    Classes, Contnrs;

type
   TObsCont = class
   public
      procedure Assign(obs: TObsCont);
   private
      fxCampo : string;{401b-Z05-Identificacao do Campo}
      fxTexto : string;{401c-Z06-Conteúdo do Campo}
   published
      property xCampo : String read fxCampo write fxCampo;
      property xTexto : String read fxTexto write fxTexto;
   end;
   TObsList = class(TObjectList)
   protected
      function GetItem(Index: Integer): TObsCont; {Retorna o objeto TObsCont que está na posição definida por Index}
      procedure SetItem(Index: Integer; obs : TObsCont); {Altera o objeto TObsCont que está na posição definida por Index}
   public
      constructor Create;
      function Add(obs : TObsCont) : integer; {Insere o item no final da coleção}
      function Remove(obs : TObsCont): Integer; {Remove da coleção o item}
      function IndexOf(obs : TObsCont): Integer; {Retorna a posição onde está localizado o item na coleção}
      procedure Insert(Index: Integer; obs : TObsCont); {Insere o item na posição indicada por Index}
      property Items[Index : integer] : TObsCont read GetItem write SetItem; default;
   end;
   TAdicional = class
   public
      obs : TObsList;
      constructor Create;   
   private
      finfAdFisco : string; {400-Z02-Informações adicionais de interesse do Fisco}
      finfCpl : string; {401-Z03-Informações complementares de interesse do contribuinte}
   published
      property infAdFisco : String read finfAdFisco write finfAdFisco;
      property infCpl : String read finfCpl write finfCpl;
   end;

implementation

{ TObsList }
function TObsList.Add(obs: TObsCont): integer;
var
   NovoObs : TObsCont;
begin
     NovoObs := TObsCont.Create;
     NovoObs.Assign(obs);
     Result := inherited Add(NovoObs);
end;

constructor TObsList.Create;
begin
     inherited Create;
end;

function TObsList.GetItem(Index: Integer): TObsCont;
begin
     Result := inherited Items[Index] as TObsCont;
end;

function TObsList.IndexOf(obs: TObsCont): Integer;
begin
     Result := inherited IndexOf(obs);
end;

procedure TObsList.Insert(Index: Integer; obs: TObsCont);
begin
     inherited Insert(Index, obs);
end;

function TObsList.Remove(obs: TObsCont): Integer;
begin
     Result := inherited Remove(obs);
end;

procedure TObsList.SetItem(Index: Integer; obs: TObsCont);
begin
     inherited Items[Index] := obs;
end;

{ TObsCont }

procedure TObsCont.Assign(obs: TObsCont);
begin
     xCampo := obs.xCampo;
     xTexto := obs.xTexto;
end;

{ TAdicional }

constructor TAdicional.Create;
begin
     inherited Create;
     obs := TObsList.Create;
end;

end.
