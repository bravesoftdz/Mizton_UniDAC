object FrmFolioMaterial: TFrmFolioMaterial
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Asignar Material'
  ClientHeight = 119
  ClientWidth = 357
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBotonera: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 77
    Width = 351
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnGuardar: TcxButton
      AlignWithMargins = True
      Left = 152
      Top = 3
      Width = 95
      Height = 33
      Align = alRight
      Caption = '&Guardar y'#13#10' Cerrar'
      OptionsImage.ImageIndex = 8
      OptionsImage.Images = UDMConection.cxImage16
      TabOrder = 0
      OnClick = btnGuardarClick
    end
    object btnCancelar: TcxButton
      AlignWithMargins = True
      Left = 253
      Top = 3
      Width = 95
      Height = 33
      Align = alRight
      Caption = '&Cancelar'
      OptionsImage.ImageIndex = 2
      OptionsImage.Images = UDMConection.cxImage16
      TabOrder = 1
      OnClick = btnCancelarClick
    end
    object btnGuardarNuevo: TcxButton
      AlignWithMargins = True
      Left = 51
      Top = 3
      Width = 95
      Height = 33
      Align = alRight
      Caption = '&Guardar y'#13#10' a'#241'adir otro'
      OptionsImage.ImageIndex = 8
      OptionsImage.Images = UDMConection.cxImage16
      TabOrder = 2
      OnClick = btnGuardarNuevoClick
    end
  end
  object dxLayControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 357
    Height = 74
    Align = alClient
    TabOrder = 1
    LayoutLookAndFeel = UDMConection.dxStyleForms
    object cbbMaterial: TcxDBLookupComboBox
      Left = 70
      Top = 11
      DataBinding.DataField = 'IdMaterial'
      DataBinding.DataSource = dsDatos
      Properties.KeyFieldNames = 'IdServicio'
      Properties.ListColumns = <
        item
          FieldName = 'servicio'
        end>
      Properties.ListOptions.SyncMode = True
      Properties.ListSource = dsMaterial
      Style.HotTrack = False
      TabOrder = 0
      Width = 267
    end
    object cxSpinCantidad: TcxDBSpinEdit
      Left = 70
      Top = 38
      DataBinding.DataField = 'Cantidad'
      DataBinding.DataSource = dsDatos
      Properties.AssignedValues.MinValue = True
      Properties.ValueType = vtFloat
      Style.HotTrack = False
      TabOrder = 1
      Width = 121
    end
    object dxLayControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahLeft
      AlignVert = avTop
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object lyMaterial: TdxLayoutItem
      Parent = dxLayControl1Group_Root
      CaptionOptions.Text = 'Material:'
      Control = cbbMaterial
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lyCantidad: TdxLayoutItem
      Parent = dxLayControl1Group_Root
      CaptionOptions.Text = 'Cantidad:'
      Control = cxSpinCantidad
      ControlOptions.ShowBorder = False
      Index = 1
    end
  end
  object zMaterial: TUniQuery
    Top = 88
  end
  object dsMaterial: TDataSource
    DataSet = zMaterial
    Left = 8
    Top = 40
  end
  object dsDatos: TDataSource
    DataSet = zDatos
    Left = 8
    Top = 72
  end
  object zDatos: TUniQuery
    Top = 56
  end
end
