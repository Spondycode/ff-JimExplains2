import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_profile_page_widget.dart' show CreateProfilePageWidget;
import 'package:flutter/material.dart';

class CreateProfilePageModel extends FlutterFlowModel<CreateProfilePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for DispolayNameTextField widget.
  FocusNode? dispolayNameTextFieldFocusNode;
  TextEditingController? dispolayNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      dispolayNameTextFieldTextControllerValidator;
  // State field(s) for CampermodeDropDown widget.
  String? campermodeDropDownValue;
  FormFieldController<String>? campermodeDropDownValueController;
  // State field(s) for CamperStory widget.
  FocusNode? camperStoryFocusNode;
  TextEditingController? camperStoryTextController;
  String? Function(BuildContext, String?)? camperStoryTextControllerValidator;
  String? _camperStoryTextControllerValidator(
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

  // State field(s) for NationalityTextField widget.
  FocusNode? nationalityTextFieldFocusNode;
  TextEditingController? nationalityTextFieldTextController;
  String? Function(BuildContext, String?)?
      nationalityTextFieldTextControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {
    camperStoryTextControllerValidator = _camperStoryTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    dispolayNameTextFieldFocusNode?.dispose();
    dispolayNameTextFieldTextController?.dispose();

    camperStoryFocusNode?.dispose();
    camperStoryTextController?.dispose();

    nationalityTextFieldFocusNode?.dispose();
    nationalityTextFieldTextController?.dispose();
  }
}
