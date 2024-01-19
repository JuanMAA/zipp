import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/logo_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'componente_login_widget.dart' show ComponenteLoginWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ComponenteLoginModel extends FlutterFlowModel<ComponenteLoginWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Model for logoComponent component.
  late LogoComponentModel logoComponentModel;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  String? _emailAddressControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '0xmb18gs' /* El campo es requerido */,
      );
    }

    if (val.length > 300) {
      return 'Maximum 300 characters allowed, currently ${val.length}.';
    }
    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'yyn7jb5j' /* Introduzca una dirección de co... */,
      );
    }
    return null;
  }

  // State field(s) for primerNombre widget.
  FocusNode? primerNombreFocusNode;
  TextEditingController? primerNombreController;
  String? Function(BuildContext, String?)? primerNombreControllerValidator;
  String? _primerNombreControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'bush02dk' /* El campo es requerido */,
      );
    }

    return null;
  }

  // State field(s) for password-Create widget.
  FocusNode? passwordCreateFocusNode;
  TextEditingController? passwordCreateController;
  late bool passwordCreateVisibility;
  String? Function(BuildContext, String?)? passwordCreateControllerValidator;
  String? _passwordCreateControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'pow36zki' /* El campo es requerido */,
      );
    }

    return null;
  }

  // State field(s) for passwordConfirm widget.
  FocusNode? passwordConfirmFocusNode;
  TextEditingController? passwordConfirmController;
  late bool passwordConfirmVisibility;
  String? Function(BuildContext, String?)? passwordConfirmControllerValidator;
  String? _passwordConfirmControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'hpm0epix' /* El campo es requerido */,
      );
    }

    return null;
  }

  // State field(s) for telefono widget.
  FocusNode? telefonoFocusNode;
  TextEditingController? telefonoController;
  String? Function(BuildContext, String?)? telefonoControllerValidator;
  String? _telefonoControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'jspunpnk' /* El campo es requerido */,
      );
    }

    if (val.length < 9) {
      return FFLocalizations.of(context).getText(
        '419tlen5' /* La longitud mínima es de 9. */,
      );
    }

    if (!RegExp('^9\\d{8}\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '8xhxzomn' /* Número telefónico inválido. */,
      );
    }
    return null;
  }

  // State field(s) for CheckboxTyC widget.
  bool? checkboxTyCValue;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? valPhone;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? valEmail;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    logoComponentModel = createModel(context, () => LogoComponentModel());
    emailAddressControllerValidator = _emailAddressControllerValidator;
    primerNombreControllerValidator = _primerNombreControllerValidator;
    passwordCreateVisibility = false;
    passwordCreateControllerValidator = _passwordCreateControllerValidator;
    passwordConfirmVisibility = false;
    passwordConfirmControllerValidator = _passwordConfirmControllerValidator;
    telefonoControllerValidator = _telefonoControllerValidator;
  }

  void dispose() {
    logoComponentModel.dispose();
    emailAddressFocusNode?.dispose();
    emailAddressController?.dispose();

    primerNombreFocusNode?.dispose();
    primerNombreController?.dispose();

    passwordCreateFocusNode?.dispose();
    passwordCreateController?.dispose();

    passwordConfirmFocusNode?.dispose();
    passwordConfirmController?.dispose();

    telefonoFocusNode?.dispose();
    telefonoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
