unit uClassNFEtransp;

interface

Type
   {Informações do Transporte da NF-e}
   {Dados do transportador}
   TTransporta = class
   private
      fCNPJ : String; {359-X04-CNPJ do transportador}
      fCPF : String; {360-X05-CPF do transportador}
      fxNome : String; {361=X06-Razão Social ou nome}
      fIE : String; {362=X07-Inscrição Estadual}
      fxEnder : String; {363=X08-Endereço Completo}
      fxMun : String; {364=X09-Nome do Municipio}
      fUF : String; {365=X10-Sigla da UF}
   published
      property CNPJ : String read fCNPJ write fCNPJ;
      property CPF : String read fCPF write fCPF;
      property xNome : String read fxNome write fxNome;
      property IE : String read fIE write fIE;
      property xEnder : String read fxEnder write fxEnder;
      property xMun : String read fxMun write fxMun;
      property UF : String read fUF write fUF;
   end;
   {Dados do Veiculo}
   TVeicTransp = class
   private
      fplaca : String; {374-X19-Placa do Veículo}
      fUF : String; {375-X20-Sigla da UF}
      fRNTC : String; {376=X21-Registro Nacional de Transportador de Carga (RNTC - ANTT)}
   published
      property placa : String read fplaca write fplaca;
      property UF : String read fUF write fUF;
      property RNTC : String read fRNTC write fRNTC;
   end;
   {Dados dos volumes}
   TVol = class
   private
      fqVol : String; {382-X27-Quantidade de volumes transportados}
      fesp : String; {383-X28-Espécie dos volumes transportados}
      fmarca : String; {384-X29-Marca dos volumes transportados}
      fnVol : String; {385-X30-Numeração dos volumes transportados}
      fpesoL : String; {386-X31-Peso Líquido (em kg)}
      fpesoB : String; {387-X32-Peso Bruto (em kg)}
   published
      property qVol : String read fqVol write fqVol;
      property esp : String read fesp write fesp;
      property marca : String read fmarca write fmarca;
      property nVol : String read fnVol write fnVol;
      property pesoL : String read fpesoL write fpesoL;
      property pesoB : String read fpesoB write fpesoB;
   end;
   {Classe TTransp - Utilizada para representar os dados do transporte}
   TTransp = class
   Public
      transporta : TTransporta;
      veicTransp : TVeicTransp;
      vol : TVol;
      constructor Create;
   private
      fmodFrete : String; {357-X02-Modalidade do frete}
   published
      property modFrete : String read fmodFrete write fmodFrete;
   end;

implementation

{ TTransp }

constructor TTransp.Create;
begin
     inherited Create;
     transporta := TTransporta.Create;
     veicTransp := TVeicTransp.Create;
     vol := TVol.Create;
end;

end.
