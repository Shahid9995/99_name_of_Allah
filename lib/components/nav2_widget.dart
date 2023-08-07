import 'package:share_plus/share_plus.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

import 'nav2_model.dart';
export 'nav2_model.dart';

class Nav2Widget extends StatefulWidget {
  const Nav2Widget({
    Key? key,
    required this.currentPage,
    this.learnt,
    this.order,
    required this.audio,
    required this.name,
    required this.definition,
  }) : super(key: key);

  final String? currentPage;
  final Color? learnt;
  final int? order;
  final String? audio;
  final String? name;
  final String? definition;

  @override
  _Nav2WidgetState createState() => _Nav2WidgetState();
}

class _Nav2WidgetState extends State<Nav2Widget> {
  late Nav2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Nav2Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Color(0x00EEEEEE),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Material(
                color: Colors.transparent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Color(0x1A57636C),
                        offset: Offset(0, -10),
                        spreadRadius: 0.1,
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: AlignmentDirectional(0, 0.32),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 50,
                      icon: Icon(
                        Icons.home_rounded,
                        color: Color(0xFF334155),
                        size: 24,
                      ),
                      onPressed: () async {
                        context.pushNamed(
                          'HomePage',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      },
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 50,
                      icon: Icon(
                        Icons.graphic_eq_rounded,
                        color: Color(0xFF334155),
                        size: 24,
                      ),
                      onPressed: () async {
                        _model.soundPlayer ??= AudioPlayer();
                        if (_model.soundPlayer!.playing) {
                          await _model.soundPlayer!.stop();
                        }
                        _model.soundPlayer!.setVolume(1);
                        _model.soundPlayer!
                            .setUrl(widget.audio!)
                            .then((_) => _model.soundPlayer!.play());
                      },
                    ),
                  ],
                ),
                if ((String currentPage) {
                  return currentPage == 'nameDetails';
                }(widget.currentPage!))
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 50,
                        fillColor: widget.learnt,
                        icon: Icon(
                          Icons.check_rounded,
                          color: Colors.black,
                          size: 24,
                        ),
                        onPressed: () async {
                          await actions.changeLearntState(
                            context,
                            FFAppState().localNamesOfAllah[widget.order!],
                            widget.order!,
                          );
                        },
                      ),
                    ],
                  ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 50,
                      icon: Icon(
                        Icons.favorite_rounded,
                        color: functions.setFavourite(getJsonField(
                          FFAppState().localNamesOfAllah[widget.order!],
                          r'''$.favourite''',
                        )),
                        size: 24,
                      ),
                      onPressed: () async {
                        await actions.changeFavouriteState(
                          context,
                          FFAppState().localNamesOfAllah[widget.order!],
                          widget.order!,
                        );
                      },
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Builder(
                      builder: (context) => FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 50,
                        icon: Icon(
                          Icons.share_sharp,
                          color: Color(0xFF334155),
                          size: 24,
                        ),
                        onPressed: () async {
                          await Share.share(
                            (String name, String definition) {
                              return '$name: $definition';
                            }(widget.name!, widget.definition!),
                            sharePositionOrigin: getWidgetBoundingBox(context),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
