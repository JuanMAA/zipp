import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/step_widget.dart';
import '/components/title_widget_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'componente_pago_model.dart';
export 'componente_pago_model.dart';

class ComponentePagoWidget extends StatefulWidget {
  const ComponentePagoWidget({
    Key? key,
    this.userAccountParam,
  }) : super(key: key);

  final DocumentReference? userAccountParam;

  @override
  _ComponentePagoWidgetState createState() => _ComponentePagoWidgetState();
}

class _ComponentePagoWidgetState extends State<ComponentePagoWidget> {
  late ComponentePagoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponentePagoModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.userAccountParam != null) {
        _model.accountData =
            await UserAccountsRecord.getDocumentOnce(widget.userAccountParam!);
        setState(() {
          _model.amountController?.text = valueOrDefault<String>(
            _model.accountData?.amount?.toString(),
            '0',
          );
        });
        setState(() {
          _model.currencyValueController?.value = valueOrDefault<String>(
            _model.accountData?.currency,
            'CLP',
          );
        });
        setState(() {
          _model.monthValueController?.value = valueOrDefault<String>(
            _model.accountData?.month,
            '1',
          );
        });
        setState(() {
          _model.yearValueController?.value = valueOrDefault<String>(
            _model.accountData?.year,
            '2024',
          );
        });
        setState(() {
          _model.commentaryController?.text = _model.accountData!.comment;
        });
        FFAppState().totalPay = (((FFAppConstants.COMMISSION / 100) *
                    int.parse(_model.amountController.text)) +
                int.parse(_model.amountController.text))
            .roundToDouble();
        FFAppState().totalComission = ((FFAppConstants.COMMISSION / 100) *
                int.parse(_model.amountController.text))
            .roundToDouble();
      } else {
        context.pushNamed('paginaHome');
      }

      _model.apiResultsCards = await OneClickGroup.clientCardsCall.call(
        userId: currentUserUid,
        merchantId: '2024Zipp2A8f',
      );
      if ((_model.apiResultsCards?.succeeded ?? true)) {
        _model.updatePage(() {
          FFAppState().jsonArr = (_model.apiResultsCards?.jsonBody ?? '');
        });
      }
    });

    _model.amountController ??= TextEditingController();
    _model.amountFocusNode ??= FocusNode();

    _model.commentaryController ??= TextEditingController();
    _model.commentaryFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          _model.amountController?.text = FFLocalizations.of(context).getText(
            'd225n78u' /* 0 */,
          );
        }));
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
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        wrapWithModel(
                          model: _model.titleWidgetModel,
                          updateCallback: () => setState(() {}),
                          child: TitleWidgetWidget(
                            title: widget.userAccountParam == null
                                ? 'Registrar Pago'
                                : 'Actualizar Pago',
                            subtitle: 'Gestiona tus pago aquí.',
                          ),
                        ),
                        wrapWithModel(
                          model: _model.stepModel,
                          updateCallback: () => setState(() {}),
                          child: StepWidget(
                            currentPage: 'pago',
                            ua: widget.userAccountParam,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 16.0, 24.0, 0.0),
                          child: FlutterFlowDropDown<String>(
                            controller: _model.currencyValueController ??=
                                FormFieldController<String>(
                              _model.currencyValue ??= 'CLP',
                            ),
                            options: List<String>.from(['CLP']),
                            optionLabels: [
                              FFLocalizations.of(context).getText(
                                'guq0qsxj' /* CLP */,
                              )
                            ],
                            onChanged: (val) =>
                                setState(() => _model.currencyValue = val),
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 60.0,
                            searchTextStyle:
                                FlutterFlowTheme.of(context).bodyMedium,
                            textStyle: FlutterFlowTheme.of(context).bodyMedium,
                            hintText: FFLocalizations.of(context).getText(
                              'e3cqmr5k' /* Tipo de Moneda */,
                            ),
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            elevation: 2.0,
                            borderColor: FlutterFlowTheme.of(context).alternate,
                            borderWidth: 1.0,
                            borderRadius: 8.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                20.0, 20.0, 12.0, 20.0),
                            hidesUnderline: true,
                            isSearchable: true,
                            isMultiSelect: false,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 20.0, 24.0, 0.0),
                          child: TextFormField(
                            controller: _model.amountController,
                            focusNode: _model.amountFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.amountController',
                              Duration(milliseconds: 2000),
                              () async {
                                FFAppState().totalPay = (((FFAppConstants
                                                    .COMMISSION /
                                                100) *
                                            int.parse(
                                                _model.amountController.text)) +
                                        int.parse(_model.amountController.text))
                                    .roundToDouble();
                                setState(() {
                                  FFAppState().totalComission =
                                      ((FFAppConstants.COMMISSION / 100) *
                                              int.parse(
                                                  _model.amountController.text))
                                          .roundToDouble();
                                });
                              },
                            ),
                            textCapitalization: TextCapitalization.none,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                '8hybnvxf' /* Monto a pagar */,
                              ),
                              labelStyle:
                                  FlutterFlowTheme.of(context).bodySmall,
                              hintText: FFLocalizations.of(context).getText(
                                'vumkk8b8' /* Ej: 2000 */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context).bodySmall,
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
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 24.0, 20.0, 24.0),
                              suffixIcon: _model
                                      .amountController!.text.isNotEmpty
                                  ? InkWell(
                                      onTap: () async {
                                        _model.amountController?.clear();
                                        FFAppState().totalPay =
                                            (((FFAppConstants.COMMISSION /
                                                            100) *
                                                        int.parse(_model
                                                            .amountController
                                                            .text)) +
                                                    int.parse(_model
                                                        .amountController.text))
                                                .roundToDouble();
                                        setState(() {
                                          FFAppState().totalComission =
                                              ((FFAppConstants.COMMISSION /
                                                          100) *
                                                      int.parse(_model
                                                          .amountController
                                                          .text))
                                                  .roundToDouble();
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
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            validator: _model.amountControllerValidator
                                .asValidator(context),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                            ],
                          ),
                        ),
                        if (false)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 16.0, 24.0, 0.0),
                            child: FlutterFlowDropDown<String>(
                              controller: _model.monthValueController ??=
                                  FormFieldController<String>(
                                _model.monthValue ??=
                                    functions.getMonthDafaultValue(),
                              ),
                              options: List<String>.from([
                                '1',
                                '2',
                                '3',
                                '4',
                                '5',
                                '6',
                                '7',
                                '8',
                                '9',
                                '10',
                                '11',
                                '12'
                              ]),
                              optionLabels: [
                                FFLocalizations.of(context).getText(
                                  '8uhs48l9' /* Enero */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '0le40g9z' /* Febrero */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '6alr0y4m' /* Marzo */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'miypsi7z' /* Abril */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'l11ctk13' /* Mayo */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '7d1ftgqe' /* Junio */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'mxvhujau' /* Julio */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'yrq32gl1' /* Agosto */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'yiu4ml2v' /* Septiembre */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '5a9mgyac' /* Octubre */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'qpwis29s' /* Noviembre */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '3herpr7b' /* Diciembre */,
                                )
                              ],
                              onChanged: (val) =>
                                  setState(() => _model.monthValue = val),
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 60.0,
                              searchTextStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              textStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              hintText: FFLocalizations.of(context).getText(
                                'b1c5uqv0' /* Buscar Mes */,
                              ),
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: FlutterFlowTheme.of(context).grayLight,
                                size: 15.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              elevation: 2.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).alternate,
                              borderWidth: 1.0,
                              borderRadius: 8.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 20.0, 12.0, 20.0),
                              hidesUnderline: true,
                              isSearchable: true,
                              isMultiSelect: false,
                            ),
                          ),
                        if (false)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 16.0, 24.0, 0.0),
                            child: FlutterFlowDropDown<String>(
                              controller: _model.yearValueController ??=
                                  FormFieldController<String>(
                                _model.yearValue ??=
                                    functions.getYearDafaultValue(),
                              ),
                              options: [
                                FFLocalizations.of(context).getText(
                                  '8jedhw5d' /* 2023 */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'xlwtzwdr' /* 2024 */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'h6uad5by' /* 2025 */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'gymiitia' /* 2026 */,
                                )
                              ],
                              onChanged: (val) =>
                                  setState(() => _model.yearValue = val),
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 60.0,
                              searchHintTextStyle: TextStyle(),
                              searchTextStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              textStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              hintText: FFLocalizations.of(context).getText(
                                'eibuflb9' /* Seleccionar Año */,
                              ),
                              searchHintText:
                                  FFLocalizations.of(context).getText(
                                'ap5epi6t' /* Buscar Año */,
                              ),
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: FlutterFlowTheme.of(context).grayLight,
                                size: 15.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              elevation: 2.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).alternate,
                              borderWidth: 1.0,
                              borderRadius: 8.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 20.0, 12.0, 20.0),
                              hidesUnderline: true,
                              isSearchable: true,
                              isMultiSelect: false,
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 20.0, 24.0, 0.0),
                          child: TextFormField(
                            controller: _model.commentaryController,
                            focusNode: _model.commentaryFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.commentaryController',
                              Duration(milliseconds: 2000),
                              () => setState(() {}),
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                'eaennovt' /* Agregar un comentario */,
                              ),
                              labelStyle:
                                  FlutterFlowTheme.of(context).bodySmall,
                              hintText: FFLocalizations.of(context).getText(
                                '8p1gdbh4' /* Ejemplo: residencia de mayores... */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context).bodySmall,
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
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 24.0, 20.0, 24.0),
                              suffixIcon: _model
                                      .commentaryController!.text.isNotEmpty
                                  ? InkWell(
                                      onTap: () async {
                                        _model.commentaryController?.clear();
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
                            maxLines: 3,
                            validator: _model.commentaryControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        if (false)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: SwitchListTile.adaptive(
                              value: _model.notifyRecipientValue ??= true,
                              onChanged: (newValue) async {
                                setState(() =>
                                    _model.notifyRecipientValue = newValue!);
                              },
                              title: Text(
                                FFLocalizations.of(context).getText(
                                  '4sjf00xh' /* Avisar al destinatario  */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 18.0,
                                    ),
                              ),
                              subtitle: Text(
                                FFLocalizations.of(context).getText(
                                  'rbth2l35' /* (próximamente) */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                              ),
                              activeColor: FlutterFlowTheme.of(context).primary,
                              activeTrackColor:
                                  FlutterFlowTheme.of(context).accent1,
                              dense: false,
                              controlAffinity: ListTileControlAffinity.trailing,
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 10.0, 15.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 16.0, 24.0, 4.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'rbc0m47v' /* Resumen */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 4.0, 24.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Comisión Zipp (${FFAppConstants.COMMISSION.toString()}%)',
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                    Text(
                                      '\$${valueOrDefault<String>(
                                        FFAppState().totalComission.toString(),
                                        '0',
                                      )}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 4.0, 24.0, 24.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '9ztt0lxb' /* Total */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '\$${valueOrDefault<String>(
                                        FFAppState().totalPay.toString(),
                                        '0',
                                      )}',
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          child: FlutterFlowDropDown<String>(
                            controller: _model.accountsListValueController ??=
                                FormFieldController<String>(
                              _model.accountsListValue ??= '',
                            ),
                            options: List<String>.from((getJsonField(
                              FFAppState().jsonArr,
                              r'''$.data.cards[:].identifier''',
                              true,
                            ) as List)
                                .map<String>((s) => s.toString())
                                .toList()!),
                            optionLabels: (getJsonField(
                              FFAppState().jsonArr,
                              r'''$.data.cards[:].last_4_digits''',
                              true,
                            ) as List)
                                .map<String>((s) => s.toString())
                                .toList()!,
                            onChanged: (val) =>
                                setState(() => _model.accountsListValue = val),
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 60.0,
                            searchTextStyle:
                                FlutterFlowTheme.of(context).bodyMedium,
                            textStyle: FlutterFlowTheme.of(context).bodyMedium,
                            hintText: FFLocalizations.of(context).getText(
                              'z5kt11wz' /* Selecciona una cuenta */,
                            ),
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).grayLight,
                              size: 15.0,
                            ),
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            elevation: 2.0,
                            borderColor: FlutterFlowTheme.of(context).alternate,
                            borderWidth: 1.0,
                            borderRadius: 8.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                20.0, 20.0, 12.0, 20.0),
                            hidesUnderline: true,
                            isSearchable: true,
                            isMultiSelect: false,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 5.0, 24.0, 12.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await authManager.refreshUser();
                              if (_model.formKey.currentState == null ||
                                  !_model.formKey.currentState!.validate()) {
                                return;
                              }
                              if (_model.currencyValue == null) {
                                return;
                              }
                              if ((_model.accountsListValue != null &&
                                      _model.accountsListValue != '') &&
                                  (_model.accountsListValue != '0')) {
                                var confirmDialogResponse =
                                    await showDialog<bool>(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Confirmación'),
                                              content: Text(
                                                  '¿Estás seguro de realizar el pago? También si se realizaron cambios en la cuenta, estos se actualizarán. '),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: Text('Cancelar'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: Text('Confirmar'),
                                                ),
                                              ],
                                            );
                                          },
                                        ) ??
                                        false;
                                if (confirmDialogResponse) {
                                  if (currentUserEmailVerified) {
                                    await widget.userAccountParam!
                                        .update(createUserAccountsRecordData(
                                      amount: int.tryParse(
                                          _model.amountController.text),
                                      comment: _model.commentaryController.text,
                                    ));
                                    _model.apiResultmpo =
                                        await ZippGroup.registerPayCall.call(
                                      amount: int.tryParse(
                                          _model.amountController.text),
                                      authToken: currentJwtToken,
                                      cardId: valueOrDefault<String>(
                                        _model.accountsListValue,
                                        'sure6ad3f2960394fbf3e675',
                                      ),
                                      description: '',
                                      userAccountId:
                                          widget.userAccountParam?.id,
                                    );
                                    if ((_model.apiResultmpo?.succeeded ??
                                        true)) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            '¡Se realizó la transacción correctamente!  Revise el detalle en el listado de transacciones.',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          action: SnackBarAction(
                                            label: 'Solicitar verificación',
                                            textColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            onPressed: () async {
                                              context.pushNamed(
                                                'paginaEditarPerfil',
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 0),
                                                  ),
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      );

                                      context.pushNamed('paginaTransacciones');
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Ocurrió un error al realizar el pago, vuelve a intentarlo y verifica si el número de cuenta es válido.',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          action: SnackBarAction(
                                            label: 'Solicitar verificación',
                                            textColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            onPressed: () async {
                                              context.pushNamed(
                                                'paginaEditarPerfil',
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 0),
                                                  ),
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      );
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Tu correo electrónico no está verificado.',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        action: SnackBarAction(
                                          label: 'Solicitar verificación',
                                          textColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          onPressed: () async {
                                            context.pushNamed(
                                              'paginaEditarPerfil',
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                  duration:
                                                      Duration(milliseconds: 0),
                                                ),
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  }
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Debes seleccionar una de tus tarjetas; si no tienes una tarjeta, debes registrar una.',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                );
                              }

                              setState(() {});
                            },
                            text: FFLocalizations.of(context).getText(
                              'i5p4ok0g' /* Pagar Cuenta */,
                            ),
                            icon: Icon(
                              Icons.payments_outlined,
                              size: 15.0,
                            ),
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 56.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).success,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Lexend',
                                    color:
                                        FlutterFlowTheme.of(context).textColor,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 5.0, 24.0, 12.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          context.pushNamed(
                            'paginaTransacciones',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                        text: FFLocalizations.of(context).getText(
                          'q5y8e4di' /* Agregar Targeta */,
                        ),
                        icon: Icon(
                          Icons.add,
                          size: 15.0,
                        ),
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 56.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Lexend',
                                color: FlutterFlowTheme.of(context).textColor,
                              ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 12.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (_model.formKey.currentState == null ||
                              !_model.formKey.currentState!.validate()) {
                            return;
                          }
                          if (_model.currencyValue == null) {
                            return;
                          }

                          await widget.userAccountParam!
                              .update(createUserAccountsRecordData(
                            amount: int.tryParse(_model.amountController.text),
                            comment: _model.commentaryController.text,
                          ));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                '¡Datos de la cuenta actualizados correctamente!',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).alternate,
                              action: SnackBarAction(
                                label: 'Solicitar verificación',
                                textColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                onPressed: () async {
                                  context.pushNamed(
                                    'paginaEditarPerfil',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );
                                },
                              ),
                            ),
                          );
                        },
                        text: FFLocalizations.of(context).getText(
                          'tsb75546' /* Actualizar Cuenta */,
                        ),
                        icon: Icon(
                          Icons.save,
                          size: 15.0,
                        ),
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 56.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Lexend',
                                color: FlutterFlowTheme.of(context).textColor,
                              ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
