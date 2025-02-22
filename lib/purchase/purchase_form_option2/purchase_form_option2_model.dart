import '/flutter_flow/flutter_flow_util.dart';
import 'purchase_form_option2_widget.dart' show PurchaseFormOption2Widget;
import 'package:flutter/material.dart';

class PurchaseFormOption2Model
    extends FlutterFlowModel<PurchaseFormOption2Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
