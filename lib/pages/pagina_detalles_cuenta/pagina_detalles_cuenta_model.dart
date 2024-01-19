import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/dynamic_component_widget.dart';
import '/components/menu_component_widget.dart';
import '/components/title_widget_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'pagina_detalles_cuenta_widget.dart' show PaginaDetallesCuentaWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaginaDetallesCuentaModel
    extends FlutterFlowModel<PaginaDetallesCuentaWidget> {
  ///  Local state fields for this page.

  List<String> valuesArray = [];
  void addToValuesArray(String item) => valuesArray.add(item);
  void removeFromValuesArray(String item) => valuesArray.remove(item);
  void removeAtIndexFromValuesArray(int index) => valuesArray.removeAt(index);
  void insertAtIndexInValuesArray(int index, String item) =>
      valuesArray.insert(index, item);
  void updateValuesArrayAtIndex(int index, Function(String) updateFn) =>
      valuesArray[index] = updateFn(valuesArray[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in paginaDetallesCuenta widget.
  UserAccountsRecord? userAccountData;
  // Model for menuComponent component.
  late MenuComponentModel menuComponentModel;
  // Model for titleWidget component.
  late TitleWidgetModel titleWidgetModel;
  // Model for dynamicComponent component.
  late DynamicComponentModel dynamicComponentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    menuComponentModel = createModel(context, () => MenuComponentModel());
    titleWidgetModel = createModel(context, () => TitleWidgetModel());
    dynamicComponentModel = createModel(context, () => DynamicComponentModel());
  }

  void dispose() {
    menuComponentModel.dispose();
    titleWidgetModel.dispose();
    dynamicComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
