unit uClassEmitente;

interface

uses
    uClassEndereco;

type
   {Identificação do Emitente da Nota Fiscal eletrônica}
   TEmit = class
   public
      enderEmit : TEndereco;
      constructor Create;
      destructor Destroy; override;
   private
      fCNPJ : string; {31-CNPJ do emitente}
      fxNome : string; {32-Razão Social ou Nome do emitente}
      fxFant : string; {33-Nome fantasia}
      fIE : string; {46-C17-IE}
      fIEST : string; {47-C18-IE do Substito Tributário}
      fIM : string; {48-C19-Inscrição Municipal}
      fCNAE : string; {49-C20-CNAE Fiscal}
      fCRT : string; {49a-C21-Código de Regime Tributário}
      fcVen : string;
      fformaPag : string;
      fcondPag : string;
   published
      property CNPJ : String read fCNPJ write fCNPJ;
      property xNome : String read fxNome write fxNome;
      property xFant : String read fxFant write fxFant;
      property IE : String read fIE write fIE;
      property IEST : String read fIEST write fIEST;
      property IM : String read fIM write fIM;
      property CNAE : String read fCNAE write fCNAE;
      property CRT : String read fCRT write fCRT;
      property cVen : String read fcVen write fcVen;
      property formaPag : String read fformaPag write fformaPag;
      property condPag : String read fcondPag write fcondPag;
   end;

implementation

{ TEmit }
constructor TEmit.Create;
begin
     inherited Create;
     enderEmit := TEndereco.Create;
end;
                                  
destructor TEmit.Destroy;
begin
     enderEmit.Free;
     inherited;
end;

end.
