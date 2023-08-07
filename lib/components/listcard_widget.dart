import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'listcard_model.dart';
export 'listcard_model.dart';

class ListcardWidget extends StatefulWidget {
  const ListcardWidget({
    Key? key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
    this.parameter4,
    this.parameter5,
    this.parameter6,
    this.parameter7,
    this.parameter8,
  }) : super(key: key);

  final int? parameter1;
  final String? parameter2;
  final String? parameter3;
  final String? parameter4;
  final String? parameter5;
  final String? parameter6;
  final String? parameter7;
  final String? parameter8;

  @override
  _ListcardWidgetState createState() => _ListcardWidgetState();
}

class _ListcardWidgetState extends State<ListcardWidget> {
  late ListcardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListcardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            context.pushNamed(
              'NameDetailsFr',
              queryParameters: {
                'order': serializeParam(
                  widget.parameter1,
                  ParamType.int,
                ),
                'image': serializeParam(
                  widget.parameter4,
                  ParamType.String,
                ),
                'name': serializeParam(
                  widget.parameter2,
                  ParamType.String,
                ),
                'translation': serializeParam(
                  widget.parameter3,
                  ParamType.String,
                ),
                'definition': serializeParam(
                  widget.parameter5,
                  ParamType.String,
                ),
                'verse': serializeParam(
                  widget.parameter6,
                  ParamType.String,
                ),
                'verseEnglish': serializeParam(
                  widget.parameter7,
                  ParamType.String,
                ),
                'verseArabic': serializeParam(
                  widget.parameter8,
                  ParamType.String,
                ),
                'prevPage': serializeParam(
                  'home',
                  ParamType.String,
                ),
              }.withoutNulls,
            );
          },
          child: Container(
            width: 414.0,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 0.0,
                  color: Color(0xFFEFF7F5),
                  offset: Offset(0.0, 1.0),
                )
              ],
              borderRadius: BorderRadius.circular(6.0),
              border: Border.all(
                color: Color(0xFFEFF7F5),
                width: 1.0,
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 16.0, 12.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                    child: Container(
                      width: 27.0,
                      height: 27.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFD0EBFD),
                        shape: BoxShape.circle,
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        (widget.parameter1! + 1).toString(),
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Roboto',
                                  color: Color(0xFF334155),
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          child: Text(
                            widget.parameter2!,
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: Color(0xFF111417),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          child: Text(
                            widget.parameter3!,
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: Color(0xFF111417),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await actions.changeLearntState(
                        context,
                        FFAppState().localNamesOfAllah[widget.parameter1!],
                        widget.parameter1!,
                      );
                    },
                    child: Icon(
                      Icons.check_circle_rounded,
                      color: functions.setLearntButtonColor(getJsonField(
                        FFAppState().localNamesOfAllah[widget.parameter1!],
                        r'''$.learnt''',
                      )),
                      size: 30.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
