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

class DynamicInput extends StatefulWidget {
  const DynamicInput({
    Key? key,
    this.width,
    this.height,
    this.defaultvalue,
    this.label,
    this.placeholder,
    this.max,
    this.min,
    this.maxlength,
    this.minlength,
    this.required,
    this.type,
    this.id,
    this.maxLines,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? defaultvalue;
  final String? label;
  final String? placeholder;
  final int? max;
  final int? min;
  final int? maxlength;
  final int? minlength;
  final bool? required;
  final Input? type;
  final int? id;
  final int? maxLines;

  @override
  _DynamicInputState createState() => _DynamicInputState();
}

class _DynamicInputState extends State<DynamicInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.defaultvalue);
    _controller.addListener(_onDynamicChanged);
    _onDynamicChanged();
  }

  void _onDynamicChanged() {
    bool found = false;

    for (var entry in FFAppState().arrayForm) {
      if (widget.id == entry.id) {
        found = true;
        break;
      }
    }

    if (!found) {
      FFAppState().update(() {
        FFAppState().arrayForm.add(
              InputDataStruct(
                  id: widget.id,
                  value: _controller.text,
                  type: widget.type,
                  name: widget.label),
            );
      });
    }

    for (var entry in FFAppState().arrayForm) {
      print(entry);
      FFAppState().update(() {
        if (widget.id == entry.id) {
          entry.value = _controller.text;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: TextFormField(
        controller: _controller,
        onChanged: (value) {
          _onDynamicChanged();
        },
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: FlutterFlowTheme.of(context).bodySmall,
          hintText: widget.placeholder,
          hintStyle: FlutterFlowTheme.of(context).bodySmall,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).alternate,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).alternate,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          filled: true,
          fillColor: FlutterFlowTheme.of(context).primaryBackground,
          contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
        ),
        style: FlutterFlowTheme.of(context).bodyMedium,
        maxLength: widget.maxlength,
        keyboardType: _getKeyboardType(widget.type),
        maxLines: widget.type == Input.textarea ? 3 : 1,
        validator: (value) {
          if (widget.required == true && (value == null || value.isEmpty)) {
            return 'Campo obligatorio';
          }
          return null;
        },
      ),
    );
  }

  TextInputType _getKeyboardType(Input? type) {
    switch (type) {
      case Input.text:
        return TextInputType.text;
      case Input.number:
        return TextInputType.number;
      default:
        return TextInputType.text;
    }
  }
}
