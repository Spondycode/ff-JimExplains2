import '/flutter_flow/flutter_flow_util.dart';
import 'postlikeby_widget.dart' show PostlikebyWidget;
import 'package:flutter/material.dart';

class PostlikebyModel extends FlutterFlowModel<PostlikebyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
