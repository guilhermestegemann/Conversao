unit uClassNFEexporta;

interface

Type
   {Informações de comercio exterior da NF-e}
   {Dados do grupo de exportação}
   TExporta = class
   private
      fUFEmbarq : String; {403-ZA02-Sigla da UF onde ocorrerá o embarque dos produtos}
      fxLocEmbarq : String; {404-ZA04-Local onde ocorrerá o embarque dos produtos}
   published
      property UFEmbarq : String read fUFEmbarq write fUFEmbarq;
      property xLocEmbarq : String read fxLocEmbarq write fxLocEmbarq;
   end;

implementation

end.
