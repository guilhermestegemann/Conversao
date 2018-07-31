object DMDados: TDMDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 579
  Width = 842
  object SQLConnection: TSQLConnection
    ConnectionName = 'FBCONNECTION'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'Database=database.fdb'
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver240.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=24.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver240.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=24.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      'User_Name=sysdba'
      'Password=masterkey'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'SQLDialect=3'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'TrimChar=False'
      'BlobSize=-1'
      'ErrorResourceFile='
      'RoleName=RoleName'
      'ServerCharSet='
      'Trim Char=False'
      'DriverName=Firebird')
    Left = 56
    Top = 16
  end
  object SQLNF: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'SELECT FIRST(1) * FROM NF WHERE NUMERO = -1')
    SQLConnection = SQLConnection
    Left = 40
    Top = 80
    object SQLNFNUMERO: TIntegerField
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SQLNFSERIE: TStringField
      FieldName = 'SERIE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object SQLNFFILIAL: TIntegerField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SQLNFORIGEM: TStringField
      FieldName = 'ORIGEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 1
    end
    object SQLNFCLIFOR: TIntegerField
      FieldName = 'CLIFOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SQLNFEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Required = True
    end
    object SQLNFSAIDA: TDateField
      FieldName = 'SAIDA'
    end
    object SQLNFHORA: TTimeField
      FieldName = 'HORA'
    end
    object SQLNFCONDICAOPAGAMENTO: TIntegerField
      FieldName = 'CONDICAOPAGAMENTO'
      Required = True
    end
    object SQLNFFORMAPAGAMENTO: TIntegerField
      FieldName = 'FORMAPAGAMENTO'
      Required = True
    end
    object SQLNFBASEICMS: TFMTBCDField
      FieldName = 'BASEICMS'
      Required = True
      Precision = 15
      Size = 2
    end
    object SQLNFVALORICMS: TFMTBCDField
      FieldName = 'VALORICMS'
      Required = True
      Precision = 15
      Size = 2
    end
    object SQLNFBASESUBSTITUICAO: TFMTBCDField
      FieldName = 'BASESUBSTITUICAO'
      Required = True
      Precision = 15
      Size = 2
    end
    object SQLNFVALORSUBSTITUICAO: TFMTBCDField
      FieldName = 'VALORSUBSTITUICAO'
      Required = True
      Precision = 15
      Size = 2
    end
    object SQLNFTOTALPRODUTO: TFMTBCDField
      FieldName = 'TOTALPRODUTO'
      Required = True
      Precision = 15
      Size = 2
    end
    object SQLNFVALORFRETE: TFMTBCDField
      FieldName = 'VALORFRETE'
      Required = True
      Precision = 15
      Size = 2
    end
    object SQLNFVALORSEGURO: TFMTBCDField
      FieldName = 'VALORSEGURO'
      Required = True
      Precision = 15
      Size = 2
    end
    object SQLNFVALORENCARGO: TFMTBCDField
      FieldName = 'VALORENCARGO'
      Required = True
      Precision = 15
      Size = 2
    end
    object SQLNFVALORIPI: TFMTBCDField
      FieldName = 'VALORIPI'
      Required = True
      Precision = 15
      Size = 2
    end
    object SQLNFPERCDESCONTO: TFMTBCDField
      FieldName = 'PERCDESCONTO'
      Required = True
      Precision = 15
      Size = 2
    end
    object SQLNFVALORDESCONTO: TFMTBCDField
      FieldName = 'VALORDESCONTO'
      Required = True
      Precision = 15
      Size = 2
    end
    object SQLNFTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Required = True
      Precision = 15
      Size = 2
    end
    object SQLNFFUNCIONARIO: TIntegerField
      FieldName = 'FUNCIONARIO'
      Required = True
    end
    object SQLNFTRANSPORTADOR: TIntegerField
      FieldName = 'TRANSPORTADOR'
      Required = True
    end
    object SQLNFCONTAFRETE: TStringField
      FieldName = 'CONTAFRETE'
      Required = True
      Size = 1
    end
    object SQLNFPLACA: TStringField
      FieldName = 'PLACA'
      Size = 8
    end
    object SQLNFUFPLACA: TStringField
      FieldName = 'UFPLACA'
      Size = 2
    end
    object SQLNFVOLUME: TIntegerField
      FieldName = 'VOLUME'
    end
    object SQLNFESPECIE: TStringField
      FieldName = 'ESPECIE'
      Size = 60
    end
    object SQLNFMARCA: TStringField
      FieldName = 'MARCA'
      Size = 60
    end
    object SQLNFLOTE: TStringField
      FieldName = 'LOTE'
      Size = 60
    end
    object SQLNFPESOBRUTO: TFMTBCDField
      FieldName = 'PESOBRUTO'
      Precision = 15
      Size = 3
    end
    object SQLNFPESOLIQUIDO: TFMTBCDField
      FieldName = 'PESOLIQUIDO'
      Precision = 15
      Size = 3
    end
    object SQLNFOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object SQLNFCANCELADA: TStringField
      FieldName = 'CANCELADA'
      Required = True
      Size = 1
    end
    object SQLNFIMPRESSA: TStringField
      FieldName = 'IMPRESSA'
      Required = True
      Size = 1
    end
    object SQLNFATUALIZADA: TStringField
      FieldName = 'ATUALIZADA'
      Required = True
      Size = 1
    end
    object SQLNFTABELAPRECO: TIntegerField
      FieldName = 'TABELAPRECO'
    end
    object SQLNFPEDIDO: TIntegerField
      FieldName = 'PEDIDO'
    end
    object SQLNFENTREGUE: TStringField
      FieldName = 'ENTREGUE'
      Required = True
      Size = 1
    end
    object SQLNFDATACOLETA: TDateField
      FieldName = 'DATACOLETA'
    end
    object SQLNFBASEFUNRURAL: TFMTBCDField
      FieldName = 'BASEFUNRURAL'
      Required = True
      Precision = 15
      Size = 2
    end
    object SQLNFVALORFUNRURAL: TFMTBCDField
      FieldName = 'VALORFUNRURAL'
      Required = True
      Precision = 15
      Size = 2
    end
    object SQLNFBASEIPI: TFMTBCDField
      FieldName = 'BASEIPI'
      Required = True
      Precision = 15
      Size = 2
    end
    object SQLNFBASEISS: TFMTBCDField
      FieldName = 'BASEISS'
      Required = True
      Precision = 15
      Size = 2
    end
    object SQLNFVALORISS: TFMTBCDField
      FieldName = 'VALORISS'
      Required = True
      Precision = 15
      Size = 2
    end
    object SQLNFTIPOCFOP: TIntegerField
      FieldName = 'TIPOCFOP'
      Required = True
    end
    object SQLNFIMPRESSAO: TSQLTimeStampField
      FieldName = 'IMPRESSAO'
    end
    object SQLNFFILIALPEDIDO: TIntegerField
      FieldName = 'FILIALPEDIDO'
    end
    object SQLNFCOMISSAO: TFMTBCDField
      FieldName = 'COMISSAO'
      Required = True
      Precision = 15
      Size = 2
    end
    object SQLNFBASEPIS: TFMTBCDField
      FieldName = 'BASEPIS'
      Required = True
      Precision = 15
      Size = 2
    end
    object SQLNFVALORPIS: TFMTBCDField
      FieldName = 'VALORPIS'
      Required = True
      Precision = 15
      Size = 2
    end
    object SQLNFBASECOFINS: TFMTBCDField
      FieldName = 'BASECOFINS'
      Required = True
      Precision = 15
      Size = 2
    end
    object SQLNFVALORCOFINS: TFMTBCDField
      FieldName = 'VALORCOFINS'
      Required = True
      Precision = 15
      Size = 2
    end
    object SQLNFVALORISENTO: TFMTBCDField
      FieldName = 'VALORISENTO'
      Required = True
      Precision = 15
      Size = 2
    end
    object SQLNFSOMAR: TStringField
      FieldName = 'SOMAR'
      Required = True
      Size = 1
    end
    object SQLNFMODELO: TStringField
      FieldName = 'MODELO'
      Required = True
      Size = 3
    end
    object SQLNFVALORII: TFMTBCDField
      FieldName = 'VALORII'
      Precision = 15
      Size = 2
    end
    object SQLNFVALORSIMPLES: TFMTBCDField
      FieldName = 'VALORSIMPLES'
      Precision = 15
      Size = 2
    end
    object SQLNFINUTILIZADA: TStringField
      FieldName = 'INUTILIZADA'
      Required = True
      Size = 1
    end
    object SQLNFDENEGADA: TStringField
      FieldName = 'DENEGADA'
      Required = True
      Size = 1
    end
    object SQLNFVALORFUNDESA: TFMTBCDField
      FieldName = 'VALORFUNDESA'
      Precision = 15
      Size = 6
    end
    object SQLNFTOTALDEVOLVIDO: TFMTBCDField
      FieldName = 'TOTALDEVOLVIDO'
      Precision = 15
      Size = 2
    end
    object SQLNFLOCALEMBARQUE: TIntegerField
      FieldName = 'LOCALEMBARQUE'
    end
    object SQLNFVALORST: TFMTBCDField
      FieldName = 'VALORST'
      Precision = 15
      Size = 2
    end
    object SQLNFVALORFRETEFINAL: TFMTBCDField
      FieldName = 'VALORFRETEFINAL'
      Precision = 15
      Size = 2
    end
    object SQLNFFRETEPAGO: TStringField
      FieldName = 'FRETEPAGO'
      Size = 1
    end
    object SQLNFPERCVARIACAO: TFMTBCDField
      FieldName = 'PERCVARIACAO'
      Precision = 15
      Size = 2
    end
    object SQLNFBASEST: TFMTBCDField
      FieldName = 'BASEST'
      Precision = 15
      Size = 2
    end
    object SQLNFVEICULO: TIntegerField
      FieldName = 'VEICULO'
    end
    object SQLNFSERVICO: TStringField
      FieldName = 'SERVICO'
      Required = True
      Size = 1
    end
    object SQLNFVALORRESSARCIMENTOST: TFMTBCDField
      FieldName = 'VALORRESSARCIMENTOST'
      Precision = 15
      Size = 2
    end
    object SQLNFVALORADIANTAMENTO: TFMTBCDField
      FieldName = 'VALORADIANTAMENTO'
      Precision = 15
      Size = 2
    end
    object SQLNFFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      Required = True
      Size = 1
    end
    object SQLNFVALORPISSERVICO: TFMTBCDField
      FieldName = 'VALORPISSERVICO'
      Precision = 15
      Size = 2
    end
    object SQLNFVALORCOFINSSERVICO: TFMTBCDField
      FieldName = 'VALORCOFINSSERVICO'
      Precision = 15
      Size = 2
    end
    object SQLNFTOTALBRUTO: TFMTBCDField
      FieldName = 'TOTALBRUTO'
      Precision = 15
      Size = 2
    end
    object SQLNFVALORISENTOPIS: TFMTBCDField
      FieldName = 'VALORISENTOPIS'
      Precision = 15
      Size = 2
    end
    object SQLNFVALORISENTOCOFINS: TFMTBCDField
      FieldName = 'VALORISENTOCOFINS'
      Precision = 15
      Size = 2
    end
    object SQLNFMOTIVOCANCELAMENTO: TIntegerField
      FieldName = 'MOTIVOCANCELAMENTO'
    end
    object SQLNFVALORIRRF: TFMTBCDField
      FieldName = 'VALORIRRF'
      Precision = 15
      Size = 2
    end
    object SQLNFVALORICMSDIFERIMENTO: TFMTBCDField
      FieldName = 'VALORICMSDIFERIMENTO'
      Precision = 15
      Size = 2
    end
    object SQLNFCONFERIDO: TStringField
      FieldName = 'CONFERIDO'
      Size = 1
    end
    object SQLNFDEVOLVIDA: TStringField
      FieldName = 'DEVOLVIDA'
      Size = 1
    end
    object SQLNFMOTIVODEVOLUCAO: TIntegerField
      FieldName = 'MOTIVODEVOLUCAO'
    end
  end
  object cdNF: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNF'
    AfterInsert = cdNFAfterInsert
    OnReconcileError = cdNFReconcileError
    Left = 160
    Top = 80
    object cdNFNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Required = True
    end
    object cdNFSERIE: TStringField
      FieldName = 'SERIE'
      Required = True
      Size = 5
    end
    object cdNFFILIAL: TIntegerField
      FieldName = 'FILIAL'
      Required = True
    end
    object cdNFORIGEM: TStringField
      FieldName = 'ORIGEM'
      Required = True
      Size = 1
    end
    object cdNFCLIFOR: TIntegerField
      FieldName = 'CLIFOR'
      Required = True
    end
    object cdNFEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Required = True
    end
    object cdNFSAIDA: TDateField
      FieldName = 'SAIDA'
    end
    object cdNFHORA: TTimeField
      FieldName = 'HORA'
    end
    object cdNFCONDICAOPAGAMENTO: TIntegerField
      FieldName = 'CONDICAOPAGAMENTO'
      Required = True
    end
    object cdNFFORMAPAGAMENTO: TIntegerField
      FieldName = 'FORMAPAGAMENTO'
      Required = True
    end
    object cdNFBASEICMS: TFMTBCDField
      FieldName = 'BASEICMS'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdNFVALORICMS: TFMTBCDField
      FieldName = 'VALORICMS'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdNFBASESUBSTITUICAO: TFMTBCDField
      FieldName = 'BASESUBSTITUICAO'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdNFVALORSUBSTITUICAO: TFMTBCDField
      FieldName = 'VALORSUBSTITUICAO'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdNFTOTALPRODUTO: TFMTBCDField
      FieldName = 'TOTALPRODUTO'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdNFVALORFRETE: TFMTBCDField
      FieldName = 'VALORFRETE'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdNFVALORSEGURO: TFMTBCDField
      FieldName = 'VALORSEGURO'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdNFVALORENCARGO: TFMTBCDField
      FieldName = 'VALORENCARGO'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdNFVALORIPI: TFMTBCDField
      FieldName = 'VALORIPI'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdNFPERCDESCONTO: TFMTBCDField
      FieldName = 'PERCDESCONTO'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdNFVALORDESCONTO: TFMTBCDField
      FieldName = 'VALORDESCONTO'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdNFTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdNFFUNCIONARIO: TIntegerField
      FieldName = 'FUNCIONARIO'
      Required = True
    end
    object cdNFTRANSPORTADOR: TIntegerField
      FieldName = 'TRANSPORTADOR'
      Required = True
    end
    object cdNFCONTAFRETE: TStringField
      FieldName = 'CONTAFRETE'
      Required = True
      Size = 1
    end
    object cdNFPLACA: TStringField
      FieldName = 'PLACA'
      Size = 8
    end
    object cdNFUFPLACA: TStringField
      FieldName = 'UFPLACA'
      Size = 2
    end
    object cdNFVOLUME: TIntegerField
      FieldName = 'VOLUME'
    end
    object cdNFESPECIE: TStringField
      FieldName = 'ESPECIE'
      Size = 60
    end
    object cdNFMARCA: TStringField
      FieldName = 'MARCA'
      Size = 60
    end
    object cdNFLOTE: TStringField
      FieldName = 'LOTE'
      Size = 60
    end
    object cdNFPESOBRUTO: TFMTBCDField
      FieldName = 'PESOBRUTO'
      Precision = 15
      Size = 3
    end
    object cdNFPESOLIQUIDO: TFMTBCDField
      FieldName = 'PESOLIQUIDO'
      Precision = 15
      Size = 3
    end
    object cdNFOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdNFCANCELADA: TStringField
      FieldName = 'CANCELADA'
      Required = True
      Size = 1
    end
    object cdNFIMPRESSA: TStringField
      FieldName = 'IMPRESSA'
      Required = True
      Size = 1
    end
    object cdNFATUALIZADA: TStringField
      FieldName = 'ATUALIZADA'
      Required = True
      Size = 1
    end
    object cdNFTABELAPRECO: TIntegerField
      FieldName = 'TABELAPRECO'
    end
    object cdNFPEDIDO: TIntegerField
      FieldName = 'PEDIDO'
    end
    object cdNFENTREGUE: TStringField
      FieldName = 'ENTREGUE'
      Required = True
      Size = 1
    end
    object cdNFDATACOLETA: TDateField
      FieldName = 'DATACOLETA'
    end
    object cdNFBASEFUNRURAL: TFMTBCDField
      FieldName = 'BASEFUNRURAL'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdNFVALORFUNRURAL: TFMTBCDField
      FieldName = 'VALORFUNRURAL'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdNFBASEIPI: TFMTBCDField
      FieldName = 'BASEIPI'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdNFBASEISS: TFMTBCDField
      FieldName = 'BASEISS'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdNFVALORISS: TFMTBCDField
      FieldName = 'VALORISS'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdNFTIPOCFOP: TIntegerField
      FieldName = 'TIPOCFOP'
      Required = True
    end
    object cdNFIMPRESSAO: TSQLTimeStampField
      FieldName = 'IMPRESSAO'
    end
    object cdNFFILIALPEDIDO: TIntegerField
      FieldName = 'FILIALPEDIDO'
    end
    object cdNFCOMISSAO: TFMTBCDField
      FieldName = 'COMISSAO'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdNFBASEPIS: TFMTBCDField
      FieldName = 'BASEPIS'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdNFVALORPIS: TFMTBCDField
      FieldName = 'VALORPIS'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdNFBASECOFINS: TFMTBCDField
      FieldName = 'BASECOFINS'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdNFVALORCOFINS: TFMTBCDField
      FieldName = 'VALORCOFINS'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdNFVALORISENTO: TFMTBCDField
      FieldName = 'VALORISENTO'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdNFSOMAR: TStringField
      FieldName = 'SOMAR'
      Required = True
      Size = 1
    end
    object cdNFMODELO: TStringField
      FieldName = 'MODELO'
      Required = True
      Size = 3
    end
    object cdNFVALORII: TFMTBCDField
      FieldName = 'VALORII'
      Precision = 15
      Size = 2
    end
    object cdNFVALORSIMPLES: TFMTBCDField
      FieldName = 'VALORSIMPLES'
      Precision = 15
      Size = 2
    end
    object cdNFINUTILIZADA: TStringField
      FieldName = 'INUTILIZADA'
      Required = True
      Size = 1
    end
    object cdNFDENEGADA: TStringField
      FieldName = 'DENEGADA'
      Required = True
      Size = 1
    end
    object cdNFVALORFUNDESA: TFMTBCDField
      FieldName = 'VALORFUNDESA'
      Precision = 15
      Size = 6
    end
    object cdNFTOTALDEVOLVIDO: TFMTBCDField
      FieldName = 'TOTALDEVOLVIDO'
      Precision = 15
      Size = 2
    end
    object cdNFLOCALEMBARQUE: TIntegerField
      FieldName = 'LOCALEMBARQUE'
    end
    object cdNFVALORST: TFMTBCDField
      FieldName = 'VALORST'
      Precision = 15
      Size = 2
    end
    object cdNFVALORFRETEFINAL: TFMTBCDField
      FieldName = 'VALORFRETEFINAL'
      Precision = 15
      Size = 2
    end
    object cdNFFRETEPAGO: TStringField
      FieldName = 'FRETEPAGO'
      Size = 1
    end
    object cdNFPERCVARIACAO: TFMTBCDField
      FieldName = 'PERCVARIACAO'
      Precision = 15
      Size = 2
    end
    object cdNFBASEST: TFMTBCDField
      FieldName = 'BASEST'
      Precision = 15
      Size = 2
    end
    object cdNFVEICULO: TIntegerField
      FieldName = 'VEICULO'
    end
    object cdNFSERVICO: TStringField
      FieldName = 'SERVICO'
      Required = True
      Size = 1
    end
    object cdNFVALORRESSARCIMENTOST: TFMTBCDField
      FieldName = 'VALORRESSARCIMENTOST'
      Precision = 15
      Size = 2
    end
    object cdNFVALORADIANTAMENTO: TFMTBCDField
      FieldName = 'VALORADIANTAMENTO'
      Precision = 15
      Size = 2
    end
    object cdNFFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      Required = True
      Size = 1
    end
    object cdNFVALORPISSERVICO: TFMTBCDField
      FieldName = 'VALORPISSERVICO'
      Precision = 15
      Size = 2
    end
    object cdNFVALORCOFINSSERVICO: TFMTBCDField
      FieldName = 'VALORCOFINSSERVICO'
      Precision = 15
      Size = 2
    end
    object cdNFTOTALBRUTO: TFMTBCDField
      FieldName = 'TOTALBRUTO'
      Precision = 15
      Size = 2
    end
    object cdNFVALORISENTOPIS: TFMTBCDField
      FieldName = 'VALORISENTOPIS'
      Precision = 15
      Size = 2
    end
    object cdNFVALORISENTOCOFINS: TFMTBCDField
      FieldName = 'VALORISENTOCOFINS'
      Precision = 15
      Size = 2
    end
    object cdNFMOTIVOCANCELAMENTO: TIntegerField
      FieldName = 'MOTIVOCANCELAMENTO'
    end
    object cdNFVALORIRRF: TFMTBCDField
      FieldName = 'VALORIRRF'
      Precision = 15
      Size = 2
    end
    object cdNFVALORICMSDIFERIMENTO: TFMTBCDField
      FieldName = 'VALORICMSDIFERIMENTO'
      Precision = 15
      Size = 2
    end
    object cdNFCONFERIDO: TStringField
      FieldName = 'CONFERIDO'
      Size = 1
    end
    object cdNFDEVOLVIDA: TStringField
      FieldName = 'DEVOLVIDA'
      Size = 1
    end
    object cdNFMOTIVODEVOLUCAO: TIntegerField
      FieldName = 'MOTIVODEVOLUCAO'
    end
  end
  object dspNF: TDataSetProvider
    DataSet = SQLNF
    UpdateMode = upWhereKeyOnly
    OnDataRequest = dspNFDataRequest
    Left = 96
    Top = 80
  end
  object SQLPesquisa: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 344
    Top = 24
  end
  object cdPesquisa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesquisa'
    OnReconcileError = cdPesquisaReconcileError
    Left = 464
    Top = 24
  end
  object dspPesquisa: TDataSetProvider
    DataSet = SQLPesquisa
    OnDataRequest = dspPesquisaDataRequest
    Left = 400
    Top = 24
  end
  object SQLClifor: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM CLIFOR WHERE 0 = 1')
    SQLConnection = SQLConnection
    Left = 624
    Top = 16
  end
  object cdClifor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClifor'
    AfterInsert = cdCliforAfterInsert
    OnReconcileError = cdCliforReconcileError
    Left = 744
    Top = 16
    object cdCliforCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdCliforFILIAL: TIntegerField
      FieldName = 'FILIAL'
      Required = True
    end
    object cdCliforTIPO: TIntegerField
      FieldName = 'TIPO'
      Required = True
    end
    object cdCliforNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object cdCliforFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Size = 60
    end
    object cdCliforCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 18
    end
    object cdCliforIE: TStringField
      FieldName = 'IE'
      Size = 15
    end
    object cdCliforENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object cdCliforCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 60
    end
    object cdCliforREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 100
    end
    object cdCliforCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object cdCliforBAIRRO: TIntegerField
      FieldName = 'BAIRRO'
      Required = True
    end
    object cdCliforCIDADE: TIntegerField
      FieldName = 'CIDADE'
      Required = True
    end
    object cdCliforTIPOESTABELECIMENTO: TIntegerField
      FieldName = 'TIPOESTABELECIMENTO'
    end
    object cdCliforIMOVEL: TIntegerField
      FieldName = 'IMOVEL'
    end
    object cdCliforREGIAO: TIntegerField
      FieldName = 'REGIAO'
    end
    object cdCliforDATA: TDateField
      FieldName = 'DATA'
      Required = True
    end
    object cdCliforLIMITECREDITO: TFMTBCDField
      FieldName = 'LIMITECREDITO'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdCliforFORMAPAGAMENTO: TIntegerField
      FieldName = 'FORMAPAGAMENTO'
    end
    object cdCliforCONDICAOPAGAMENTO: TIntegerField
      FieldName = 'CONDICAOPAGAMENTO'
    end
    object cdCliforOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdCliforATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      Size = 1
    end
    object cdCliforINFCOMERCIAL: TMemoField
      FieldName = 'INFCOMERCIAL'
      BlobType = ftMemo
      Size = 1
    end
    object cdCliforDATANASC: TDateField
      FieldName = 'DATANASC'
    end
    object cdCliforPROMOTOR: TIntegerField
      FieldName = 'PROMOTOR'
    end
    object cdCliforRESPONSAVEL: TStringField
      FieldName = 'RESPONSAVEL'
      Size = 40
    end
    object cdCliforCPFRESPONSAVEL: TStringField
      FieldName = 'CPFRESPONSAVEL'
      Size = 14
    end
    object cdCliforRGRESPONSAVEL: TStringField
      FieldName = 'RGRESPONSAVEL'
      Size = 15
    end
    object cdCliforDATAMOVIMENTO: TDateField
      FieldName = 'DATAMOVIMENTO'
    end
    object cdCliforREFERENCIACOBRANCA: TStringField
      FieldName = 'REFERENCIACOBRANCA'
      Size = 100
    end
    object cdCliforDATAINICIOATIVIDADES: TDateField
      FieldName = 'DATAINICIOATIVIDADES'
    end
    object cdCliforBLOQUEARVENDA: TStringField
      FieldName = 'BLOQUEARVENDA'
      Required = True
      Size = 1
    end
    object cdCliforDATAINATIVADO: TDateField
      FieldName = 'DATAINATIVADO'
    end
    object cdCliforENDERECOCOBRANCA: TStringField
      FieldName = 'ENDERECOCOBRANCA'
      Size = 60
    end
    object cdCliforBAIRROCOBRANCA: TIntegerField
      FieldName = 'BAIRROCOBRANCA'
    end
    object cdCliforCIDADECOBRANCA: TIntegerField
      FieldName = 'CIDADECOBRANCA'
    end
    object cdCliforCEPCOBRANCA: TStringField
      FieldName = 'CEPCOBRANCA'
      Size = 8
    end
    object cdCliforEXPORTAROBS: TStringField
      FieldName = 'EXPORTAROBS'
      Required = True
      Size = 1
    end
    object cdCliforATUALIZARCADASTRO: TStringField
      FieldName = 'ATUALIZARCADASTRO'
      Required = True
      Size = 1
    end
    object cdCliforRAPEL: TFMTBCDField
      FieldName = 'RAPEL'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdCliforALVARA: TStringField
      FieldName = 'ALVARA'
      Required = True
      Size = 1
    end
    object cdCliforTRANSPORTADOR: TIntegerField
      FieldName = 'TRANSPORTADOR'
    end
    object cdCliforISENTO: TStringField
      FieldName = 'ISENTO'
      Required = True
      Size = 1
    end
    object cdCliforCNPJVALIDO: TStringField
      FieldName = 'CNPJVALIDO'
      Required = True
      Size = 1
    end
    object cdCliforIEVALIDO: TStringField
      FieldName = 'IEVALIDO'
      Required = True
      Size = 1
    end
    object cdCliforCATEGORIA: TIntegerField
      FieldName = 'CATEGORIA'
      Required = True
    end
    object cdCliforNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object cdCliforINSCRICAOSUFRAMA: TStringField
      FieldName = 'INSCRICAOSUFRAMA'
      Size = 15
    end
    object cdCliforNUMEROALVARA: TStringField
      FieldName = 'NUMEROALVARA'
      Size = 15
    end
    object cdCliforREDE: TIntegerField
      FieldName = 'REDE'
    end
    object cdCliforPUBLICA: TStringField
      FieldName = 'PUBLICA'
      Required = True
      Size = 1
    end
    object cdCliforINDUSTRIA: TStringField
      FieldName = 'INDUSTRIA'
      Required = True
      Size = 1
    end
    object cdCliforCADIN: TStringField
      FieldName = 'CADIN'
      Required = True
      Size = 1
    end
    object cdCliforREGISTROCONSELHOREGIONAL: TStringField
      FieldName = 'REGISTROCONSELHOREGIONAL'
      Required = True
      Size = 1
    end
    object cdCliforAUTORIZACAOESPECIAL: TStringField
      FieldName = 'AUTORIZACAOESPECIAL'
      Required = True
      Size = 1
    end
    object cdCliforCODIGOREGISTRO: TStringField
      FieldName = 'CODIGOREGISTRO'
    end
    object cdCliforLOCALTRABALHO: TStringField
      FieldName = 'LOCALTRABALHO'
      Size = 60
    end
    object cdCliforDATAADMISSAO: TDateField
      FieldName = 'DATAADMISSAO'
    end
    object cdCliforSALARIO: TFMTBCDField
      FieldName = 'SALARIO'
      Precision = 15
      Size = 2
    end
    object cdCliforCARGO: TStringField
      FieldName = 'CARGO'
      Size = 60
    end
    object cdCliforNOMEPAI: TStringField
      FieldName = 'NOMEPAI'
      Size = 60
    end
    object cdCliforNOMEMAE: TStringField
      FieldName = 'NOMEMAE'
      Size = 60
    end
    object cdCliforNOMECONJUGE: TStringField
      FieldName = 'NOMECONJUGE'
      Size = 60
    end
    object cdCliforDATANASCIMENTOCONJUGE: TDateField
      FieldName = 'DATANASCIMENTOCONJUGE'
    end
    object cdCliforCPFCONJUGE: TStringField
      FieldName = 'CPFCONJUGE'
      Size = 18
    end
    object cdCliforRGCONJUGE: TStringField
      FieldName = 'RGCONJUGE'
      Size = 15
    end
    object cdCliforLOCALTRABALHOCONJUGE: TStringField
      FieldName = 'LOCALTRABALHOCONJUGE'
      Size = 60
    end
    object cdCliforDATAADMISSAOCONJUGE: TDateField
      FieldName = 'DATAADMISSAOCONJUGE'
    end
    object cdCliforSALARIOCONJUGE: TFMTBCDField
      FieldName = 'SALARIOCONJUGE'
      Precision = 15
      Size = 2
    end
    object cdCliforCARGOCONJUGE: TStringField
      FieldName = 'CARGOCONJUGE'
      Size = 60
    end
    object cdCliforNATURALIDADE: TIntegerField
      FieldName = 'NATURALIDADE'
    end
    object cdCliforESTADOCIVIL: TIntegerField
      FieldName = 'ESTADOCIVIL'
    end
    object cdCliforDATACONSULTA: TDateField
      FieldName = 'DATACONSULTA'
    end
    object cdCliforBANCO: TIntegerField
      FieldName = 'BANCO'
    end
    object cdCliforAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Size = 15
    end
    object cdCliforCONTA: TStringField
      FieldName = 'CONTA'
      Size = 15
    end
    object cdCliforVALORPRODUCAO: TFMTBCDField
      FieldName = 'VALORPRODUCAO'
      Precision = 15
      Size = 3
    end
    object cdCliforCOMISSAO: TFMTBCDField
      FieldName = 'COMISSAO'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdCliforSIMPLES: TStringField
      FieldName = 'SIMPLES'
      Required = True
      Size = 1
    end
    object cdCliforPRACAPAGAMENTO: TIntegerField
      FieldName = 'PRACAPAGAMENTO'
    end
    object cdCliforLATITUDE: TStringField
      FieldName = 'LATITUDE'
      Size = 15
    end
    object cdCliforLONGITUDE: TStringField
      FieldName = 'LONGITUDE'
      Size = 15
    end
    object cdCliforSPC: TStringField
      FieldName = 'SPC'
      Required = True
      Size = 1
    end
    object cdCliforHISTORICOCREDITO: TIntegerField
      FieldName = 'HISTORICOCREDITO'
    end
    object cdCliforHISTORICODEBITO: TIntegerField
      FieldName = 'HISTORICODEBITO'
    end
    object cdCliforNIRF: TStringField
      FieldName = 'NIRF'
      Size = 15
    end
    object cdCliforCODIGOPRODUTOR: TStringField
      FieldName = 'CODIGOPRODUTOR'
      Size = 15
    end
    object cdCliforENVIARREMESSA: TStringField
      FieldName = 'ENVIARREMESSA'
      Required = True
      Size = 1
    end
    object cdCliforVALORFRETECOLETA: TFMTBCDField
      FieldName = 'VALORFRETECOLETA'
      Precision = 15
      Size = 4
    end
    object cdCliforIM: TStringField
      FieldName = 'IM'
      Size = 15
    end
    object cdCliforDATAALVARA: TDateField
      FieldName = 'DATAALVARA'
    end
    object cdCliforDATAAUTORIZACAOESPECIAL: TDateField
      FieldName = 'DATAAUTORIZACAOESPECIAL'
    end
    object cdCliforDATAREGISTROCONSELHOREGIONAL: TDateField
      FieldName = 'DATAREGISTROCONSELHOREGIONAL'
    end
    object cdCliforCLASSIFICACAOCLIFOR: TIntegerField
      FieldName = 'CLASSIFICACAOCLIFOR'
    end
    object cdCliforMEI: TStringField
      FieldName = 'MEI'
      Required = True
      Size = 1
    end
    object cdCliforINFORMACAOADICIONAL: TStringField
      FieldName = 'INFORMACAOADICIONAL'
      Size = 100
    end
    object cdCliforASSOCIADO: TStringField
      FieldName = 'ASSOCIADO'
      Required = True
      Size = 1
    end
    object cdCliforCOMISSAOFIXA: TStringField
      FieldName = 'COMISSAOFIXA'
      Required = True
      Size = 1
    end
    object cdCliforVENDARESTRITA: TStringField
      FieldName = 'VENDARESTRITA'
      Required = True
      Size = 1
    end
    object cdCliforCONSUMIDOR: TStringField
      FieldName = 'CONSUMIDOR'
      Required = True
      Size = 1
    end
    object cdCliforINDICADORIE: TIntegerField
      FieldName = 'INDICADORIE'
      Required = True
    end
    object cdCliforDESTACARSTITEM: TStringField
      FieldName = 'DESTACARSTITEM'
      Required = True
      Size = 1
    end
  end
  object dspClifor: TDataSetProvider
    DataSet = SQLClifor
    OnDataRequest = dspCliforDataRequest
    Left = 680
    Top = 16
  end
  object SQLBairro: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM BAIRRO WHERE 0 = 1')
    SQLConnection = SQLConnection
    Left = 624
    Top = 64
  end
  object cdBairro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBairro'
    AfterInsert = cdBairroAfterInsert
    OnReconcileError = cdBairroReconcileError
    Left = 744
    Top = 64
  end
  object dspBairro: TDataSetProvider
    DataSet = SQLBairro
    OnDataRequest = dspBairroDataRequest
    Left = 680
    Top = 64
  end
  object SQLCidade: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM CIDADE WHERE 0 = 1;')
    SQLConnection = SQLConnection
    Left = 624
    Top = 112
  end
  object cdCidade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCidade'
    AfterInsert = cdCidadeAfterInsert
    OnReconcileError = cdCidadeReconcileError
    Left = 744
    Top = 112
    object cdCidadeCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdCidadeNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object cdCidadeCODIGOFISCAL: TStringField
      FieldName = 'CODIGOFISCAL'
      Size = 7
    end
    object cdCidadePOPULACAO: TIntegerField
      FieldName = 'POPULACAO'
      Required = True
    end
    object cdCidadeOBS: TStringField
      FieldName = 'OBS'
      Size = 100
    end
    object cdCidadeREGIAOVENDA: TStringField
      FieldName = 'REGIAOVENDA'
      Required = True
      Size = 1
    end
    object cdCidadeCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object cdCidadeCOMISSAOENTREGA: TFMTBCDField
      FieldName = 'COMISSAOENTREGA'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdCidadeESTADO: TIntegerField
      FieldName = 'ESTADO'
      Required = True
    end
    object cdCidadeLATITUDE: TStringField
      FieldName = 'LATITUDE'
      Size = 15
    end
    object cdCidadeLONGITUDE: TStringField
      FieldName = 'LONGITUDE'
      Size = 15
    end
    object cdCidadeVALORFRETEADICIONAL: TFMTBCDField
      FieldName = 'VALORFRETEADICIONAL'
      Required = True
      Precision = 15
      Size = 2
    end
  end
  object dspCidade: TDataSetProvider
    DataSet = SQLCidade
    OnDataRequest = dspCidadeDataRequest
    Left = 680
    Top = 112
  end
  object SQLCliforContato: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM CLIFORCONTATO WHERE 0 = 1')
    SQLConnection = SQLConnection
    Left = 624
    Top = 160
  end
  object cdCliforContato: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCliforContato'
    AfterInsert = cdCliforContatoAfterInsert
    OnReconcileError = cdCliforContatoReconcileError
    Left = 744
    Top = 160
  end
  object dspCliforContato: TDataSetProvider
    DataSet = SQLCliforContato
    OnDataRequest = dspCliforContatoDataRequest
    Left = 680
    Top = 160
  end
  object SQLProdutoClifor: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM PRODUTOCLIFOR WHERE 0 = 1')
    SQLConnection = SQLConnection
    Left = 624
    Top = 208
  end
  object cdProdutoClifor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCliforContato'
    AfterInsert = cdProdutoCliforAfterInsert
    OnReconcileError = cdProdutoCliforReconcileError
    Left = 744
    Top = 208
  end
  object dspProdutoClifor: TDataSetProvider
    DataSet = SQLProdutoClifor
    OnDataRequest = dspProdutoCliforDataRequest
    Left = 680
    Top = 208
  end
  object SQLProduto: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM PRODUTO WHERE 0 = 1')
    SQLConnection = SQLConnection
    Left = 624
    Top = 256
  end
  object cdProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduto'
    AfterInsert = cdProdutoAfterInsert
    OnReconcileError = cdProdutoReconcileError
    Left = 744
    Top = 256
    object cdProdutoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdProdutoBARRAS: TStringField
      FieldName = 'BARRAS'
      Required = True
      Size = 15
    end
    object cdProdutoNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object cdProdutoUNCOMPRA: TStringField
      FieldName = 'UNCOMPRA'
      Required = True
      Size = 3
    end
    object cdProdutoQTDECOMPRA: TIntegerField
      FieldName = 'QTDECOMPRA'
      Required = True
    end
    object cdProdutoUNVENDA: TStringField
      FieldName = 'UNVENDA'
      Required = True
      Size = 3
    end
    object cdProdutoQTDEVENDA: TIntegerField
      FieldName = 'QTDEVENDA'
      Required = True
    end
    object cdProdutoUNCARREGAMENTO: TStringField
      FieldName = 'UNCARREGAMENTO'
      Required = True
      Size = 3
    end
    object cdProdutoQTDECARREGAMENTO: TFMTBCDField
      FieldName = 'QTDECARREGAMENTO'
      Required = True
      Precision = 15
      Size = 3
    end
    object cdProdutoTIPOPRODUTO: TIntegerField
      FieldName = 'TIPOPRODUTO'
    end
    object cdProdutoGRUPO: TIntegerField
      FieldName = 'GRUPO'
      Required = True
    end
    object cdProdutoTRIBUTACAO: TIntegerField
      FieldName = 'TRIBUTACAO'
      Required = True
    end
    object cdProdutoMARCA: TIntegerField
      FieldName = 'MARCA'
    end
    object cdProdutoCLIFOR2: TIntegerField
      FieldName = 'CLIFOR'
    end
    object cdProdutoPESOBRUTO: TFMTBCDField
      FieldName = 'PESOBRUTO'
      Required = True
      Precision = 15
      Size = 4
    end
    object cdProdutoPESOLIQUIDO: TFMTBCDField
      FieldName = 'PESOLIQUIDO'
      Required = True
      Precision = 15
      Size = 4
    end
    object cdProdutoQTDEPADRAO: TIntegerField
      FieldName = 'QTDEPADRAO'
      Required = True
    end
    object cdProdutoCODIGOFORNECEDOR: TStringField
      FieldName = 'CODIGOFORNECEDOR'
    end
    object cdProdutoDESCRICAOEMBALAGEM: TStringField
      FieldName = 'DESCRICAOEMBALAGEM'
      Size = 30
    end
    object cdProdutoCLASSIFICACAO: TIntegerField
      FieldName = 'CLASSIFICACAO'
    end
    object cdProdutoCLASSE: TIntegerField
      FieldName = 'CLASSE'
    end
    object cdProdutoQTDEMULTIPLA: TFMTBCDField
      FieldName = 'QTDEMULTIPLA'
      Required = True
      Precision = 15
      Size = 3
    end
    object cdProdutoUNTROCA: TStringField
      FieldName = 'UNTROCA'
      Required = True
      Size = 3
    end
    object cdProdutoQTDETROCA: TIntegerField
      FieldName = 'QTDETROCA'
      Required = True
    end
    object cdProdutoESPECIFICACAO: TMemoField
      FieldName = 'ESPECIFICACAO'
      BlobType = ftMemo
      Size = 1
    end
    object cdProdutoNOMECOMERCIAL: TStringField
      FieldName = 'NOMECOMERCIAL'
      Size = 60
    end
    object cdProdutoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 40
    end
    object cdProdutoCOMPOSICAO: TStringField
      FieldName = 'COMPOSICAO'
      Size = 100
    end
    object cdProdutoVENDACONTROLADA: TStringField
      FieldName = 'VENDACONTROLADA'
      Required = True
      Size = 1
    end
    object cdProdutoALTURA: TFMTBCDField
      FieldName = 'ALTURA'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdProdutoLARGURA: TFMTBCDField
      FieldName = 'LARGURA'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdProdutoPROFUNDIDADE: TFMTBCDField
      FieldName = 'PROFUNDIDADE'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdProdutoVOLUME: TFMTBCDField
      FieldName = 'VOLUME'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdProdutoCODIGONCM: TStringField
      FieldName = 'CODIGONCM'
      Size = 8
    end
    object cdProdutoINFORMACAOADICIONAL: TStringField
      FieldName = 'INFORMACAOADICIONAL'
      Size = 200
    end
    object cdProdutoESPESSURA: TFMTBCDField
      FieldName = 'ESPESSURA'
      Precision = 15
      Size = 2
    end
    object cdProdutoGRAMATURA: TFMTBCDField
      FieldName = 'GRAMATURA'
      Precision = 15
      Size = 2
    end
    object cdProdutoPESOEMBALAGEM: TFMTBCDField
      FieldName = 'PESOEMBALAGEM'
      Required = True
      Precision = 15
      Size = 4
    end
    object cdProdutoQTDEMULTIPLAEMBALAGEM: TIntegerField
      FieldName = 'QTDEMULTIPLAEMBALAGEM'
      Required = True
    end
    object cdProdutoORDEM: TIntegerField
      FieldName = 'ORDEM'
      Required = True
    end
    object cdProdutoCATEGORIAPRODUTO: TIntegerField
      FieldName = 'CATEGORIAPRODUTO'
    end
    object cdProdutoUNREFERENCIA: TStringField
      FieldName = 'UNREFERENCIA'
      Required = True
      Size = 6
    end
    object cdProdutoQTDEREFERENCIA: TFMTBCDField
      FieldName = 'QTDEREFERENCIA'
      Required = True
      Precision = 15
      Size = 6
    end
  end
  object dspProduto: TDataSetProvider
    DataSet = SQLProduto
    OnDataRequest = dspProdutoDataRequest
    Left = 680
    Top = 256
  end
  object SQLTransportador: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM TRANSPORTADOR WHERE 0 = 1')
    SQLConnection = SQLConnection
    Left = 624
    Top = 304
  end
  object cdTransportador: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTransportador'
    AfterInsert = cdTransportadorAfterInsert
    OnReconcileError = cdTransportadorReconcileError
    Left = 744
    Top = 304
    object cdTransportadorCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdTransportadorNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object cdTransportadorENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object cdTransportadorCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object cdTransportadorBAIRRO: TIntegerField
      FieldName = 'BAIRRO'
    end
    object cdTransportadorCIDADE: TIntegerField
      FieldName = 'CIDADE'
      Required = True
    end
    object cdTransportadorCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 18
    end
    object cdTransportadorIE: TStringField
      FieldName = 'IE'
      Size = 15
    end
    object cdTransportadorTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 16
    end
    object cdTransportadorFAX: TStringField
      FieldName = 'FAX'
      Size = 16
    end
    object cdTransportadorCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 40
    end
    object cdTransportadorFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Size = 60
    end
    object cdTransportadorSETOR: TStringField
      FieldName = 'SETOR'
      Size = 10
    end
    object cdTransportadorCOMISSAO: TFMTBCDField
      FieldName = 'COMISSAO'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdTransportadorEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 60
    end
    object cdTransportadorENVIARNFE: TStringField
      FieldName = 'ENVIARNFE'
      Required = True
      Size = 1
    end
    object cdTransportadorATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      Size = 1
    end
    object cdTransportadorTIPOPROPRIETARIO: TIntegerField
      FieldName = 'TIPOPROPRIETARIO'
      Required = True
    end
  end
  object dspTransportador: TDataSetProvider
    DataSet = SQLTransportador
    OnDataRequest = dspTransportadorDataRequest
    Left = 680
    Top = 304
  end
  object SQLItemNF: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'SELECT FIRST(1) * FROM ITEMNF WHERE NUMERO = -1')
    SQLConnection = SQLConnection
    Left = 40
    Top = 128
  end
  object cdItemNF: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspItemNF'
    AfterInsert = cdItemNFAfterInsert
    BeforePost = cdItemNFBeforePost
    OnReconcileError = cdItemNFReconcileError
    Left = 160
    Top = 128
    object cdItemNFNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Required = True
    end
    object cdItemNFSERIE: TStringField
      FieldName = 'SERIE'
      Required = True
      Size = 5
    end
    object cdItemNFFILIAL: TIntegerField
      FieldName = 'FILIAL'
      Required = True
    end
    object cdItemNFORIGEM: TStringField
      FieldName = 'ORIGEM'
      Required = True
      Size = 1
    end
    object cdItemNFCLIFOR: TIntegerField
      FieldName = 'CLIFOR'
      Required = True
    end
    object cdItemNFPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Required = True
    end
    object cdItemNFITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdItemNFCFOP: TIntegerField
      FieldName = 'CFOP'
    end
    object cdItemNFQTDE: TFMTBCDField
      FieldName = 'QTDE'
      Required = True
      Precision = 15
      Size = 3
    end
    object cdItemNFUNITARIO: TFMTBCDField
      FieldName = 'UNITARIO'
      Required = True
      Precision = 15
      Size = 6
    end
    object cdItemNFPERCDESCONTO: TFMTBCDField
      FieldName = 'PERCDESCONTO'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdItemNFVALORDESCONTO: TFMTBCDField
      FieldName = 'VALORDESCONTO'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdItemNFTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdItemNFCST: TStringField
      FieldName = 'CST'
      Required = True
      Size = 3
    end
    object cdItemNFREDICMS: TFMTBCDField
      FieldName = 'REDICMS'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdItemNFBASEICMS: TFMTBCDField
      FieldName = 'BASEICMS'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdItemNFPERCICMS: TFMTBCDField
      FieldName = 'PERCICMS'
      Required = True
      Precision = 15
      Size = 3
    end
    object cdItemNFVALORICMS: TFMTBCDField
      FieldName = 'VALORICMS'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdItemNFBASESUBSTITUICAO: TFMTBCDField
      FieldName = 'BASESUBSTITUICAO'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdItemNFPRECOMAXIMOCONSUMIDOR: TFMTBCDField
      FieldName = 'PRECOMAXIMOCONSUMIDOR'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdItemNFPERCSUBSTITUICAO: TFMTBCDField
      FieldName = 'PERCSUBSTITUICAO'
      Required = True
      Precision = 15
      Size = 3
    end
    object cdItemNFMARGEMSUBSTITUICAO: TFMTBCDField
      FieldName = 'MARGEMSUBSTITUICAO'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdItemNFREDUCAOSUBSTITUICAO: TFMTBCDField
      FieldName = 'REDUCAOSUBSTITUICAO'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdItemNFVALORSUBSTITUICAO: TFMTBCDField
      FieldName = 'VALORSUBSTITUICAO'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdItemNFVALORST: TFMTBCDField
      FieldName = 'VALORST'
      Precision = 15
      Size = 2
    end
    object cdItemNFBASEST: TFMTBCDField
      FieldName = 'BASEST'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdItemNFVALORRESSARCIMENTOST: TFMTBCDField
      FieldName = 'VALORRESSARCIMENTOST'
      Precision = 15
      Size = 2
    end
    object cdItemNFVALORISENTO: TFMTBCDField
      FieldName = 'VALORISENTO'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdItemNFBASEIPI: TFMTBCDField
      FieldName = 'BASEIPI'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdItemNFPERCIPI: TFMTBCDField
      FieldName = 'PERCIPI'
      Required = True
      Precision = 15
      Size = 3
    end
    object cdItemNFVALORIPI: TFMTBCDField
      FieldName = 'VALORIPI'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdItemNFBASEFUNRURAL: TFMTBCDField
      FieldName = 'BASEFUNRURAL'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdItemNFVALORFUNRURAL: TFMTBCDField
      FieldName = 'VALORFUNRURAL'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdItemNFCSTPIS: TStringField
      FieldName = 'CSTPIS'
      Required = True
      Size = 2
    end
    object cdItemNFVALORPAUTAPIS: TFMTBCDField
      FieldName = 'VALORPAUTAPIS'
      Precision = 15
      Size = 4
    end
    object cdItemNFBASEPIS: TFMTBCDField
      FieldName = 'BASEPIS'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdItemNFVALORPIS: TFMTBCDField
      FieldName = 'VALORPIS'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdItemNFVALORCONTABIL: TFMTBCDField
      FieldName = 'VALORCONTABIL'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdItemNFQTDEDEVOLVIDO: TFMTBCDField
      FieldName = 'QTDEDEVOLVIDO'
      Required = True
      Precision = 15
      Size = 3
    end
    object cdItemNFMOTIVODEVOLUCAO: TIntegerField
      FieldName = 'MOTIVODEVOLUCAO'
    end
    object cdItemNFTOTALDEVOLVIDO: TFMTBCDField
      FieldName = 'TOTALDEVOLVIDO'
      Precision = 15
    end
    object cdItemNFTOTALPRECOMAXIMOCONSUMIDOR: TFMTBCDField
      FieldName = 'TOTALPRECOMAXIMOCONSUMIDOR'
      Precision = 15
      Size = 5
    end
    object cdItemNFCSTCOFINS: TStringField
      FieldName = 'CSTCOFINS'
      Required = True
      Size = 2
    end
    object cdItemNFBASECOFINS: TFMTBCDField
      FieldName = 'BASECOFINS'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdItemNFVALORCOFINS: TFMTBCDField
      FieldName = 'VALORCOFINS'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdItemNFVALORPAUTACOFINS: TFMTBCDField
      FieldName = 'VALORPAUTACOFINS'
      Precision = 15
      Size = 4
    end
    object cdItemNFRECALCULAR: TStringField
      FieldName = 'RECALCULAR'
      Required = True
      Size = 1
    end
    object cdItemNFVALORCUSTO: TFMTBCDField
      FieldName = 'VALORCUSTO'
      Required = True
      Precision = 15
      Size = 6
    end
    object cdItemNFTOTALVALORCUSTO: TFMTBCDField
      FieldName = 'TOTALVALORCUSTO'
      Precision = 15
      Size = 9
    end
    object cdItemNFVALORSIMPLES: TFMTBCDField
      FieldName = 'VALORSIMPLES'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdItemNFVALORPUBLICA: TFMTBCDField
      FieldName = 'VALORPUBLICA'
      Precision = 15
      Size = 2
    end
    object cdItemNFVALORVENDA: TFMTBCDField
      FieldName = 'VALORVENDA'
      Precision = 15
      Size = 6
    end
    object cdItemNFVALORFUNDESA: TFMTBCDField
      FieldName = 'VALORFUNDESA'
      Precision = 15
      Size = 6
    end
    object cdItemNFTABELAPRECO: TIntegerField
      FieldName = 'TABELAPRECO'
    end
    object cdItemNFPESOBRUTO: TFMTBCDField
      FieldName = 'PESOBRUTO'
      Precision = 15
      Size = 3
    end
    object cdItemNFPESOEMBALAGEM: TFMTBCDField
      FieldName = 'PESOEMBALAGEM'
      Precision = 15
      Size = 3
    end
    object cdItemNFTOTALPESOBRUTO: TFMTBCDField
      FieldName = 'TOTALPESOBRUTO'
      Precision = 15
      Size = 6
    end
    object cdItemNFPESOLIQUIDO: TFMTBCDField
      FieldName = 'PESOLIQUIDO'
      Precision = 15
      Size = 3
    end
    object cdItemNFTOTALPESOLIQUIDO: TFMTBCDField
      FieldName = 'TOTALPESOLIQUIDO'
      Precision = 15
      Size = 6
    end
    object cdItemNFVALORFRETE: TFMTBCDField
      FieldName = 'VALORFRETE'
      Precision = 15
      Size = 2
    end
    object cdItemNFVALORSEGURO: TFMTBCDField
      FieldName = 'VALORSEGURO'
      Precision = 15
      Size = 2
    end
    object cdItemNFVALOROUTRO: TFMTBCDField
      FieldName = 'VALOROUTRO'
      Precision = 15
      Size = 2
    end
    object cdItemNFVOLUME: TIntegerField
      FieldName = 'VOLUME'
    end
    object cdItemNFQTDEVOLUME: TFMTBCDField
      FieldName = 'QTDEVOLUME'
      Precision = 15
      Size = 3
    end
    object cdItemNFVALORBRUTO: TFMTBCDField
      FieldName = 'VALORBRUTO'
      Precision = 15
      Size = 2
    end
    object cdItemNFQTDEMULTIPLAENTRADA: TFMTBCDField
      FieldName = 'QTDEMULTIPLAENTRADA'
      Precision = 15
      Size = 3
    end
    object cdItemNFCOMISSAO: TFMTBCDField
      FieldName = 'COMISSAO'
      Precision = 15
      Size = 2
    end
    object cdItemNFVALORISENTOPIS: TFMTBCDField
      FieldName = 'VALORISENTOPIS'
      Precision = 15
      Size = 2
    end
    object cdItemNFVALORISENTOCOFINS: TFMTBCDField
      FieldName = 'VALORISENTOCOFINS'
      Precision = 15
      Size = 2
    end
    object cdItemNFCSTIPI: TStringField
      FieldName = 'CSTIPI'
      Size = 2
    end
    object cdItemNFPERCPIS: TFMTBCDField
      FieldName = 'PERCPIS'
      Precision = 15
      Size = 3
    end
    object cdItemNFPERCCOFINS: TFMTBCDField
      FieldName = 'PERCCOFINS'
      Precision = 15
      Size = 3
    end
    object cdItemNFVALORPAUTAIPI: TFMTBCDField
      FieldName = 'VALORPAUTAIPI'
      Precision = 15
      Size = 4
    end
    object cdItemNFVALORISENTOIPI: TFMTBCDField
      FieldName = 'VALORISENTOIPI'
      Precision = 15
      Size = 2
    end
    object cdItemNFBASEII: TFMTBCDField
      FieldName = 'BASEII'
      Precision = 15
      Size = 2
    end
    object cdItemNFVALORDESPESAADUANEIRA: TFMTBCDField
      FieldName = 'VALORDESPESAADUANEIRA'
      Precision = 15
      Size = 2
    end
    object cdItemNFVALORII: TFMTBCDField
      FieldName = 'VALORII'
      Precision = 15
      Size = 2
    end
    object cdItemNFVALORIOF: TFMTBCDField
      FieldName = 'VALORIOF'
      Precision = 15
      Size = 2
    end
    object cdItemNFCOMBO: TIntegerField
      FieldName = 'COMBO'
    end
    object cdItemNFVALORICMSDIFERIMENTO: TFMTBCDField
      FieldName = 'VALORICMSDIFERIMENTO'
      Precision = 15
      Size = 2
    end
    object cdItemNFPERCICMSDIFERIMENTO: TFMTBCDField
      FieldName = 'PERCICMSDIFERIMENTO'
      Precision = 15
      Size = 4
    end
    object cdItemNFVALORRETIDO: TFMTBCDField
      FieldName = 'VALORRETIDO'
      Precision = 15
      Size = 6
    end
    object cdItemNFUFCONSUMO: TStringField
      FieldName = 'UFCONSUMO'
      Size = 2
    end
    object cdItemNFBASECIDE: TFMTBCDField
      FieldName = 'BASECIDE'
      Precision = 15
      Size = 3
    end
    object cdItemNFALIQUOTACIDE: TFMTBCDField
      FieldName = 'ALIQUOTACIDE'
      Precision = 15
      Size = 4
    end
    object cdItemNFVALORCIDE: TFMTBCDField
      FieldName = 'VALORCIDE'
      Precision = 15
      Size = 2
    end
    object cdItemNFVALORSENAR: TFMTBCDField
      FieldName = 'VALORSENAR'
      Precision = 15
      Size = 2
    end
    object cdItemNFVALORDESCONTOSIMPLES: TFMTBCDField
      FieldName = 'VALORDESCONTOSIMPLES'
      Precision = 15
      Size = 2
    end
    object cdItemNFCSTORIGEM: TStringField
      FieldName = 'CSTORIGEM'
      Size = 1
    end
  end
  object dspItemNF: TDataSetProvider
    DataSet = SQLItemNF
    OnDataRequest = dspItemNFDataRequest
    Left = 96
    Top = 128
  end
  object SQLOrdemNF: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM ORDEMNF WHERE 0 = 1')
    SQLConnection = SQLConnection
    Left = 39
    Top = 279
  end
  object cdOrdemNF: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOrdemNF'
    AfterInsert = cdOrdemNFAfterInsert
    OnReconcileError = cdOrdemNFReconcileError
    Left = 159
    Top = 279
    object cdOrdemNFNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Required = True
    end
    object cdOrdemNFSERIE: TStringField
      FieldName = 'SERIE'
      Required = True
      Size = 5
    end
    object cdOrdemNFFILIAL: TIntegerField
      FieldName = 'FILIAL'
      Required = True
    end
    object cdOrdemNFORIGEM: TStringField
      FieldName = 'ORIGEM'
      Required = True
      Size = 1
    end
    object cdOrdemNFCLIFOR: TIntegerField
      FieldName = 'CLIFOR'
      Required = True
    end
    object cdOrdemNFORDEM: TStringField
      FieldName = 'ORDEM'
      Required = True
      Size = 15
    end
    object cdOrdemNFVCTO: TDateField
      FieldName = 'VCTO'
      Required = True
    end
    object cdOrdemNFVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
      Size = 2
    end
    object cdOrdemNFALTERADA: TStringField
      FieldName = 'ALTERADA'
      Size = 1
    end
    object cdOrdemNFHISTORICO: TIntegerField
      FieldName = 'HISTORICO'
    end
  end
  object dspOrdemNF: TDataSetProvider
    DataSet = SQLOrdemNF
    OnDataRequest = dspOrdemNFDataRequest
    Left = 95
    Top = 279
  end
  object SQLGeral: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 344
    Top = 80
  end
  object cdGeral: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGeral'
    OnReconcileError = cdGeralReconcileError
    Left = 464
    Top = 80
  end
  object dspGeral: TDataSetProvider
    DataSet = SQLGeral
    OnDataRequest = dspGeralDataRequest
    Left = 400
    Top = 80
  end
  object SQLNFE: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'SELECT FIRST(1) * FROM NFE WHERE NUMERO = -1')
    SQLConnection = SQLConnection
    Left = 39
    Top = 327
    object SQLNFENUMERO: TIntegerField
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SQLNFESERIE: TStringField
      FieldName = 'SERIE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object SQLNFEFILIAL: TIntegerField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SQLNFEORIGEM: TStringField
      FieldName = 'ORIGEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 1
    end
    object SQLNFECLIFOR: TIntegerField
      FieldName = 'CLIFOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SQLNFECHAVEACESSO: TStringField
      FieldName = 'CHAVEACESSO'
      Size = 44
    end
    object SQLNFECNF: TStringField
      FieldName = 'CNF'
      Size = 9
    end
    object SQLNFEVERAPLIC: TStringField
      FieldName = 'VERAPLIC'
    end
    object SQLNFECHNFE: TStringField
      FieldName = 'CHNFE'
      Size = 44
    end
    object SQLNFEDHRECBTO: TStringField
      FieldName = 'DHRECBTO'
    end
    object SQLNFENPROT: TStringField
      FieldName = 'NPROT'
      Size = 15
    end
    object SQLNFEDIGVAL: TStringField
      FieldName = 'DIGVAL'
      Size = 28
    end
    object SQLNFECSTAT: TStringField
      FieldName = 'CSTAT'
      Size = 3
    end
    object SQLNFEAUTORIZADA: TStringField
      FieldName = 'AUTORIZADA'
      Required = True
      Size = 1
    end
    object SQLNFEXML: TMemoField
      FieldName = 'XML'
      BlobType = ftMemo
      Size = 1
    end
    object SQLNFETPAMB: TStringField
      FieldName = 'TPAMB'
      Required = True
      Size = 1
    end
    object SQLNFEPROTXML: TMemoField
      FieldName = 'PROTXML'
      BlobType = ftMemo
      Size = 1
    end
    object SQLNFEPEDCANCXML: TMemoField
      FieldName = 'PEDCANCXML'
      BlobType = ftMemo
      Size = 1
    end
    object SQLNFECANCCSTAT: TStringField
      FieldName = 'CANCCSTAT'
      Size = 3
    end
    object SQLNFECANCDHRECBTO: TStringField
      FieldName = 'CANCDHRECBTO'
      Size = 25
    end
    object SQLNFECANCNPROT: TStringField
      FieldName = 'CANCNPROT'
      Size = 15
    end
    object SQLNFECANCXML: TMemoField
      FieldName = 'CANCXML'
      BlobType = ftMemo
      Size = 1
    end
    object SQLNFEPEDINUTXML: TMemoField
      FieldName = 'PEDINUTXML'
      BlobType = ftMemo
      Size = 1
    end
    object SQLNFEINUTCSTAT: TStringField
      FieldName = 'INUTCSTAT'
      Size = 3
    end
    object SQLNFEINUTDHRECBTO: TStringField
      FieldName = 'INUTDHRECBTO'
    end
    object SQLNFEINUTNPROT: TStringField
      FieldName = 'INUTNPROT'
      Size = 15
    end
    object SQLNFEINUTXML: TMemoField
      FieldName = 'INUTXML'
      BlobType = ftMemo
      Size = 1
    end
    object SQLNFECONTINGENCIA: TIntegerField
      FieldName = 'CONTINGENCIA'
    end
    object SQLNFEFORMAEMISSAO: TStringField
      FieldName = 'FORMAEMISSAO'
      Required = True
      Size = 1
    end
    object SQLNFEENVIADOEMAIL: TIntegerField
      FieldName = 'ENVIADOEMAIL'
    end
    object SQLNFEENVIARTDOCS: TStringField
      FieldName = 'ENVIARTDOCS'
      Size = 1
    end
    object SQLNFEENVIADOTDOCS: TSQLTimeStampField
      FieldName = 'ENVIADOTDOCS'
    end
  end
  object cdNFE: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNFE'
    AfterInsert = cdNFEAfterInsert
    OnReconcileError = cdNFEReconcileError
    Left = 159
    Top = 327
    object cdNFENUMERO: TIntegerField
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdNFESERIE: TStringField
      FieldName = 'SERIE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object cdNFEFILIAL: TIntegerField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdNFEORIGEM: TStringField
      FieldName = 'ORIGEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 1
    end
    object cdNFECLIFOR: TIntegerField
      FieldName = 'CLIFOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdNFECHAVEACESSO: TStringField
      FieldName = 'CHAVEACESSO'
      Size = 44
    end
    object cdNFECNF: TStringField
      FieldName = 'CNF'
      Size = 9
    end
    object cdNFEVERAPLIC: TStringField
      FieldName = 'VERAPLIC'
    end
    object cdNFECHNFE: TStringField
      FieldName = 'CHNFE'
      Size = 44
    end
    object cdNFEDHRECBTO: TStringField
      FieldName = 'DHRECBTO'
    end
    object cdNFENPROT: TStringField
      FieldName = 'NPROT'
      Size = 15
    end
    object cdNFEDIGVAL: TStringField
      FieldName = 'DIGVAL'
      Size = 28
    end
    object cdNFECSTAT: TStringField
      FieldName = 'CSTAT'
      Size = 3
    end
    object cdNFEAUTORIZADA: TStringField
      FieldName = 'AUTORIZADA'
      Required = True
      Size = 1
    end
    object cdNFEXML: TMemoField
      FieldName = 'XML'
      BlobType = ftMemo
      Size = 1
    end
    object cdNFETPAMB: TStringField
      FieldName = 'TPAMB'
      Required = True
      Size = 1
    end
    object cdNFEPROTXML: TMemoField
      FieldName = 'PROTXML'
      BlobType = ftMemo
      Size = 1
    end
    object cdNFEPEDCANCXML: TMemoField
      FieldName = 'PEDCANCXML'
      BlobType = ftMemo
      Size = 1
    end
    object cdNFECANCCSTAT: TStringField
      FieldName = 'CANCCSTAT'
      Size = 3
    end
    object cdNFECANCDHRECBTO: TStringField
      FieldName = 'CANCDHRECBTO'
      Size = 25
    end
    object cdNFECANCNPROT: TStringField
      FieldName = 'CANCNPROT'
      Size = 15
    end
    object cdNFECANCXML: TMemoField
      FieldName = 'CANCXML'
      BlobType = ftMemo
      Size = 1
    end
    object cdNFEPEDINUTXML: TMemoField
      FieldName = 'PEDINUTXML'
      BlobType = ftMemo
      Size = 1
    end
    object cdNFEINUTCSTAT: TStringField
      FieldName = 'INUTCSTAT'
      Size = 3
    end
    object cdNFEINUTDHRECBTO: TStringField
      FieldName = 'INUTDHRECBTO'
    end
    object cdNFEINUTNPROT: TStringField
      FieldName = 'INUTNPROT'
      Size = 15
    end
    object cdNFEINUTXML: TMemoField
      FieldName = 'INUTXML'
      BlobType = ftMemo
      Size = 1
    end
    object cdNFECONTINGENCIA: TIntegerField
      FieldName = 'CONTINGENCIA'
    end
    object cdNFEFORMAEMISSAO: TStringField
      FieldName = 'FORMAEMISSAO'
      Required = True
      Size = 1
    end
    object cdNFEENVIADOEMAIL: TIntegerField
      FieldName = 'ENVIADOEMAIL'
    end
    object cdNFEENVIARTDOCS: TStringField
      FieldName = 'ENVIARTDOCS'
      Size = 1
    end
    object cdNFEENVIADOTDOCS: TSQLTimeStampField
      FieldName = 'ENVIADOTDOCS'
    end
  end
  object dspNFE: TDataSetProvider
    DataSet = SQLNFE
    OnDataRequest = dspNFEDataRequest
    Left = 95
    Top = 327
  end
  object QueryGeral: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 344
    Top = 136
  end
  object cdQueryGeral: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQueryGeral'
    OnReconcileError = cdQueryGeralReconcileError
    Left = 464
    Top = 136
  end
  object dspQueryGeral: TDataSetProvider
    DataSet = QueryGeral
    OnDataRequest = dspQueryGeralDataRequest
    Left = 400
    Top = 136
  end
  object SQLServicoNF: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM SERVICONF WHERE 0 = 1')
    SQLConnection = SQLConnection
    Left = 40
    Top = 184
  end
  object cdServicoNF: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspServicoNF'
    AfterInsert = cdItemNFAfterInsert
    BeforePost = cdItemNFBeforePost
    OnReconcileError = cdServicoNFReconcileError
    Left = 160
    Top = 184
    object cdServicoNFNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Required = True
    end
    object cdServicoNFSERIE: TStringField
      FieldName = 'SERIE'
      Required = True
      Size = 5
    end
    object cdServicoNFFILIAL: TIntegerField
      FieldName = 'FILIAL'
      Required = True
    end
    object cdServicoNFORIGEM: TStringField
      FieldName = 'ORIGEM'
      Required = True
      Size = 1
    end
    object cdServicoNFCLIFOR: TIntegerField
      FieldName = 'CLIFOR'
      Required = True
    end
    object cdServicoNFSERVICO: TIntegerField
      FieldName = 'SERVICO'
      Required = True
    end
    object cdServicoNFQTDE: TIntegerField
      FieldName = 'QTDE'
      Required = True
    end
    object cdServicoNFUNITARIO: TFMTBCDField
      FieldName = 'UNITARIO'
      Required = True
      Precision = 15
      Size = 6
    end
    object cdServicoNFPERCDESCONTO: TFMTBCDField
      FieldName = 'PERCDESCONTO'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdServicoNFVALORDESCONTO: TFMTBCDField
      FieldName = 'VALORDESCONTO'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdServicoNFTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdServicoNFCFOP: TIntegerField
      FieldName = 'CFOP'
    end
    object cdServicoNFALIQUOTAISS: TFMTBCDField
      FieldName = 'ALIQUOTAISS'
      Precision = 15
      Size = 2
    end
    object cdServicoNFBASEISS: TFMTBCDField
      FieldName = 'BASEISS'
      Precision = 15
      Size = 2
    end
    object cdServicoNFVALORISS: TFMTBCDField
      FieldName = 'VALORISS'
      Precision = 15
      Size = 4
    end
    object cdServicoNFCSTPIS: TStringField
      FieldName = 'CSTPIS'
      Required = True
      Size = 2
    end
    object cdServicoNFBASEPIS: TFMTBCDField
      FieldName = 'BASEPIS'
      Precision = 15
      Size = 2
    end
    object cdServicoNFPERCPIS: TFMTBCDField
      FieldName = 'PERCPIS'
      Precision = 15
      Size = 3
    end
    object cdServicoNFVALORPIS: TFMTBCDField
      FieldName = 'VALORPIS'
      Precision = 15
      Size = 2
    end
    object cdServicoNFCSTCOFINS: TStringField
      FieldName = 'CSTCOFINS'
      Required = True
      Size = 2
    end
    object cdServicoNFBASECOFINS: TFMTBCDField
      FieldName = 'BASECOFINS'
      Precision = 15
      Size = 2
    end
    object cdServicoNFPERCCOFINS: TFMTBCDField
      FieldName = 'PERCCOFINS'
      Precision = 15
      Size = 3
    end
    object cdServicoNFVALORCOFINS: TFMTBCDField
      FieldName = 'VALORCOFINS'
      Precision = 15
      Size = 2
    end
    object cdServicoNFRECALCULAR: TStringField
      FieldName = 'RECALCULAR'
      Required = True
      Size = 1
    end
  end
  object dspServicoNF: TDataSetProvider
    DataSet = SQLServicoNF
    OnDataRequest = dspServicoNFDataRequest
    Left = 96
    Top = 184
  end
  object SQLValidadeItemNFEntrada: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM VALIDADEITEMNF WHERE 0 = 1')
    SQLConnection = SQLConnection
    Left = 40
    Top = 232
  end
  object cdValidadeItemNFEntrada: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspValidadeItemNFEntrada'
    OnReconcileError = cdValidadeItemNFEntradaReconcileError
    Left = 160
    Top = 232
    object cdValidadeItemNFEntradaNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Required = True
    end
    object cdValidadeItemNFEntradaSERIE: TStringField
      FieldName = 'SERIE'
      Required = True
      Size = 5
    end
    object cdValidadeItemNFEntradaFILIAL: TIntegerField
      FieldName = 'FILIAL'
      Required = True
    end
    object cdValidadeItemNFEntradaORIGEM: TStringField
      FieldName = 'ORIGEM'
      Required = True
      Size = 1
    end
    object cdValidadeItemNFEntradaCLIFOR: TIntegerField
      FieldName = 'CLIFOR'
      Required = True
    end
    object cdValidadeItemNFEntradaPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Required = True
    end
    object cdValidadeItemNFEntradaITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdValidadeItemNFEntradaLOTE: TStringField
      FieldName = 'LOTE'
      Required = True
    end
    object cdValidadeItemNFEntradaVALIDADE: TDateField
      FieldName = 'VALIDADE'
      Required = True
    end
    object cdValidadeItemNFEntradaQTDE: TFMTBCDField
      FieldName = 'QTDE'
      Required = True
      Precision = 15
      Size = 3
    end
    object cdValidadeItemNFEntradaFABRICACAO: TDateField
      FieldName = 'FABRICACAO'
    end
    object cdValidadeItemNFEntradaQTDEVOLUME: TFMTBCDField
      FieldName = 'QTDEVOLUME'
      Precision = 15
      Size = 3
    end
  end
  object dspValidadeItemNFEntrada: TDataSetProvider
    DataSet = SQLValidadeItemNFEntrada
    OnDataRequest = dspValidadeItemNFEntradaDataRequest
    Left = 96
    Top = 232
  end
  object SQLQueryTipoCFOP: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM TIPOCFOP WHERE 0 = 1')
    SQLConnection = SQLConnection
    Left = 624
    Top = 360
  end
  object cdTipoCFOP: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipoCFOP'
    AfterInsert = cdTipoCFOPAfterInsert
    OnReconcileError = cdTransportadorReconcileError
    Left = 744
    Top = 360
    object cdTipoCFOPCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdTipoCFOPNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 40
    end
    object cdTipoCFOPGERARFINANCEIRO: TStringField
      FieldName = 'GERARFINANCEIRO'
      Required = True
      Size = 1
    end
    object cdTipoCFOPGERARESTOQUE: TStringField
      FieldName = 'GERARESTOQUE'
      Required = True
      Size = 1
    end
    object cdTipoCFOPGERARCONSUMO: TStringField
      FieldName = 'GERARCONSUMO'
      Required = True
      Size = 1
    end
    object cdTipoCFOPZERARUNITARIO: TStringField
      FieldName = 'ZERARUNITARIO'
      Required = True
      Size = 1
    end
    object cdTipoCFOPGERARCAIXA: TStringField
      FieldName = 'GERARCAIXA'
      Required = True
      Size = 1
    end
    object cdTipoCFOPHISTORICO: TIntegerField
      FieldName = 'HISTORICO'
    end
    object cdTipoCFOPCALCULAICMS: TStringField
      FieldName = 'CALCULAICMS'
      Required = True
      Size = 1
    end
    object cdTipoCFOPCALCULAIPI: TStringField
      FieldName = 'CALCULAIPI'
      Required = True
      Size = 1
    end
    object cdTipoCFOPGERARCOMISSAO: TStringField
      FieldName = 'GERARCOMISSAO'
      Required = True
      Size = 1
    end
    object cdTipoCFOPGERARTROCA: TStringField
      FieldName = 'GERARTROCA'
      Required = True
      Size = 1
    end
    object cdTipoCFOPGERARCUSTO: TStringField
      FieldName = 'GERARCUSTO'
      Required = True
      Size = 1
    end
    object cdTipoCFOPCALCULAFUNRURAL: TStringField
      FieldName = 'CALCULAFUNRURAL'
      Required = True
      Size = 1
    end
    object cdTipoCFOPGERARBONIFICACAO: TStringField
      FieldName = 'GERARBONIFICACAO'
      Required = True
      Size = 1
    end
    object cdTipoCFOPGERARFLEX: TStringField
      FieldName = 'GERARFLEX'
      Required = True
      Size = 1
    end
    object cdTipoCFOPFATURA: TStringField
      FieldName = 'FATURA'
      Required = True
      Size = 1
    end
    object cdTipoCFOPDESCONTARFUNRURAL: TStringField
      FieldName = 'DESCONTARFUNRURAL'
      Required = True
      Size = 1
    end
    object cdTipoCFOPCONTABIL: TStringField
      FieldName = 'CONTABIL'
      Size = 5
    end
    object cdTipoCFOPMOVIMENTACAOFISICA: TStringField
      FieldName = 'MOVIMENTACAOFISICA'
      Required = True
      Size = 1
    end
    object cdTipoCFOPDEVOLUCAO: TStringField
      FieldName = 'DEVOLUCAO'
      Required = True
      Size = 1
    end
    object cdTipoCFOPCALCULASUBSTITUICAO: TStringField
      FieldName = 'CALCULASUBSTITUICAO'
      Required = True
      Size = 1
    end
    object cdTipoCFOPGERARESTOQUEIMPROPRIO: TStringField
      FieldName = 'GERARESTOQUEIMPROPRIO'
      Required = True
      Size = 1
    end
    object cdTipoCFOPSITUACAO: TIntegerField
      FieldName = 'SITUACAO'
    end
    object cdTipoCFOPCALCULAFUNDESA: TStringField
      FieldName = 'CALCULAFUNDESA'
      Required = True
      Size = 1
    end
    object cdTipoCFOPGERARFIDELIZACAO: TStringField
      FieldName = 'GERARFIDELIZACAO'
      Required = True
      Size = 1
    end
    object cdTipoCFOPATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      Size = 1
    end
    object cdTipoCFOPCALCULACREDITOSIMPLES: TStringField
      FieldName = 'CALCULACREDITOSIMPLES'
      Required = True
      Size = 1
    end
    object cdTipoCFOPCALCULAPIS: TStringField
      FieldName = 'CALCULAPIS'
      Required = True
      Size = 1
    end
    object cdTipoCFOPCALCULACOFINS: TStringField
      FieldName = 'CALCULACOFINS'
      Required = True
      Size = 1
    end
    object cdTipoCFOPFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      Required = True
      Size = 1
    end
    object cdTipoCFOPNATUREZAOPERACAO: TIntegerField
      FieldName = 'NATUREZAOPERACAO'
      Required = True
    end
    object cdTipoCFOPDESCONTARFRETE: TStringField
      FieldName = 'DESCONTARFRETE'
      Required = True
      Size = 1
    end
    object cdTipoCFOPCODIGOBASECALCULOCREDITO: TIntegerField
      FieldName = 'CODIGOBASECALCULOCREDITO'
    end
    object cdTipoCFOPMENSAGEMFISCAL: TIntegerField
      FieldName = 'MENSAGEMFISCAL'
    end
    object cdTipoCFOPDESCONTARFUNDESA: TStringField
      FieldName = 'DESCONTARFUNDESA'
      Required = True
      Size = 1
    end
    object cdTipoCFOPOUTRASES: TStringField
      FieldName = 'OUTRASES'
      Required = True
      Size = 1
    end
    object cdTipoCFOPENCARGOCOMPORBASEICMS: TStringField
      FieldName = 'ENCARGOCOMPORBASEICMS'
      Required = True
      Size = 1
    end
    object cdTipoCFOPCALCULADESCONTOSIMPLES: TStringField
      FieldName = 'CALCULADESCONTOSIMPLES'
      Required = True
      Size = 1
    end
    object cdTipoCFOPEXPORTARDADOSCOLETA: TStringField
      FieldName = 'EXPORTARDADOSCOLETA'
      Required = True
      Size = 1
    end
    object cdTipoCFOPFRETECOMPORBASEICMS: TStringField
      FieldName = 'FRETECOMPORBASEICMS'
      Required = True
      Size = 1
    end
    object cdTipoCFOPCONDICAOPAGAMENTO: TIntegerField
      FieldName = 'CONDICAOPAGAMENTO'
    end
    object cdTipoCFOPFORMAPAGAMENTO: TIntegerField
      FieldName = 'FORMAPAGAMENTO'
    end
  end
  object dspTipoCFOP: TDataSetProvider
    DataSet = SQLQueryTipoCFOP
    OnDataRequest = dspTransportadorDataRequest
    Left = 680
    Top = 360
  end
  object SQLQueryCFOP: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM CFOP WHERE 0 = 1')
    SQLConnection = SQLConnection
    Left = 624
    Top = 416
  end
  object cdCFOP: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCFOP'
    AfterInsert = cdCFOPAfterInsert
    OnReconcileError = cdCFOPReconcileError
    Left = 744
    Top = 416
    object cdCFOPCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdCFOPNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object cdCFOPCFOP: TStringField
      FieldName = 'CFOP'
      Required = True
      Size = 5
    end
    object cdCFOPTIPOCFOP: TIntegerField
      FieldName = 'TIPOCFOP'
      Required = True
    end
    object cdCFOPCLASSIFICACAOFISCAL: TIntegerField
      FieldName = 'CLASSIFICACAOFISCAL'
      Required = True
    end
    object cdCFOPCATEGORIA: TIntegerField
      FieldName = 'CATEGORIA'
      Required = True
    end
    object cdCFOPMENSAGEMFISCAL: TIntegerField
      FieldName = 'MENSAGEMFISCAL'
    end
    object cdCFOPFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      Size = 1
    end
  end
  object dspCFOP: TDataSetProvider
    DataSet = SQLQueryCFOP
    OnDataRequest = dspTransportadorDataRequest
    Left = 680
    Top = 416
  end
  object SQLQueryCTe: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'SELECT FIRST(1) * FROM CT WHERE NUMERO = -1')
    SQLConnection = SQLConnection
    Left = 32
    Top = 408
    object SQLQueryCTeID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SQLQueryCTeFILIAL: TIntegerField
      FieldName = 'FILIAL'
      Required = True
    end
    object SQLQueryCTeNFNUMERO: TIntegerField
      FieldName = 'NFNUMERO'
    end
    object SQLQueryCTeNFSERIE: TStringField
      FieldName = 'NFSERIE'
      Size = 5
    end
    object SQLQueryCTeNFFILIAL: TIntegerField
      FieldName = 'NFFILIAL'
    end
    object SQLQueryCTeNFORIGEM: TStringField
      FieldName = 'NFORIGEM'
      Size = 1
    end
    object SQLQueryCTeNFCLIFOR: TIntegerField
      FieldName = 'NFCLIFOR'
    end
    object SQLQueryCTeCLIFOR: TIntegerField
      FieldName = 'CLIFOR'
      Required = True
    end
    object SQLQueryCTeEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Required = True
    end
    object SQLQueryCTeAQUISICAO: TDateField
      FieldName = 'AQUISICAO'
      Required = True
    end
    object SQLQueryCTeMODELO: TStringField
      FieldName = 'MODELO'
      Required = True
      Size = 3
    end
    object SQLQueryCTeSERIE: TStringField
      FieldName = 'SERIE'
      Required = True
      Size = 4
    end
    object SQLQueryCTeSUBSERIE: TStringField
      FieldName = 'SUBSERIE'
      Size = 3
    end
    object SQLQueryCTeNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Required = True
    end
    object SQLQueryCTeCFOP: TIntegerField
      FieldName = 'CFOP'
    end
    object SQLQueryCTeVALORTOTAL: TFMTBCDField
      FieldName = 'VALORTOTAL'
      Required = True
      Precision = 15
      Size = 2
    end
    object SQLQueryCTeVALORDESCONTO: TFMTBCDField
      FieldName = 'VALORDESCONTO'
      Required = True
      Precision = 15
      Size = 2
    end
    object SQLQueryCTeVALORREDBASEICMS: TFMTBCDField
      FieldName = 'VALORREDBASEICMS'
      Required = True
      Precision = 15
      Size = 2
    end
    object SQLQueryCTeBASEICMS: TFMTBCDField
      FieldName = 'BASEICMS'
      Required = True
      Precision = 15
      Size = 2
    end
    object SQLQueryCTePERCICMS: TFMTBCDField
      FieldName = 'PERCICMS'
      Required = True
      Precision = 15
      Size = 2
    end
    object SQLQueryCTeVALORICMS: TFMTBCDField
      FieldName = 'VALORICMS'
      Required = True
      Precision = 15
      Size = 2
    end
    object SQLQueryCTeVALORISENTO: TFMTBCDField
      FieldName = 'VALORISENTO'
      Required = True
      Precision = 15
      Size = 2
    end
    object SQLQueryCTeVALOROUTRAS: TFMTBCDField
      FieldName = 'VALOROUTRAS'
      Required = True
      Precision = 15
      Size = 2
    end
    object SQLQueryCTeVALORSERVICO: TFMTBCDField
      FieldName = 'VALORSERVICO'
      Required = True
      Precision = 15
      Size = 2
    end
    object SQLQueryCTeCANCELADO: TStringField
      FieldName = 'CANCELADO'
      Required = True
      Size = 1
    end
    object SQLQueryCTeMODALIDADE: TStringField
      FieldName = 'MODALIDADE'
      Required = True
      Size = 1
    end
    object SQLQueryCTeNATUREZA: TStringField
      FieldName = 'NATUREZA'
      Required = True
      Size = 1
    end
    object SQLQueryCTeCONTAFRETE: TStringField
      FieldName = 'CONTAFRETE'
      Required = True
      Size = 1
    end
    object SQLQueryCTeCHAVE: TStringField
      FieldName = 'CHAVE'
      Size = 44
    end
    object SQLQueryCTeTIPOCTE: TIntegerField
      FieldName = 'TIPOCTE'
    end
    object SQLQueryCTeCSTPIS: TStringField
      FieldName = 'CSTPIS'
      Size = 2
    end
    object SQLQueryCTeCODIGOBASEPIS: TStringField
      FieldName = 'CODIGOBASEPIS'
      Size = 2
    end
    object SQLQueryCTeBASEPIS: TFMTBCDField
      FieldName = 'BASEPIS'
      Precision = 15
      Size = 2
    end
    object SQLQueryCTePERCPIS: TFMTBCDField
      FieldName = 'PERCPIS'
      Precision = 15
      Size = 2
    end
    object SQLQueryCTeVALORPIS: TFMTBCDField
      FieldName = 'VALORPIS'
      Precision = 15
      Size = 2
    end
    object SQLQueryCTeCSTCOFINS: TStringField
      FieldName = 'CSTCOFINS'
      Size = 2
    end
    object SQLQueryCTeCODIGOBASECOFINS: TStringField
      FieldName = 'CODIGOBASECOFINS'
      Size = 2
    end
    object SQLQueryCTeBASECOFINS: TFMTBCDField
      FieldName = 'BASECOFINS'
      Precision = 15
      Size = 2
    end
    object SQLQueryCTePERCCOFINS: TFMTBCDField
      FieldName = 'PERCCOFINS'
      Precision = 15
      Size = 2
    end
    object SQLQueryCTeVALORCOFINS: TFMTBCDField
      FieldName = 'VALORCOFINS'
      Precision = 15
      Size = 2
    end
    object SQLQueryCTeCSTICMS: TStringField
      FieldName = 'CSTICMS'
      Size = 3
    end
    object SQLQueryCTeXML: TMemoField
      FieldName = 'XML'
      BlobType = ftMemo
      Size = 1
    end
    object SQLQueryCTeREMETENTE: TIntegerField
      FieldName = 'REMETENTE'
    end
    object SQLQueryCTeDESTINATARIO: TIntegerField
      FieldName = 'DESTINATARIO'
    end
    object SQLQueryCTeRECEBEDOR: TIntegerField
      FieldName = 'RECEBEDOR'
    end
    object SQLQueryCTeEXPEDIDOR: TIntegerField
      FieldName = 'EXPEDIDOR'
    end
    object SQLQueryCTeTOMADOR: TIntegerField
      FieldName = 'TOMADOR'
    end
    object SQLQueryCTeTOMADORSERVICO: TIntegerField
      FieldName = 'TOMADORSERVICO'
    end
    object SQLQueryCTeORIGEM: TStringField
      FieldName = 'ORIGEM'
      Required = True
      Size = 1
    end
    object SQLQueryCTeINDICADORFORMAPAGAMENTO: TIntegerField
      FieldName = 'INDICADORFORMAPAGAMENTO'
    end
    object SQLQueryCTeINUTILIZADO: TStringField
      FieldName = 'INUTILIZADO'
      Required = True
      Size = 1
    end
    object SQLQueryCTeINDICADORTIPOSERVICO: TIntegerField
      FieldName = 'INDICADORTIPOSERVICO'
    end
    object SQLQueryCTeNPROT: TStringField
      FieldName = 'NPROT'
      Size = 15
    end
    object SQLQueryCTeCANCNPROT: TStringField
      FieldName = 'CANCNPROT'
      Size = 15
    end
    object SQLQueryCTeINUTNPROT: TStringField
      FieldName = 'INUTNPROT'
      Size = 15
    end
    object SQLQueryCTeINDICADORTIPODOCUMENTO: TIntegerField
      FieldName = 'INDICADORTIPODOCUMENTO'
    end
    object SQLQueryCTeHORA: TTimeField
      FieldName = 'HORA'
    end
    object SQLQueryCTeBASEST: TFMTBCDField
      FieldName = 'BASEST'
      Required = True
      Precision = 15
      Size = 2
    end
    object SQLQueryCTeVALORST: TFMTBCDField
      FieldName = 'VALORST'
      Required = True
      Precision = 15
      Size = 2
    end
    object SQLQueryCTeDATAPREVISTAENTREGA: TDateField
      FieldName = 'DATAPREVISTAENTREGA'
    end
    object SQLQueryCTeCARGAPREDOMINANTE: TStringField
      FieldName = 'CARGAPREDOMINANTE'
      Size = 60
    end
    object SQLQueryCTeFORMAPAGAMENTO: TIntegerField
      FieldName = 'FORMAPAGAMENTO'
    end
    object SQLQueryCTeCONDICAOPAGAMENTO: TIntegerField
      FieldName = 'CONDICAOPAGAMENTO'
    end
    object SQLQueryCTeAUTORIZADO: TStringField
      FieldName = 'AUTORIZADO'
      Required = True
      Size = 1
    end
    object SQLQueryCTeATUALIZADO: TStringField
      FieldName = 'ATUALIZADO'
      Required = True
      Size = 1
    end
    object SQLQueryCTePESOBRUTO: TFMTBCDField
      FieldName = 'PESOBRUTO'
      Precision = 15
      Size = 3
    end
    object SQLQueryCTePESOLIQUIDO: TFMTBCDField
      FieldName = 'PESOLIQUIDO'
      Precision = 15
      Size = 3
    end
    object SQLQueryCTeVOLUMES: TIntegerField
      FieldName = 'VOLUMES'
    end
    object SQLQueryCTeVALORTOTALITENS: TFMTBCDField
      FieldName = 'VALORTOTALITENS'
      Precision = 15
      Size = 2
    end
    object SQLQueryCTeSOMAR: TStringField
      FieldName = 'SOMAR'
      Required = True
      Size = 1
    end
    object SQLQueryCTeRECIBOLOTE: TStringField
      FieldName = 'RECIBOLOTE'
      Size = 15
    end
    object SQLQueryCTeVALORTOTALTRIBUTO: TFMTBCDField
      FieldName = 'VALORTOTALTRIBUTO'
      Required = True
      Precision = 15
      Size = 2
    end
    object SQLQueryCTeNBS: TIntegerField
      FieldName = 'NBS'
    end
    object SQLQueryCTeOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object SQLQueryCTeCHAVEREFERENCIADA: TStringField
      FieldName = 'CHAVEREFERENCIADA'
      Size = 44
    end
    object SQLQueryCTeVALORPEDAGIO: TFMTBCDField
      FieldName = 'VALORPEDAGIO'
      Precision = 15
      Size = 2
    end
    object SQLQueryCTeCANCXML: TMemoField
      FieldName = 'CANCXML'
      BlobType = ftMemo
      Size = 1
    end
    object SQLQueryCTeINUTXML: TMemoField
      FieldName = 'INUTXML'
      BlobType = ftMemo
      Size = 1
    end
    object SQLQueryCTeENVIADOEMAIL: TIntegerField
      FieldName = 'ENVIADOEMAIL'
    end
    object SQLQueryCTeVEICULO: TIntegerField
      FieldName = 'VEICULO'
    end
    object SQLQueryCTeMOTORISTA: TIntegerField
      FieldName = 'MOTORISTA'
    end
    object SQLQueryCTeINDICADORLOTACAO: TIntegerField
      FieldName = 'INDICADORLOTACAO'
    end
  end
  object cdCTe: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCTe'
    AfterInsert = cdCTeAfterInsert
    BeforePost = cdCTeBeforePost
    OnReconcileError = cdNFReconcileError
    Left = 147
    Top = 408
    object cdCTeID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdCTeFILIAL: TIntegerField
      FieldName = 'FILIAL'
      Required = True
    end
    object cdCTeNFNUMERO: TIntegerField
      FieldName = 'NFNUMERO'
    end
    object cdCTeNFSERIE: TStringField
      FieldName = 'NFSERIE'
      Size = 5
    end
    object cdCTeNFFILIAL: TIntegerField
      FieldName = 'NFFILIAL'
    end
    object cdCTeNFORIGEM: TStringField
      FieldName = 'NFORIGEM'
      Size = 1
    end
    object cdCTeNFCLIFOR: TIntegerField
      FieldName = 'NFCLIFOR'
    end
    object cdCTeCLIFOR: TIntegerField
      FieldName = 'CLIFOR'
      Required = True
    end
    object cdCTeEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Required = True
    end
    object cdCTeAQUISICAO: TDateField
      FieldName = 'AQUISICAO'
      Required = True
    end
    object cdCTeMODELO: TStringField
      FieldName = 'MODELO'
      Required = True
      Size = 3
    end
    object cdCTeSERIE: TStringField
      FieldName = 'SERIE'
      Required = True
      Size = 4
    end
    object cdCTeSUBSERIE: TStringField
      FieldName = 'SUBSERIE'
      Size = 3
    end
    object cdCTeNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Required = True
    end
    object cdCTeCFOP: TIntegerField
      FieldName = 'CFOP'
    end
    object cdCTeVALORTOTAL: TFMTBCDField
      FieldName = 'VALORTOTAL'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdCTeVALORDESCONTO: TFMTBCDField
      FieldName = 'VALORDESCONTO'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdCTeVALORREDBASEICMS: TFMTBCDField
      FieldName = 'VALORREDBASEICMS'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdCTeBASEICMS: TFMTBCDField
      FieldName = 'BASEICMS'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdCTePERCICMS: TFMTBCDField
      FieldName = 'PERCICMS'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdCTeVALORICMS: TFMTBCDField
      FieldName = 'VALORICMS'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdCTeVALORISENTO: TFMTBCDField
      FieldName = 'VALORISENTO'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdCTeVALOROUTRAS: TFMTBCDField
      FieldName = 'VALOROUTRAS'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdCTeVALORSERVICO: TFMTBCDField
      FieldName = 'VALORSERVICO'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdCTeCANCELADO: TStringField
      FieldName = 'CANCELADO'
      Required = True
      Size = 1
    end
    object cdCTeMODALIDADE: TStringField
      FieldName = 'MODALIDADE'
      Required = True
      Size = 1
    end
    object cdCTeNATUREZA: TStringField
      FieldName = 'NATUREZA'
      Required = True
      Size = 1
    end
    object cdCTeCONTAFRETE: TStringField
      FieldName = 'CONTAFRETE'
      Required = True
      Size = 1
    end
    object cdCTeCHAVE: TStringField
      FieldName = 'CHAVE'
      Size = 44
    end
    object cdCTeTIPOCTE: TIntegerField
      FieldName = 'TIPOCTE'
    end
    object cdCTeCSTPIS: TStringField
      FieldName = 'CSTPIS'
      Size = 2
    end
    object cdCTeCODIGOBASEPIS: TStringField
      FieldName = 'CODIGOBASEPIS'
      Size = 2
    end
    object cdCTeBASEPIS: TFMTBCDField
      FieldName = 'BASEPIS'
      Precision = 15
      Size = 2
    end
    object cdCTePERCPIS: TFMTBCDField
      FieldName = 'PERCPIS'
      Precision = 15
      Size = 2
    end
    object cdCTeVALORPIS: TFMTBCDField
      FieldName = 'VALORPIS'
      Precision = 15
      Size = 2
    end
    object cdCTeCSTCOFINS: TStringField
      FieldName = 'CSTCOFINS'
      Size = 2
    end
    object cdCTeCODIGOBASECOFINS: TStringField
      FieldName = 'CODIGOBASECOFINS'
      Size = 2
    end
    object cdCTeBASECOFINS: TFMTBCDField
      FieldName = 'BASECOFINS'
      Precision = 15
      Size = 2
    end
    object cdCTePERCCOFINS: TFMTBCDField
      FieldName = 'PERCCOFINS'
      Precision = 15
      Size = 2
    end
    object cdCTeVALORCOFINS: TFMTBCDField
      FieldName = 'VALORCOFINS'
      Precision = 15
      Size = 2
    end
    object cdCTeCSTICMS: TStringField
      FieldName = 'CSTICMS'
      Size = 3
    end
    object cdCTeXML: TMemoField
      FieldName = 'XML'
      BlobType = ftMemo
      Size = 1
    end
    object cdCTeREMETENTE: TIntegerField
      FieldName = 'REMETENTE'
    end
    object cdCTeDESTINATARIO: TIntegerField
      FieldName = 'DESTINATARIO'
    end
    object cdCTeRECEBEDOR: TIntegerField
      FieldName = 'RECEBEDOR'
    end
    object cdCTeEXPEDIDOR: TIntegerField
      FieldName = 'EXPEDIDOR'
    end
    object cdCTeTOMADOR: TIntegerField
      FieldName = 'TOMADOR'
    end
    object cdCTeTOMADORSERVICO: TIntegerField
      FieldName = 'TOMADORSERVICO'
    end
    object cdCTeORIGEM: TStringField
      FieldName = 'ORIGEM'
      Required = True
      Size = 1
    end
    object cdCTeINDICADORFORMAPAGAMENTO: TIntegerField
      FieldName = 'INDICADORFORMAPAGAMENTO'
    end
    object cdCTeINUTILIZADO: TStringField
      FieldName = 'INUTILIZADO'
      Required = True
      Size = 1
    end
    object cdCTeINDICADORTIPOSERVICO: TIntegerField
      FieldName = 'INDICADORTIPOSERVICO'
    end
    object cdCTeNPROT: TStringField
      FieldName = 'NPROT'
      Size = 15
    end
    object cdCTeCANCNPROT: TStringField
      FieldName = 'CANCNPROT'
      Size = 15
    end
    object cdCTeINUTNPROT: TStringField
      FieldName = 'INUTNPROT'
      Size = 15
    end
    object cdCTeINDICADORTIPODOCUMENTO: TIntegerField
      FieldName = 'INDICADORTIPODOCUMENTO'
    end
    object cdCTeHORA: TTimeField
      FieldName = 'HORA'
    end
    object cdCTeBASEST: TFMTBCDField
      FieldName = 'BASEST'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdCTeVALORST: TFMTBCDField
      FieldName = 'VALORST'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdCTeDATAPREVISTAENTREGA: TDateField
      FieldName = 'DATAPREVISTAENTREGA'
    end
    object cdCTeCARGAPREDOMINANTE: TStringField
      FieldName = 'CARGAPREDOMINANTE'
      Size = 60
    end
    object cdCTeFORMAPAGAMENTO: TIntegerField
      FieldName = 'FORMAPAGAMENTO'
    end
    object cdCTeCONDICAOPAGAMENTO: TIntegerField
      FieldName = 'CONDICAOPAGAMENTO'
    end
    object cdCTeAUTORIZADO: TStringField
      FieldName = 'AUTORIZADO'
      Required = True
      Size = 1
    end
    object cdCTeATUALIZADO: TStringField
      FieldName = 'ATUALIZADO'
      Required = True
      Size = 1
    end
    object cdCTePESOBRUTO: TFMTBCDField
      FieldName = 'PESOBRUTO'
      Precision = 15
      Size = 3
    end
    object cdCTePESOLIQUIDO: TFMTBCDField
      FieldName = 'PESOLIQUIDO'
      Precision = 15
      Size = 3
    end
    object cdCTeVOLUMES: TIntegerField
      FieldName = 'VOLUMES'
    end
    object cdCTeVALORTOTALITENS: TFMTBCDField
      FieldName = 'VALORTOTALITENS'
      Precision = 15
      Size = 2
    end
    object cdCTeSOMAR: TStringField
      FieldName = 'SOMAR'
      Required = True
      Size = 1
    end
    object cdCTeRECIBOLOTE: TStringField
      FieldName = 'RECIBOLOTE'
      Size = 15
    end
    object cdCTeVALORTOTALTRIBUTO: TFMTBCDField
      FieldName = 'VALORTOTALTRIBUTO'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdCTeNBS: TIntegerField
      FieldName = 'NBS'
    end
    object cdCTeOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdCTeCHAVEREFERENCIADA: TStringField
      FieldName = 'CHAVEREFERENCIADA'
      Size = 44
    end
    object cdCTeVALORPEDAGIO: TFMTBCDField
      FieldName = 'VALORPEDAGIO'
      Precision = 15
      Size = 2
    end
    object cdCTeCANCXML: TMemoField
      FieldName = 'CANCXML'
      BlobType = ftMemo
      Size = 1
    end
    object cdCTeINUTXML: TMemoField
      FieldName = 'INUTXML'
      BlobType = ftMemo
      Size = 1
    end
    object cdCTeENVIADOEMAIL: TIntegerField
      FieldName = 'ENVIADOEMAIL'
    end
    object cdCTeVEICULO: TIntegerField
      FieldName = 'VEICULO'
    end
    object cdCTeMOTORISTA: TIntegerField
      FieldName = 'MOTORISTA'
    end
    object cdCTeINDICADORLOTACAO: TIntegerField
      FieldName = 'INDICADORLOTACAO'
    end
  end
  object dspCTe: TDataSetProvider
    DataSet = SQLQueryCTe
    UpdateMode = upWhereKeyOnly
    OnDataRequest = dspCTeDataRequest
    Left = 93
    Top = 408
  end
  object SQLQueryItemCTe: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'SELECT FIRST(1) * FROM ITEMCT WHERE CT = -1')
    SQLConnection = SQLConnection
    Left = 32
    Top = 464
  end
  object cdItemCTe: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspItemCTe'
    AfterInsert = cdItemCTeAfterInsert
    OnReconcileError = cdNFReconcileError
    Left = 147
    Top = 464
    object cdItemCTeCT: TIntegerField
      FieldName = 'CT'
      Required = True
    end
    object cdItemCTeITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdItemCTeMODELO: TStringField
      FieldName = 'MODELO'
      Size = 3
    end
    object cdItemCTeCHAVEACESSO: TStringField
      FieldName = 'CHAVEACESSO'
      Size = 44
    end
    object cdItemCTeNUMERODOCUMENTO: TIntegerField
      FieldName = 'NUMERODOCUMENTO'
    end
    object cdItemCTeSERIEDOCUMENTO: TStringField
      FieldName = 'SERIEDOCUMENTO'
      Size = 3
    end
    object cdItemCTeEMISSAODOCUMENTO: TDateField
      FieldName = 'EMISSAODOCUMENTO'
    end
    object cdItemCTeBASEICMS: TFMTBCDField
      FieldName = 'BASEICMS'
      Precision = 15
      Size = 2
    end
    object cdItemCTeVALORICMS: TFMTBCDField
      FieldName = 'VALORICMS'
      Precision = 15
      Size = 2
    end
    object cdItemCTeBASEST: TFMTBCDField
      FieldName = 'BASEST'
      Precision = 15
      Size = 2
    end
    object cdItemCTeVALORST: TFMTBCDField
      FieldName = 'VALORST'
      Precision = 15
      Size = 2
    end
    object cdItemCTeTOTALPRODUTO: TFMTBCDField
      FieldName = 'TOTALPRODUTO'
      Precision = 15
      Size = 2
    end
    object cdItemCTeTOTALDOCUMENTO: TFMTBCDField
      FieldName = 'TOTALDOCUMENTO'
      Precision = 15
      Size = 2
    end
    object cdItemCTeCFOPPREDOMINANTE: TStringField
      FieldName = 'CFOPPREDOMINANTE'
      Size = 5
    end
    object cdItemCTeNFNUMERO: TIntegerField
      FieldName = 'NFNUMERO'
    end
    object cdItemCTeNFSERIE: TStringField
      FieldName = 'NFSERIE'
      Size = 5
    end
    object cdItemCTeNFFILIAL: TIntegerField
      FieldName = 'NFFILIAL'
    end
    object cdItemCTeNFORIGEM: TStringField
      FieldName = 'NFORIGEM'
      Size = 1
    end
    object cdItemCTeNFCLIFOR: TIntegerField
      FieldName = 'NFCLIFOR'
    end
    object cdItemCTePESOBRUTO: TFMTBCDField
      FieldName = 'PESOBRUTO'
      Precision = 15
      Size = 3
    end
    object cdItemCTePESOLIQUIDO: TFMTBCDField
      FieldName = 'PESOLIQUIDO'
      Precision = 15
      Size = 3
    end
    object cdItemCTeVOLUMES: TIntegerField
      FieldName = 'VOLUMES'
    end
  end
  object dspItemCTe: TDataSetProvider
    DataSet = SQLQueryItemCTe
    UpdateMode = upWhereKeyOnly
    OnDataRequest = dspItemCTeDataRequest
    Left = 93
    Top = 464
  end
  object SQLQueryOrdemCTe: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'SELECT FIRST(1) * FROM ORDEMCT WHERE CT = -1')
    SQLConnection = SQLConnection
    Left = 32
    Top = 520
  end
  object cdOrdemCTe: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOrdemCTe'
    OnReconcileError = cdNFReconcileError
    Left = 147
    Top = 520
    object cdOrdemCTeCT: TIntegerField
      FieldName = 'CT'
      Required = True
    end
    object cdOrdemCTeORDEM: TStringField
      FieldName = 'ORDEM'
      Required = True
    end
    object cdOrdemCTeVCTO: TDateField
      FieldName = 'VCTO'
      Required = True
    end
    object cdOrdemCTeVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Required = True
      Precision = 15
      Size = 2
    end
  end
  object dspOrdemCTe: TDataSetProvider
    DataSet = SQLQueryOrdemCTe
    UpdateMode = upWhereKeyOnly
    OnDataRequest = dspOrdemCTeDataRequest
    Left = 93
    Top = 520
  end
  object SQLQueryUNMedida: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM UNIDADEMEDIDA WHERE CODIGO IS NULL')
    SQLConnection = SQLConnection
    Left = 624
    Top = 480
  end
  object cdUNMedida: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUNMedida'
    Left = 744
    Top = 480
    object cdUNMedidaCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 6
    end
    object cdUNMedidaNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
  end
  object dspUNMedida: TDataSetProvider
    DataSet = SQLQueryUNMedida
    OnDataRequest = dspTransportadorDataRequest
    Left = 680
    Top = 480
  end
end
