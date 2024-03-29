import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/menu_component_widget.dart';
import '/components/title_widget_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'pagina_editar_cuenta_widget.dart' show PaginaEditarCuentaWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaginaEditarCuentaModel
    extends FlutterFlowModel<PaginaEditarCuentaWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for menuComponent component.
  late MenuComponentModel menuComponentModel;
  // Model for titleWidget component.
  late TitleWidgetModel titleWidgetModel;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue1;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    menuComponentModel = createModel(context, () => MenuComponentModel());
    titleWidgetModel = createModel(context, () => TitleWidgetModel());
  }

  void dispose() {
    menuComponentModel.dispose();
    titleWidgetModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
