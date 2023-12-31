import '/componentes/componente_f_a_q/componente_f_a_q_widget.dart';
import '/components/menu_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'pagina_f_a_qs_widget.dart' show PaginaFAQsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaginaFAQsModel extends FlutterFlowModel<PaginaFAQsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for menuComponent component.
  late MenuComponentModel menuComponentModel;
  // Model for componenteFAQ component.
  late ComponenteFAQModel componenteFAQModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    menuComponentModel = createModel(context, () => MenuComponentModel());
    componenteFAQModel = createModel(context, () => ComponenteFAQModel());
  }

  void dispose() {
    menuComponentModel.dispose();
    componenteFAQModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
