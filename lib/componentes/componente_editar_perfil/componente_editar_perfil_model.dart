import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/title_widget_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'componente_editar_perfil_widget.dart' show ComponenteEditarPerfilWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ComponenteEditarPerfilModel
    extends FlutterFlowModel<ComponenteEditarPerfilWidget> {
  ///  Local state fields for this component.

  String formattedRut = '';

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Model for titleWidget component.
  late TitleWidgetModel titleWidgetModel;
  // State field(s) for firstNameInput widget.
  FocusNode? firstNameInputFocusNode;
  TextEditingController? firstNameInputController;
  String? Function(BuildContext, String?)? firstNameInputControllerValidator;
  String? _firstNameInputControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '28j7behd' /* El campo es requerido */,
      );
    }

    return null;
  }

  // State field(s) for phoneInput widget.
  FocusNode? phoneInputFocusNode;
  TextEditingController? phoneInputController;
  String? Function(BuildContext, String?)? phoneInputControllerValidator;
  String? _phoneInputControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'kt3b0rff' /* El campo es requerido */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'r3yux9q8' /* La longitud mínima es de 9. */,
      );
    }

    if (!RegExp('^9\\d*').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '22u7tbnl' /* Número telefónico inválido. */,
      );
    }
    return null;
  }

  // State field(s) for emailInput widget.
  FocusNode? emailInputFocusNode;
  TextEditingController? emailInputController;
  String? Function(BuildContext, String?)? emailInputControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in ButtonActualizar widget.
  int? valPhone;
  // Stores action output result for [Firestore Query - Query a collection] action in ButtonActualizar widget.
  int? valEmail;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    titleWidgetModel = createModel(context, () => TitleWidgetModel());
    firstNameInputControllerValidator = _firstNameInputControllerValidator;
    phoneInputControllerValidator = _phoneInputControllerValidator;
  }

  void dispose() {
    titleWidgetModel.dispose();
    firstNameInputFocusNode?.dispose();
    firstNameInputController?.dispose();

    phoneInputFocusNode?.dispose();
    phoneInputController?.dispose();

    emailInputFocusNode?.dispose();
    emailInputController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
