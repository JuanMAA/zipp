import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/componentes/componente_mensaje/componente_mensaje_widget.dart';
import '/components/step_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dynamic_component_model.dart';
export 'dynamic_component_model.dart';

class DynamicComponentWidget extends StatefulWidget {
  const DynamicComponentWidget({
    Key? key,
    required this.accountId,
    this.userAccountId,
  }) : super(key: key);

  final DocumentReference? accountId;
  final DocumentReference? userAccountId;

  @override
  _DynamicComponentWidgetState createState() => _DynamicComponentWidgetState();
}

class _DynamicComponentWidgetState extends State<DynamicComponentWidget> {
  late DynamicComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DynamicComponentModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        wrapWithModel(
          model: _model.stepModel,
          updateCallback: () => setState(() {}),
          child: StepWidget(
            currentPage: 'detalle',
            ua: widget.userAccountId,
            acc: widget.accountId,
          ),
        ),
        Form(
          key: _model.formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Visibility(
            visible: !FFAppState().loader,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                StreamBuilder<AccountsRecord>(
                  stream: AccountsRecord.getDocument(widget.accountId!),
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
                    final listViewAccountsRecord = snapshot.data!;
                    return Builder(
                      builder: (context) {
                        final fieldJson =
                            listViewAccountsRecord.fields.toList();
                        if (fieldJson.isEmpty) {
                          return ComponenteMensajeWidget(
                            message: 'No existen elementos registrados.',
                          );
                        }
                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: fieldJson.length,
                          separatorBuilder: (_, __) => SizedBox(height: 0.0),
                          itemBuilder: (context, fieldJsonIndex) {
                            final fieldJsonItem = fieldJson[fieldJsonIndex];
                            return Container(
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 20.0, 20.0, 0.0),
                                    child: FutureBuilder<FieldsRecord>(
                                      future: FieldsRecord.getDocumentOnce(
                                          fieldJsonItem),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 40.0,
                                              height: 40.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        final dynamicInputFieldsRecord =
                                            snapshot.data!;
                                        return Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 75.0,
                                          child: custom_widgets.DynamicInput(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 75.0,
                                            defaultvalue:
                                                functions.getDefaultValue(
                                                    valueOrDefault<int>(
                                                      (fieldJsonIndex ?? 0) + 1,
                                                      1,
                                                    ),
                                                    FFAppState()
                                                        .arrayForm
                                                        .toList()),
                                            label:
                                                dynamicInputFieldsRecord.label,
                                            placeholder:
                                                dynamicInputFieldsRecord
                                                    .placeholder,
                                            max: dynamicInputFieldsRecord.max,
                                            min: dynamicInputFieldsRecord.min,
                                            maxlength: dynamicInputFieldsRecord
                                                .maxLength,
                                            minlength: dynamicInputFieldsRecord
                                                .minLength,
                                            required: dynamicInputFieldsRecord
                                                .required,
                                            type: dynamicInputFieldsRecord
                                                .inputType,
                                            id: valueOrDefault<int>(
                                              (fieldJsonIndex ?? 0) + 1,
                                              1,
                                            ),
                                            maxLines: 1,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(24.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (_model.formKey.currentState == null ||
                          !_model.formKey.currentState!.validate()) {
                        return;
                      }
                      if (widget.userAccountId != null) {
                        await widget.userAccountId!.update({
                          ...mapToFirestore(
                            {
                              'data': getInputDataListFirestoreData(
                                FFAppState().arrayForm,
                              ),
                            },
                          ),
                        });

                        context.pushNamed(
                          'paginaDestinatario',
                          queryParameters: {
                            'ua': serializeParam(
                              widget.userAccountId,
                              ParamType.DocumentReference,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      } else {
                        context.pushNamed(
                          'paginaDestinatario',
                          queryParameters: {
                            'ac': serializeParam(
                              widget.accountId,
                              ParamType.DocumentReference,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      }
                    },
                    text: (widget.userAccountId?.id == null ||
                                widget.userAccountId?.id == ''
                            ? false
                            : true)
                        ? 'Actualizar Datos'
                        : 'Registrar Datos',
                    icon: Icon(
                      Icons.save_as,
                      size: 15.0,
                    ),
                    options: FFButtonOptions(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 56.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
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
          ),
        ),
      ],
    );
  }
}
