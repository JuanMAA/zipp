import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/componentes/componente_mensaje/componente_mensaje_widget.dart';
import '/components/title_widget_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:data_table_2/data_table_2.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'componente_transacciones_model.dart';
export 'componente_transacciones_model.dart';

class ComponenteTransaccionesWidget extends StatefulWidget {
  const ComponenteTransaccionesWidget({Key? key}) : super(key: key);

  @override
  _ComponenteTransaccionesWidgetState createState() =>
      _ComponenteTransaccionesWidgetState();
}

class _ComponenteTransaccionesWidgetState
    extends State<ComponenteTransaccionesWidget> {
  late ComponenteTransaccionesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponenteTransaccionesModel());

    _model.searchTableController ??= TextEditingController();
    _model.searchTableFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          wrapWithModel(
            model: _model.titleWidgetModel,
            updateCallback: () => setState(() {}),
            child: TitleWidgetWidget(
              title: 'Mis transacciones',
              subtitle:
                  'Aquí tienes un informe detallado que enumera todas las transacciones que has realizado.',
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 15.0, 24.0, 0.0),
            child: TextFormField(
              controller: _model.searchTableController,
              focusNode: _model.searchTableFocusNode,
              onChanged: (_) => EasyDebounce.debounce(
                '_model.searchTableController',
                Duration(milliseconds: 2000),
                () async {
                  await queryTransactionsRecordOnce()
                      .then(
                        (records) => _model.simpleSearchResults = TextSearch(
                          records
                              .map(
                                (record) => TextSearchItem.fromTerms(record, [
                                  record.status!,
                                  record.description!,
                                  record.recipientAccountType!,
                                  record.recipientAccountNumber!,
                                  record.recipientBankId!,
                                  record.totalAmount!,
                                  record.totalCommission!,
                                  record.percentCommission!,
                                  record.baseAmount!,
                                  record.commission!
                                ]),
                              )
                              .toList(),
                        )
                            .search(_model.searchTableController.text)
                            .map((r) => r.object)
                            .toList(),
                      )
                      .onError((_, __) => _model.simpleSearchResults = [])
                      .whenComplete(() => setState(() {}));

                  setState(() {
                    _model.isFull = false;
                  });
                },
              ),
              obscureText: false,
              decoration: InputDecoration(
                labelText: FFLocalizations.of(context).getText(
                  'a4sryklp' /* Buscar */,
                ),
                labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                hintText: FFLocalizations.of(context).getText(
                  'xau0qvk2' /* Buscar */,
                ),
                hintStyle: FlutterFlowTheme.of(context).bodyMedium,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                contentPadding:
                    EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                suffixIcon: _model.searchTableController!.text.isNotEmpty
                    ? InkWell(
                        onTap: () async {
                          _model.searchTableController?.clear();
                          await queryTransactionsRecordOnce()
                              .then(
                                (records) => _model
                                    .simpleSearchResults = TextSearch(
                                  records
                                      .map(
                                        (record) =>
                                            TextSearchItem.fromTerms(record, [
                                          record.status!,
                                          record.description!,
                                          record.recipientAccountType!,
                                          record.recipientAccountNumber!,
                                          record.recipientBankId!,
                                          record.totalAmount!,
                                          record.totalCommission!,
                                          record.percentCommission!,
                                          record.baseAmount!,
                                          record.commission!
                                        ]),
                                      )
                                      .toList(),
                                )
                                    .search(_model.searchTableController.text)
                                    .map((r) => r.object)
                                    .toList(),
                              )
                              .onError(
                                  (_, __) => _model.simpleSearchResults = [])
                              .whenComplete(() => setState(() {}));

                          setState(() {
                            _model.isFull = false;
                          });
                          setState(() {});
                        },
                        child: Icon(
                          Icons.clear,
                          color: Color(0xFF757575),
                          size: 22.0,
                        ),
                      )
                    : null,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium,
              cursorColor: FlutterFlowTheme.of(context).alternate,
              validator:
                  _model.searchTableControllerValidator.asValidator(context),
            ),
          ),
          Builder(
            builder: (context) {
              if (_model.isFull) {
                return Container(
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
                    child: StreamBuilder<List<TransactionsRecord>>(
                      stream: queryTransactionsRecord(
                        queryBuilder: (transactionsRecord) =>
                            transactionsRecord.where(
                          'user',
                          isEqualTo: currentUserReference,
                        ),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: SpinKitRing(
                                color: FlutterFlowTheme.of(context).primary,
                                size: 50.0,
                              ),
                            ),
                          );
                        }
                        List<TransactionsRecord>
                            dataTableTransactionsRecordList = snapshot.data!;
                        if (dataTableTransactionsRecordList.isEmpty) {
                          return ComponenteMensajeWidget();
                        }
                        return Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          child: DataTable2(
                            columns: [
                              DataColumn2(
                                label: DefaultTextStyle.merge(
                                  softWrap: true,
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '5xmd6ill' /* Estado */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).labelLarge,
                                  ),
                                ),
                                fixedWidth: 200.0,
                              ),
                              DataColumn2(
                                label: DefaultTextStyle.merge(
                                  softWrap: true,
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'tcejc193' /* Cuenta Detinatario */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).labelLarge,
                                  ),
                                ),
                                fixedWidth: 200.0,
                              ),
                              DataColumn2(
                                label: DefaultTextStyle.merge(
                                  softWrap: true,
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'j6ic6ufr' /* Monto */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).labelLarge,
                                  ),
                                ),
                                fixedWidth: 200.0,
                              ),
                              DataColumn2(
                                label: DefaultTextStyle.merge(
                                  softWrap: true,
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'sfjddiv3' /* Fecha de pago */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).labelLarge,
                                  ),
                                ),
                                fixedWidth: 200.0,
                              ),
                              DataColumn2(
                                label: DefaultTextStyle.merge(
                                  softWrap: true,
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '7y58kixd' /* Acciones */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).labelLarge,
                                  ),
                                ),
                                fixedWidth: 0.0,
                              ),
                            ],
                            rows: dataTableTransactionsRecordList
                                .mapIndexed((dataTableIndex,
                                        dataTableTransactionsRecord) =>
                                    [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              width: 100.0,
                                              height: 40.0,
                                              child:
                                                  custom_widgets.GetStatusTag(
                                                width: 100.0,
                                                height: 40.0,
                                                status:
                                                    dataTableTransactionsRecord
                                                        .status,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        dataTableTransactionsRecord
                                            .recipientAccountNumber,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                      Text(
                                        '\$${valueOrDefault<String>(
                                          dataTableTransactionsRecord
                                              .baseAmount,
                                          '0',
                                        )}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                      Text(
                                        dateTimeFormat(
                                          'M/d h:mm a',
                                          dataTableTransactionsRecord
                                              .createDate!,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          FFButtonWidget(
                                            onPressed: () {
                                              print('Button pressed ...');
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'f1x2pcp6' /* Ver Mas */,
                                            ),
                                            options: FFButtonOptions(
                                              height: 30.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color: Colors.white,
                                                        fontSize: 12.0,
                                                      ),
                                              elevation: 3.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ].map((c) => DataCell(c)).toList())
                                .map((e) => DataRow(cells: e))
                                .toList(),
                            headingRowColor: MaterialStateProperty.all(
                              FlutterFlowTheme.of(context).primaryBackground,
                            ),
                            headingRowHeight: 40.0,
                            dataRowColor: MaterialStateProperty.all(
                              FlutterFlowTheme.of(context).secondaryBackground,
                            ),
                            dataRowHeight: 40.0,
                            border: TableBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            dividerThickness: 1.0,
                            showBottomBorder: true,
                            minWidth: 49.0,
                          ),
                        );
                      },
                    ),
                  ),
                );
              } else {
                return Container(
                  height: 200.0,
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final searchColumn =
                            _model.simpleSearchResults.toList();
                        if (searchColumn.isEmpty) {
                          return ComponenteMensajeWidget();
                        }
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            child: DataTable2(
                              columns: [
                                DataColumn2(
                                  label: DefaultTextStyle.merge(
                                    softWrap: true,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '5owwokk0' /* Estado */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge,
                                    ),
                                  ),
                                  fixedWidth: 200.0,
                                ),
                                DataColumn2(
                                  label: DefaultTextStyle.merge(
                                    softWrap: true,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '6kj7l3zf' /* Cuenta Detinatario */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge,
                                    ),
                                  ),
                                  fixedWidth: 200.0,
                                ),
                                DataColumn2(
                                  label: DefaultTextStyle.merge(
                                    softWrap: true,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '720glych' /* Monto */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge,
                                    ),
                                  ),
                                  fixedWidth: 200.0,
                                ),
                                DataColumn2(
                                  label: DefaultTextStyle.merge(
                                    softWrap: true,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'w1wfu7c6' /* Fecha de Pago */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge,
                                    ),
                                  ),
                                  fixedWidth: 200.0,
                                ),
                                DataColumn2(
                                  label: DefaultTextStyle.merge(
                                    softWrap: true,
                                    child: Visibility(
                                      visible: false,
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'mmylgf7n' /* Acciones */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge,
                                      ),
                                    ),
                                  ),
                                  fixedWidth: 0.0,
                                ),
                              ],
                              rows: searchColumn
                                  .mapIndexed((searchColumnIndex,
                                          searchColumnItem) =>
                                      [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Container(
                                                width: 100.0,
                                                height: 40.0,
                                                child:
                                                    custom_widgets.GetStatusTag(
                                                  width: 100.0,
                                                  height: 40.0,
                                                  status:
                                                      searchColumnItem.status,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '${searchColumnItem.recipientAccountNumber}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                        Text(
                                          '\$${valueOrDefault<String>(
                                            searchColumnItem.baseAmount,
                                            '0',
                                          )}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                        Text(
                                          dateTimeFormat(
                                            'M/d H:mm',
                                            searchColumnItem.createDate!,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            FFButtonWidget(
                                              onPressed: () {
                                                print('Button pressed ...');
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'bodtwi88' /* Ver Mas */,
                                              ),
                                              options: FFButtonOptions(
                                                height: 30.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          color: Colors.white,
                                                          fontSize: 12.0,
                                                        ),
                                                elevation: 3.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(40.0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ].map((c) => DataCell(c)).toList())
                                  .map((e) => DataRow(cells: e))
                                  .toList(),
                              headingRowColor: MaterialStateProperty.all(
                                FlutterFlowTheme.of(context).primaryBackground,
                              ),
                              headingRowHeight: 40.0,
                              dataRowColor: MaterialStateProperty.all(
                                FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              dataRowHeight: 40.0,
                              border: TableBorder(
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              dividerThickness: 1.0,
                              showBottomBorder: true,
                              minWidth: 49.0,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
