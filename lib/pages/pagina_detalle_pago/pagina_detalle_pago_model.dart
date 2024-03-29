import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/componentes/componente_pago/componente_pago_widget.dart';
import '/components/menu_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'pagina_detalle_pago_widget.dart' show PaginaDetallePagoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaginaDetallePagoModel extends FlutterFlowModel<PaginaDetallePagoWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in paginaDetallePago widget.
  UserAccountsRecord? userAccountData;
  // Model for menuComponent component.
  late MenuComponentModel menuComponentModel;
  // Model for componentePago.
  late ComponentePagoModel componentePagoModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    menuComponentModel = createModel(context, () => MenuComponentModel());
    componentePagoModel = createModel(context, () => ComponentePagoModel());
  }

  void dispose() {
    menuComponentModel.dispose();
    componentePagoModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
