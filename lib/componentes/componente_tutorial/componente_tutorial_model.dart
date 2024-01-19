import '/components/logo_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'componente_tutorial_widget.dart' show ComponenteTutorialWidget;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ComponenteTutorialModel
    extends FlutterFlowModel<ComponenteTutorialWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for logoComponent component.
  late LogoComponentModel logoComponentModel;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    logoComponentModel = createModel(context, () => LogoComponentModel());
  }

  void dispose() {
    logoComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
