import '/flutter_flow/flutter_flow_util.dart';
import 'help_page_widget.dart' show HelpPageWidget;
import 'package:flutter/material.dart';

class HelpPageModel extends FlutterFlowModel<HelpPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
