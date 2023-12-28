import '/componentes/componente_editar_perfil/componente_editar_perfil_widget.dart';
import '/components/menu_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'pagina_editar_perfil_widget.dart' show PaginaEditarPerfilWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaginaEditarPerfilModel
    extends FlutterFlowModel<PaginaEditarPerfilWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for menuComponent component.
  late MenuComponentModel menuComponentModel;
  // Model for componenteEditarPerfil component.
  late ComponenteEditarPerfilModel componenteEditarPerfilModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    menuComponentModel = createModel(context, () => MenuComponentModel());
    componenteEditarPerfilModel =
        createModel(context, () => ComponenteEditarPerfilModel());
  }

  void dispose() {
    menuComponentModel.dispose();
    componenteEditarPerfilModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
