import '/componentes/componente_categorias/componente_categorias_widget.dart';
import '/components/menu_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'pagina_agregar_cuenta_widget.dart' show PaginaAgregarCuentaWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaginaAgregarCuentaModel
    extends FlutterFlowModel<PaginaAgregarCuentaWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for menuComponent component.
  late MenuComponentModel menuComponentModel;
  // Model for componenteCategorias component.
  late ComponenteCategoriasModel componenteCategoriasModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    menuComponentModel = createModel(context, () => MenuComponentModel());
    componenteCategoriasModel =
        createModel(context, () => ComponenteCategoriasModel());
  }

  void dispose() {
    menuComponentModel.dispose();
    componenteCategoriasModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
