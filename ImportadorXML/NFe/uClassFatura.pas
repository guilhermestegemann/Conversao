unit uClassFatura;

interface
uses
    Classes, Contnrs;

Type
   {Dados da Cobrança da NF-e}
   TFatura = class
   private
      fnFat : String; {391-Y03-Número da fatura}
      fvOrig : String; {392-Y04-Valor Original da Fatura}
      fvDesc : String; {393-Y05-Valor do Desconto}
      fvLiq : String; {394-Y06-Valor Liquido da Fatura}
   published
      property nFat : String read fnFat write fnFat;
      property vOrig : String read fvOrig write fvOrig;
      property vDesc : String read fvDesc write fvDesc;
      property vLiq : String read fvLiq write fvLiq;
   end;
   TDuplicata = class
   public
      procedure Assign(duplicata: TDuplicata);
   private
      fnDup : String; {396-Y08-Número da Duplicata}
      fdVenc : String; {397-Y09-Data de Vencimento}
      fvDup : String; {398-Y10-Valor da Duplicata}
   published
      property nDup : String read fnDup write fnDup;
      property dVenc : String read fdVenc write fdVenc;
      property vDup : String read fvDup write fvDup;
   end;
   {Representa uma lista de Itens(Objetos do tipo TDuplicata)}
   TDupList = class(TObjectList)
   protected
      function GetItem(Index: Integer): TDuplicata; {Retorna o objeto TDuplicata que está na posição definida por Index}
      procedure SetItem(Index: Integer; duplicata : TDuplicata); {Altera o objeto TItem que está na posição definida por Index}
   public
      constructor Create;
      function Add(duplicata : TDuplicata) : integer; {Insere o item no final da coleção}
      function Remove(duplicata : TDuplicata): Integer; {Remove da coleção o item}
      function IndexOf(duplicata : TDuplicata): Integer; {Retorna a posição onde está localizado o item na coleção}
      procedure Insert(Index: Integer; duplicata : TDuplicata); {Insere o item na posição indicada por Index}
      property Items[Index : integer] : TDuplicata read GetItem write SetItem; default;
   end;
   {Cobranca}
   TCobranca = class
   Public
      fat : TFatura;
      dup : TDupList;
      constructor Create;
   end;

implementation

{ TCobranca }
constructor TCobranca.Create;
begin
     inherited Create;
     fat := TFatura.Create;
     dup := TDupList.Create;
end;

{ TDupList }
function TDupList.Add(duplicata: TDuplicata): integer;
var
   NovaDup : TDuplicata;
begin
     NovaDup := TDuplicata.Create;
     NovaDup.Assign(duplicata);
     Result := inherited Add(NovaDup);
end;

constructor TDupList.Create;
begin
     inherited Create;
end;

function TDupList.GetItem(Index: Integer): TDuplicata;
begin
     Result := inherited Items[Index] as TDuplicata;
end;

function TDupList.IndexOf(duplicata: TDuplicata): Integer;
begin
     Result := inherited IndexOf(duplicata);
end;

procedure TDupList.Insert(Index: Integer; duplicata: TDuplicata);
begin
     inherited Insert(Index, duplicata);
end;

function TDupList.Remove(duplicata: TDuplicata): Integer;
begin
     Result := inherited Remove(duplicata);
end;

procedure TDupList.SetItem(Index: Integer; duplicata: TDuplicata);
begin
     inherited Items[Index] := duplicata;
end;

{ TDuplicata }
procedure TDuplicata.Assign(duplicata: TDuplicata);
begin
     nDup := duplicata.nDup;
     dVenc := duplicata.dVenc;
     vDup := duplicata.vDup;
end;

end.
