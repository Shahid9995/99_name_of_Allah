import '/components/card_view_widget.dart';
import '/components/nav2_widget.dart';
import '/components/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NameDetailsFrModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for cardView component.
  late CardViewModel cardViewModel;
  // Model for Nav2 component.
  late Nav2Model nav2Model;
  // Model for NavBar1 component.
  late NavBar1Model navBar1Model;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    cardViewModel = createModel(context, () => CardViewModel());
    nav2Model = createModel(context, () => Nav2Model());
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  void dispose() {
    unfocusNode.dispose();
    cardViewModel.dispose();
    nav2Model.dispose();
    navBar1Model.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
