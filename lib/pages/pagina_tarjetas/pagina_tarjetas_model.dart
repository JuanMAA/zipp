import '/componentes/componente_billetera/componente_billetera_widget.dart';
import '/components/menu_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'pagina_tarjetas_widget.dart' show PaginaTarjetasWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaginaTarjetasModel extends FlutterFlowModel<PaginaTarjetasWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for menuComponent component.
  late MenuComponentModel menuComponentModel;
  // Model for componenteBilletera component.
  late ComponenteBilleteraModel componenteBilleteraModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    menuComponentModel = createModel(context, () => MenuComponentModel());
    componenteBilleteraModel =
        createModel(context, () => ComponenteBilleteraModel());
  }

  void dispose() {
    menuComponentModel.dispose();
    componenteBilleteraModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
