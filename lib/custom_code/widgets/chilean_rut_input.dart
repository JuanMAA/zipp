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

import 'package:flutter/services.dart';

class ChileanRutInput extends StatefulWidget {
  const ChileanRutInput({
    Key? key,
    this.width,
    this.height,
    this.defaultValue,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? defaultValue;

  @override
  _ChileanRutInputState createState() => _ChileanRutInputState();
}

class _ChileanRutInputState extends State<ChileanRutInput> {
  TextEditingController _rutController = TextEditingController();
  String? _errorText = '';

  @override
  void initState() {
    super.initState();

    // Set the initial value if defaultValue is provided
    _rutController.text = widget.defaultValue!;

    // Agrega un listener al controlador para detectar cambios
    _rutController.addListener(_onRutChanged);
  }

  // Método que se ejecutará cada vez que el valor del controlador cambie
  void _onRutChanged() {
    // Guarda el valor en FFAppState().rutForm
    FFAppState().update(() {
      FFAppState().rutForm = _rutController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: TextFormField(
        controller: _rutController,
        onChanged: (value) {
          _onRutChanged(); // Llama al método onChanged
        },
        textCapitalization: TextCapitalization.none,
        obscureText: false,
        decoration: InputDecoration(
          labelText: 'RUT',
          labelStyle: FlutterFlowTheme.of(context).bodySmall,
          hintText: 'Ingresa tu RUT',
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
        //maxLength: 12, // Adjust the maxLength according to your RUT format
        validator: (value) {
          setState(() {
            _errorText = _validateRut(value ?? '');
          });
          return _errorText;
        },
      ),
    );
  }

  String? _validateRut(String rut) {
    if (rut.isEmpty) {
      return 'RUT es requerido';
    }

    rut = rut.replaceAll(RegExp(r'[^0-9Kk]'), '').toUpperCase();

    if (!RegExp(r'^[0-9]+[K]?$').hasMatch(rut)) {
      return 'Formato RUT inválido';
    }

    String rutNumber = rut.substring(0, rut.length - 1);
    String verifierDigit = rut.substring(rut.length - 1).toUpperCase();

    if (_calculateVerifierDigit(rutNumber) != verifierDigit) {
      return 'RUT inválido';
    }

    return null; // Return null for a valid RUT
  }

  String _calculateVerifierDigit(String rutNumber) {
    int sum = 0;
    int multiplier = 2;

    // Calculate the RUT verifier digit in reverse order
    for (int i = rutNumber.length - 1; i >= 0; i--) {
      sum += int.parse(rutNumber[i]) * multiplier;
      multiplier = (multiplier < 7) ? multiplier + 1 : 2;
    }

    int remainder = sum % 11;
    String verifierDigit = (11 - remainder).toString();

    if (verifierDigit == '10') {
      return 'K';
    } else if (verifierDigit == '11') {
      return '0';
    } else {
      return verifierDigit;
    }
  }
}

class ChileanRutFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;

    if (text.length <= 1) {
      return newValue;
    }

    // Remove all non-digit characters
    final cleanedText = text.replaceAll(RegExp(r'\D'), '');

    // Insert hyphen after the first character
    if (cleanedText.length > 1) {
      final firstPart = cleanedText.substring(0, cleanedText.length - 1);
      final secondPart = cleanedText.substring(cleanedText.length - 1);
      return TextEditingValue(
        text: '$firstPart-$secondPart',
        selection: TextSelection.collapsed(offset: firstPart.length + 1),
      );
    } else {
      return newValue;
    }
  }
}
