import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/componentes/componente_mensaje/componente_mensaje_widget.dart';
import '/components/title_widget_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'componente_billetera_widget.dart' show ComponenteBilleteraWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ComponenteBilleteraModel
    extends FlutterFlowModel<ComponenteBilleteraWidget> {
  ///  Local state fields for this component.

  List<dynamic> localCards = [];
  void addToLocalCards(dynamic item) => localCards.add(item);
  void removeFromLocalCards(dynamic item) => localCards.remove(item);
  void removeAtIndexFromLocalCards(int index) => localCards.removeAt(index);
  void insertAtIndexInLocalCards(int index, dynamic item) =>
      localCards.insert(index, item);
  void updateLocalCardsAtIndex(int index, Function(dynamic) updateFn) =>
      localCards[index] = updateFn(localCards[index]);

  bool loading = true;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (CLIENT CARDS)] action in componenteBilletera widget.
  ApiCallResponse? getCards;
  // Model for titleWidget component.
  late TitleWidgetModel titleWidgetModel;
  // Stores action output result for [Backend Call - API (CREATE CLIENT  SUBSC)] action in Button widget.
  ApiCallResponse? returnUrl;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    titleWidgetModel = createModel(context, () => TitleWidgetModel());
  }

  void dispose() {
    titleWidgetModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
