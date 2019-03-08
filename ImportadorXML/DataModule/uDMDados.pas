unit uDMDados;

interface

uses
  SysUtils, Classes, WideStrings, DBXFirebird, DB, SqlExpr, FMTBcd, Provider,
  DBClient, RecError;

Const
  TomadorRemetente = 0;
  TomadorDestinatario = 3;
  TomadorExpedidor = 1;
  TomadorRecebedor = 2;
  TomadorOutro = 4;

  TipoDocumentoNFe = 1;

  TipoServicoNormal = 0;

type
  TDMDados = class(TDataModule)
    SQLConnection: TSQLConnection;
    SQLNF: TSQLQuery;
    cdNF: TClientDataSet;
    dspNF: TDataSetProvider;
    SQLPesquisa: TSQLQuery;
    cdPesquisa: TClientDataSet;
    dspPesquisa: TDataSetProvider;
    SQLClifor: TSQLQuery;
    cdClifor: TClientDataSet;
    dspClifor: TDataSetProvider;
    SQLBairro: TSQLQuery;
    cdBairro: TClientDataSet;
    dspBairro: TDataSetProvider;
    SQLCidade: TSQLQuery;
    cdCidade: TClientDataSet;
    dspCidade: TDataSetProvider;
    SQLCliforContato: TSQLQuery;
    cdCliforContato: TClientDataSet;
    dspCliforContato: TDataSetProvider;
    SQLProdutoClifor: TSQLQuery;
    cdProdutoClifor: TClientDataSet;
    dspProdutoClifor: TDataSetProvider;
    SQLProduto: TSQLQuery;
    cdProduto: TClientDataSet;
    dspProduto: TDataSetProvider;
    cdProdutoCODIGO: TIntegerField;
    cdProdutoBARRAS: TStringField;
    cdProdutoNOME: TStringField;
    cdProdutoUNCOMPRA: TStringField;
    cdProdutoQTDECOMPRA: TIntegerField;
    cdProdutoUNVENDA: TStringField;
    cdProdutoQTDEVENDA: TIntegerField;
    cdProdutoUNCARREGAMENTO: TStringField;
    cdProdutoQTDECARREGAMENTO: TFMTBCDField;
    cdProdutoTIPOPRODUTO: TIntegerField;
    cdProdutoGRUPO: TIntegerField;
    cdProdutoTRIBUTACAO: TIntegerField;
    cdProdutoMARCA: TIntegerField;
    cdProdutoCLIFOR2: TIntegerField;
    cdProdutoPESOBRUTO: TFMTBCDField;
    cdProdutoPESOLIQUIDO: TFMTBCDField;
    cdProdutoQTDEPADRAO: TIntegerField;
    cdProdutoCODIGOFORNECEDOR: TStringField;
    cdProdutoDESCRICAOEMBALAGEM: TStringField;
    cdProdutoCLASSIFICACAO: TIntegerField;
    cdProdutoCLASSE: TIntegerField;
    cdProdutoQTDEMULTIPLA: TFMTBCDField;
    cdProdutoUNTROCA: TStringField;
    cdProdutoQTDETROCA: TIntegerField;
    cdProdutoESPECIFICACAO: TMemoField;
    cdProdutoNOMECOMERCIAL: TStringField;
    cdProdutoREFERENCIA: TStringField;
    cdProdutoCOMPOSICAO: TStringField;
    cdProdutoVENDACONTROLADA: TStringField;
    cdProdutoALTURA: TFMTBCDField;
    cdProdutoLARGURA: TFMTBCDField;
    cdProdutoPROFUNDIDADE: TFMTBCDField;
    cdProdutoVOLUME: TFMTBCDField;
    cdProdutoCODIGONCM: TStringField;
    cdProdutoINFORMACAOADICIONAL: TStringField;
    cdProdutoESPESSURA: TFMTBCDField;
    cdProdutoGRAMATURA: TFMTBCDField;
    cdProdutoPESOEMBALAGEM: TFMTBCDField;
    cdProdutoQTDEMULTIPLAEMBALAGEM: TIntegerField;
    cdProdutoORDEM: TIntegerField;
    cdProdutoCATEGORIAPRODUTO: TIntegerField;
    SQLTransportador: TSQLQuery;
    cdTransportador: TClientDataSet;
    dspTransportador: TDataSetProvider;
    cdTransportadorCODIGO: TIntegerField;
    cdTransportadorNOME: TStringField;
    cdTransportadorENDERECO: TStringField;
    cdTransportadorCEP: TStringField;
    cdTransportadorBAIRRO: TIntegerField;
    cdTransportadorCIDADE: TIntegerField;
    cdTransportadorCNPJ: TStringField;
    cdTransportadorIE: TStringField;
    cdTransportadorTELEFONE: TStringField;
    cdTransportadorFAX: TStringField;
    cdTransportadorCONTATO: TStringField;
    cdTransportadorFANTASIA: TStringField;
    cdTransportadorSETOR: TStringField;
    cdTransportadorCOMISSAO: TFMTBCDField;
    cdTransportadorEMAIL: TStringField;
    cdTransportadorENVIARNFE: TStringField;
    cdTransportadorATIVO: TStringField;
    cdCidadeCODIGO: TIntegerField;
    cdCidadeNOME: TStringField;
    cdCidadeCODIGOFISCAL: TStringField;
    cdCidadePOPULACAO: TIntegerField;
    cdCidadeOBS: TStringField;
    cdCidadeREGIAOVENDA: TStringField;
    cdCidadeCEP: TStringField;
    cdCidadeCOMISSAOENTREGA: TFMTBCDField;
    cdCidadeESTADO: TIntegerField;
    cdCidadeLATITUDE: TStringField;
    cdCidadeLONGITUDE: TStringField;
    SQLItemNF: TSQLQuery;
    cdItemNF: TClientDataSet;
    dspItemNF: TDataSetProvider;
    SQLOrdemNF: TSQLQuery;
    cdOrdemNF: TClientDataSet;
    dspOrdemNF: TDataSetProvider;
    cdOrdemNFNUMERO: TIntegerField;
    cdOrdemNFSERIE: TStringField;
    cdOrdemNFFILIAL: TIntegerField;
    cdOrdemNFORIGEM: TStringField;
    cdOrdemNFCLIFOR: TIntegerField;
    cdOrdemNFORDEM: TStringField;
    cdOrdemNFVCTO: TDateField;
    cdOrdemNFVALOR: TFMTBCDField;
    cdOrdemNFALTERADA: TStringField;
    cdOrdemNFHISTORICO: TIntegerField;
    SQLGeral: TSQLQuery;
    cdGeral: TClientDataSet;
    dspGeral: TDataSetProvider;
    SQLNFE: TSQLQuery;
    cdNFE: TClientDataSet;
    dspNFE: TDataSetProvider;
    cdNFENUMERO: TIntegerField;
    cdNFESERIE: TStringField;
    cdNFEFILIAL: TIntegerField;
    cdNFEORIGEM: TStringField;
    cdNFECLIFOR: TIntegerField;
    cdNFECHAVEACESSO: TStringField;
    cdNFECNF: TStringField;
    cdNFEVERAPLIC: TStringField;
    cdNFECHNFE: TStringField;
    cdNFEDHRECBTO: TStringField;
    cdNFENPROT: TStringField;
    cdNFEDIGVAL: TStringField;
    cdNFECSTAT: TStringField;
    cdNFEAUTORIZADA: TStringField;
    cdNFEXML: TMemoField;
    cdNFETPAMB: TStringField;
    cdNFEPROTXML: TMemoField;
    cdNFEPEDCANCXML: TMemoField;
    cdNFECANCCSTAT: TStringField;
    cdNFECANCDHRECBTO: TStringField;
    cdNFECANCNPROT: TStringField;
    cdNFECANCXML: TMemoField;
    cdNFEPEDINUTXML: TMemoField;
    cdNFEINUTCSTAT: TStringField;
    cdNFEINUTDHRECBTO: TStringField;
    cdNFEINUTNPROT: TStringField;
    cdNFEINUTXML: TMemoField;
    cdNFECONTINGENCIA: TIntegerField;
    cdNFEFORMAEMISSAO: TStringField;
    cdNFEENVIADOEMAIL: TIntegerField;
    cdNFEENVIARTDOCS: TStringField;
    cdNFEENVIADOTDOCS: TSQLTimeStampField;
    QueryGeral: TSQLQuery;
    cdQueryGeral: TClientDataSet;
    dspQueryGeral: TDataSetProvider;
    SQLServicoNF: TSQLQuery;
    cdServicoNF: TClientDataSet;
    dspServicoNF: TDataSetProvider;
    cdServicoNFNUMERO: TIntegerField;
    cdServicoNFSERIE: TStringField;
    cdServicoNFFILIAL: TIntegerField;
    cdServicoNFORIGEM: TStringField;
    cdServicoNFCLIFOR: TIntegerField;
    cdServicoNFSERVICO: TIntegerField;
    cdServicoNFQTDE: TIntegerField;
    cdServicoNFUNITARIO: TFMTBCDField;
    cdServicoNFPERCDESCONTO: TFMTBCDField;
    cdServicoNFVALORDESCONTO: TFMTBCDField;
    cdServicoNFTOTAL: TFMTBCDField;
    cdServicoNFCFOP: TIntegerField;
    cdServicoNFALIQUOTAISS: TFMTBCDField;
    cdServicoNFBASEISS: TFMTBCDField;
    cdServicoNFVALORISS: TFMTBCDField;
    cdServicoNFCSTPIS: TStringField;
    cdServicoNFBASEPIS: TFMTBCDField;
    cdServicoNFPERCPIS: TFMTBCDField;
    cdServicoNFVALORPIS: TFMTBCDField;
    cdServicoNFCSTCOFINS: TStringField;
    cdServicoNFBASECOFINS: TFMTBCDField;
    cdServicoNFPERCCOFINS: TFMTBCDField;
    cdServicoNFVALORCOFINS: TFMTBCDField;
    cdServicoNFRECALCULAR: TStringField;
    cdCliforCODIGO: TIntegerField;
    cdCliforFILIAL: TIntegerField;
    cdCliforTIPO: TIntegerField;
    cdCliforNOME: TStringField;
    cdCliforFANTASIA: TStringField;
    cdCliforCNPJ: TStringField;
    cdCliforIE: TStringField;
    cdCliforENDERECO: TStringField;
    cdCliforCOMPLEMENTO: TStringField;
    cdCliforREFERENCIA: TStringField;
    cdCliforCEP: TStringField;
    cdCliforBAIRRO: TIntegerField;
    cdCliforCIDADE: TIntegerField;
    cdCliforTIPOESTABELECIMENTO: TIntegerField;
    cdCliforIMOVEL: TIntegerField;
    cdCliforREGIAO: TIntegerField;
    cdCliforDATA: TDateField;
    cdCliforLIMITECREDITO: TFMTBCDField;
    cdCliforFORMAPAGAMENTO: TIntegerField;
    cdCliforCONDICAOPAGAMENTO: TIntegerField;
    cdCliforOBS: TMemoField;
    cdCliforATIVO: TStringField;
    cdCliforINFCOMERCIAL: TMemoField;
    cdCliforDATANASC: TDateField;
    cdCliforPROMOTOR: TIntegerField;
    cdCliforRESPONSAVEL: TStringField;
    cdCliforCPFRESPONSAVEL: TStringField;
    cdCliforRGRESPONSAVEL: TStringField;
    cdCliforDATAMOVIMENTO: TDateField;
    cdCliforREFERENCIACOBRANCA: TStringField;
    cdCliforDATAINICIOATIVIDADES: TDateField;
    cdCliforBLOQUEARVENDA: TStringField;
    cdCliforDATAINATIVADO: TDateField;
    cdCliforENDERECOCOBRANCA: TStringField;
    cdCliforBAIRROCOBRANCA: TIntegerField;
    cdCliforCIDADECOBRANCA: TIntegerField;
    cdCliforCEPCOBRANCA: TStringField;
    cdCliforEXPORTAROBS: TStringField;
    cdCliforATUALIZARCADASTRO: TStringField;
    cdCliforRAPEL: TFMTBCDField;
    cdCliforALVARA: TStringField;
    cdCliforTRANSPORTADOR: TIntegerField;
    cdCliforISENTO: TStringField;
    cdCliforCNPJVALIDO: TStringField;
    cdCliforIEVALIDO: TStringField;
    cdCliforCATEGORIA: TIntegerField;
    cdCliforNUMERO: TStringField;
    cdCliforINSCRICAOSUFRAMA: TStringField;
    cdCliforNUMEROALVARA: TStringField;
    cdCliforREDE: TIntegerField;
    cdCliforPUBLICA: TStringField;
    cdCliforINDUSTRIA: TStringField;
    cdCliforCADIN: TStringField;
    cdCliforREGISTROCONSELHOREGIONAL: TStringField;
    cdCliforAUTORIZACAOESPECIAL: TStringField;
    cdCliforCODIGOREGISTRO: TStringField;
    cdCliforLOCALTRABALHO: TStringField;
    cdCliforDATAADMISSAO: TDateField;
    cdCliforSALARIO: TFMTBCDField;
    cdCliforCARGO: TStringField;
    cdCliforNOMEPAI: TStringField;
    cdCliforNOMEMAE: TStringField;
    cdCliforNOMECONJUGE: TStringField;
    cdCliforDATANASCIMENTOCONJUGE: TDateField;
    cdCliforCPFCONJUGE: TStringField;
    cdCliforRGCONJUGE: TStringField;
    cdCliforLOCALTRABALHOCONJUGE: TStringField;
    cdCliforDATAADMISSAOCONJUGE: TDateField;
    cdCliforSALARIOCONJUGE: TFMTBCDField;
    cdCliforCARGOCONJUGE: TStringField;
    cdCliforNATURALIDADE: TIntegerField;
    cdCliforESTADOCIVIL: TIntegerField;
    cdCliforDATACONSULTA: TDateField;
    cdCliforBANCO: TIntegerField;
    cdCliforAGENCIA: TStringField;
    cdCliforCONTA: TStringField;
    cdCliforVALORPRODUCAO: TFMTBCDField;
    cdCliforCOMISSAO: TFMTBCDField;
    cdCliforSIMPLES: TStringField;
    cdCliforPRACAPAGAMENTO: TIntegerField;
    cdCliforLATITUDE: TStringField;
    cdCliforLONGITUDE: TStringField;
    cdCliforSPC: TStringField;
    cdCliforHISTORICOCREDITO: TIntegerField;
    cdCliforHISTORICODEBITO: TIntegerField;
    cdCliforNIRF: TStringField;
    cdCliforCODIGOPRODUTOR: TStringField;
    cdCliforENVIARREMESSA: TStringField;
    cdCliforVALORFRETECOLETA: TFMTBCDField;
    cdCliforIM: TStringField;
    cdCliforDATAALVARA: TDateField;
    cdCliforDATAAUTORIZACAOESPECIAL: TDateField;
    cdCliforDATAREGISTROCONSELHOREGIONAL: TDateField;
    cdCliforCLASSIFICACAOCLIFOR: TIntegerField;
    cdCliforMEI: TStringField;
    cdCliforINFORMACAOADICIONAL: TStringField;
    SQLNFNUMERO: TIntegerField;
    SQLNFSERIE: TStringField;
    SQLNFFILIAL: TIntegerField;
    SQLNFORIGEM: TStringField;
    SQLNFCLIFOR: TIntegerField;
    SQLNFEMISSAO: TDateField;
    SQLNFSAIDA: TDateField;
    SQLNFHORA: TTimeField;
    SQLNFCONDICAOPAGAMENTO: TIntegerField;
    SQLNFFORMAPAGAMENTO: TIntegerField;
    SQLNFBASEICMS: TFMTBCDField;
    SQLNFVALORICMS: TFMTBCDField;
    SQLNFBASESUBSTITUICAO: TFMTBCDField;
    SQLNFVALORSUBSTITUICAO: TFMTBCDField;
    SQLNFTOTALPRODUTO: TFMTBCDField;
    SQLNFVALORFRETE: TFMTBCDField;
    SQLNFVALORSEGURO: TFMTBCDField;
    SQLNFVALORENCARGO: TFMTBCDField;
    SQLNFVALORIPI: TFMTBCDField;
    SQLNFPERCDESCONTO: TFMTBCDField;
    SQLNFVALORDESCONTO: TFMTBCDField;
    SQLNFTOTAL: TFMTBCDField;
    SQLNFFUNCIONARIO: TIntegerField;
    SQLNFTRANSPORTADOR: TIntegerField;
    SQLNFCONTAFRETE: TStringField;
    SQLNFPLACA: TStringField;
    SQLNFUFPLACA: TStringField;
    SQLNFVOLUME: TIntegerField;
    SQLNFESPECIE: TStringField;
    SQLNFMARCA: TStringField;
    SQLNFLOTE: TStringField;
    SQLNFPESOBRUTO: TFMTBCDField;
    SQLNFPESOLIQUIDO: TFMTBCDField;
    SQLNFOBS: TMemoField;
    SQLNFCANCELADA: TStringField;
    SQLNFIMPRESSA: TStringField;
    SQLNFATUALIZADA: TStringField;
    SQLNFTABELAPRECO: TIntegerField;
    SQLNFPEDIDO: TIntegerField;
    SQLNFENTREGUE: TStringField;
    SQLNFDATACOLETA: TDateField;
    SQLNFBASEFUNRURAL: TFMTBCDField;
    SQLNFVALORFUNRURAL: TFMTBCDField;
    SQLNFBASEIPI: TFMTBCDField;
    SQLNFBASEISS: TFMTBCDField;
    SQLNFVALORISS: TFMTBCDField;
    SQLNFTIPOCFOP: TIntegerField;
    SQLNFIMPRESSAO: TSQLTimeStampField;
    SQLNFFILIALPEDIDO: TIntegerField;
    SQLNFCOMISSAO: TFMTBCDField;
    SQLNFBASEPIS: TFMTBCDField;
    SQLNFVALORPIS: TFMTBCDField;
    SQLNFBASECOFINS: TFMTBCDField;
    SQLNFVALORCOFINS: TFMTBCDField;
    SQLNFVALORISENTO: TFMTBCDField;
    SQLNFSOMAR: TStringField;
    SQLNFMODELO: TStringField;
    SQLNFVALORII: TFMTBCDField;
    SQLNFVALORSIMPLES: TFMTBCDField;
    SQLNFINUTILIZADA: TStringField;
    SQLNFDENEGADA: TStringField;
    SQLNFVALORFUNDESA: TFMTBCDField;
    SQLNFTOTALDEVOLVIDO: TFMTBCDField;
    SQLNFLOCALEMBARQUE: TIntegerField;
    SQLNFVALORST: TFMTBCDField;
    SQLNFVALORFRETEFINAL: TFMTBCDField;
    SQLNFFRETEPAGO: TStringField;
    SQLNFPERCVARIACAO: TFMTBCDField;
    SQLNFBASEST: TFMTBCDField;
    SQLNFVEICULO: TIntegerField;
    SQLNFSERVICO: TStringField;
    SQLNFVALORRESSARCIMENTOST: TFMTBCDField;
    SQLNFVALORADIANTAMENTO: TFMTBCDField;
    SQLNFFINALIDADE: TStringField;
    SQLNFVALORPISSERVICO: TFMTBCDField;
    SQLNFVALORCOFINSSERVICO: TFMTBCDField;
    SQLNFTOTALBRUTO: TFMTBCDField;
    SQLNFVALORISENTOPIS: TFMTBCDField;
    SQLNFVALORISENTOCOFINS: TFMTBCDField;
    SQLNFMOTIVOCANCELAMENTO: TIntegerField;
    SQLNFVALORIRRF: TFMTBCDField;
    SQLNFVALORICMSDIFERIMENTO: TFMTBCDField;
    SQLNFCONFERIDO: TStringField;
    SQLNFDEVOLVIDA: TStringField;
    SQLNFMOTIVODEVOLUCAO: TIntegerField;
    cdNFNUMERO: TIntegerField;
    cdNFSERIE: TStringField;
    cdNFFILIAL: TIntegerField;
    cdNFORIGEM: TStringField;
    cdNFCLIFOR: TIntegerField;
    cdNFEMISSAO: TDateField;
    cdNFSAIDA: TDateField;
    cdNFHORA: TTimeField;
    cdNFCONDICAOPAGAMENTO: TIntegerField;
    cdNFFORMAPAGAMENTO: TIntegerField;
    cdNFBASEICMS: TFMTBCDField;
    cdNFVALORICMS: TFMTBCDField;
    cdNFBASESUBSTITUICAO: TFMTBCDField;
    cdNFVALORSUBSTITUICAO: TFMTBCDField;
    cdNFTOTALPRODUTO: TFMTBCDField;
    cdNFVALORFRETE: TFMTBCDField;
    cdNFVALORSEGURO: TFMTBCDField;
    cdNFVALORENCARGO: TFMTBCDField;
    cdNFVALORIPI: TFMTBCDField;
    cdNFPERCDESCONTO: TFMTBCDField;
    cdNFVALORDESCONTO: TFMTBCDField;
    cdNFTOTAL: TFMTBCDField;
    cdNFFUNCIONARIO: TIntegerField;
    cdNFTRANSPORTADOR: TIntegerField;
    cdNFCONTAFRETE: TStringField;
    cdNFPLACA: TStringField;
    cdNFUFPLACA: TStringField;
    cdNFVOLUME: TIntegerField;
    cdNFESPECIE: TStringField;
    cdNFMARCA: TStringField;
    cdNFLOTE: TStringField;
    cdNFPESOBRUTO: TFMTBCDField;
    cdNFPESOLIQUIDO: TFMTBCDField;
    cdNFOBS: TMemoField;
    cdNFCANCELADA: TStringField;
    cdNFIMPRESSA: TStringField;
    cdNFATUALIZADA: TStringField;
    cdNFTABELAPRECO: TIntegerField;
    cdNFPEDIDO: TIntegerField;
    cdNFENTREGUE: TStringField;
    cdNFDATACOLETA: TDateField;
    cdNFBASEFUNRURAL: TFMTBCDField;
    cdNFVALORFUNRURAL: TFMTBCDField;
    cdNFBASEIPI: TFMTBCDField;
    cdNFBASEISS: TFMTBCDField;
    cdNFVALORISS: TFMTBCDField;
    cdNFTIPOCFOP: TIntegerField;
    cdNFIMPRESSAO: TSQLTimeStampField;
    cdNFFILIALPEDIDO: TIntegerField;
    cdNFCOMISSAO: TFMTBCDField;
    cdNFBASEPIS: TFMTBCDField;
    cdNFVALORPIS: TFMTBCDField;
    cdNFBASECOFINS: TFMTBCDField;
    cdNFVALORCOFINS: TFMTBCDField;
    cdNFVALORISENTO: TFMTBCDField;
    cdNFSOMAR: TStringField;
    cdNFMODELO: TStringField;
    cdNFVALORII: TFMTBCDField;
    cdNFVALORSIMPLES: TFMTBCDField;
    cdNFINUTILIZADA: TStringField;
    cdNFDENEGADA: TStringField;
    cdNFVALORFUNDESA: TFMTBCDField;
    cdNFTOTALDEVOLVIDO: TFMTBCDField;
    cdNFLOCALEMBARQUE: TIntegerField;
    cdNFVALORST: TFMTBCDField;
    cdNFVALORFRETEFINAL: TFMTBCDField;
    cdNFFRETEPAGO: TStringField;
    cdNFPERCVARIACAO: TFMTBCDField;
    cdNFBASEST: TFMTBCDField;
    cdNFVEICULO: TIntegerField;
    cdNFSERVICO: TStringField;
    cdNFVALORRESSARCIMENTOST: TFMTBCDField;
    cdNFVALORADIANTAMENTO: TFMTBCDField;
    cdNFFINALIDADE: TStringField;
    cdNFVALORPISSERVICO: TFMTBCDField;
    cdNFVALORCOFINSSERVICO: TFMTBCDField;
    cdNFTOTALBRUTO: TFMTBCDField;
    cdNFVALORISENTOPIS: TFMTBCDField;
    cdNFVALORISENTOCOFINS: TFMTBCDField;
    cdNFMOTIVOCANCELAMENTO: TIntegerField;
    cdNFVALORIRRF: TFMTBCDField;
    cdNFVALORICMSDIFERIMENTO: TFMTBCDField;
    cdNFCONFERIDO: TStringField;
    cdNFDEVOLVIDA: TStringField;
    cdNFMOTIVODEVOLUCAO: TIntegerField;
    cdItemNFNUMERO: TIntegerField;
    cdItemNFSERIE: TStringField;
    cdItemNFFILIAL: TIntegerField;
    cdItemNFORIGEM: TStringField;
    cdItemNFCLIFOR: TIntegerField;
    cdItemNFPRODUTO: TIntegerField;
    cdItemNFITEM: TIntegerField;
    cdItemNFCFOP: TIntegerField;
    cdItemNFQTDE: TFMTBCDField;
    cdItemNFUNITARIO: TFMTBCDField;
    cdItemNFPERCDESCONTO: TFMTBCDField;
    cdItemNFVALORDESCONTO: TFMTBCDField;
    cdItemNFTOTAL: TFMTBCDField;
    cdItemNFCST: TStringField;
    cdItemNFREDICMS: TFMTBCDField;
    cdItemNFBASEICMS: TFMTBCDField;
    cdItemNFPERCICMS: TFMTBCDField;
    cdItemNFVALORICMS: TFMTBCDField;
    cdItemNFBASESUBSTITUICAO: TFMTBCDField;
    cdItemNFPRECOMAXIMOCONSUMIDOR: TFMTBCDField;
    cdItemNFPERCSUBSTITUICAO: TFMTBCDField;
    cdItemNFMARGEMSUBSTITUICAO: TFMTBCDField;
    cdItemNFREDUCAOSUBSTITUICAO: TFMTBCDField;
    cdItemNFVALORSUBSTITUICAO: TFMTBCDField;
    cdItemNFVALORST: TFMTBCDField;
    cdItemNFBASEST: TFMTBCDField;
    cdItemNFVALORRESSARCIMENTOST: TFMTBCDField;
    cdItemNFVALORISENTO: TFMTBCDField;
    cdItemNFBASEIPI: TFMTBCDField;
    cdItemNFPERCIPI: TFMTBCDField;
    cdItemNFVALORIPI: TFMTBCDField;
    cdItemNFBASEFUNRURAL: TFMTBCDField;
    cdItemNFVALORFUNRURAL: TFMTBCDField;
    cdItemNFCSTPIS: TStringField;
    cdItemNFVALORPAUTAPIS: TFMTBCDField;
    cdItemNFBASEPIS: TFMTBCDField;
    cdItemNFVALORPIS: TFMTBCDField;
    cdItemNFVALORCONTABIL: TFMTBCDField;
    cdItemNFQTDEDEVOLVIDO: TFMTBCDField;
    cdItemNFMOTIVODEVOLUCAO: TIntegerField;
    cdItemNFTOTALDEVOLVIDO: TFMTBCDField;
    cdItemNFTOTALPRECOMAXIMOCONSUMIDOR: TFMTBCDField;
    cdItemNFCSTCOFINS: TStringField;
    cdItemNFBASECOFINS: TFMTBCDField;
    cdItemNFVALORCOFINS: TFMTBCDField;
    cdItemNFVALORPAUTACOFINS: TFMTBCDField;
    cdItemNFRECALCULAR: TStringField;
    cdItemNFVALORCUSTO: TFMTBCDField;
    cdItemNFTOTALVALORCUSTO: TFMTBCDField;
    cdItemNFVALORSIMPLES: TFMTBCDField;
    cdItemNFVALORPUBLICA: TFMTBCDField;
    cdItemNFVALORVENDA: TFMTBCDField;
    cdItemNFVALORFUNDESA: TFMTBCDField;
    cdItemNFTABELAPRECO: TIntegerField;
    cdItemNFPESOBRUTO: TFMTBCDField;
    cdItemNFPESOEMBALAGEM: TFMTBCDField;
    cdItemNFTOTALPESOBRUTO: TFMTBCDField;
    cdItemNFPESOLIQUIDO: TFMTBCDField;
    cdItemNFTOTALPESOLIQUIDO: TFMTBCDField;
    cdItemNFVALORFRETE: TFMTBCDField;
    cdItemNFVALORSEGURO: TFMTBCDField;
    cdItemNFVALOROUTRO: TFMTBCDField;
    cdItemNFVOLUME: TIntegerField;
    cdItemNFQTDEVOLUME: TFMTBCDField;
    cdItemNFVALORBRUTO: TFMTBCDField;
    cdItemNFQTDEMULTIPLAENTRADA: TFMTBCDField;
    cdItemNFCOMISSAO: TFMTBCDField;
    cdItemNFVALORISENTOPIS: TFMTBCDField;
    cdItemNFVALORISENTOCOFINS: TFMTBCDField;
    cdItemNFCSTIPI: TStringField;
    cdItemNFPERCPIS: TFMTBCDField;
    cdItemNFPERCCOFINS: TFMTBCDField;
    cdItemNFVALORPAUTAIPI: TFMTBCDField;
    cdItemNFVALORISENTOIPI: TFMTBCDField;
    cdItemNFBASEII: TFMTBCDField;
    cdItemNFVALORDESPESAADUANEIRA: TFMTBCDField;
    cdItemNFVALORII: TFMTBCDField;
    cdItemNFVALORIOF: TFMTBCDField;
    cdItemNFCOMBO: TIntegerField;
    cdItemNFVALORICMSDIFERIMENTO: TFMTBCDField;
    cdItemNFPERCICMSDIFERIMENTO: TFMTBCDField;
    cdItemNFVALORRETIDO: TFMTBCDField;
    cdItemNFUFCONSUMO: TStringField;
    cdItemNFBASECIDE: TFMTBCDField;
    cdItemNFALIQUOTACIDE: TFMTBCDField;
    cdItemNFVALORCIDE: TFMTBCDField;
    cdItemNFVALORSENAR: TFMTBCDField;
    cdItemNFVALORDESCONTOSIMPLES: TFMTBCDField;
    cdItemNFCSTORIGEM: TStringField;
    cdCliforASSOCIADO: TStringField;
    cdCliforCOMISSAOFIXA: TStringField;
    cdCliforVENDARESTRITA: TStringField;
    cdTransportadorTIPOPROPRIETARIO: TIntegerField;
    SQLNFENUMERO: TIntegerField;
    SQLNFESERIE: TStringField;
    SQLNFEFILIAL: TIntegerField;
    SQLNFEORIGEM: TStringField;
    SQLNFECLIFOR: TIntegerField;
    SQLNFECHAVEACESSO: TStringField;
    SQLNFECNF: TStringField;
    SQLNFEVERAPLIC: TStringField;
    SQLNFECHNFE: TStringField;
    SQLNFEDHRECBTO: TStringField;
    SQLNFENPROT: TStringField;
    SQLNFEDIGVAL: TStringField;
    SQLNFECSTAT: TStringField;
    SQLNFEAUTORIZADA: TStringField;
    SQLNFEXML: TMemoField;
    SQLNFETPAMB: TStringField;
    SQLNFEPROTXML: TMemoField;
    SQLNFEPEDCANCXML: TMemoField;
    SQLNFECANCCSTAT: TStringField;
    SQLNFECANCDHRECBTO: TStringField;
    SQLNFECANCNPROT: TStringField;
    SQLNFECANCXML: TMemoField;
    SQLNFEPEDINUTXML: TMemoField;
    SQLNFEINUTCSTAT: TStringField;
    SQLNFEINUTDHRECBTO: TStringField;
    SQLNFEINUTNPROT: TStringField;
    SQLNFEINUTXML: TMemoField;
    SQLNFECONTINGENCIA: TIntegerField;
    SQLNFEFORMAEMISSAO: TStringField;
    SQLNFEENVIADOEMAIL: TIntegerField;
    SQLNFEENVIARTDOCS: TStringField;
    SQLNFEENVIADOTDOCS: TSQLTimeStampField;
    SQLValidadeItemNFEntrada: TSQLQuery;
    cdValidadeItemNFEntrada: TClientDataSet;
    dspValidadeItemNFEntrada: TDataSetProvider;
    cdValidadeItemNFEntradaNUMERO: TIntegerField;
    cdValidadeItemNFEntradaSERIE: TStringField;
    cdValidadeItemNFEntradaFILIAL: TIntegerField;
    cdValidadeItemNFEntradaORIGEM: TStringField;
    cdValidadeItemNFEntradaCLIFOR: TIntegerField;
    cdValidadeItemNFEntradaPRODUTO: TIntegerField;
    cdValidadeItemNFEntradaITEM: TIntegerField;
    cdValidadeItemNFEntradaLOTE: TStringField;
    cdValidadeItemNFEntradaVALIDADE: TDateField;
    cdValidadeItemNFEntradaQTDE: TFMTBCDField;
    cdValidadeItemNFEntradaFABRICACAO: TDateField;
    cdValidadeItemNFEntradaQTDEVOLUME: TFMTBCDField;
    cdProdutoUNREFERENCIA: TStringField;
    cdProdutoQTDEREFERENCIA: TFMTBCDField;
    cdCliforCONSUMIDOR: TStringField;
    cdCliforINDICADORIE: TIntegerField;
    cdCliforDESTACARSTITEM: TStringField;
    SQLQueryTipoCFOP: TSQLQuery;
    cdTipoCFOP: TClientDataSet;
    dspTipoCFOP: TDataSetProvider;
    cdTipoCFOPCODIGO: TIntegerField;
    cdTipoCFOPNOME: TStringField;
    cdTipoCFOPGERARFINANCEIRO: TStringField;
    cdTipoCFOPGERARESTOQUE: TStringField;
    cdTipoCFOPGERARCONSUMO: TStringField;
    cdTipoCFOPZERARUNITARIO: TStringField;
    cdTipoCFOPGERARCAIXA: TStringField;
    cdTipoCFOPHISTORICO: TIntegerField;
    cdTipoCFOPCALCULAICMS: TStringField;
    cdTipoCFOPCALCULAIPI: TStringField;
    cdTipoCFOPGERARCOMISSAO: TStringField;
    cdTipoCFOPGERARTROCA: TStringField;
    cdTipoCFOPGERARCUSTO: TStringField;
    cdTipoCFOPCALCULAFUNRURAL: TStringField;
    cdTipoCFOPGERARBONIFICACAO: TStringField;
    cdTipoCFOPGERARFLEX: TStringField;
    cdTipoCFOPFATURA: TStringField;
    cdTipoCFOPDESCONTARFUNRURAL: TStringField;
    cdTipoCFOPCONTABIL: TStringField;
    cdTipoCFOPMOVIMENTACAOFISICA: TStringField;
    cdTipoCFOPDEVOLUCAO: TStringField;
    cdTipoCFOPCALCULASUBSTITUICAO: TStringField;
    cdTipoCFOPGERARESTOQUEIMPROPRIO: TStringField;
    cdTipoCFOPSITUACAO: TIntegerField;
    cdTipoCFOPCALCULAFUNDESA: TStringField;
    cdTipoCFOPGERARFIDELIZACAO: TStringField;
    cdTipoCFOPATIVO: TStringField;
    cdTipoCFOPCALCULACREDITOSIMPLES: TStringField;
    cdTipoCFOPCALCULAPIS: TStringField;
    cdTipoCFOPCALCULACOFINS: TStringField;
    cdTipoCFOPFINALIDADE: TStringField;
    cdTipoCFOPNATUREZAOPERACAO: TIntegerField;
    cdTipoCFOPDESCONTARFRETE: TStringField;
    cdTipoCFOPCODIGOBASECALCULOCREDITO: TIntegerField;
    cdTipoCFOPMENSAGEMFISCAL: TIntegerField;
    cdTipoCFOPDESCONTARFUNDESA: TStringField;
    cdTipoCFOPOUTRASES: TStringField;
    cdTipoCFOPENCARGOCOMPORBASEICMS: TStringField;
    cdTipoCFOPCALCULADESCONTOSIMPLES: TStringField;
    cdTipoCFOPEXPORTARDADOSCOLETA: TStringField;
    cdTipoCFOPFRETECOMPORBASEICMS: TStringField;
    cdTipoCFOPCONDICAOPAGAMENTO: TIntegerField;
    cdTipoCFOPFORMAPAGAMENTO: TIntegerField;
    SQLQueryCFOP: TSQLQuery;
    cdCFOP: TClientDataSet;
    dspCFOP: TDataSetProvider;
    cdCFOPCODIGO: TIntegerField;
    cdCFOPNOME: TStringField;
    cdCFOPCFOP: TStringField;
    cdCFOPTIPOCFOP: TIntegerField;
    cdCFOPCLASSIFICACAOFISCAL: TIntegerField;
    cdCFOPCATEGORIA: TIntegerField;
    cdCFOPMENSAGEMFISCAL: TIntegerField;
    cdCFOPFINALIDADE: TStringField;
    cdCidadeVALORFRETEADICIONAL: TFMTBCDField;
    SQLQueryCTe: TSQLQuery;
    cdCTe: TClientDataSet;
    dspCTe: TDataSetProvider;
    SQLQueryItemCTe: TSQLQuery;
    cdItemCTe: TClientDataSet;
    dspItemCTe: TDataSetProvider;
    cdItemCTeCT: TIntegerField;
    cdItemCTeITEM: TIntegerField;
    cdItemCTeMODELO: TStringField;
    cdItemCTeCHAVEACESSO: TStringField;
    cdItemCTeNUMERODOCUMENTO: TIntegerField;
    cdItemCTeSERIEDOCUMENTO: TStringField;
    cdItemCTeEMISSAODOCUMENTO: TDateField;
    cdItemCTeBASEICMS: TFMTBCDField;
    cdItemCTeVALORICMS: TFMTBCDField;
    cdItemCTeBASEST: TFMTBCDField;
    cdItemCTeVALORST: TFMTBCDField;
    cdItemCTeTOTALPRODUTO: TFMTBCDField;
    cdItemCTeTOTALDOCUMENTO: TFMTBCDField;
    cdItemCTeCFOPPREDOMINANTE: TStringField;
    cdItemCTeNFNUMERO: TIntegerField;
    cdItemCTeNFSERIE: TStringField;
    cdItemCTeNFFILIAL: TIntegerField;
    cdItemCTeNFORIGEM: TStringField;
    cdItemCTeNFCLIFOR: TIntegerField;
    cdItemCTePESOBRUTO: TFMTBCDField;
    cdItemCTePESOLIQUIDO: TFMTBCDField;
    cdItemCTeVOLUMES: TIntegerField;
    SQLQueryOrdemCTe: TSQLQuery;
    cdOrdemCTe: TClientDataSet;
    dspOrdemCTe: TDataSetProvider;
    cdOrdemCTeCT: TIntegerField;
    cdOrdemCTeORDEM: TStringField;
    cdOrdemCTeVCTO: TDateField;
    cdOrdemCTeVALOR: TFMTBCDField;
    SQLQueryUNMedida: TSQLQuery;
    cdUNMedida: TClientDataSet;
    dspUNMedida: TDataSetProvider;
    cdUNMedidaCODIGO: TStringField;
    cdUNMedidaNOME: TStringField;
    SQLQueryCTeID: TIntegerField;
    SQLQueryCTeFILIAL: TIntegerField;
    SQLQueryCTeCLIFOR: TIntegerField;
    SQLQueryCTeEMISSAO: TDateField;
    SQLQueryCTeAQUISICAO: TDateField;
    SQLQueryCTeMODELO: TStringField;
    SQLQueryCTeSERIE: TStringField;
    SQLQueryCTeSUBSERIE: TStringField;
    SQLQueryCTeNUMERO: TIntegerField;
    SQLQueryCTeCFOP: TIntegerField;
    SQLQueryCTeVALORTOTAL: TFMTBCDField;
    SQLQueryCTeVALORDESCONTO: TFMTBCDField;
    SQLQueryCTeVALORREDBASEICMS: TFMTBCDField;
    SQLQueryCTeBASEICMS: TFMTBCDField;
    SQLQueryCTePERCICMS: TFMTBCDField;
    SQLQueryCTeVALORICMS: TFMTBCDField;
    SQLQueryCTeVALORISENTO: TFMTBCDField;
    SQLQueryCTeVALOROUTRAS: TFMTBCDField;
    SQLQueryCTeVALORSERVICO: TFMTBCDField;
    SQLQueryCTeCANCELADO: TStringField;
    SQLQueryCTeMODALIDADE: TStringField;
    SQLQueryCTeCONTAFRETE: TStringField;
    SQLQueryCTeCHAVE: TStringField;
    SQLQueryCTeTIPOCTE: TIntegerField;
    SQLQueryCTeCSTPIS: TStringField;
    SQLQueryCTeCODIGOBASEPIS: TStringField;
    SQLQueryCTeBASEPIS: TFMTBCDField;
    SQLQueryCTePERCPIS: TFMTBCDField;
    SQLQueryCTeVALORPIS: TFMTBCDField;
    SQLQueryCTeCSTCOFINS: TStringField;
    SQLQueryCTeCODIGOBASECOFINS: TStringField;
    SQLQueryCTeBASECOFINS: TFMTBCDField;
    SQLQueryCTePERCCOFINS: TFMTBCDField;
    SQLQueryCTeVALORCOFINS: TFMTBCDField;
    SQLQueryCTeCSTICMS: TStringField;
    SQLQueryCTeXML: TMemoField;
    SQLQueryCTeREMETENTE: TIntegerField;
    SQLQueryCTeDESTINATARIO: TIntegerField;
    SQLQueryCTeRECEBEDOR: TIntegerField;
    SQLQueryCTeEXPEDIDOR: TIntegerField;
    SQLQueryCTeTOMADOR: TIntegerField;
    SQLQueryCTeTOMADORSERVICO: TIntegerField;
    SQLQueryCTeORIGEM: TStringField;
    SQLQueryCTeINDICADORFORMAPAGAMENTO: TIntegerField;
    SQLQueryCTeINUTILIZADO: TStringField;
    SQLQueryCTeINDICADORTIPOSERVICO: TIntegerField;
    SQLQueryCTeNPROT: TStringField;
    SQLQueryCTeCANCNPROT: TStringField;
    SQLQueryCTeINUTNPROT: TStringField;
    SQLQueryCTeINDICADORTIPODOCUMENTO: TIntegerField;
    SQLQueryCTeHORA: TTimeField;
    SQLQueryCTeBASEST: TFMTBCDField;
    SQLQueryCTeVALORST: TFMTBCDField;
    SQLQueryCTeDATAPREVISTAENTREGA: TDateField;
    SQLQueryCTeCARGAPREDOMINANTE: TStringField;
    SQLQueryCTeFORMAPAGAMENTO: TIntegerField;
    SQLQueryCTeCONDICAOPAGAMENTO: TIntegerField;
    SQLQueryCTeAUTORIZADO: TStringField;
    SQLQueryCTeATUALIZADO: TStringField;
    SQLQueryCTePESOBRUTO: TFMTBCDField;
    SQLQueryCTePESOLIQUIDO: TFMTBCDField;
    SQLQueryCTeVOLUMES: TIntegerField;
    SQLQueryCTeVALORTOTALITENS: TFMTBCDField;
    SQLQueryCTeSOMAR: TStringField;
    SQLQueryCTeRECIBOLOTE: TStringField;
    SQLQueryCTeVALORTOTALTRIBUTO: TFMTBCDField;
    SQLQueryCTeNBS: TIntegerField;
    SQLQueryCTeOBS: TMemoField;
    SQLQueryCTeCHAVEREFERENCIADA: TStringField;
    SQLQueryCTeVALORPEDAGIO: TFMTBCDField;
    SQLQueryCTeCANCXML: TMemoField;
    SQLQueryCTeINUTXML: TMemoField;
    SQLQueryCTeENVIADOEMAIL: TIntegerField;
    SQLQueryCTeVEICULO: TIntegerField;
    SQLQueryCTeMOTORISTA: TIntegerField;
    SQLQueryCTeINDICADORLOTACAO: TIntegerField;
    SQLQueryCTeEDITADO: TStringField;
    SQLQueryCTeVALORBASEICMSSTRETIDO: TFMTBCDField;
    SQLQueryCTeVALORICMSSTRETIDO: TFMTBCDField;
    SQLQueryCTePERCICMSSTRETIDO: TFMTBCDField;
    SQLQueryCTeVALORCREDITOPRESUMIDO: TFMTBCDField;
    SQLQueryCTePERCREDUCAOBASEICMS: TFMTBCDField;
    SQLQueryCTePERCREDUCAOBASEOUTRAUF: TFMTBCDField;
    SQLQueryCTeVALORBASEOUTRAUF: TFMTBCDField;
    SQLQueryCTePERCICMSOUTRAUF: TFMTBCDField;
    SQLQueryCTeVALORICMSOUTRAUF: TFMTBCDField;
    SQLQueryCTeINDICADORGLOBALIZADO: TIntegerField;
    SQLQueryCTeINFGLOBALIZADO: TStringField;
    cdCTeID: TIntegerField;
    cdCTeFILIAL: TIntegerField;
    cdCTeCLIFOR: TIntegerField;
    cdCTeEMISSAO: TDateField;
    cdCTeAQUISICAO: TDateField;
    cdCTeMODELO: TStringField;
    cdCTeSERIE: TStringField;
    cdCTeSUBSERIE: TStringField;
    cdCTeNUMERO: TIntegerField;
    cdCTeCFOP: TIntegerField;
    cdCTeVALORTOTAL: TFMTBCDField;
    cdCTeVALORDESCONTO: TFMTBCDField;
    cdCTeVALORREDBASEICMS: TFMTBCDField;
    cdCTeBASEICMS: TFMTBCDField;
    cdCTePERCICMS: TFMTBCDField;
    cdCTeVALORICMS: TFMTBCDField;
    cdCTeVALORISENTO: TFMTBCDField;
    cdCTeVALOROUTRAS: TFMTBCDField;
    cdCTeVALORSERVICO: TFMTBCDField;
    cdCTeCANCELADO: TStringField;
    cdCTeMODALIDADE: TStringField;
    cdCTeCONTAFRETE: TStringField;
    cdCTeCHAVE: TStringField;
    cdCTeTIPOCTE: TIntegerField;
    cdCTeCSTPIS: TStringField;
    cdCTeCODIGOBASEPIS: TStringField;
    cdCTeBASEPIS: TFMTBCDField;
    cdCTePERCPIS: TFMTBCDField;
    cdCTeVALORPIS: TFMTBCDField;
    cdCTeCSTCOFINS: TStringField;
    cdCTeCODIGOBASECOFINS: TStringField;
    cdCTeBASECOFINS: TFMTBCDField;
    cdCTePERCCOFINS: TFMTBCDField;
    cdCTeVALORCOFINS: TFMTBCDField;
    cdCTeCSTICMS: TStringField;
    cdCTeXML: TMemoField;
    cdCTeREMETENTE: TIntegerField;
    cdCTeDESTINATARIO: TIntegerField;
    cdCTeRECEBEDOR: TIntegerField;
    cdCTeEXPEDIDOR: TIntegerField;
    cdCTeTOMADOR: TIntegerField;
    cdCTeTOMADORSERVICO: TIntegerField;
    cdCTeORIGEM: TStringField;
    cdCTeINDICADORFORMAPAGAMENTO: TIntegerField;
    cdCTeINUTILIZADO: TStringField;
    cdCTeINDICADORTIPOSERVICO: TIntegerField;
    cdCTeNPROT: TStringField;
    cdCTeCANCNPROT: TStringField;
    cdCTeINUTNPROT: TStringField;
    cdCTeINDICADORTIPODOCUMENTO: TIntegerField;
    cdCTeHORA: TTimeField;
    cdCTeBASEST: TFMTBCDField;
    cdCTeVALORST: TFMTBCDField;
    cdCTeDATAPREVISTAENTREGA: TDateField;
    cdCTeCARGAPREDOMINANTE: TStringField;
    cdCTeFORMAPAGAMENTO: TIntegerField;
    cdCTeCONDICAOPAGAMENTO: TIntegerField;
    cdCTeAUTORIZADO: TStringField;
    cdCTeATUALIZADO: TStringField;
    cdCTePESOBRUTO: TFMTBCDField;
    cdCTePESOLIQUIDO: TFMTBCDField;
    cdCTeVOLUMES: TIntegerField;
    cdCTeVALORTOTALITENS: TFMTBCDField;
    cdCTeSOMAR: TStringField;
    cdCTeRECIBOLOTE: TStringField;
    cdCTeVALORTOTALTRIBUTO: TFMTBCDField;
    cdCTeNBS: TIntegerField;
    cdCTeOBS: TMemoField;
    cdCTeCHAVEREFERENCIADA: TStringField;
    cdCTeVALORPEDAGIO: TFMTBCDField;
    cdCTeCANCXML: TMemoField;
    cdCTeINUTXML: TMemoField;
    cdCTeENVIADOEMAIL: TIntegerField;
    cdCTeVEICULO: TIntegerField;
    cdCTeMOTORISTA: TIntegerField;
    cdCTeINDICADORLOTACAO: TIntegerField;
    cdCTeEDITADO: TStringField;
    cdCTeVALORBASEICMSSTRETIDO: TFMTBCDField;
    cdCTeVALORICMSSTRETIDO: TFMTBCDField;
    cdCTePERCICMSSTRETIDO: TFMTBCDField;
    cdCTeVALORCREDITOPRESUMIDO: TFMTBCDField;
    cdCTePERCREDUCAOBASEICMS: TFMTBCDField;
    cdCTePERCREDUCAOBASEOUTRAUF: TFMTBCDField;
    cdCTeVALORBASEOUTRAUF: TFMTBCDField;
    cdCTePERCICMSOUTRAUF: TFMTBCDField;
    cdCTeVALORICMSOUTRAUF: TFMTBCDField;
    cdCTeINDICADORGLOBALIZADO: TIntegerField;
    cdCTeINFGLOBALIZADO: TStringField;
    cdItemNFID: TLargeintField;
    cdItemNFBASERESSARCIMENTOST: TFMTBCDField;
    cdItemNFVALORTOTALTRIBUTO: TFMTBCDField;
    cdItemNFFCI: TIntegerField;
    cdItemNFUNIDADEMEDIDA: TStringField;
    cdItemNFITEMORDEMCOMPRA: TIntegerField;
    cdItemNFVALORCUSTOTABELAANTERIOR: TFMTBCDField;
    cdItemNFREGRADESCONTO: TIntegerField;
    cdItemNFVALORCREDITOPRESUMIDO: TFMTBCDField;
    cdItemNFBASECREDITOPRESUMIDO: TFMTBCDField;
    cdItemNFPERCCREDITOPRESUMIDO: TFMTBCDField;
    cdItemNFBASERESSARCIMENTOICMS: TFMTBCDField;
    cdItemNFVALORRESSARCIMENTOICMS: TFMTBCDField;
    cdItemNFENQUADRAMENTOLEGALIPI: TStringField;
    cdItemNFVALORICMSDESTINO: TFMTBCDField;
    cdItemNFVALORDIFAL: TFMTBCDField;
    cdItemNFVALORPARTILHAORIGEM: TFMTBCDField;
    cdItemNFVALORPARTILHADESTINO: TFMTBCDField;
    cdItemNFPERCFCEP: TFMTBCDField;
    cdItemNFVALORFCEP: TFMTBCDField;
    cdItemNFPERCICMSINTERNA: TFMTBCDField;
    cdItemNFPERCDESTINO: TFMTBCDField;
    cdItemNFCODIGONCM: TStringField;
    cdItemNFCEST: TStringField;
    cdItemNFBASEICMSINTERESTADUAL: TFMTBCDField;
    cdItemNFPERCICMSINTERESTADUAL: TFMTBCDField;
    cdItemNFBASEFCEP: TFMTBCDField;
    cdItemNFMOTIVOICMSDESONERADO: TIntegerField;
    cdItemNFVALORICMSDESONERADO: TFMTBCDField;
    cdItemNFBASEICMSDESONERADO: TFMTBCDField;
    cdItemNFIDNF: TLargeintField;
    cdItemNFVALORFCPST: TFMTBCDField;
    cdItemNFVALORIPIDEVOLVIDO: TFMTBCDField;
    cdItemNFPERCST: TFMTBCDField;
    cdItemNFPERCSIMPLES: TFMTBCDField;
    cdItemNFBASEFCPST: TFMTBCDField;
    cdItemNFPERCFCPST: TFMTBCDField;
    cdItemNFBASEFCPSTRET: TFMTBCDField;
    cdItemNFPERCFCPSTRET: TFMTBCDField;
    cdItemNFVALORFCPSTRET: TFMTBCDField;
    cdItemNFBASEFCPUFDEST: TFMTBCDField;
    cdItemNFPERCFCPUFDEST: TFMTBCDField;
    cdItemNFVALORFCPUFDEST: TFMTBCDField;
    SQLOrdemNFNUMERO: TIntegerField;
    SQLOrdemNFSERIE: TStringField;
    SQLOrdemNFFILIAL: TIntegerField;
    SQLOrdemNFORIGEM: TStringField;
    SQLOrdemNFCLIFOR: TIntegerField;
    SQLOrdemNFORDEM: TStringField;
    SQLOrdemNFVCTO: TDateField;
    SQLOrdemNFVALOR: TFMTBCDField;
    SQLOrdemNFALTERADA: TStringField;
    SQLOrdemNFHISTORICO: TIntegerField;
    SQLOrdemNFPARCELA: TIntegerField;
    cdOrdemNFPARCELA: TIntegerField;
    function dspNFDataRequest(Sender: TObject; Input: OleVariant): OleVariant;
    function dspPesquisaDataRequest(Sender: TObject;
      Input: OleVariant): OleVariant;
    function dspCliforDataRequest(Sender: TObject;
      Input: OleVariant): OleVariant;
    function dspBairroDataRequest(Sender: TObject;
      Input: OleVariant): OleVariant;
    function dspCidadeDataRequest(Sender: TObject;
      Input: OleVariant): OleVariant;
    function dspCliforContatoDataRequest(Sender: TObject;
      Input: OleVariant): OleVariant;
    function dspProdutoCliforDataRequest(Sender: TObject;
      Input: OleVariant): OleVariant;
    function dspProdutoDataRequest(Sender: TObject;
      Input: OleVariant): OleVariant;
    function dspTransportadorDataRequest(Sender: TObject;
      Input: OleVariant): OleVariant;
    function dspItemNFDataRequest(Sender: TObject;
      Input: OleVariant): OleVariant;
    function dspOrdemNFDataRequest(Sender: TObject;
      Input: OleVariant): OleVariant;
    function dspGeralDataRequest(Sender: TObject;
      Input: OleVariant): OleVariant;
    function dspNFEDataRequest(Sender: TObject; Input: OleVariant): OleVariant;
    procedure cdProdutoAfterInsert(DataSet: TDataSet);
    procedure cdNFAfterInsert(DataSet: TDataSet);
    procedure cdItemNFAfterInsert(DataSet: TDataSet);
    procedure cdOrdemNFAfterInsert(DataSet: TDataSet);
    procedure cdNFEAfterInsert(DataSet: TDataSet);
    procedure cdCliforAfterInsert(DataSet: TDataSet);
    procedure cdBairroAfterInsert(DataSet: TDataSet);
    procedure cdCidadeAfterInsert(DataSet: TDataSet);
    procedure cdCliforContatoAfterInsert(DataSet: TDataSet);
    procedure cdProdutoCliforAfterInsert(DataSet: TDataSet);
    procedure cdTransportadorAfterInsert(DataSet: TDataSet);
    procedure cdNFReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdProdutoReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    function dspQueryGeralDataRequest(Sender: TObject;
      Input: OleVariant): OleVariant;
    procedure cdItemNFReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdItemNFBeforePost(DataSet: TDataSet);
    function dspServicoNFDataRequest(Sender: TObject;
      Input: OleVariant): OleVariant;
    procedure cdCliforReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdProdutoCliforReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdServicoNFReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure cdOrdemNFReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure cdNFEReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure cdPesquisaReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure cdGeralReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure cdQueryGeralReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure cdBairroReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure cdCidadeReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure cdCliforContatoReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure cdTransportadorReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    function dspValidadeItemNFEntradaDataRequest(Sender: TObject;
      Input: OleVariant): OleVariant;
    procedure cdValidadeItemNFEntradaReconcileError(
      DataSet: TCustomClientDataSet; E: EReconcileError;
      UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure cdTipoCFOPAfterInsert(DataSet: TDataSet);
    procedure cdCFOPAfterInsert(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure cdCFOPReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    function dspCTeDataRequest(Sender: TObject; Input: OleVariant): OleVariant;
    procedure cdCTeAfterInsert(DataSet: TDataSet);
    function dspItemCTeDataRequest(Sender: TObject; Input: OleVariant): OleVariant;
    procedure cdItemCTeAfterInsert(DataSet: TDataSet);
    function dspOrdemCTeDataRequest(Sender: TObject; Input: OleVariant): OleVariant;
    procedure cdCTeBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    procedure ConexaoBanco(Caminho: String; Conectar: Boolean);
  end;

var
  DMDados: TDMDados;

implementation

uses UFerramentas, Form_Principal;

{$R *.dfm}

{ TDMDados }

procedure TDMDados.cdBairroAfterInsert(DataSet: TDataSet);
begin
  cdBairro.FieldByName('CODIGO').AsInteger := Novo_Codigo('BAIRRO', 0);
end;

procedure TDMDados.cdBairroReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TDMDados.cdCFOPAfterInsert(DataSet: TDataSet);
begin
  if cdCFOP.FieldByName('CODIGO').IsNull then
    cdCFOP.FieldByName('CODIGO').AsInteger := Novo_Codigo('CFOP', 0);
  cdCFOP.FieldByName('CLASSIFICACAOFISCAL').AsInteger := 1;
  cdCFOP.FieldByName('CATEGORIA').AsInteger := 1;
end;

procedure TDMDados.cdCFOPReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
 Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TDMDados.cdCidadeAfterInsert(DataSet: TDataSet);
begin
  cdCidade.FieldByName('CODIGO').AsInteger := Novo_Codigo('CIDADE', 0);
  cdCidade.FieldByName('POPULACAO').AsInteger := 1;
  cdCidade.FieldByName('REGIAOVENDA').AsString := 'S';
  cdCidade.FieldByName('COMISSAOENTREGA').AsFloat := 0;
  cdCidade.FieldByName('VALORFRETEADICIONAL').AsFloat := 0;
end;

procedure TDMDados.cdCidadeReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TDMDados.cdCliforAfterInsert(DataSet: TDataSet);
begin
  cdClifor.FieldByName('CODIGO').AsInteger := Novo_Codigo('CLIFOR', 0);
  cdClifor.FieldByName('FILIAL').AsInteger := Var_Filial;
  cdClifor.FieldByName('TIPO').AsInteger := 1;
  cdClifor.FieldByName('DATA').AsDateTime := Date;
  cdClifor.FieldByName('ATIVO').AsString := 'S';
  cdClifor.FieldByName('BLOQUEARVENDA').AsString := 'N';
  cdCliFor.FieldByName('EXPORTAROBS').AsString := 'N';
  cdCliFor.FieldByName('ATUALIZARCADASTRO').AsString := 'N';
  cdCliFor.FieldByName('RAPEL').AsFloat := 0;
  cdCliFor.FieldByName('ALVARA').AsString := 'N';
  cdCliFor.FieldByName('ISENTO').AsString := 'N';
  cdCliFor.FieldByName('CNPJVALIDO').AsString := 'N';
  cdCliFor.FieldByName('IEVALIDO').AsString := 'N';
  cdCliFor.FieldByName('CATEGORIA').AsInteger := 1;
  cdCliFor.FieldByName('PUBLICA').AsString := 'N';
  cdCliFor.FieldByName('INDUSTRIA').AsString := 'N';
  cdCliFor.FieldByName('CADIN').AsString := 'N';
  cdCliFor.FieldByName('REGISTROCONSELHOREGIONAL').AsString := 'N';
  cdCliFor.FieldByName('AUTORIZACAOESPECIAL').AsString := 'N';
  cdCliFor.FieldByName('COMISSAO').AsInteger := 0;
  cdCliFor.FieldByName('SIMPLES').AsString := 'N';
  cdCliFor.FieldByName('SPC').AsString := 'N';
  cdCliFor.FieldByName('LIMITECREDITO').AsFloat := 0;
  cdCliFor.FieldByName('ENVIARREMESSA').AsString := 'S';
  cdCliFor.FieldByName('MEI').AsString := 'N';
  cdCliFor.FieldByName('ASSOCIADO').AsString := 'N';
  cdCliFor.FieldByName('COMISSAOFIXA').AsString := 'N';
  cdCliFor.FieldByName('VENDARESTRITA').AsString := 'N';
  cdCliFor.FieldByName('CONSUMIDOR').AsString := 'N';
  cdCliFor.FieldByName('INDICADORIE').AsString := '1';
  cdCliFor.FieldByName('DESTACARSTITEM').AsString := 'N';
end;

procedure TDMDados.cdCliforContatoAfterInsert(DataSet: TDataSet);
begin
  cdCliforContato.FieldByName('CODIGO').AsInteger := 0;
  cdCliforContato.FieldByName('ENVIARNFE').AsString := 'N';
  cdCliforContato.FieldByName('ENVIARDANFE').AsString := 'N';
  cdCliforContato.FieldByName('ENVIARBOLETO').AsString := 'N';
  cdCliforContato.FieldByName('ENVIARPEDIDO').AsString := 'N';
end;

procedure TDMDados.cdCliforContatoReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TDMDados.cdCliforReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TDMDados.cdCTeAfterInsert(DataSet: TDataSet);
begin
  cdCTeFILIAL.AsInteger := Var_Filial;
  //cdCTeSERIE.AsString := ClienteDMFiscal.CDGeral.FieldByName('CTESERIE').AsString;
  cdCTeORIGEM.AsString := 'P';
  //cdCTeEMISSAO.AsDateTime := StrToDate(DataServidor);
  //cdCTeHORA.AsDateTime := Now;

  cdCTeAUTORIZADO.AsString := 'N';
  cdCTeATUALIZADO.AsString := 'N';
  cdCTeSOMAR.AsString := 'N';
  cdCTeCANCELADO.AsString := 'N';
  cdCTeINUTILIZADO.AsString := 'N';

  cdCTeTIPOCTE.AsInteger := 0; { 0 = Normal }
  cdCTeMODALIDADE.AsInteger := 0; { 0 = Rodoviário }
  cdCTeMODELO.AsInteger := 57; { 57 = CTe }
  cdCTeTOMADORSERVICO.AsInteger := TomadorRemetente; { 0 = Remetente }
  cdCTeCONTAFRETE.AsString := '1'; { COM BASE NO TOMADOR 0- Por conta do emitente / 1- Por conta do destinatário/remetente / 2- Por conta de terceiros }
  cdCTeINDICADORFORMAPAGAMENTO.AsString := '0';
  cdCTeINDICADORTIPOSERVICO.AsString := '0';
  cdCTeINDICADORTIPODOCUMENTO.ReadOnly := False; { caso esteja bloqueado }
  cdCTeINDICADORTIPODOCUMENTO.AsInteger := TipoDocumentoNFe; { nfe }

  cdCTeID.AsInteger := 0;
  // ClienteDMNF.cdCTAQUISICAO.AsDateTime := Date;
  cdCTeVALORSERVICO.AsFloat := 0;
  cdCTeVALORDESCONTO.AsFloat := 0;
  cdCTeVALORTOTAL.AsFloat := 0;
  cdCTeVALOROUTRAS.AsFloat := 0;
  cdCTeVALORPEDAGIO.AsFloat := 0;

  cdCTeVALORREDBASEICMS.AsFloat := 0;
  cdCTeBASEICMS.AsFloat := 0;
  cdCTePERCICMS.AsFloat := 0;
  cdCTeVALORICMS.AsFloat := 0;
  cdCTeVALORISENTO.AsFloat := 0;
  cdCTeVALOROUTRAS.AsFloat := 0;
  cdCTeBASEST.AsFloat := 0;
  cdCTeVALORST.AsFloat := 0;

  cdCTeCARGAPREDOMINANTE.AsString := 'DIVERSOS';

  //cdCTeDATAPREVISTAENTREGA.AsDateTime := Now + 1;
  cdCTePESOBRUTO.AsFloat := 0;
  cdCTePESOLIQUIDO.AsFloat := 0;
  cdCTeVOLUMES.AsFloat := 0;
  cdCTeVALORTOTALITENS.AsFloat := 0;
  cdCTeVALORTOTALTRIBUTO.AsFloat := 0;
  cdCTeENVIADOEMAIL.AsInteger := 0;
  cdCTeINDICADORLOTACAO.AsInteger := 0; { 0 - Não; 1 - Sim }
  //cdCTeEDITADO.AsString := 'N';

  cdCTeFORMAPAGAMENTO.AsInteger    := 1;
  cdCTeCONDICAOPAGAMENTO.AsInteger := 1;

  Open_SQL(CDGeral, Format('SELECT COALESCE(CTENBS,0) AS NBS  FROM FILIAL WHERE (CODIGO = %D)', [Var_Filial]));
  cdCTeNBS.AsInteger := CDGeral.FieldByName('NBS').AsInteger;

end;

procedure TDMDados.cdCTeBeforePost(DataSet: TDataSet);
begin
  if cdCTeDATAPREVISTAENTREGA.AsString = '30/12/1899' then
    cdCTeDATAPREVISTAENTREGA.AsDateTime := cdCTeEMISSAO.AsDateTime + 1;
  cdCTeEDITADO.AsString := 'S';
  case cdCTeTOMADORSERVICO.AsInteger of
    0: cdCTeCLIFOR.AsInteger := cdCTeREMETENTE.AsInteger;
    3: cdCTeCLIFOR.AsInteger := cdCTeDESTINATARIO.AsInteger;
    1: cdCTeCLIFOR.AsInteger := cdCTeEXPEDIDOR.AsInteger;
    2: cdCTeCLIFOR.AsInteger := cdCTeRECEBEDOR.AsInteger;
    4: cdCTeCLIFOR.AsInteger := cdCTeTOMADOR.AsInteger;
  end;

  { COM BASE NO TOMADOR
    0- Por conta do emitente /
    1- Por conta do destinatário/remetente /
    2- Por conta de terceiros /
    9 - Sem cobrança de frete }
  case cdCTeTOMADORSERVICO.AsInteger of
    TomadorRemetente, TomadorDestinatario: cdCTeCONTAFRETE.AsString := '1';
    TomadorExpedidor, TomadorRecebedor, TomadorOutro: cdCTeCONTAFRETE.AsString := '2';
  end;
  if (cdCTeINDICADORFORMAPAGAMENTO.AsInteger = 2) then { 0 - Pago / 1 - A Pagar / 2 - Outros }
    cdCTeCONTAFRETE.AsString := '9';

  if (cdCTe.State = dsEdit) then { é atribuido por trigger quando for nullo mas somente na insersão }
    if (cdCTeCFOP.IsNull) then
      raise Exception.Create('Informar CFOP');

  if (cdCTeREMETENTE.IsNull) then { Poderá não ser informado para os CTe de redespacho intermediário. Nos demais casos deverá sempre ser informado. }
    if (cdCTeINDICADORTIPOSERVICO.AsInteger <> 3) then { 3- Redespacho Intermediario }
      raise Exception.Create('Remetente não Informado!');
  if (cdCTeDESTINATARIO.IsNull) then { Só pode ser omitido em caso de redespacho intermediário }
    if (cdCTeINDICADORTIPOSERVICO.AsInteger <> 3) then { 3- Redespacho Intermediario }
      raise Exception.Create('Destinatário não Informado!');

  if (cdCTeINDICADORTIPOSERVICO.AsInteger = TipoServicoNormal) then
  begin
    cdCTeRECEBEDOR.Clear;
    cdCTeEXPEDIDOR.Clear;
    if (cdCTeTOMADORSERVICO.AsInteger = TomadorRecebedor) or (cdCTeTOMADORSERVICO.AsInteger = TomadorExpedidor) then
      raise Exception.Create('Tomador inválido para este Tipo de Serviço!');
  end;

  if (cdCTeTOMADORSERVICO.AsInteger = TomadorRecebedor) then
    if (cdCTeRECEBEDOR.IsNull) then
      raise Exception.Create('Recebedor não Informado!');
  if (cdCTeTOMADORSERVICO.AsInteger = TomadorExpedidor) then
    if (cdCTeEXPEDIDOR.IsNull) then
      raise Exception.Create('Expedidor não Informado!');
  if (cdCTeTOMADORSERVICO.AsInteger = TomadorOutro) then
  begin
    if (cdCTeTOMADOR.IsNull) then
      raise Exception.Create('Tomador não Informado!');
  end
  else
    cdCTeTOMADOR.Clear;

  cdCTeAQUISICAO.AsDateTime := cdCTeEMISSAO.AsDateTime; { não tem na emissão }
  //cdCTeNATUREZA.AsString := '1'; { está como obrigatório, ver a utilidade se realmente existe alguma }

  //if (cdCTeHORA.IsNull) then
  //  cdCTeHORA.AsDateTime := Now;

  //if (cdCTeFORMAPAGAMENTO.IsNull) then
  //  raise Exception.Create('Forma de Pagamento  não Informada!');
  //if (cdCTeCONDICAOPAGAMENTO.IsNull) then
  //  raise Exception.Create('Condição de Pagamento não Informado!');
  if (Trim(cdCTeCARGAPREDOMINANTE.AsString) = '') then
    raise Exception.Create('Produto Predominante não Informado!');
  if (cdCTeDATAPREVISTAENTREGA.IsNull) then
    raise Exception.Create('Data Prevista de Entrega não Informada!');

  if (cdCTeVALORSERVICO.IsNull) or (cdCTeVALORSERVICO.AsFloat < 0) then
    cdCTeVALORSERVICO.AsFloat := 0;
  if (cdCTeVALORDESCONTO.IsNull) or (cdCTeVALORDESCONTO.AsFloat < 0) then
    cdCTeVALORDESCONTO.AsFloat := 0;
  if (cdCTeVALOROUTRAS.IsNull) or (cdCTeVALOROUTRAS.AsFloat < 0) then
    cdCTeVALOROUTRAS.AsFloat := 0;
  if (cdCTeVALORPEDAGIO.IsNull) or (cdCTeVALORPEDAGIO.AsFloat < 0) then
    cdCTeVALORPEDAGIO.AsFloat := 0;
  if (cdCTeVALORDESCONTO.AsFloat > cdCTeVALORSERVICO.AsFloat) then
    raise Exception.Create('Valor de desconto não pode ser maior que o Valor do serviço');
  { VALORTOTAL agora é feito via trigger }

  if (cdCTeNBS.AsInteger = 0) then
    raise Exception.Create('Código NBS não Informado!');

end;

procedure TDMDados.cdGeralReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TDMDados.cdItemCTeAfterInsert(DataSet: TDataSet);
begin
  cdItemCTeMODELO.AsString := '55';
end;

procedure TDMDados.cdItemNFAfterInsert(DataSet: TDataSet);
begin
  cdItemNF.FieldByName('ID').AsInteger    := 0;
  cdItemNF.FieldByName('CLIFOR').AsInteger  := cdNF.FieldByName('CLIFOR').AsInteger;
  cdItemNF.FieldByName('ITEM').AsInteger    := 0;
  cdItemNF.FieldByName('BASEICMS').AsFloat  := 0;
  cdItemNF.FieldByName('VALORICMS').AsFloat := 0;
  cdItemNF.FieldByName('BASEIPI').AsFloat   := 0;
  cdItemNF.FieldByName('VALORIPI').AsFloat  := 0;
  cdItemNF.FieldByName('VALORPAUTAIPI').AsFloat  := 0;
  cdItemNF.FieldByName('BASESUBSTITUICAO').AsFloat  := 0;
  cdItemNF.FieldByName('VALORSUBSTITUICAO').AsFloat := 0;
  cdItemNF.FieldByName('QTDEDEVOLVIDO').AsFloat := 0;
  cdItemNF.FieldByName('BASEFUNRURAL').AsFloat  := 0;
  cdItemNF.FieldByName('VALORFUNRURAL').AsFloat := 0;
  cdItemNF.FieldByName('BASEPIS').AsFloat := 0;
  cdItemNF.FieldByName('VALORPIS').AsFloat := 0;
  cdItemNF.FieldByName('VALORPAUTAPIS').AsFloat := 0;
  cdItemNF.FieldByName('PRECOMAXIMOCONSUMIDOR').AsFloat := 0;
  cdItemNF.FieldByName('VALORISENTO').AsFloat := 0;
  cdItemNF.FieldByName('BASECOFINS').AsFloat := 0;
  cdItemNF.FieldByName('VALORCOFINS').AsFloat := 0;
  cdItemNF.FieldByName('VALORPAUTACOFINS').AsFloat := 0;
  cdItemNF.FieldByName('RECALCULAR').AsString := 'N';
  cdItemNF.FieldByName('PERCICMS').AsFloat := 0;
  cdItemNF.FieldByName('PERCIPI').AsFloat := 0;
  {cdItemNF.FieldByName('CST').AsString       := '--';
  cdItemNF.FieldByName('CSTIPI').AsString    := '--';
  cdItemNF.FieldByName('CSTPIS').AsString    := '--';
  cdItemNF.FieldByName('CSTCOFINS').AsString := '--';}
  cdItemNF.FieldByName('VALORCUSTO').AsFloat := 0;
  cdItemNF.FieldByName('UNITARIO').AsFloat   := 0;
  cdItemNF.FieldByName('MARGEMSUBSTITUICAO').AsFloat := 0;
  cdItemNF.FieldByName('REDUCAOSUBSTITUICAO').AsFloat := 0;
  cdItemNF.FieldByName('PERCSUBSTITUICAO').AsFloat := 0;
  cdItemNF.FieldByName('REDICMS').AsFloat := 0;
  cdItemNF.FieldByName('VALORSIMPLES').AsFloat := 0;
  cdItemNF.FieldByName('VALORPUBLICA').AsFloat := 0;
  cdItemNF.FieldByName('PERCDESCONTO').AsFloat := 0;
  cdItemNF.FieldByName('VALORDESCONTO').AsFloat := 0;
  cdItemNF.FieldByName('VALORCONTABIL').AsFloat := 0;
  cdItemNF.FieldByName('VALORST').AsFloat := 0;
  cdItemNF.FieldByName('BASEST').AsFloat := 0;
  cdItemNF.FieldByName('PERCPIS').AsFloat   := 0;
  cdItemNF.FieldByName('PERCCOFINS').AsFloat := 0;
end;

procedure TDMDados.cdItemNFBeforePost(DataSet: TDataSet);
begin
  if cdItemNF.FieldByName('NUMERO').IsNull then
  begin
    cdItemNF.FieldByName('NUMERO').AsInteger  := cdNF.FieldByName('NUMERO').AsInteger;
    cdItemNF.FieldByName('SERIE').AsString    := cdNF.FieldByName('SERIE').AsString;
    cdItemNF.FieldByName('FILIAL').AsInteger  := Var_filial;
    cdItemNF.FieldByName('ORIGEM').AsString   := cdNF.FieldByName('ORIGEM').AsString;
    cdItemNF.FieldByName('CLIFOR').AsInteger  := cdNF.FieldByName('CLIFOR').AsInteger;
  end;
end;

procedure TDMDados.cdItemNFReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TDMDados.cdNFAfterInsert(DataSet: TDataSet);
begin
  cdNF.FieldByName('FILIAL').AsInteger         := Var_filial;
  cdNF.FieldByName('EMISSAO').AsDateTime       := Date;
  cdNF.FieldByName('SAIDA').AsDateTime         := Date;
  cdNF.FieldByName('HORA').AsDateTime          := Time;
  cdNF.FieldByName('MODELO').AsString          := '55';
  cdNF.FieldByName('ATUALIZADA').AsString      := Atualizada;
  cdNF.FieldByName('ORIGEM').AsString          := Origem;
  cdNF.FieldByName('CANCELADA').AsString       := 'N';
  cdNF.FieldByName('IMPRESSA').AsString        := Impressa;
  cdNF.FieldByName('ENTREGUE').AsString        := 'S';
  cdNF.FieldByName('SOMAR').AsString           := 'N';
  cdNF.FieldByName('INUTILIZADA').AsString     := 'N';
  cdNF.FieldByName('DENEGADA').AsString        := 'N';
  cdNF.FieldByName('CONTAFRETE').AsInteger     := 1;
  cdNF.FieldByName('TOTALPRODUTO').AsFloat     := 0;
  cdNF.FieldByName('PERCDESCONTO').AsFloat     := 0;
  cdNF.FieldByName('VALORDESCONTO').AsFloat    := 0;
  cdNF.FieldByName('VALORFRETE').AsFloat       := 0;
  cdNF.FieldByName('VALORENCARGO').AsFloat     := 0;
  cdNF.FieldByName('TOTAL').AsFloat            := 0;
  cdNF.FieldByName('PESOBRUTO').AsFloat        := 0;
  cdNF.FieldByName('PESOLIQUIDO').AsFloat      := 0;
  cdNF.FieldByName('VALORSEGURO').AsFloat      := 0;
  cdNF.FieldByName('TRANSPORTADOR').AsInteger  := 1;
  cdNF.FieldByName('BASEICMS').AsFloat         := 0;
  cdNF.FieldByName('VALORICMS').AsFloat        := 0;
  cdNF.FieldByName('BASESUBSTITUICAO').AsFloat := 0;
  cdNF.FieldByName('VALORSUBSTITUICAO').AsFloat:= 0;
  cdNF.FieldByName('VALORSEGURO').AsFloat      := 0;
  cdNF.FieldByName('VALORIPI').AsFloat         := 0;
  cdNF.FieldByName('BASEIPI').AsFloat          := 0;
  cdNF.FieldByName('BASEFUNRURAL').AsFloat     := 0;
  cdNF.FieldByName('VALORFUNRURAL').AsFloat    := 0;
  cdNF.FieldByName('BASEISS').AsFloat          := 0;
  cdNF.FieldByName('VALORISS').AsFloat         := 0;
  cdNF.FieldByName('BASEPIS').AsFloat          := 0;
  cdNF.FieldByName('VALORPIS').AsFloat         := 0;
  cdNF.FieldByName('BASECOFINS').AsFloat       := 0;
  cdNF.FieldByName('VALORCOFINS').AsFloat      := 0;
  cdNF.FieldByName('VALORISENTO').AsFloat      := 0;
  cdNF.FieldByName('COMISSAO').AsFloat         := 0;
  cdNF.FieldByName('VALORII').AsFloat          := 0;
  cdNF.FieldByName('VALORSIMPLES').AsFloat     := 0;
  cdNF.FieldByName('SERVICO').AsString         := Servico;
  cdNF.FieldByName('TOTALBRUTO').AsFloat       := 0;
  cdNF.FieldByName('VALORIRRF').AsFloat        := 0;
  cdNF.FieldByName('FINALIDADE').AsFloat       := 1;
end;

procedure TDMDados.cdNFEAfterInsert(DataSet: TDataSet);
begin
  if cdNFE.FieldByName('AUTORIZADA').AsString = EmptyStr then cdNFE.FieldByName('AUTORIZADA').AsString   := 'N';
  cdNFE.FieldByName('TPAMB').AsString        := '0';
  cdNFE.FieldByName('FORMAEMISSAO').AsString := '1';
end;

procedure TDMDados.cdNFEReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TDMDados.cdNFReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TDMDados.cdOrdemNFAfterInsert(DataSet: TDataSet);
begin
  //cdOrdemNF.FieldByName('ID').AsInteger := 0;
  //cdOrdemNF.FieldByName('IDNF').AsInteger := cdNF.FieldByName('ID').AsInteger;
  cdOrdemNF.FieldByName('NUMERO').AsInteger := cdNF.FieldByName('NUMERO').AsInteger;
  cdOrdemNF.FieldByName('SERIE').AsString   := cdNF.FieldByName('SERIE').AsString;
  cdOrdemNF.FieldByName('FILIAL').AsInteger := Var_filial;
  cdOrdemNF.FieldByName('ORIGEM').AsString  := cdNF.FieldByName('ORIGEM').AsString;
  cdOrdemNF.FieldByName('CLIFOR').AsInteger := cdNF.FieldByName('CLIFOR').AsInteger;
  cdOrdemNF.FieldByName('ALTERADA').AsString := 'N';
end;

procedure TDMDados.cdOrdemNFReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TDMDados.cdPesquisaReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TDMDados.cdProdutoAfterInsert(DataSet: TDataSet);
begin
  //cdProduto.FieldByName('CODIGO').AsInteger := Novo_Codigo('PRODUTO', 0);
  cdProduto.FieldByName('PESOLIQUIDO').AsFloat := 0;
  cdProduto.FieldByName('PESOBRUTO').AsFloat := 0;
  cdProduto.FieldByName('VENDACONTROLADA').AsString := 'N';
  cdProduto.FieldByName('ALTURA').AsFloat := 0;
  cdProduto.FieldByName('LARGURA').AsFloat := 0;
  cdProduto.FieldByName('PROFUNDIDADE').AsFloat := 0;
  cdProduto.FieldByName('VOLUME').AsFloat := 0;
  cdProduto.FieldByName('UNCOMPRA').AsString := 'UN';
  cdProduto.FieldByName('QTDECOMPRA').AsInteger := 1;
  cdProduto.FieldByName('UNVENDA').AsString := 'UN';
  cdProduto.FieldByName('QTDEVENDA').AsInteger := 1;
  cdProduto.FieldByName('UNCARREGAMENTO').AsString := 'UN';
  cdProduto.FieldByName('QTDECARREGAMENTO').AsInteger := 1;
  cdProduto.FieldByName('QTDEPADRAO').AsInteger := 1;
  cdProduto.FieldByName('QTDEMULTIPLA').AsInteger := 1;
  cdProduto.FieldByName('UNTROCA').AsString := 'UN';
  cdProduto.FieldByName('QTDETROCA').AsInteger := 1;
  cdProduto.FieldByName('PESOEMBALAGEM').AsInteger := 0;
  cdProduto.FieldByName('QTDEMULTIPlAEMBALAGEM').AsInteger := 1;
  cdProduto.FieldByName('ORDEM').AsInteger := 0;
  cdProduto.FieldByName('UNREFERENCIA').AsString := 'UN';
  cdProduto.FieldByName('QTDEREFERENCIA').AsInteger := 1;

end;

procedure TDMDados.cdProdutoCliforAfterInsert(DataSet: TDataSet);
begin
  cdProdutoClifor.FieldByName('COMPRA').AsString := 'S';
  cdProdutoClifor.FieldByName('VENDA').AsString := 'N';
end;

procedure TDMDados.cdProdutoCliforReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TDMDados.cdProdutoReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TDMDados.cdQueryGeralReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TDMDados.cdServicoNFReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TDMDados.cdTipoCFOPAfterInsert(DataSet: TDataSet);
begin
     cdTipoCFOP.FieldByName('CODIGO').AsInteger               := Novo_Codigo('TIPOCFOP', 0);
     cdTipoCFOP.FieldByName('GERARFINANCEIRO').AsString       := 'N';
     cdTipoCFOP.FieldByName('GERARCONSUMO').AsString          := 'N';
     cdTipoCFOP.FieldByName('CALCULAICMS').AsString           := 'N';
     cdTipoCFOP.FieldByName('CALCULAIPI').AsString            := 'N';
     cdTipoCFOP.FieldByName('GERARESTOQUE').AsString          := 'N';
     cdTipoCFOP.FieldByName('GERARCAIXA').AsString            := 'N';
     cdTipoCFOP.FieldByName('GERARCOMISSAO').AsString         := 'N';
     cdTipoCFOP.FieldByName('ZERARUNITARIO').AsString         := 'N';
     cdTipoCFOP.FieldByName('GERARBONIFICACAO').AsString      := 'N';
     cdTipoCFOP.FieldByName('GERARTROCA').AsString            := 'N';
     cdTipoCFOP.FieldByName('GERARCUSTO').AsString            := 'N';
     cdTipoCFOP.FieldByName('CALCULAFUNRURAL').AsString       := 'N';
     cdTipoCFOP.FieldByName('GERARFLEX').AsString             := 'N';
     cdTipoCFOP.FieldByName('FATURA').AsString                := 'S';
     cdTipoCFOP.FieldByName('DESCONTARFUNRURAL').AsString     := 'N';
     cdTipoCFOP.FieldByName('MOVIMENTACAOFISICA').AsString    := 'S';
     cdTipoCFOP.FieldByName('DEVOLUCAO').AsString             := 'N';
     cdTipoCFOP.FieldByName('CALCULASUBSTITUICAO').AsString   := 'N';
     cdTipoCFOP.FieldByName('GERARESTOQUEIMPROPRIO').AsString := 'N';
     cdTipoCFOP.FieldByName('CALCULAFUNDESA').AsString        := 'N';
     cdTipoCFOP.FieldByName('GERARFIDELIZACAO').AsString      := 'N';
     cdTipoCFOP.FieldByName('ATIVO').AsString                 := 'S';
     cdTipoCFOP.FieldByName('CALCULACREDITOSIMPLES').AsString := 'N';
     cdTipoCFOP.FieldByName('CALCULAPIS').AsString            := 'N';
     cdTipoCFOP.FieldByName('CALCULACOFINS').AsString         := 'N';
     cdTipoCFOP.FieldByName('FINALIDADE').AsString            := '1';
     cdTipoCFOP.FieldByName('NATUREZAOPERACAO').AsString      := '1';
     cdTipoCFOP.FieldByName('DESCONTARFRETE').AsString        := 'N';
     cdTipoCFOP.FieldByName('DESCONTARFUNDESA').AsString      := 'N';
     cdTipoCFOP.FieldByName('OUTRASES').AsString              := 'N';
     cdTipoCFOP.FieldByName('ENCARGOCOMPORBASEICMS').AsString := 'N';
     cdTipoCFOP.FieldByName('CALCULADESCONTOSIMPLES').AsString:= 'N';
     cdTipoCFOP.FieldByName('EXPORTARDADOSCOLETA').AsString   := 'N';
     cdTipoCFOP.FieldByName('FRETECOMPORBASEICMS').AsString   := 'N';
end;

procedure TDMDados.cdTransportadorAfterInsert(DataSet: TDataSet);
begin
  cdTransportador.FieldByName('CODIGO').AsInteger   := Novo_Codigo('TRANSPORTADOR', 0);
  cdTransportador.FieldByName('COMISSAO').AsFloat   := 0;
  cdTransportador.FieldByName('ENVIARNFE').AsString := 'N';
  cdTransportador.FieldByName('ATIVO').AsString     := 'S';
  cdTransportador.FieldByName('TIPOPROPRIETARIO').AsInteger := 2;
end;

procedure TDMDados.cdTransportadorReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TDMDados.cdValidadeItemNFEntradaReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TDMDados.ConexaoBanco(Caminho: String; Conectar: Boolean);
begin
  try
    if Conectar then
      SQLConnection.Params.Values['database'] := Caminho;
    SQLConnection.Connected := Conectar;
  Except
    SQLConnection.Connected := False;
    raise exception.Create('Erro de conexão com Banco de Dados de Origem.');
  end;
end;

procedure TDMDados.DataModuleCreate(Sender: TObject);
begin
  DMDados.SQLConnection.Connected := False;
end;

function TDMDados.dspBairroDataRequest(Sender: TObject;
  Input: OleVariant): OleVariant;
begin
  SQLBairro.SQL.Text := Input;
end;

function TDMDados.dspCidadeDataRequest(Sender: TObject;
  Input: OleVariant): OleVariant;
begin
  SQLCidade.SQL.Text := Input;
end;

function TDMDados.dspCliforContatoDataRequest(Sender: TObject;
  Input: OleVariant): OleVariant;
begin
  SQLCliforContato.SQL.Text := Input;
end;

function TDMDados.dspCliforDataRequest(Sender: TObject;
  Input: OleVariant): OleVariant;
begin
  SQLClifor.SQL.Text := Input;
end;

function TDMDados.dspCTeDataRequest(Sender: TObject; Input: OleVariant): OleVariant;
begin
  SQLQueryCTe.SQL.Text := Input;
end;

function TDMDados.dspGeralDataRequest(Sender: TObject;
  Input: OleVariant): OleVariant;
begin
  SQLGeral.SQL.Text := Input;
end;

function TDMDados.dspItemCTeDataRequest(Sender: TObject; Input: OleVariant): OleVariant;
begin
  SQLQueryItemCTe.SQL.Text := Input;
end;

function TDMDados.dspItemNFDataRequest(Sender: TObject;
  Input: OleVariant): OleVariant;
begin
  SQLItemNF.SQL.Text := Input;
end;

function TDMDados.dspNFDataRequest(Sender: TObject;
  Input: OleVariant): OleVariant;
begin
  SQLNF.SQL.Text := Input;
end;

function TDMDados.dspNFEDataRequest(Sender: TObject;
  Input: OleVariant): OleVariant;
begin
  SQLNFE.SQL.Text := Input;
end;

function TDMDados.dspOrdemCTeDataRequest(Sender: TObject; Input: OleVariant): OleVariant;
begin
  SQLQueryOrdemCTe.SQL.Text := Input;
end;

function TDMDados.dspOrdemNFDataRequest(Sender: TObject;
  Input: OleVariant): OleVariant;
begin
  SQLOrdemNF.SQL.Text := Input;
end;

function TDMDados.dspPesquisaDataRequest(Sender: TObject;
  Input: OleVariant): OleVariant;
begin
  SQLPesquisa.SQL.Text := Input;
end;

function TDMDados.dspProdutoCliforDataRequest(Sender: TObject;
  Input: OleVariant): OleVariant;
begin
  SQLProdutoClifor.SQL.Text := Input;
end;

function TDMDados.dspProdutoDataRequest(Sender: TObject;
  Input: OleVariant): OleVariant;
begin
  SQLProduto.SQL.Text := Input;
end;

function TDMDados.dspQueryGeralDataRequest(Sender: TObject;
  Input: OleVariant): OleVariant;
begin
  QueryGeral.SQL.Text := Input;
end;

function TDMDados.dspServicoNFDataRequest(Sender: TObject;
  Input: OleVariant): OleVariant;
begin
  SQLServicoNF.SQL.Text := Input;
end;

function TDMDados.dspTransportadorDataRequest(Sender: TObject;
  Input: OleVariant): OleVariant;
begin
  SQLTransportador.SQL.Text := Input;
end;

function TDMDados.dspValidadeItemNFEntradaDataRequest(Sender: TObject;
  Input: OleVariant): OleVariant;
begin
  SQLValidadeItemNFEntrada.SQL.Text := Input;
end;

end.
