// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class GetStatusTag extends StatefulWidget {
  const GetStatusTag({
    Key? key,
    this.width,
    this.height,
    this.status,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? status;

  @override
  _GetStatusTagState createState() => _GetStatusTagState();
}

class _GetStatusTagState extends State<GetStatusTag> {
  @override
  Widget build(BuildContext context) {
    return _buildTag();
  }

  Widget _buildTag() {
    Color tagColor;
    IconData icon;
    String label;

    if (widget.status == 'SUCCESS') {
      tagColor = Colors.green;
      icon = Icons.check;
      label = 'Pagado';
    } else if (widget.status == 'ERROR') {
      tagColor = Colors.red;
      icon = Icons.error;
      label = 'Error';
    } else {
      tagColor = Colors.grey;
      icon = Icons.info;
      label = 'Unknown';
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: tagColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
