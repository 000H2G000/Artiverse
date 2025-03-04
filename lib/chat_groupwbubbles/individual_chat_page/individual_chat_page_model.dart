import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'individual_chat_page_widget.dart' show IndividualChatPageWidget;
import 'package:flutter/material.dart';

class IndividualChatPageModel
    extends FlutterFlowModel<IndividualChatPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for messageInput widget.
  FocusNode? messageInputFocusNode;
  TextEditingController? messageInputTextController;
  String? Function(BuildContext, String?)? messageInputTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    messageInputFocusNode?.dispose();
    messageInputTextController?.dispose();
  }
}
