inherited FrmCostosInstalacion: TFrmCostosInstalacion
  Caption = 'Costos instalaci'#243'n'
  ClientHeight = 577
  ClientWidth = 820
  OnCreate = FormCreate
  ExplicitWidth = 826
  ExplicitHeight = 606
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxRibbon1: TdxRibbon
    Width = 820
    ExplicitWidth = 820
    inherited dxRibbon1Tab1: TdxRibbonTab
      Caption = 'Inicio'
      Index = 0
    end
  end
  inherited cxGridGral: TcxGrid
    Width = 809
    Height = 299
    ExplicitWidth = 809
    ExplicitHeight = 299
    inherited cxGridDatos: TcxGridDBTableView
      DataController.DataSource = dsDatos
      OptionsView.GroupByBox = True
      object cxColFecha: TcxGridDBColumn
        Caption = 'Vigente desde'
        DataBinding.FieldName = 'Vigencia'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ReadOnly = True
        Width = 195
      end
      object cxColTipoOrden: TcxGridDBColumn
        Caption = 'Tipo Orden'
        DataBinding.FieldName = 'TipoOrden'
        Visible = False
        GroupIndex = 0
      end
      object cxColCostoLocal: TcxGridDBColumn
        Caption = '$ T'#233'cnico O.T.  Local'
        DataBinding.FieldName = 'pagoTecnicoLocal'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.ReadOnly = True
        Width = 153
      end
      object cxColCostoForaneo: TcxGridDBColumn
        Caption = '$ T'#233'cnico O.T. Foraneo'
        DataBinding.FieldName = 'pagoTecnicoForaneo'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.ReadOnly = True
        Width = 172
      end
      object cxColEmpLocal: TcxGridDBColumn
        Caption = 'Costo O.T. Local'
        DataBinding.FieldName = 'CostoLocal'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.ReadOnly = True
        Width = 132
      end
      object cxColEmpForaneo: TcxGridDBColumn
        Caption = 'Costo O.T. Foraneo'
        DataBinding.FieldName = 'CostoForaneo'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.ReadOnly = True
        Width = 84
      end
    end
  end
  inherited pnlDatos: TPanel
    Top = 427
    Width = 820
    Height = 150
    ExplicitTop = 427
    ExplicitWidth = 820
    ExplicitHeight = 150
    inherited cxPageDatos: TcxPageControl
      Width = 816
      Height = 146
      ExplicitWidth = 816
      ExplicitHeight = 146
      ClientRectBottom = 140
      ClientRectRight = 810
      inherited cxTsDatos: TcxTabSheet
        ExplicitWidth = 808
        ExplicitHeight = 113
        inherited dxLYCDatos: TdxLayoutControl
          Width = 808
          Height = 113
          ExplicitWidth = 808
          ExplicitHeight = 113
          object cxDateFecha: TcxDBDateEdit [0]
            Left = 144
            Top = 11
            DataBinding.DataField = 'Vigencia'
            DataBinding.DataSource = dsDatosUpt
            Style.HotTrack = False
            TabOrder = 0
            Width = 210
          end
          object cbbTipoOrden: TcxDBLookupComboBox [1]
            Left = 501
            Top = 11
            DataBinding.DataField = 'IdTipoOrden'
            DataBinding.DataSource = dsDatosUpt
            Properties.KeyFieldNames = 'Idtipo'
            Properties.ListColumns = <
              item
                FieldName = 'TipoOrden'
              end>
            Properties.ListSource = dsTO
            Style.HotTrack = False
            TabOrder = 3
            Width = 145
          end
          object cxCurrencyLocal: TcxDBCurrencyEdit [2]
            Left = 144
            Top = 38
            DataBinding.DataField = 'Pagotecnicolocal'
            DataBinding.DataSource = dsDatosUpt
            Style.HotTrack = False
            TabOrder = 1
            Width = 210
          end
          object cxCurrencyEmpForaneo: TcxDBCurrencyEdit [3]
            Left = 501
            Top = 65
            DataBinding.DataField = 'CostoForaneo'
            DataBinding.DataSource = dsDatosUpt
            Style.HotTrack = False
            TabOrder = 5
            Width = 121
          end
          object cxCurrencyForaneo: TcxDBCurrencyEdit [4]
            Left = 144
            Top = 65
            DataBinding.DataField = 'Pagotecnicoforaneo'
            DataBinding.DataSource = dsDatosUpt
            Style.HotTrack = False
            TabOrder = 2
            Width = 210
          end
          object cxCurrencyEmpLocal: TcxDBCurrencyEdit [5]
            Left = 501
            Top = 38
            DataBinding.DataField = 'CostoLocal'
            DataBinding.DataSource = dsDatosUpt
            Style.HotTrack = False
            TabOrder = 4
            Width = 250
          end
          inherited dxLyDatos: TdxLayoutGroup
            LayoutDirection = ldHorizontal
            Index = -1
          end
          object lyFecha: TdxLayoutItem
            Parent = dxLYCDatosGroup4
            AlignHorz = ahClient
            CaptionOptions.Text = 'Fecha:'
            Control = cxDateFecha
            ControlOptions.ShowBorder = False
            Index = 0
          end
          object lyTipoOrden: TdxLayoutItem
            Parent = dxLYCDatosGroup3
            CaptionOptions.Text = 'Tipo Orden:'
            Control = cbbTipoOrden
            ControlOptions.ShowBorder = False
            Index = 0
          end
          object dxLYCDatosGroup3: TdxLayoutAutoCreatedGroup
            Parent = dxLyDatos
            Index = 1
            AutoCreated = True
          end
          object lyLocal: TdxLayoutItem
            Parent = dxLYCDatosGroup4
            AlignHorz = ahLeft
            CaptionOptions.Text = '$ T'#233'cnico O.T. Local'
            Control = cxCurrencyLocal
            ControlOptions.ShowBorder = False
            Index = 1
          end
          object dxLYCDatosGroup4: TdxLayoutAutoCreatedGroup
            Parent = dxLyDatos
            AlignHorz = ahLeft
            Index = 0
            AutoCreated = True
          end
          object lyEmpForaneo: TdxLayoutItem
            Parent = dxLYCDatosGroup3
            CaptionOptions.Text = '$ Empresa O.T. Foraneo'
            Control = cxCurrencyEmpForaneo
            ControlOptions.ShowBorder = False
            Index = 2
          end
          object lyForaneo: TdxLayoutItem
            Parent = dxLYCDatosGroup4
            AlignHorz = ahLeft
            CaptionOptions.Text = '$ T'#233'cnico O.T. Foraneo'
            Control = cxCurrencyForaneo
            ControlOptions.ShowBorder = False
            Index = 2
          end
          object lyEmpLocal: TdxLayoutItem
            Parent = dxLYCDatosGroup3
            CaptionOptions.Text = '$ Empresa O.T. Local'
            Control = cxCurrencyEmpLocal
            ControlOptions.ShowBorder = False
            Index = 1
          end
        end
      end
    end
  end
  inherited cxSplitter1: TcxSplitter
    Height = 305
    ExplicitHeight = 305
  end
  inherited dxBarManager1: TdxBarManager
    LookAndFeel.SkinName = ''
    Top = 224
    DockControlHeights = (
      0
      0
      0
      0)
    inherited dxbrManager1Bar: TdxBar
      DockedDockControl = nil
      DockedDockingStyle = dsNone
      FloatClientWidth = 97
      FloatClientHeight = 307
    end
    inherited dxButtonGuardar: TdxBarLargeButton
      ImageIndex = 9
    end
  end
  inherited dsDatos: TDataSource
    DataSet = zDatos
    Left = 24
    Top = 240
  end
  inherited zDatos: TUniQuery
    Left = 24
    Top = 312
  end
  inherited zDatosUpt: TUniQuery
    Left = 88
    Top = 312
  end
  inherited dsDatosUpt: TDataSource
    Top = 240
  end
  inherited dxPopupGrid: TdxRibbonPopupMenu
    Top = 272
  end
  inherited dlgSave1: TSaveDialog
    Left = 192
    Top = 280
  end
  object zTO: TUniQuery
    Left = 352
    Top = 288
  end
  object dsTO: TDataSource
    DataSet = zTO
    Left = 360
    Top = 296
  end
end
