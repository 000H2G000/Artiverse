import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'auth3_phone_widget.dart' show Auth3PhoneWidget;
import 'package:flutter/material.dart';

class Auth3PhoneModel extends FlutterFlowModel<Auth3PhoneWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();
  }
}
