import '/components/card_view_widget.dart';
import '/components/nav2_widget.dart';
import '/components/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'name_details_fr_model.dart';
export 'name_details_fr_model.dart';

class NameDetailsFrWidget extends StatefulWidget {
  const NameDetailsFrWidget({
    Key? key,
    this.order,
    this.image,
    this.name,
    this.translation,
    this.definition,
    this.verse,
    this.verseEnglish,
    this.verseArabic,
    required this.prevPage,
    required this.audio,
  }) : super(key: key);

  final int? order;
  final String? image;
  final String? name;
  final String? translation;
  final String? definition;
  final String? verse;
  final String? verseEnglish;
  final String? verseArabic;
  final String? prevPage;
  final String? audio;

  @override
  _NameDetailsFrWidgetState createState() => _NameDetailsFrWidgetState();
}

class _NameDetailsFrWidgetState extends State<NameDetailsFrWidget> {
  late NameDetailsFrModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NameDetailsFrModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFECF8FF),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFD0EBFD),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: wrapWithModel(
                            model: _model.cardViewModel,
                            updateCallback: () => setState(() {}),
                            child: CardViewWidget(
                              order: widget.order,
                              image: widget.image,
                              name: widget.name,
                              translation: widget.translation,
                              definition: widget.definition,
                              verse: widget.verse,
                              verseEnglish: widget.verseEnglish,
                              verseArabic: widget.verseArabic,
                            ),
                          ),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.nav2Model,
                        updateCallback: () => setState(() {}),
                        updateOnChange: true,
                        child: Nav2Widget(
                          currentPage: 'nameDetails',
                          learnt: valueOrDefault<Color>(
                            functions.setLearntButtonColor(getJsonField(
                              FFAppState().localNamesOfAllah[widget.order!],
                              r'''$.learnt''',
                            )),
                            FlutterFlowTheme.of(context).error,
                          ),
                          order: widget.order,
                          audio: widget.audio!,
                          name: widget.name!,
                          definition: widget.definition!,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
