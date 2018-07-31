unit uClassReferenciada;

interface
uses
    Contnrs;

type
   {Grupo de informação das NF/NF-e referenciadas}
   TReferenciada = class
   public
      procedure Assign(referenciada: TReferenciada);
   private
      frefNFe  : String; {Chave de acesso da NF-e referenciada}
      fcUF     : String; {dados para NFProdutor}
      fAAMM    : String; {dados para NFProdutor}
      fCNPJ    : String; {dados para NFProdutor}
      fCPF     : String; {dados para NFProdutor}
      fIE      : String; {dados para NFProdutor}
      fmodelo  : String; {dados para NFProdutor e CF}
      fserie   : String; {dados para NFProdutor}
      fnNF     : String; {dados para NFProdutor}
      fnECF    : String; {dados para CF}
      fnCOO    : String; {dados para CF}
   published
      property refNFe : String read frefNFe write frefNFe;
      property cUF    : String read fcUF write fcUF;
      property AAMM   : String read fAAMM write fAAMM;
      property CNPJ   : String read fCNPJ write fCNPJ;
      property CPF    : String read fCPF write fCPF;
      property IE     : String read fIE write fIE;
      property modelo : String read fmodelo write fmodelo;
      property serie  : String read fserie write fserie;
      property nNF    : String read fnNF write fnNF;
      property nECF   : String read fnECF write fnECF;
      property nCOO   : String read fnCOO write fnCOO;
   end;
   {Representa uma lista de Itens(Objetos do tipo TRef)}
   TRefList = class(TObjectList)
   protected
      function GetItem(Index: Integer): TReferenciada; {Retorna o objeto TRef que está na posição definida por Index}
      procedure SetItem(Index: Integer; referenciada : TReferenciada); {Altera o objeto TRef que está na posição definida por Index}
   public
      constructor Create;
      function Add(referenciada : TReferenciada) : integer; {Insere o item no final da coleção}
      function Remove(referenciada : TReferenciada): Integer; {Remove da coleção o item}
      function IndexOf(referenciada : TReferenciada): Integer; {Retorna a posição onde está localizado o item na coleção}
      procedure Insert(Index: Integer; referenciada : TReferenciada); {Insere o item na posição indicada por Index}
      property Items[Index : integer] : TReferenciada read GetItem write SetItem; default;
   end;
   TRef = class
   public
      refs : TRefList;
      constructor Create;
   end;

implementation



{ TItemRef }



{ TReferenciada }

procedure TReferenciada.Assign(referenciada: TReferenciada);
begin
     refNFe := Referenciada.refNFe;
     cUF    := Referenciada.cUF;
     AAMM   := Referenciada.AAMM;
     CNPJ   := Referenciada.CNPJ;
     CPF    := Referenciada.CPF;
     IE     := Referenciada.IE;
     modelo := Referenciada.modelo;
     serie  := Referenciada.serie;
     nNF    := Referenciada.nNF;
     nECF   := Referenciada.nECF;
     nCOO   := Referenciada.nCOO;
end;

{ TRefList }

function TRefList.Add(referenciada: TReferenciada): integer;
var
   NovaRef : TReferenciada;
begin
     NovaRef := TReferenciada.Create;
     NovaRef.Assign(referenciada);
     Result := inherited Add(NovaRef);
end;

constructor TRefList.Create;
begin
     inherited Create;
end;

function TRefList.GetItem(Index: Integer): TReferenciada;
begin
      Result := inherited Items[Index] as TReferenciada;
end;

function TRefList.IndexOf(referenciada: TReferenciada): Integer;
begin
     Result := inherited IndexOf(referenciada);
end;

procedure TRefList.Insert(Index: Integer; referenciada: TReferenciada);
begin
      inherited Insert(Index, referenciada);
end;

function TRefList.Remove(referenciada: TReferenciada): Integer;
begin
     Result := inherited Remove(referenciada);
end;

procedure TRefList.SetItem(Index: Integer; referenciada: TReferenciada);
begin
      inherited Items[Index] := referenciada;
end;

{ TRef }

constructor TRef.Create;
begin
     refs := TRefList.Create;
end;

end.
