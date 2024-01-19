import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/componentes/componente_mensaje/componente_mensaje_widget.dart';
import '/components/title_widget_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'componente_transacciones_widget.dart'
    show ComponenteTransaccionesWidget;
import 'package:data_table_2/data_table_2.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class ComponenteTransaccionesModel
    extends FlutterFlowModel<ComponenteTransaccionesWidget> {
  ///  Local state fields for this component.

  bool isFull = true;

  ///  State fields for stateful widgets in this component.

  // Model for titleWidget component.
  late TitleWidgetModel titleWidgetModel;
  // State field(s) for searchTable widget.
  FocusNode? searchTableFocusNode;
  TextEditingController? searchTableController;
  String? Function(BuildContext, String?)? searchTableControllerValidator;
  List<TransactionsRecord> simpleSearchResults = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    titleWidgetModel = createModel(context, () => TitleWidgetModel());
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
  }

  void dispose() {
    titleWidgetModel.dispose();
    searchTableFocusNode?.dispose();
    searchTableController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
