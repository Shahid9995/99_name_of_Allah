import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'card_model.dart';
export 'card_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({
    Key? key,
    this.order,
    this.image,
    this.name,
    this.translation,
    this.definition,
    this.verse,
    this.verseEnglish,
    this.verseArabic,
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
  final String? audio;

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> with TickerProviderStateMixin {
  late CardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          context.pushNamed(
            'NameDetailsFr',
            queryParameters: {
              'order': serializeParam(
                widget.order,
                ParamType.int,
              ),
              'image': serializeParam(
                widget.image,
                ParamType.String,
              ),
              'name': serializeParam(
                widget.name,
                ParamType.String,
              ),
              'translation': serializeParam(
                widget.translation,
                ParamType.String,
              ),
              'definition': serializeParam(
                widget.definition,
                ParamType.String,
              ),
              'verse': serializeParam(
                widget.verse,
                ParamType.String,
              ),
              'verseEnglish': serializeParam(
                widget.verseEnglish,
                ParamType.String,
              ),
              'verseArabic': serializeParam(
                widget.verseArabic,
                ParamType.String,
              ),
              'prevPage': serializeParam(
                'home',
                ParamType.String,
              ),
              'audio': serializeParam(
                '',
                ParamType.String,
              ),
            }.withoutNulls,
          );
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 20.0, 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 36.0,
                      height: 36.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        (widget.order! + 1).toString(),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: Color(0xFF64748B),
                              fontSize: 14.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                    Icon(
                      Icons.open_in_full_rounded,
                      color: Color(0xFF64748B),
                      size: 18.0,
                    ),
                  ],
                ),
              ),
              Container(
                width: 87.0,
                height: 64.6,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                child: SvgPicture.network(
                  widget.image!,
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      widget.name!,
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'Montserrat',
                            color: Color(0xFF334155),
                            fontSize: widget.name == 'Ḏūl-Jalāli wal-Ikrām'
                                ? 18.0
                                : 24.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                      child: Text(
                        widget.translation!,
                        textAlign: TextAlign.center,
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
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
                    FFAppState().localNamesOfAllah[widget.order!],
                    widget.order!,
                  );
                },
                child: Icon(
                  Icons.check_circle_rounded,
                  color: valueOrDefault<Color>(
                    functions.setLearntButtonColor(getJsonField(
                      FFAppState().localNamesOfAllah[widget.order!],
                      r'''$.learnt''',
                    )),
                    FlutterFlowTheme.of(context).error,
                  ),
                  size: 35.0,
                ),
              ),
            ],
          ),
        ));
  }
}
