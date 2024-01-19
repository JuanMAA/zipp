import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/componentes/componente_destinatario/componente_destinatario_widget.dart';
import '/components/menu_component_widget.dart';
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
import 'pagina_destinatario_model.dart';
export 'pagina_destinatario_model.dart';

class PaginaDestinatarioWidget extends StatefulWidget {
  const PaginaDestinatarioWidget({
    Key? key,
    this.ac,
    this.ua,
  }) : super(key: key);

  final DocumentReference? ac;
  final DocumentReference? ua;

  @override
  _PaginaDestinatarioWidgetState createState() =>
      _PaginaDestinatarioWidgetState();
}

class _PaginaDestinatarioWidgetState extends State<PaginaDestinatarioWidget> {
  late PaginaDestinatarioModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaginaDestinatarioModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().loader = true;
      });
      if (widget.ua != null) {
        _model.userAccountData =
            await UserAccountsRecord.getDocumentOnce(widget.ua!);
        setState(() {
          FFAppState().rutForm = _model.userAccountData!.recipientDocumentId;
        });
        setState(() {
          _model.componenteDestinatarioModel.nameRecipientController?.text =
              _model.userAccountData!.name;
        });
        setState(() {
          _model.componenteDestinatarioModel.accountValueController?.value =
              _model.userAccountData!.type;
        });
        setState(() {
          _model.componenteDestinatarioModel.bankValueController?.value =
              _model.userAccountData!.bank;
        });
        setState(() {
          _model.componenteDestinatarioModel.numberAcountRecipientController
              ?.text = _model.userAccountData!.accountNumber.toString();
        });
        setState(() {
          _model.componenteDestinatarioModel.emailAddressRecipientController
              ?.text = _model.userAccountData!.email;
        });
      }
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
                  '2xxyt28g' /* Datos Destinatario */,
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
          Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            constraints: BoxConstraints(
              maxWidth: 600.0,
            ),
            decoration: BoxDecoration(),
            child: Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                child: wrapWithModel(
                  model: _model.componenteDestinatarioModel,
                  updateCallback: () => setState(() {}),
                  child: ComponenteDestinatarioWidget(
                    accounParam: widget.ua != null
                        ? _model.userAccountData?.account
                        : widget.ac,
                    userAccountParam: widget.ua,
                    defaultRut: widget.ua != null
                        ? _model.userAccountData?.recipientDocumentId
                        : '',
                    defaultBank:
                        widget.ua != null ? _model.userAccountData?.bankId : '',
                    defaultAccount: widget.ua != null
                        ? _model.userAccountData?.typeAccountId
                        : '',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
