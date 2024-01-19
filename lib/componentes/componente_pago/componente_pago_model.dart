import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/step_widget.dart';
import '/components/title_widget_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'componente_pago_widget.dart' show ComponentePagoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ComponentePagoModel extends FlutterFlowModel<ComponentePagoWidget> {
  ///  Local state fields for this component.

  dynamic cardsList;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Read Document] action in componentePago widget.
  UserAccountsRecord? accountData;
  // Stores action output result for [Backend Call - API (CLIENT CARDS)] action in componentePago widget.
  ApiCallResponse? apiResultsCards;
  // Model for titleWidget component.
  late TitleWidgetModel titleWidgetModel;
  // Model for step component.
  late StepModel stepModel;
  // State field(s) for currency widget.
  String? currencyValue;
  FormFieldController<String>? currencyValueController;
  // State field(s) for amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountController;
  String? Function(BuildContext, String?)? amountControllerValidator;
  String? _amountControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'c523py1d' /* El campo es requerido */,
      );
    }

    if (val.length < 3) {
      return FFLocalizations.of(context).getText(
        'f5bucgya' /* Debe ingresar mínimo 3 caracte... */,
      );
    }

    return null;
  }

  // State field(s) for month widget.
  String? monthValue;
  FormFieldController<String>? monthValueController;
  // State field(s) for year widget.
  String? yearValue;
  FormFieldController<String>? yearValueController;
  // State field(s) for commentary widget.
  FocusNode? commentaryFocusNode;
  TextEditingController? commentaryController;
  String? Function(BuildContext, String?)? commentaryControllerValidator;
  // State field(s) for notifyRecipient widget.
  bool? notifyRecipientValue;
  // State field(s) for accountsList widget.
  String? accountsListValue;
  FormFieldController<String>? accountsListValueController;
  // Stores action output result for [Backend Call - API (REGISTER PAY)] action in Button-Login widget.
  ApiCallResponse? apiResultmpo;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    titleWidgetModel = createModel(context, () => TitleWidgetModel());
    stepModel = createModel(context, () => StepModel());
    amountControllerValidator = _amountControllerValidator;
  }

  void dispose() {
    titleWidgetModel.dispose();
    stepModel.dispose();
    amountFocusNode?.dispose();
    amountController?.dispose();

    commentaryFocusNode?.dispose();
    commentaryController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
