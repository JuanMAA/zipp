import '/components/logo_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'landing_widget.dart' show LandingWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LandingModel extends FlutterFlowModel<LandingWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for logoComponent component.
  late LogoComponentModel logoComponentModel1;
  // Model for logoComponent component.
  late LogoComponentModel logoComponentModel2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    logoComponentModel1 = createModel(context, () => LogoComponentModel());
    logoComponentModel2 = createModel(context, () => LogoComponentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    logoComponentModel1.dispose();
    logoComponentModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
