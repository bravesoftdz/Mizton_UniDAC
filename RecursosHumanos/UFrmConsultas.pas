unit UFrmConsultas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, ComCtrls, dxCore, cxDateUtils, dxLayoutcxEditAdapters,
  cxTextEdit, StdCtrls, cxRadioGroup, dxLayoutContainer, cxMaskEdit,
  cxDropDownEdit, cxCalendar, dxLayoutControl, cxGroupBox, ExtCtrls, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxCheckBox, cxSplitter, Menus,
  cxButtons, cxCustomPivotGrid, cxDBPivotGrid, ZAbstractRODataset, uconection,
  cxExport, UMsgBox, ShellApi, cxGridExportLink,
  comObj, cxExportPivotGridLink, DateUtils, uni, MemDS, DBAccess, ExportaExcel;

type
  TFrmConsultas = class(TForm)
    pnlFiltros: TPanel;
    cxGboxFecha: TcxGroupBox;
    dxLayControl1Group_Root: TdxLayoutGroup;
    dxLayControl1: TdxLayoutControl;
    cxDateDesde: TcxDateEdit;
    lyDesde: TdxLayoutItem;
    cxDateHasta: TcxDateEdit;
    lyHasta: TdxLayoutItem;
    rbFecha: TcxRadioButton;
    rbFolio: TcxRadioButton;
    cxGboxFolio: TcxGroupBox;
    dxLayoutControl1: TdxLayoutControl;
    dxLayoutGroup1: TdxLayoutGroup;
    cxTextFolio: TcxTextEdit;
    lyFolio: TdxLayoutItem;
    rbTelefono: TcxRadioButton;
    cxGroupBox1: TcxGroupBox;
    dxLayoutControl2: TdxLayoutControl;
    cxTextTelefono: TcxTextEdit;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutItem1: TdxLayoutItem;
    cxTextExpediente: TcxTextEdit;
    lyExpediente: TdxLayoutItem;
    cxCheckExpediente: TcxCheckBox;
    lyExpedienteChk: TdxLayoutItem;
    cxCheckOrign: TcxCheckBox;
    lyOrigen: TdxLayoutItem;
    cxSplitter1: TcxSplitter;
    btnReporte: TcxButton;
    cxPivotFolios: TcxDBPivotGrid;
    cxPGFieldFolio: TcxDBPivotGridField;
    cxPGFieldTelefono: TcxDBPivotGridField;
    cxPGFieldPagoTecnico: TcxDBPivotGridField;
    cxPGFieldFecha: TcxDBPivotGridField;
    cxPGFieldEstatus: TcxDBPivotGridField;
    cxPGFieldTipo: TcxDBPivotGridField;
    cxPGFieldTipoInstalacion: TcxDBPivotGridField;
    cxPGFieldCostoEmpresa: TcxDBPivotGridField;
    zDatos: TUniQuery;
    dsDatos: TDataSource;
    cxPGFieldExpediente: TcxDBPivotGridField;
    btnImprimir: TcxButton;
    dlgSave1: TSaveDialog;
    btnAcumSemanal: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnReporteClick(Sender: TObject);
    procedure cxCheckOrignPropertiesChange(Sender: TObject);
    procedure cxCheckExpedientePropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAcumSemanalClick(Sender: TObject);
  private
    ExApp: variant;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsultas: TFrmConsultas;

implementation

{$R *.dfm}

procedure TFrmConsultas.btnAcumSemanalClick(Sender: TObject);
Var
  cursor: TCursor;
  Continuar: Boolean;
  Rango: Variant;
  zMat: TUniquery;
  iniFila, iniCol, recFila, recCol, i: Integer;
  ListaMaterial: TStringList;
  Inicio: String;
  Termino: String;
  Expediente: String;
  PersonalConteo: string;
  colFormula:integer;
begin
  try
    if cxCheckOrign.Checked then
    begin
      Inicio := '-1';
      Termino := '-1';
    end
    else
    begin
      Inicio := fechaSQL(cxDateDesde.date);
      Termino := fechaSQL(cxDateHasta.date);
    end;

    if  cxCheckExpediente.Checked then
      Expediente := cxTextExpediente.Text
    else
      Expediente := '-1';

    FiltrarDataset(zDatos, 'IdFolio,Expediente,Desde,Hasta,Contar', ['-1',Expediente,Inicio,Termino,'Si']);

    if zDatos.Active then
      zDatos.Refresh
    else
      zDatos.Open;

    Try
      Continuar     := True;
      ExApp := CreateOleObject('Excel.Application');
      ExApp.Visible := True;
      ExApp.DisplayAlerts := False;
      ExApp.Workbooks.Add;
    Except
      on e:Exception do
      begin
        Continuar := False;
        msgBox.ShowModal('Ha ocurrido un error.','Al parecer no el equipo no tiene instalado Microsoft Excel, Contacte a su administrador de sistema para poder utilizar esta característica', cmtError, [cmbOK]);
      end;
    End;

    //Si no se vá al chorizo, continuar
    if Continuar then
    begin
      //encabezado y datos generales

      ExApp.Range['B2:B2'] := 'TECNICO';
      ExApp.Range['C2:C2'] := 'EXP.';
      ExApp.Range['D2:D2'] := 'A.0';
      ExApp.Range['E2:E2'] := 'FOT';
      ExApp.Range['F2:F2'] := 'FOC';


      FormatoTexto(ExApp.Range['B2:F2'], 'Calibri', 14, True, True);
      ExApp.Range['A2:F2'].interior.Color := clBlack;
      ExApp.Range['A2:F2'].Font.Color := clWhite;

      Cursor := Screen.Cursor;
      try
        Screen.Cursor := crAppStart;

        iniFila := 4;
        InicOl := 1;
        recFila := 0;
        recCol := 0;

        zDatos.First;
        PersonalConteo := zDatos.FieldByName('PersonalConteo').AsString;
        while not zDatos.Eof do
        begin
          if (zDatos.RecNo <> 1) and (zDatos.FieldByName('PersonalConteo').AsString <> PersonalConteo)  then
          begin
            PersonalConteo := zDatos.FieldByName('PersonalConteo').AsString;
            Inc(recFila);
          end;

          //personalConteo := zDatos.FieldByName('PersonalConteo').AsString;
          ExApp.Range['A'+ IntToStr(IniFila + recFila)] := zDatos.RecNo;
          ExApp.Range['B'+ IntToStr(IniFila + recFila)] := zDatos.FieldByName('NombreCompletoPersonal').AsString;
          ExApp.Range['C'+ IntToStr(IniFila + recFila)] := zDatos.FieldByName('ExpedienteCorto').AsString;

          Rango := ExApp.Range['D'+ IntToStr(IniFila + recFila)];
          if zDatos.FieldByName('LeyendaINstalacion').IsNull then
            Rango.Value := zDatos.FieldByName('ConteoAcumulado').AsString;
            //Rango.Value := 0;

          Rango := ExApp.Range['E'+ IntToStr(IniFila + recFila)];
          if zDatos.FieldByName('LeyendaINstalacion').AsString = 'FO TELMEX' then
            Rango.Value := zDatos.FieldByName('ConteoAcumulado').AsString;


          Rango := ExApp.Range['F'+ IntToStr(IniFila + recFila)];
          if zDatos.FieldByName('LeyendaINstalacion').AsString = 'FO CARSO' then
            Rango.Value := zDatos.FieldByName('ConteoAcumulado').AsString;
            //Rango.Value := 0;

          zDatos.Next;
        end;

        //Asignando ancho a las columnas
        ExApp.Columns['A:A'].ColumnWidth := 4.29;
        ExApp.Columns['B:B'].ColumnWidth := 33.71;
        ExApp.Columns['C:C'].ColumnWidth := 9.14;
        ExApp.Columns['D:D'].ColumnWidth := 4.86;
        ExApp.Columns['E:E'].ColumnWidth := 5;
        ExApp.Columns['F:F'].ColumnWidth := 4.86;

        SetBorders(ExApp.Range['A4:F'+IntToStr(IniFila+RecFila)], xlThin, xlContinuous);

        colFormula := IniFila+RecFila+1;
                                                                   //'=SUM(R[-' + intToStr(zDatos.RecordCount) + ']C:R[-1]C)'
        ExApp.Range['D'+inttoStr(IniFila+RecFila+1)].FormulaR1C1 := '=SUM(R[-' + intToStr(RecFila+1) + ']C:R[-1]C)';
        ExApp.Range['E'+inttoStr(IniFila+RecFila+1)].FormulaR1C1 := '=SUM(R[-' + intToStr(RecFila+1) + ']C:R[-1]C)';
        ExApp.Range['F'+inttoStr(IniFila+RecFila+1)].FormulaR1C1 := '=SUM(R[-' + intToStr(RecFila+1) + ']C:R[-1]C)';

        SetBorders(ExApp.Range['D'+IntToStr(IniFila+RecFila+1)+':F'+IntToStr(IniFila+RecFila+1)], xlThin, xlContinuous);

        ExApp.Range['F'+inttoStr(IniFila+RecFila+3)] := 'TOTAL';
        ExApp.Range['G'+inttoStr(IniFila+RecFila+3)] := '=D'+inttoStr(IniFila+RecFila+1)+'+E'+inttoStr(IniFila+RecFila+1)+'+F'+inttoStr(IniFila+RecFila+1);

        SetBorders(ExApp.Range['G'+IntToStr(IniFila+RecFila+3)+':G'+IntToStr(IniFila+RecFila+3)], xlThin, xlContinuous);

        ExApp.Range['F'+inttoStr(IniFila+RecFila+3)].interior.Color := clBlack;
        ExApp.Range['F'+inttoStr(IniFila+RecFila+3)].Font.Color := clWhite;


        ExApp.ActiveSheet.name := 'ACUMULADO SEMANAL';
        ExApp.ActiveWindow.DisplayGridlines := False;
      finally
        Screen.Cursor := Cursor;
      end;
    end;
  finally
    zDatos.Filtered := False;
    btnReporteClick(nil);
  end;
end;

procedure TFrmConsultas.btnImprimirClick(Sender: TObject);
var
  rutaArchivo: string;
  Excel, Sheet: Variant;
begin
  try


    dlgSave1.FileName := '';
    if dlgSave1.Execute then
    begin
      try
        try
          rutaArchivo := dlgSave1.FileName + '.xls';
          cxExportPivotGridToExcel(rutaArchivo, cxpivotFolios);

          Excel := CreateOleObject('Excel.Application');
          Excel.workbooks.Open(rutaArchivo);

          Excel.Range['A1'].Select;
          Excel.Selection.EntireRow.Insert;
          Excel.Selection.EntireRow.Insert;
          Excel.Selection.EntireRow.Insert;
          Excel.Range['A1'].Select;
          Excel.ActiveCell.FormulaR1C1 := 'CONCENTRADO DEL # AL #';
          Excel.Range['A7:E8'].MergeCells := true;


          Excel.Range['A7:'+'L'+IntToStr(9+zDatos.RecordCount)].select;//advancedFilter(Action:=1,Unique:=False);
          Excel.Selection.AutoFilter;
          Excel.Columns['E:E'].ColumnWidth := 17.29;

        finally
          Excel.DisplayAlerts:= 0;
          Excel.ActiveWorkBook.Save;
          Excel.ActiveWorkBook.Close(SaveChanges:= 1);
        End;
      Finally
        Excel.Quit;
        Excel:= UnAssigned;
      end;

       if MsgBox.ShowModal('Aviso', '¿Desea abrir el documento exportado?', cmtConfirmation, [cmbOpen, cmbNo]) = mrYes then
          ShellExecute(Self.Handle, Nil, PChar(rutaArchivo), '', '', SW_SHOWNORMAL);
    end;
  Except
    on e: exception do
      MsgBox.ShowModal('Error', e.message, cmtError, [cmbok]);
  end;
end;

procedure TFrmConsultas.btnReporteClick(Sender: TObject);
var
  Inicio: String;
  Termino: String;
  Expediente: String;
begin
  if cxCheckOrign.Checked then
  begin
    Inicio := '-1';
    Termino := '-1';
  end
  else
  begin
    Inicio := fechaSQL(cxDateDesde.date);
    Termino := fechaSQL(cxDateHasta.date);
  end;

  if  cxCheckExpediente.Checked then
    Expediente := cxTextExpediente.Text
  else
    Expediente := '-1';

  FiltrarDataset(zDatos, 'IdFolio,Expediente,Desde,Hasta', ['-1',Expediente,Inicio,Termino]);



  if zDatos.Active then
    zDatos.Refresh
  else
    zDatos.Open;
end;

procedure TFrmConsultas.cxCheckExpedientePropertiesChange(Sender: TObject);
begin
  lyExpediente.Enabled :=  cxCheckExpediente.Checked;
end;

procedure TFrmConsultas.cxCheckOrignPropertiesChange(Sender: TObject);
begin
  lyDesde.Enabled := Not cxCheckOrign.Checked;
  lyHasta.Enabled := Not cxCheckOrign.Checked;

end;

procedure TFrmConsultas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := Cafree;
end;

procedure TFrmConsultas.FormShow(Sender: TObject);
begin
  AsignarSQL(zDatos, 'mt_foliosxtecnicos', pReadOnly);
  FiltrarDataset(zDatos, 'IdFolio', ['-1']);

  cxDatedesde.date := StartOfTheWeek(Now);
  cxDateHasta.date := EndOfTheWeek(now);
end;

end.
