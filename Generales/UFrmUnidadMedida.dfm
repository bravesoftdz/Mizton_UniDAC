inherited FrmUnidadMedida: TFrmUnidadMedida
  Caption = 'Unidades de Medidas'
  ClientHeight = 522
  ClientWidth = 594
  OnCreate = FormCreate
  ExplicitWidth = 600
  ExplicitHeight = 551
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxRibbon1: TdxRibbon
    Width = 594
    ExplicitWidth = 594
    inherited dxRibbon1Tab1: TdxRibbonTab
      Caption = 'Unidad de Medida'
      Index = 0
    end
  end
  inherited cxGridGral: TcxGrid
    Width = 588
    Height = 273
    ExplicitWidth = 588
    ExplicitHeight = 273
    inherited cxGridDatos: TcxGridDBTableView
      DataController.DataSource = dsDatos
      object cxColumnUnidad: TcxGridDBColumn
        Tag = 1
        Caption = 'Unidad de Medida'
        DataBinding.FieldName = 'Unidad'
        Width = 277
      end
      object cxColumnAbreviatura: TcxGridDBColumn
        Tag = 1
        DataBinding.FieldName = 'Abreviatura'
        Width = 255
      end
    end
  end
  inherited pnlDatos: TPanel
    Top = 401
    Width = 594
    Height = 121
    ExplicitTop = 401
    ExplicitWidth = 594
    ExplicitHeight = 121
    inherited cxPageDatos: TcxPageControl
      Width = 590
      Height = 117
      ExplicitWidth = 590
      ExplicitHeight = 117
      ClientRectBottom = 111
      ClientRectRight = 584
      inherited cxTsDatos: TcxTabSheet
        ExplicitWidth = 582
        ExplicitHeight = 84
        inherited dxLYCDatos: TdxLayoutControl
          Width = 582
          Height = 84
          ExplicitWidth = 582
          ExplicitHeight = 84
          object cxtextUnidad: TcxDBTextEdit [0]
            Tag = -1
            Left = 117
            Top = 11
            DataBinding.DataField = 'Unidad'
            DataBinding.DataSource = dsDatosUpt
            Properties.MaxLength = 20
            Style.HotTrack = False
            TabOrder = 0
            Width = 445
          end
          object cxtextAbreviatura: TcxDBTextEdit [1]
            Tag = -1
            Left = 117
            Top = 38
            DataBinding.DataField = 'Abreviatura'
            DataBinding.DataSource = dsDatosUpt
            Properties.MaxLength = 20
            Style.HotTrack = False
            TabOrder = 1
            Width = 121
          end
          inherited dxLyDatos: TdxLayoutGroup
            Index = -1
          end
          object dxLYCDatosItem1: TdxLayoutItem
            Parent = dxLyDatos
            CaptionOptions.Text = 'Unidad de Medida'
            Control = cxtextUnidad
            ControlOptions.ShowBorder = False
            Index = 0
          end
          object dxLYCDatosItem2: TdxLayoutItem
            Parent = dxLyDatos
            CaptionOptions.Text = 'Abreviatura'
            Control = cxtextAbreviatura
            ControlOptions.ShowBorder = False
            Index = 1
          end
        end
      end
    end
  end
  inherited dxBarManager1: TdxBarManager
    LookAndFeel.SkinName = ''
    DockControlHeights = (
      0
      0
      0
      0)
    inherited dxbrManager1Bar: TdxBar
      FloatClientWidth = 97
      FloatClientHeight = 307
    end
    inherited dxButtonGuardar: TdxBarLargeButton
      ImageIndex = 8
    end
  end
  inherited dsDatos: TDataSource
    DataSet = zDatos
  end
  inherited zDatos: TZQuery
    Connection = UDMConection.conBD
  end
  inherited zDatosUpt: TZQuery
    Connection = UDMConection.conBD
  end
end
