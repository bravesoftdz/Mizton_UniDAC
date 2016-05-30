object FrmAbrirEmpresa: TFrmAbrirEmpresa
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Seleccionar Empresa'
  ClientHeight = 327
  ClientWidth = 538
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lstEmpresas: TcxDBTreeList
    AlignWithMargins = True
    Left = 3
    Top = 100
    Width = 532
    Height = 161
    BorderStyle = cxcbsNone
    Align = alClient
    Bands = <
      item
        Caption.Text = 'Empresas'
      end>
    DataController.DataSource = dsEmpresa
    DataController.ImageIndexField = 'imgIndex'
    DataController.ParentField = 'IdPadre'
    DataController.KeyField = 'IdEmpresa'
    Navigator.Buttons.CustomButtons = <>
    OptionsSelection.CellSelect = False
    OptionsView.ColumnAutoWidth = True
    RootValue = -1
    Styles.Content = UDMConection.cxstylContent
    Styles.BandHeader = UDMConection.cxstylHeader
    Styles.ColumnHeader = UDMConection.cxstylHeader
    TabOrder = 0
    ExplicitTop = 94
    ExplicitHeight = 179
    object cxColumnRazonSocial: TcxDBTreeListColumn
      PropertiesClassName = 'TcxLabelProperties'
      DataBinding.FieldName = 'Titulo'
      Width = 207
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object cxColumnRfc: TcxDBTreeListColumn
      PropertiesClassName = 'TcxLabelProperties'
      DataBinding.FieldName = 'RFC'
      Width = 114
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object cxColumnRegPät: TcxDBTreeListColumn
      PropertiesClassName = 'TcxLabelProperties'
      DataBinding.FieldName = 'RegPatronal'
      Width = 108
      Position.ColIndex = 3
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object cxColumnImgIndex: TcxDBTreeListColumn
      PropertiesClassName = 'TcxImageProperties'
      Properties.GraphicClassName = 'TdxSmartImage'
      Properties.ReadOnly = True
      Visible = False
      Caption.Text = '...'
      DataBinding.FieldName = 'ImgIndex'
      Width = 28
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
  end
  object btnAbort: TcxButton
    Left = 355
    Top = 80
    Width = 75
    Height = 25
    Caption = 'btnAbort'
    ModalResult = 3
    TabOrder = 1
    Visible = False
  end
  object btn1: TcxButton
    Left = 256
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 2
    Visible = False
    OnClick = btn1Click
  end
  object btn2: TcxButton
    Left = 337
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 6
    Visible = False
  end
  object cxLabel1: TcxLabel
    AlignWithMargins = True
    Left = 3
    Top = 77
    Align = alTop
    Caption = 
      'Seleccione la empresa con la cual desea trabajar y presione "Abr' +
      'ir"'
    Transparent = True
    ExplicitLeft = 0
    ExplicitTop = 71
    ExplicitWidth = 538
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 538
    Height = 74
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 9
    object cxDBImage1: TcxDBImage
      AlignWithMargins = True
      Left = 3
      Top = 3
      Align = alLeft
      DataBinding.DataField = 'logotipo'
      DataBinding.DataSource = dsEmpresa
      Properties.GraphicClassName = 'TdxSmartImage'
      TabOrder = 0
      Height = 68
      Width = 81
    end
    object cxdblbl1: TcxDBLabel
      AlignWithMargins = True
      Left = 90
      Top = 3
      Align = alClient
      DataBinding.DataField = 'RazonSocial'
      DataBinding.DataSource = dsEmpresa
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.TransparentBorder = True
      Style.IsFontAssigned = True
      Transparent = True
      ExplicitLeft = 87
      ExplicitTop = 0
      ExplicitWidth = 451
      ExplicitHeight = 74
      Height = 68
      Width = 445
    end
  end
  object zEmpresa: TUniQuery
    Connection = UDMConection.conBd
    SQL.Strings = (
      'Select '
      '  e.*,'
      '  p.Pais,'
      '  es.Estado,'
      '  c.Ciudad,'
      '  CONCAT(c.Ciudad,", ", es.Estado) as Expedicion,'
      '  0 as ImgIndex'
      'From '
      '  master_empresa as e'
      '                                            '
      'left join '
      '  master_pais as p'
      'on (p.IdPais =e.IdPais)'
      ''
      'left join'
      '  master_estado as es'
      'on(es.IdEstado = e.IdEstado)'
      '                                 '
      'left join'
      '  master_ciudad as c       '
      'on(c.IdCiudad = e.IdCiudad)'
      ''
      ''
      'Where'
      
        ' ((:IdEmpresa = -1 and e.Activo = '#39'Si'#39') or (:IdEmpresa <> -1 and' +
        ' e.IdEmpresa = :IdEmpresa)) and '
      
        ' ((:bIdEmpresa = -1) or (:bIdEmpresa <> -1 and (e.IdEmpresa = :b' +
        'IdEmpresa or e.IdPadre = :bIdEmpresa))) and'
      ' (:IdPadre = -1 or (:IdPadre <> -1 and e.IdPadre = :IdPadre))  '
      '  ')
    Left = 216
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IdEmpresa'
      end
      item
        DataType = ftUnknown
        Name = 'bIdEmpresa'
      end
      item
        DataType = ftUnknown
        Name = 'IdPadre'
      end>
  end
  object dsEmpresa: TDataSource
    DataSet = zEmpresa
    Left = 160
    Top = 152
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.LargeImages = UDMConection.cxImgListFlat32
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 256
    Top = 120
    DockControlHeights = (
      0
      0
      0
      63)
    object dxbrManager1Bar: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Custom 1'
      CaptionButtons = <>
      DockedDockingStyle = dsBottom
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsBottom
      FloatLeft = 507
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxButtonAbiri'
        end
        item
          Visible = True
          ItemName = 'dxButtonCerrar'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      ShowMark = False
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = False
    end
    object dxButtonAbiri: TdxBarLargeButton
      Caption = '&Abrir'
      Category = 0
      Hint = 'Abrir'
      Visible = ivAlways
      LargeImageIndex = 6
      OnClick = dxButtonAbiriClick
      AutoGrayScale = False
    end
    object dxButtonCerrar: TdxBarLargeButton
      Caption = '&Cerrar'
      Category = 0
      Hint = 'Cerrar'
      Visible = ivAlways
      LargeImageIndex = 1
      OnClick = dxButtonCerrarClick
      AutoGrayScale = False
    end
  end
end
