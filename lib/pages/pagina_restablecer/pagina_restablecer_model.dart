import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/components/logo_component_widget.dart';
import '/components/menu_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'pagina_restablecer_widget.dart' show PaginaRestablecerWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaginaRestablecerModel extends FlutterFlowModel<PaginaRestablecerWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // Model for menuComponent component.
  late MenuComponentModel menuComponentModel;
  // State field(s) for emailAddressLogged widget.
  FocusNode? emailAddressLoggedFocusNode;
  TextEditingController? emailAddressLoggedController;
  String? Function(BuildContext, String?)?
      emailAddressLoggedControllerValidator;
  String? _emailAddressLoggedControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'u22yrtxd' /* El campo es requerido */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'zmzc43ze' /* Introduzca una dirección de co... */,
      );
    }
    return null;
  }

  // Model for logoComponent component.
  late LogoComponentModel logoComponentModel;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  String? _emailAddressControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'l96p5gmt' /* El campo es requerido */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'scdh0whd' /* Introduzca una dirección de co... */,
      );
    }
    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    menuComponentModel = createModel(context, () => MenuComponentModel());
    emailAddressLoggedControllerValidator =
        _emailAddressLoggedControllerValidator;
    logoComponentModel = createModel(context, () => LogoComponentModel());
    emailAddressControllerValidator = _emailAddressControllerValidator;
  }

  void dispose() {
    menuComponentModel.dispose();
    emailAddressLoggedFocusNode?.dispose();
    emailAddressLoggedController?.dispose();

    logoComponentModel.dispose();
    emailAddressFocusNode?.dispose();
    emailAddressController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
