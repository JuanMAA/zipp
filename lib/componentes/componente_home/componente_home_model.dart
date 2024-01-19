import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/componentes/componente_mensaje/componente_mensaje_widget.dart';
import '/components/title_widget_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'componente_home_widget.dart' show ComponenteHomeWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ComponenteHomeModel extends FlutterFlowModel<ComponenteHomeWidget> {
  ///  Local state fields for this component.

  String currentMenu = 'accounts';

  ///  State fields for stateful widgets in this component.

  // Model for titleWidget component.
  late TitleWidgetModel titleWidgetModel;
  // State field(s) for Checkbox widget.

  Map<UserAccountsRecord, bool> checkboxValueMap = {};
  List<UserAccountsRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

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
