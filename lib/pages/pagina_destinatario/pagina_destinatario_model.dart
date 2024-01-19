import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/componentes/componente_destinatario/componente_destinatario_widget.dart';
import '/components/menu_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'pagina_destinatario_widget.dart' show PaginaDestinatarioWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaginaDestinatarioModel
    extends FlutterFlowModel<PaginaDestinatarioWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in paginaDestinatario widget.
  UserAccountsRecord? userAccountData;
  // Model for menuComponent component.
  late MenuComponentModel menuComponentModel;
  // Model for componenteDestinatario component.
  late ComponenteDestinatarioModel componenteDestinatarioModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    menuComponentModel = createModel(context, () => MenuComponentModel());
    componenteDestinatarioModel =
        createModel(context, () => ComponenteDestinatarioModel());
  }

  void dispose() {
    menuComponentModel.dispose();
    componenteDestinatarioModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
