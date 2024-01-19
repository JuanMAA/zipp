// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:html' as html;
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

bool? getActiveMenu() {
  /// MODIFY CODE ONLY BELOW THIS LINE

  final currentUrl = html.window.location.href;
  final uri = Uri.parse(currentUrl);
  final pathSegments = uri.pathSegments;

  switch (pathSegments.last) {
    case 'home':
      return true;
    default:
      return false;
  }

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
