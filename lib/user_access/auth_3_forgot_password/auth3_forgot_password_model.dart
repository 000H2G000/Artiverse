import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'auth3_forgot_password_widget.dart' show Auth3ForgotPasswordWidget;
import 'package:flutter/material.dart';

class Auth3ForgotPasswordModel
    extends FlutterFlowModel<Auth3ForgotPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
