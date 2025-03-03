import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'update_event_page_widget.dart' show UpdateEventPageWidget;
import 'package:flutter/material.dart';

class UpdateEventPageModel extends FlutterFlowModel<UpdateEventPageWidget> {
  ///  Local state fields for this page.

  bool displayList = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Event Name is required';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for price widget.
  FocusNode? priceFocusNode;
  TextEditingController? priceTextController;
  String? Function(BuildContext, String?)? priceTextControllerValidator;
  // State field(s) for maxGuests widget.
  FocusNode? maxGuestsFocusNode;
  TextEditingController? maxGuestsTextController;
  String? Function(BuildContext, String?)? maxGuestsTextControllerValidator;
  String? _maxGuestsTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Max Number of Guests is required';
    }

    if (val.length < 10) {
      return 'at leaset 10 people';
    }

    return null;
  }

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (uploadImage)] action in Text widget.
  ApiCallResponse? apiResponse;

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    maxGuestsTextControllerValidator = _maxGuestsTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    priceFocusNode?.dispose();
    priceTextController?.dispose();

    maxGuestsFocusNode?.dispose();
    maxGuestsTextController?.dispose();
  }
}
