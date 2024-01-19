import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/componentes/componente_mensaje/componente_mensaje_widget.dart';
import '/components/title_widget_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'componente_billetera_model.dart';
export 'componente_billetera_model.dart';

class ComponenteBilleteraWidget extends StatefulWidget {
  const ComponenteBilleteraWidget({
    Key? key,
    int? gridQty,
  })  : this.gridQty = gridQty ?? 1,
        super(key: key);

  final int gridQty;

  @override
  _ComponenteBilleteraWidgetState createState() =>
      _ComponenteBilleteraWidgetState();
}

class _ComponenteBilleteraWidgetState extends State<ComponenteBilleteraWidget>
    with TickerProviderStateMixin {
  late ComponenteBilleteraModel _model;

  final animationsMap = {
    'rowOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 30.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.4, 0.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponenteBilleteraModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.loading = true;
      });
      _model.getCards = await OneClickGroup.clientCardsCall.call(
        userId: currentUserUid,
        merchantId: '2024Zipp2A8f',
      );
      if ((_model.getCards?.succeeded ?? true)) {
        setState(() {
          _model.localCards = getJsonField(
            (_model.getCards?.jsonBody ?? ''),
            r'''$.data.cards''',
            true,
          )!
              .toList()
              .cast<dynamic>();
        });
      } else {
        setState(() {
          _model.localCards = [];
        });
      }

      setState(() {
        _model.loading = false;
      });
    });

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 15.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: wrapWithModel(
                    model: _model.titleWidgetModel,
                    updateCallback: () => setState(() {}),
                    child: TitleWidgetWidget(
                      title: FFLocalizations.of(context).getText(
                        't0zumebl' /* Mis tarjetas */,
                      ),
                      subtitle: FFLocalizations.of(context).getText(
                        'ygb6mxkg' /* Personaliza tu cartera de tarj... */,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 0.0, 5.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      if ((valueOrDefault(
                                      currentUserDocument?.documentId, '') !=
                                  null &&
                              valueOrDefault(
                                      currentUserDocument?.documentId, '') !=
                                  '') &&
                          (currentPhoneNumber != null &&
                              currentPhoneNumber != '')) {
                        _model.returnUrl =
                            await OneClickGroup.createClientSubscCall.call(
                          email: currentUserEmail,
                          phone: currentPhoneNumber,
                          rut: valueOrDefault(
                              currentUserDocument?.documentId, ''),
                          userId: currentUserUid,
                          name: currentUserDisplayName,
                        );
                        if ((_model.returnUrl?.succeeded ?? true)) {
                          await launchURL(getJsonField(
                            (_model.returnUrl?.jsonBody ?? ''),
                            r'''$.data.url''',
                          ).toString());
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Hubo un error al tratar de registrar una tarjeta, intenté nuevamente.',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).alternate,
                            ),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Debe registrar su email y número telefónico para registrar una tarjeta.',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                            action: SnackBarAction(
                              label: 'Ir a configuración',
                              onPressed: () async {
                                context.pushNamed('paginaEditarPerfil');
                              },
                            ),
                          ),
                        );
                      }

                      setState(() {});
                    },
                    text: FFLocalizations.of(context).getText(
                      '9wb8eezn' /* Añadir */,
                    ),
                    icon: Icon(
                      Icons.add,
                      size: 13.0,
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Lexend',
                                color: Colors.white,
                                fontSize: 13.0,
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
              ),
            ],
          ),
        ),
        if (valueOrDefault<bool>(
          _model.loading,
          true,
        ))
          Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: 100.0,
            child: custom_widgets.LoadingGenerator(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 100.0,
            ),
          ),
        if (!valueOrDefault<bool>(
          _model.loading,
          false,
        ))
          Expanded(
            child: Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 20.0),
                child: Builder(
                  builder: (context) {
                    final cards = _model.localCards.toList();
                    if (cards.isEmpty) {
                      return ComponenteMensajeWidget(
                        message: FFAppState().loader
                            ? 'Cargando targetas...'
                            : 'No registras tarjetas.',
                      );
                    }
                    return GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: widget.gridQty,
                        crossAxisSpacing: 12.0,
                        mainAxisSpacing: 12.0,
                        childAspectRatio: 2.0,
                      ),
                      scrollDirection: Axis.vertical,
                      itemCount: cards.length,
                      itemBuilder: (context, cardsIndex) {
                        final cardsItem = cards[cardsIndex];
                        return Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 6.0,
                                        color: Color(0x4B1A1F24),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 20.0, 20.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            if (false)
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  if (false)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  5.0),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        borderRadius: 10.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 40.0,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        icon: Icon(
                                                          Icons.star_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .textColor,
                                                          size: 20.0,
                                                        ),
                                                        onPressed: () async {
                                                          var confirmDialogResponse =
                                                              await showDialog<
                                                                      bool>(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            'Marcar como favorito'),
                                                                        content:
                                                                            Text('Marcar como favorito'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, false),
                                                                            child:
                                                                                Text('Cancelar'),
                                                                          ),
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, true),
                                                                            child:
                                                                                Text('Confirmar'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  ) ??
                                                                  false;
                                                          if (!confirmDialogResponse) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title:
                                                                      Text('-'),
                                                                  content:
                                                                      Text('-'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  if (false)
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(5.0),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        borderRadius: 10.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 40.0,
                                                        fillColor:
                                                            Color(0xFFBE446D),
                                                        icon: Icon(
                                                          Icons.remove,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .textColor,
                                                          size: 24.0,
                                                        ),
                                                        onPressed: () async {
                                                          var confirmDialogResponse =
                                                              await showDialog<
                                                                      bool>(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            'Eliminar'),
                                                                        content:
                                                                            Text('Seguro que desea eliminar la targeta?'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, false),
                                                                            child:
                                                                                Text('Cancelar'),
                                                                          ),
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, true),
                                                                            child:
                                                                                Text('Confirmar'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  ) ??
                                                                  false;
                                                          if (!confirmDialogResponse) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title:
                                                                      Text('-'),
                                                                  content:
                                                                      Text('-'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            Text(
                                              valueOrDefault<String>(
                                                getJsonField(
                                                  cardsItem,
                                                  r'''$.card_type''',
                                                )?.toString(),
                                                'no data',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 20.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                getJsonField(
                                                  cardsItem,
                                                  r'''$.last_4_digits''',
                                                )?.toString(),
                                                'no data',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Roboto Mono',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 1.0)),
                                  ),
                                ),
                              ),
                            ],
                          ).animateOnPageLoad(
                              animationsMap['rowOnPageLoadAnimation']!),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
      ],
    );
  }
}
