import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/dynamic_component_widget.dart';
import '/components/menu_component_widget.dart';
import '/components/title_widget_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pagina_detalles_cuenta_model.dart';
export 'pagina_detalles_cuenta_model.dart';

class PaginaDetallesCuentaWidget extends StatefulWidget {
  const PaginaDetallesCuentaWidget({
    Key? key,
    this.ac,
    this.ua,
  }) : super(key: key);

  final DocumentReference? ac;
  final DocumentReference? ua;

  @override
  _PaginaDetallesCuentaWidgetState createState() =>
      _PaginaDetallesCuentaWidgetState();
}

class _PaginaDetallesCuentaWidgetState
    extends State<PaginaDetallesCuentaWidget> {
  late PaginaDetallesCuentaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaginaDetallesCuentaModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().loader = true;
      });
      if (widget.ua != null) {
        _model.userAccountData =
            await UserAccountsRecord.getDocumentOnce(widget.ua!);
        setState(() {
          FFAppState().arrayForm =
              _model.userAccountData!.data.toList().cast<InputDataStruct>();
        });
      } else {
        setState(() {
          FFAppState().rutForm = '';
        });
      }

      setState(() {
        FFAppState().loader = false;
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: responsiveVisibility(
        context: context,
        tablet: false,
        tabletLandscape: false,
        desktop: false,
      )
          ? AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              leading: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pop();
                },
                child: Icon(
                  Icons.chevron_left_rounded,
                  color: FlutterFlowTheme.of(context).grayLight,
                  size: 32.0,
                ),
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  'xru8vjsa' /* Agregar Detalle */,
                ),
                style: FlutterFlowTheme.of(context).headlineSmall,
              ),
              actions: [],
              centerTitle: false,
              elevation: 0.0,
            )
          : null,
      body: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          wrapWithModel(
            model: _model.menuComponentModel,
            updateCallback: () => setState(() {}),
            child: MenuComponentWidget(),
          ),
          if (!FFAppState().loader)
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                constraints: BoxConstraints(
                  maxWidth: 600.0,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    wrapWithModel(
                      model: _model.titleWidgetModel,
                      updateCallback: () => setState(() {}),
                      updateOnChange: true,
                      child: TitleWidgetWidget(
                        title: (widget.ua == null ? false : true)
                            ? 'Editar datos cuenta'
                            : 'Registrar datos cuenta',
                        subtitle:
                            'Información adicional necesaria para la transacción.',
                      ),
                    ),
                    if (!FFAppState().loader)
                      wrapWithModel(
                        model: _model.dynamicComponentModel,
                        updateCallback: () => setState(() {}),
                        child: DynamicComponentWidget(
                          accountId: widget.ua != null
                              ? _model.userAccountData!.account!
                              : widget.ac!,
                          userAccountId: widget.ua,
                        ),
                      ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
