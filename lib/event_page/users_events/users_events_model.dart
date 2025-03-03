import '/flutter_flow/flutter_flow_util.dart';
import 'users_events_widget.dart' show UsersEventsWidget;
import 'package:flutter/material.dart';

class UsersEventsModel extends FlutterFlowModel<UsersEventsWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> thisEvent = [];
  void addToThisEvent(DocumentReference item) => thisEvent.add(item);
  void removeFromThisEvent(DocumentReference item) => thisEvent.remove(item);
  void removeAtIndexFromThisEvent(int index) => thisEvent.removeAt(index);
  void insertAtIndexInThisEvent(int index, DocumentReference item) =>
      thisEvent.insert(index, item);
  void updateThisEventAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      thisEvent[index] = updateFn(thisEvent[index]);

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
