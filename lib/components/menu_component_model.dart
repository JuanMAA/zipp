import '/auth/firebase_auth/auth_util.dart';
import '/componentes/componente_menu/componente_menu_widget.dart';
import '/components/logo_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'menu_component_widget.dart' show MenuComponentWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MenuComponentModel extends FlutterFlowModel<MenuComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for logoComponent component.
  late LogoComponentModel logoComponentModel;
  // Model for componenteMenu component.
  late ComponenteMenuModel componenteMenuModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    logoComponentModel = createModel(context, () => LogoComponentModel());
    componenteMenuModel = createModel(context, () => ComponenteMenuModel());
  }

  void dispose() {
    logoComponentModel.dispose();
    componenteMenuModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
