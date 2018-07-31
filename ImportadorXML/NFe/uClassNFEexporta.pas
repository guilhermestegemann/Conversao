unit uClassNFEexporta;

interface

Type
   {Informa��es de comercio exterior da NF-e}
   {Dados do grupo de exporta��o}
   TExporta = class
   private
      fUFEmbarq : String; {403-ZA02-Sigla da UF onde ocorrer� o embarque dos produtos}
      fxLocEmbarq : String; {404-ZA04-Local onde ocorrer� o embarque dos produtos}
   published
      property UFEmbarq : String read fUFEmbarq write fUFEmbarq;
      property xLocEmbarq : String read fxLocEmbarq write fxLocEmbarq;
   end;

implementation

end.
