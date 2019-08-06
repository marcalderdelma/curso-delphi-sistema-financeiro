object DMConexao: TDMConexao
  OldCreateOrder = False
  Height = 711
  Width = 365
  object FDConexao: TFDConnection
    Params.Strings = (
      'ConnectionDef=financeiro')
    Connected = True
    LoginPrompt = False
    Left = 32
    Top = 8
  end
  object CDSUsuario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPUsuario'
    Left = 256
    Top = 72
    object CDSUsuarioidusuario: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldKind = fkCalculated
      FieldName = 'idusuario'
      Origin = 'idusuario'
      ProviderFlags = [pfInWhere, pfInKey]
      Calculated = True
    end
    object CDSUsuarionome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 50
    end
    object CDSUsuariologin: TStringField
      FieldName = 'login'
      Origin = 'login'
      Required = True
    end
    object CDSUsuariosenha: TStringField
      FieldName = 'senha'
      Origin = 'senha'
      Required = True
    end
    object CDSUsuariodata_cadastro: TDateField
      FieldName = 'data_cadastro'
      Origin = 'data_cadastro'
      Required = True
    end
    object CDSUsuariostatus: TStringField
      FieldName = 'status'
      Origin = '`status`'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object DSPUsuario: TDataSetProvider
    DataSet = FDQUsuario
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 144
    Top = 72
  end
  object CDSCaixa: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPCaixa'
    Left = 256
    Top = 128
    object CDSCaixaidcaixa: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'idcaixa'
      Origin = 'idcaixa'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object CDSCaixanumero_doc: TStringField
      FieldName = 'numero_doc'
      Origin = 'numero_doc'
      Required = True
    end
    object CDSCaixadescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 200
    end
    object CDSCaixatipo: TStringField
      FieldName = 'tipo'
      Origin = 'tipo'
      Required = True
      FixedChar = True
      Size = 1
    end
    object CDSCaixavalor: TFloatField
      FieldName = 'valor'
      Origin = 'valor'
      Required = True
    end
    object CDSCaixadata_cadastro: TDateField
      FieldName = 'data_cadastro'
      Origin = 'data_cadastro'
      Required = True
    end
  end
  object CDSContasReceber: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPContasReceber'
    Left = 256
    Top = 192
    object CDSContasReceberidcontas_rec: TAutoIncField
      FieldName = 'idcontas_rec'
      ReadOnly = True
    end
    object CDSContasRecebernumero_doc: TStringField
      FieldName = 'numero_doc'
      Required = True
    end
    object CDSContasReceberdescricao: TStringField
      FieldName = 'descricao'
      Size = 200
    end
    object CDSContasReceberqtd_parcela: TIntegerField
      FieldName = 'qtd_parcela'
      Required = True
    end
    object CDSContasRecebervlr_venda: TFloatField
      FieldName = 'vlr_venda'
      Required = True
    end
    object CDSContasRecebervlr_abatido: TFloatField
      FieldName = 'vlr_abatido'
      Required = True
    end
    object CDSContasReceberdata_venda: TDateField
      FieldName = 'data_venda'
      Required = True
    end
    object CDSContasReceberdata_cadastro: TDateField
      FieldName = 'data_cadastro'
      Required = True
    end
    object CDSContasReceberstatus: TStringField
      FieldName = 'status'
      Required = True
      FixedChar = True
      Size = 1
    end
    object CDSContasReceberdata_recebimento: TDateField
      FieldName = 'data_recebimento'
    end
    object CDSContasReceberid_empresa: TIntegerField
      FieldName = 'id_empresa'
      Required = True
    end
  end
  object CDSContasPagar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPContasPagar'
    Left = 256
    Top = 264
    object CDSContasPagaridcontas_pag: TAutoIncField
      FieldName = 'idcontas_pag'
      ReadOnly = True
    end
    object CDSContasPagarnumero_doc: TStringField
      FieldName = 'numero_doc'
      Required = True
    end
    object CDSContasPagardescricao: TStringField
      FieldName = 'descricao'
      Size = 200
    end
    object CDSContasPagarqtd_parcela: TIntegerField
      FieldName = 'qtd_parcela'
      Required = True
    end
    object CDSContasPagarvlr_compra: TFloatField
      FieldName = 'vlr_compra'
      Required = True
    end
    object CDSContasPagarvlr_abatido: TFloatField
      FieldName = 'vlr_abatido'
      Required = True
    end
    object CDSContasPagardata_compra: TDateField
      FieldName = 'data_compra'
      Required = True
    end
    object CDSContasPagardata_cadastro: TDateField
      FieldName = 'data_cadastro'
      Required = True
    end
    object CDSContasPagarstatus: TStringField
      FieldName = 'status'
      Required = True
      FixedChar = True
      Size = 1
    end
    object CDSContasPagardata_pagamento: TDateField
      FieldName = 'data_pagamento'
    end
    object CDSContasPagarid_empresa: TIntegerField
      FieldName = 'id_empresa'
      Required = True
    end
  end
  object DSPCaixa: TDataSetProvider
    DataSet = FDQCaixa
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 144
    Top = 128
  end
  object DSPContasReceber: TDataSetProvider
    DataSet = FDQContasReceber
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 144
    Top = 192
  end
  object DSPContasPagar: TDataSetProvider
    DataSet = FDQContasPagar
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 136
    Top = 256
  end
  object FDQUsuario: TFDQuery
    Connection = FDConexao
    SQL.Strings = (
      'SELECT * FROM usuario'
      'ORDER BY idusuario DESC;')
    Left = 32
    Top = 64
  end
  object FDQCaixa: TFDQuery
    Active = True
    Connection = FDConexao
    SQL.Strings = (
      'SELECT idcaixa,numero_doc,descricao,tipo,valor,data_cadastro'
      ' FROM caixa'
      'ORDER BY idcaixa  DESC;')
    Left = 24
    Top = 136
    object FDQCaixaidcaixa: TFDAutoIncField
      FieldName = 'idcaixa'
      Origin = 'idcaixa'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQCaixanumero_doc: TStringField
      FieldName = 'numero_doc'
      Origin = 'numero_doc'
      Required = True
    end
    object FDQCaixadescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 200
    end
    object FDQCaixatipo: TStringField
      FieldName = 'tipo'
      Origin = 'tipo'
      Required = True
      FixedChar = True
      Size = 1
    end
    object FDQCaixavalor: TFloatField
      FieldName = 'valor'
      Origin = 'valor'
      Required = True
    end
    object FDQCaixadata_cadastro: TDateField
      FieldName = 'data_cadastro'
      Origin = 'data_cadastro'
      Required = True
    end
  end
  object FDQContasReceber: TFDQuery
    Connection = FDConexao
    SQL.Strings = (
      'SELECT * FROM contas_receber'
      'ORDER BY idcontas_rec DESC;')
    Left = 32
    Top = 192
    object FDQContasReceberidcontas_rec: TFDAutoIncField
      FieldName = 'idcontas_rec'
      Origin = 'idcontas_rec'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQContasRecebernumero_doc: TStringField
      FieldName = 'numero_doc'
      Origin = 'numero_doc'
      Required = True
    end
    object FDQContasReceberdescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 200
    end
    object FDQContasReceberqtd_parcela: TIntegerField
      FieldName = 'qtd_parcela'
      Origin = 'qtd_parcela'
      Required = True
    end
    object FDQContasRecebervlr_venda: TFloatField
      FieldName = 'vlr_venda'
      Origin = 'vlr_venda'
      Required = True
    end
    object FDQContasRecebervlr_abatido: TFloatField
      FieldName = 'vlr_abatido'
      Origin = 'vlr_abatido'
      Required = True
    end
    object FDQContasReceberdata_venda: TDateField
      FieldName = 'data_venda'
      Origin = 'data_venda'
      Required = True
    end
    object FDQContasReceberdata_cadastro: TDateField
      FieldName = 'data_cadastro'
      Origin = 'data_cadastro'
      Required = True
    end
    object FDQContasReceberstatus: TStringField
      FieldName = 'status'
      Origin = '`status`'
      Required = True
      FixedChar = True
      Size = 1
    end
    object FDQContasReceberdata_recebimento: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'data_recebimento'
      Origin = 'data_recebimento'
    end
    object FDQContasReceberid_empresa: TIntegerField
      FieldName = 'id_empresa'
      Origin = 'id_empresa'
      Required = True
    end
  end
  object FDQContasPagar: TFDQuery
    Active = True
    Connection = FDConexao
    SQL.Strings = (
      'SELECT * FROM contas_pagar'
      'ORDER BY idcontas_pag  DESC;')
    Left = 32
    Top = 264
    object FDQContasPagaridcontas_pag: TFDAutoIncField
      FieldName = 'idcontas_pag'
      Origin = 'idcontas_pag'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQContasPagarnumero_doc: TStringField
      FieldName = 'numero_doc'
      Origin = 'numero_doc'
      Required = True
    end
    object FDQContasPagardescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 200
    end
    object FDQContasPagarqtd_parcela: TIntegerField
      FieldName = 'qtd_parcela'
      Origin = 'qtd_parcela'
      Required = True
    end
    object FDQContasPagarvlr_compra: TFloatField
      FieldName = 'vlr_compra'
      Origin = 'vlr_compra'
      Required = True
    end
    object FDQContasPagarvlr_abatido: TFloatField
      FieldName = 'vlr_abatido'
      Origin = 'vlr_abatido'
      Required = True
    end
    object FDQContasPagardata_compra: TDateField
      FieldName = 'data_compra'
      Origin = 'data_compra'
      Required = True
    end
    object FDQContasPagardata_cadastro: TDateField
      FieldName = 'data_cadastro'
      Origin = 'data_cadastro'
      Required = True
    end
    object FDQContasPagarstatus: TStringField
      FieldName = 'status'
      Origin = '`status`'
      Required = True
      FixedChar = True
      Size = 1
    end
    object FDQContasPagardata_pagamento: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'data_pagamento'
      Origin = 'data_pagamento'
    end
    object FDQContasPagarid_empresa: TIntegerField
      FieldName = 'id_empresa'
      Origin = 'id_empresa'
      Required = True
    end
  end
  object FDQEmpresa: TFDQuery
    Connection = FDConexao
    SQL.Strings = (
      'SELECT * FROM empresa')
    Left = 32
    Top = 336
    object FDQEmpresaidempresa: TFDAutoIncField
      FieldName = 'idempresa'
      Origin = 'idempresa'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQEmpresanome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 50
    end
    object FDQEmpresatelefone: TStringField
      FieldName = 'telefone'
      Origin = 'telefone'
      Required = True
      Size = 15
    end
    object FDQEmpresatipo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tipo'
      Origin = 'tipo'
      FixedChar = True
      Size = 1
    end
  end
  object DSPEmpresa: TDataSetProvider
    DataSet = FDQEmpresa
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 136
    Top = 336
  end
  object CDSEmpresa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPEmpresa'
    Left = 256
    Top = 336
    object CDSEmpresaidempresa: TAutoIncField
      FieldName = 'idempresa'
      KeyFields = 'idempresa'
      ReadOnly = True
    end
    object CDSEmpresanome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 50
    end
    object CDSEmpresatelefone: TStringField
      FieldName = 'telefone'
      Required = True
      Size = 15
    end
    object CDSEmpresatipo: TStringField
      FieldName = 'tipo'
      FixedChar = True
      Size = 1
    end
  end
  object FDQListaclientes: TFDQuery
    Active = True
    Connection = FDConexao
    SQL.Strings = (
      
        'SELECT idempresa, nome, telefone, tipo FROM empresa WHERE tipo='#39 +
        'C'#39)
    Left = 32
    Top = 400
    object FDQListaclientesidempresa: TFDAutoIncField
      FieldName = 'idempresa'
      Origin = 'idempresa'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQListaclientesnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 50
    end
    object FDQListaclientestelefone: TStringField
      FieldName = 'telefone'
      Origin = 'telefone'
      Required = True
      Size = 15
    end
    object FDQListaclientestipo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tipo'
      Origin = 'tipo'
      FixedChar = True
      Size = 1
    end
  end
  object FDQContcliente: TFDQuery
    Active = True
    Connection = FDConexao
    SQL.Strings = (
      'SELECT count(*) AS total '
      'FROM (SELECT * FROM empresa WHERE tipo='#39'C'#39') as t')
    Left = 24
    Top = 545
    object FDQContclientetotal: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'total'
      Origin = 'total'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object DSPContcliente: TDataSetProvider
    DataSet = FDQContcliente
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 120
    Top = 537
  end
  object CDSContcliente: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPContcliente'
    Left = 248
    Top = 537
    object CDSContclientetotal: TLargeintField
      FieldName = 'total'
      Origin = 'total'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object DSPListaclientes: TDataSetProvider
    DataSet = FDQListaclientes
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 128
    Top = 400
  end
  object CDSListaclientes: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'idempresa'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'nome'
        Attributes = [faRequired]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'telefone'
        Attributes = [faRequired]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'tipo'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DSPListaclientes'
    StoreDefs = True
    Left = 248
    Top = 400
    object CDSListaclientesidempresa: TAutoIncField
      FieldName = 'idempresa'
      Origin = 'idempresa'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object CDSListaclientesnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 50
    end
    object CDSListaclientestelefone: TStringField
      FieldName = 'telefone'
      Origin = 'telefone'
      Required = True
      Size = 15
    end
    object CDSListaclientestipo: TStringField
      FieldName = 'tipo'
      Origin = 'tipo'
      FixedChar = True
      Size = 1
    end
  end
  object FDQListafornecedores: TFDQuery
    Active = True
    Connection = FDConexao
    SQL.Strings = (
      
        'SELECT idempresa, nome, telefone, tipo FROM empresa WHERE tipo='#39 +
        'F'#39)
    Left = 26
    Top = 474
    object FDAutoIncField1: TFDAutoIncField
      FieldName = 'idempresa'
      Origin = 'idempresa'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object StringField1: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 50
    end
    object StringField2: TStringField
      FieldName = 'telefone'
      Origin = 'telefone'
      Required = True
      Size = 15
    end
    object StringField3: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tipo'
      Origin = 'tipo'
      FixedChar = True
      Size = 1
    end
  end
  object DSPListafornecodores: TDataSetProvider
    DataSet = FDQListafornecedores
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 134
    Top = 474
  end
  object CDSListafornecedores: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'idempresa'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'nome'
        Attributes = [faRequired]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'telefone'
        Attributes = [faRequired]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'tipo'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DSPListafornecodores'
    StoreDefs = True
    Left = 242
    Top = 482
    object CDSListafornecedoresidempresa: TAutoIncField
      FieldName = 'idempresa'
      Origin = 'idempresa'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object CDSListafornecedoresnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 50
    end
    object CDSListafornecedorestelefone: TStringField
      FieldName = 'telefone'
      Origin = 'telefone'
      Required = True
      Size = 15
    end
    object CDSListafornecedorestipo: TStringField
      FieldName = 'tipo'
      Origin = 'tipo'
      FixedChar = True
      Size = 1
    end
  end
  object FDQContfornecedores: TFDQuery
    Active = True
    Connection = FDConexao
    SQL.Strings = (
      'SELECT count(*) AS total '
      'FROM (SELECT * FROM empresa WHERE tipo='#39'F'#39') as t')
    Left = 32
    Top = 616
    object FDQContfornecedorestotal: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'total'
      Origin = 'total'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object DSPContfornecedores: TDataSetProvider
    DataSet = FDQContfornecedores
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 128
    Top = 608
  end
  object CDSContfornecedores: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPContfornecedores'
    Left = 256
    Top = 608
    object CDSContfornecedorestotal: TLargeintField
      FieldName = 'total'
      Origin = 'total'
      ProviderFlags = []
      ReadOnly = True
    end
  end
end
