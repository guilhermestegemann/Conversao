unit uClassDestinatario;

interface

uses
    uClassEndereco;

type
   {Identificação do Destinatário da Nota Fiscal eletrônica}
   TDest = class
   public
      enderDest : TEndereco;
      constructor Create;
      destructor Destroy; override; 
   private
      fcCli : string; {Código do Clientes}
      fCNPJ : string; {63-E02-CNPJ do destinatário}
      fCPF : string; {64-E03-CPF do destinatário}
      fxNome : string; {65-E04-Razão social ou nome do destinatário}
      fIE : string; {78-E17-IE}
      fISUF : string; {79-E18-Inscrição na SUFRAMA}
      femail: string; {79a-E19-email}
   published
      property cCli : String read fcCli write fcCli;
      property CNPJ : String read fCNPJ write fCNPJ;
      property CPF : String read fCPF write fCPF;
      property xNome : String read fxNome write fxNome;
      property IE : String read fIE write fIE;
      property ISUF : String read fISUF write fISUF;
      property email : String read femail write femail;
   end;

implementation

{ TDest }
constructor TDest.Create;
begin
     inherited Create;
     enderDest := TEndereco.Create;
end;

destructor TDest.Destroy;
begin
     enderDest.Free;
     inherited;
end;

end.
