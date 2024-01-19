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
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'componente_destinatario_model.dart';
export 'componente_destinatario_model.dart';

class ComponenteDestinatarioWidget extends StatefulWidget {
  const ComponenteDestinatarioWidget({
    Key? key,
    this.accounParam,
    this.userAccountParam,
    this.defaultRut,
    this.defaultBank,
    this.defaultAccount,
  }) : super(key: key);

  final DocumentReference? accounParam;
  final DocumentReference? userAccountParam;
  final String? defaultRut;
  final String? defaultBank;
  final String? defaultAccount;

  @override
  _ComponenteDestinatarioWidgetState createState() =>
      _ComponenteDestinatarioWidgetState();
}

class _ComponenteDestinatarioWidgetState
    extends State<ComponenteDestinatarioWidget> {
  late ComponenteDestinatarioModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponenteDestinatarioModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.getBanksAndAccounts = await OneClickGroup.getBanksCall.call(
        merchantId: '2024Zipp2A8f',
        country: 'CL',
      );
      if ((_model.getBanksAndAccounts?.succeeded ?? true)) {
        setState(() {
          FFAppState().loader = false;
        });
      } else {
        setState(() {
          FFAppState().loader = false;
        });
      }
    });

    _model.nameRecipientController ??= TextEditingController();
    _model.nameRecipientFocusNode ??= FocusNode();

    _model.emailAddressRecipientController ??= TextEditingController();
    _model.emailAddressRecipientFocusNode ??= FocusNode();

    _model.numberAcountRecipientController ??= TextEditingController();
    _model.numberAcountRecipientFocusNode ??= FocusNode();

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          wrapWithModel(
            model: _model.titleWidgetModel,
            updateCallback: () => setState(() {}),
            child: TitleWidgetWidget(
              title: widget.userAccountParam != null
                  ? 'Editar datos bancarios'
                  : 'Registrar datos bancarios',
              subtitle: '¿Cuáles son los datos bancarios del destinatario?',
            ),
          ),
          wrapWithModel(
            model: _model.stepModel,
            updateCallback: () => setState(() {}),
            child: StepWidget(
              currentPage: 'destinatario',
              ua: widget.userAccountParam,
              acc: widget.accounParam,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Wrap(
                    spacing: 0.0,
                    runSpacing: 0.0,
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.start,
                    verticalDirection: VerticalDirection.down,
                    clipBehavior: Clip.none,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 0.0),
                        child: TextFormField(
                          controller: _model.nameRecipientController,
                          focusNode: _model.nameRecipientFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.nameRecipientController',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: FFLocalizations.of(context).getText(
                              'og89hzvy' /* Nombre del destinatario. */,
                            ),
                            labelStyle: FlutterFlowTheme.of(context).bodySmall,
                            hintText: FFLocalizations.of(context).getText(
                              'euxg5eno' /* Ej: Gabriel */,
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
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 24.0, 20.0, 24.0),
                            suffixIcon: _model
                                    .nameRecipientController!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.nameRecipientController?.clear();
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
                          validator: _model.nameRecipientControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 0.0),
                        child: TextFormField(
                          controller: _model.emailAddressRecipientController,
                          focusNode: _model.emailAddressRecipientFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.emailAddressRecipientController',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: FFLocalizations.of(context).getText(
                              'a9qm1ujr' /* Email destinatario */,
                            ),
                            labelStyle: FlutterFlowTheme.of(context).bodySmall,
                            hintText: FFLocalizations.of(context).getText(
                              'hmjea2s1' /* Ej: gabriel@zipp.com */,
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
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 24.0, 20.0, 24.0),
                            suffixIcon: _model.emailAddressRecipientController!
                                    .text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.emailAddressRecipientController
                                          ?.clear();
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
                          keyboardType: TextInputType.emailAddress,
                          validator: _model
                              .emailAddressRecipientControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 20.0),
                        child: TextFormField(
                          controller: _model.numberAcountRecipientController,
                          focusNode: _model.numberAcountRecipientFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.numberAcountRecipientController',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: FFLocalizations.of(context).getText(
                              '641uypkf' /* Número de cuenta */,
                            ),
                            labelStyle: FlutterFlowTheme.of(context).bodySmall,
                            hintText: FFLocalizations.of(context).getText(
                              'igwfl4vy' /* Ej: 099999999 */,
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
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 24.0, 20.0, 24.0),
                            suffixIcon: _model.numberAcountRecipientController!
                                    .text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.numberAcountRecipientController
                                          ?.clear();
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
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Lexend',
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                          maxLength: 100,
                          maxLengthEnforcement: MaxLengthEnforcement.none,
                          buildCounter: (context,
                                  {required currentLength,
                                  required isFocused,
                                  maxLength}) =>
                              null,
                          keyboardType: TextInputType.number,
                          validator: _model
                              .numberAcountRecipientControllerValidator
                              .asValidator(context),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                          ],
                        ),
                      ),
                      if (!FFAppState().loader)
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 13.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 70.0,
                              child: custom_widgets.ChileanRutInput(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 70.0,
                                defaultValue: widget.defaultRut,
                              ),
                            ),
                          ),
                        ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: FutureBuilder<ApiCallResponse>(
                          future: OneClickGroup.getBanksCall.call(),
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
                            final columnGetBanksResponse = snapshot.data!;
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller: _model.bankValueController ??=
                                        FormFieldController<String>(
                                      _model.bankValue ??= widget.defaultBank,
                                    ),
                                    options: List<String>.from((getJsonField(
                                      columnGetBanksResponse.jsonBody,
                                      r'''$.banks[:].id''',
                                      true,
                                    ) as List)
                                        .map<String>((s) => s.toString())
                                        .toList()!),
                                    optionLabels: (getJsonField(
                                      columnGetBanksResponse.jsonBody,
                                      r'''$.banks[:].name''',
                                      true,
                                    ) as List)
                                        .map<String>((s) => s.toString())
                                        .toList()!,
                                    onChanged: (val) =>
                                        setState(() => _model.bankValue = val),
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 60.0,
                                    searchHintTextStyle: TextStyle(),
                                    searchTextStyle:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    textStyle:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      '8kbk6jpj' /* Seleccione un banco */,
                                    ),
                                    searchHintText:
                                        FFLocalizations.of(context).getText(
                                      'm8p6l8pr' /* Seleccione el banco del destin... */,
                                    ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .grayLight,
                                      size: 15.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    elevation: 1.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderWidth: 1.0,
                                    borderRadius: 8.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 20.0, 12.0, 20.0),
                                    hidesUnderline: true,
                                    isOverButton: true,
                                    isSearchable: true,
                                    isMultiSelect: false,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 20.0, 20.0, 0.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller:
                                        _model.accountValueController ??=
                                            FormFieldController<String>(
                                      _model.accountValue ??=
                                          widget.defaultAccount,
                                    ),
                                    options: List<String>.from(
                                        ['CCT', 'CTV', 'CRUT', 'AHO']),
                                    optionLabels: [
                                      FFLocalizations.of(context).getText(
                                        'exsu7wl8' /* Cuenta Corriente */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'wsg0f4u6' /* Cuenta Vista */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'pc5ozlpr' /* CuentaRUT */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'a2b6qcvf' /* Cuenta Ahorro */,
                                      )
                                    ],
                                    onChanged: (val) => setState(
                                        () => _model.accountValue = val),
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 60.0,
                                    searchHintTextStyle: TextStyle(),
                                    searchTextStyle:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    textStyle:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'g79fetbt' /* Seleccione tipo de cuenta. */,
                                    ),
                                    searchHintText:
                                        FFLocalizations.of(context).getText(
                                      'zo4zzwof' /* Buscar un banco */,
                                    ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .grayLight,
                                      size: 15.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    elevation: 1.0,
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
                                      20.0, 20.0, 20.0, 20.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      if (_model.formKey.currentState == null ||
                                          !_model.formKey.currentState!
                                              .validate()) {
                                        return;
                                      }
                                      if (_model.bankValue == null) {
                                        return;
                                      }
                                      if (_model.accountValue == null) {
                                        return;
                                      }
                                      if (widget.userAccountParam == null) {
                                        var userAccountsRecordReference =
                                            UserAccountsRecord.collection.doc();
                                        await userAccountsRecordReference.set({
                                          ...createUserAccountsRecordData(
                                            user: currentUserReference,
                                            name: _model
                                                .nameRecipientController.text,
                                            accountNumber: int.tryParse(_model
                                                .numberAcountRecipientController
                                                .text),
                                            account: widget.accounParam,
                                            recipientDocumentId:
                                                FFAppState().rutForm,
                                            email: _model
                                                .emailAddressRecipientController
                                                .text,
                                            bankId: _model.bankValue,
                                            typeAccountId: _model.accountValue,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'data':
                                                  getInputDataListFirestoreData(
                                                FFAppState().arrayForm,
                                              ),
                                            },
                                          ),
                                        });
                                        _model.userAccountCreated =
                                            UserAccountsRecord
                                                .getDocumentFromData({
                                          ...createUserAccountsRecordData(
                                            user: currentUserReference,
                                            name: _model
                                                .nameRecipientController.text,
                                            accountNumber: int.tryParse(_model
                                                .numberAcountRecipientController
                                                .text),
                                            account: widget.accounParam,
                                            recipientDocumentId:
                                                FFAppState().rutForm,
                                            email: _model
                                                .emailAddressRecipientController
                                                .text,
                                            bankId: _model.bankValue,
                                            typeAccountId: _model.accountValue,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'data':
                                                  getInputDataListFirestoreData(
                                                FFAppState().arrayForm,
                                              ),
                                            },
                                          ),
                                        }, userAccountsRecordReference);

                                        context.pushNamed(
                                          'paginaDetallePago',
                                          queryParameters: {
                                            'ua': serializeParam(
                                              _model.userAccountCreated
                                                  ?.reference,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              '¡Se registró tu cuenta correctamente! Ahora registra los datos para poder realizar el pago.',
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
                                                    .primaryBackground,
                                          ),
                                        );
                                      } else {
                                        await widget.userAccountParam!.update(
                                            createUserAccountsRecordData(
                                          recipientDocumentId:
                                              FFAppState().rutForm,
                                          accountNumber: int.tryParse(_model
                                              .numberAcountRecipientController
                                              .text),
                                          name: _model
                                              .nameRecipientController.text,
                                          email: _model
                                              .emailAddressRecipientController
                                              .text,
                                          bankId: _model.bankValue,
                                          typeAccountId: _model.accountValue,
                                        ));

                                        context.pushNamed(
                                          'paginaDetallePago',
                                          queryParameters: {
                                            'ua': serializeParam(
                                              widget.userAccountParam,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              '¡Se actualizó tu cuenta correctamente! Ahora registra los datos para poder realizar el pago.',
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
                                                    .primaryBackground,
                                          ),
                                        );
                                      }

                                      setState(() {});
                                    },
                                    text: widget.userAccountParam != null
                                        ? 'Editar dastinatario'
                                        : 'Registrar destinatario',
                                    options: FFButtonOptions(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 50.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall,
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
                            );
                          },
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
    );
  }
}
