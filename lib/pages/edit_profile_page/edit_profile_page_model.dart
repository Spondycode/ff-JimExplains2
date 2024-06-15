import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_profile_page_widget.dart' show EditProfilePageWidget;
import 'package:flutter/material.dart';

class EditProfilePageModel extends FlutterFlowModel<EditProfilePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for DisplayNameTextField widget.
  FocusNode? displayNameTextFieldFocusNode;
  TextEditingController? displayNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      displayNameTextFieldTextControllerValidator;
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
  // State field(s) for FavCampsiteTextField widget.
  FocusNode? favCampsiteTextFieldFocusNode;
  TextEditingController? favCampsiteTextFieldTextController;
  String? Function(BuildContext, String?)?
      favCampsiteTextFieldTextControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  @override
  void initState(BuildContext context) {
    camperStoryTextControllerValidator = _camperStoryTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    displayNameTextFieldFocusNode?.dispose();
    displayNameTextFieldTextController?.dispose();

    camperStoryFocusNode?.dispose();
    camperStoryTextController?.dispose();

    nationalityTextFieldFocusNode?.dispose();
    nationalityTextFieldTextController?.dispose();

    favCampsiteTextFieldFocusNode?.dispose();
    favCampsiteTextFieldTextController?.dispose();
  }
}
