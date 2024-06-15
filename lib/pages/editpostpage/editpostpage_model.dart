import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'editpostpage_widget.dart' show EditpostpageWidget;
import 'package:flutter/material.dart';

class EditpostpageModel extends FlutterFlowModel<EditpostpageWidget> {
  ///  Local state fields for this page.

  int? categorycampsite;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  String? _descriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 10) {
      return 'Requires at least 10 characters.';
    }
    if (val.length > 250) {
      return 'Maximum 250 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for W3WTextField widget.
  FocusNode? w3WTextFieldFocusNode;
  TextEditingController? w3WTextFieldTextController;
  String? Function(BuildContext, String?)? w3WTextFieldTextControllerValidator;
  // State field(s) for CountryDropDown widget.
  String? countryDropDownValue;
  FormFieldController<String>? countryDropDownValueController;
  // State field(s) for CategoryDropDown widget.
  String? categoryDropDownValue;
  FormFieldController<String>? categoryDropDownValueController;
  List<CategoriesRecord>? categoryDropDownPreviousSnapshot;
  // State field(s) for CampsiteNameTextField widget.
  FocusNode? campsiteNameTextFieldFocusNode;
  TextEditingController? campsiteNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      campsiteNameTextFieldTextControllerValidator;
  // State field(s) for PlotIDTextField widget.
  FocusNode? plotIDTextFieldFocusNode;
  TextEditingController? plotIDTextFieldTextController;
  String? Function(BuildContext, String?)?
      plotIDTextFieldTextControllerValidator;
  // State field(s) for SeasonTextField widget.
  String? seasonTextFieldValue;
  FormFieldController<String>? seasonTextFieldValueController;
  // State field(s) for PriceTextField widget.
  FocusNode? priceTextFieldFocusNode;
  TextEditingController? priceTextFieldTextController;
  String? Function(BuildContext, String?)?
      priceTextFieldTextControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {
    descriptionTextControllerValidator = _descriptionTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    w3WTextFieldFocusNode?.dispose();
    w3WTextFieldTextController?.dispose();

    campsiteNameTextFieldFocusNode?.dispose();
    campsiteNameTextFieldTextController?.dispose();

    plotIDTextFieldFocusNode?.dispose();
    plotIDTextFieldTextController?.dispose();

    priceTextFieldFocusNode?.dispose();
    priceTextFieldTextController?.dispose();
  }
}
