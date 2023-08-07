import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nav_bar1_model.dart';
export 'nav_bar1_model.dart';

class NavBar1Widget extends StatefulWidget {
  const NavBar1Widget({
    Key? key,
    this.currentPage,
  }) : super(key: key);

  final String? currentPage;

  @override
  _NavBar1WidgetState createState() => _NavBar1WidgetState();
}

class _NavBar1WidgetState extends State<NavBar1Widget> {
  late NavBar1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBar1Model());
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
      height: 100.0,
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
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  height: 90.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10.0,
                        color: Color(0x1A57636C),
                        offset: Offset(0.0, -10.0),
                        spreadRadius: 0.1,
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 0.1),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FlutterFlowIconButton(
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 50.0,
                  fillColor: (String currentColor) {
                    return currentColor == 'home'
                        ? Color(0xFCD0EBFD)
                        : Color(0x00FD);
                  }(widget.currentPage!),
                  icon: Icon(
                    Icons.home_rounded,
                    color: Color(0xFF334155),
                    size: 24.0,
                  ),
                  onPressed: () async {
                    widget.currentPage != 'home'
                        ? context.pushNamed(
                            'HomePage',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          )
                        : null;
                  },
                ),
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 50.0,
                  fillColor: (String currentColor) {
                    return currentColor == 'search'
                        ? Color(0xFCD0EBFD)
                        : Color(0x00FD);
                  }(widget.currentPage!),
                  icon: Icon(
                    Icons.search_outlined,
                    color: Color(0xFF262626),
                    size: 24.0,
                  ),
                  onPressed: () async {
                    widget.currentPage != 'search'
                        ? context.pushNamed(
                            'Search',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          )
                        : null;
                  },
                ),
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 50.0,
                  fillColor: (String currentColor) {
                    return currentColor == 'myNames'
                        ? Color(0xFCD0EBFD)
                        : Color(0x00FD);
                  }(widget.currentPage!),
                  icon: Icon(
                    Icons.favorite_border_rounded,
                    color: Color(0xFF262626),
                    size: 24.0,
                  ),
                  onPressed: () async {
                    widget.currentPage != 'myNames'
                        ? context.pushNamed('MyNames')
                        : null;
                  },
                ),
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 50.0,
                  fillColor: (String currentColor) {
                    return currentColor == 'settings'
                        ? Color(0xFCD0EBFD)
                        : Color(0x00FD);
                  }(widget.currentPage!),
                  icon: Icon(
                    Icons.settings,
                    color: Color(0xFF262626),
                    size: 24.0,
                  ),
                  onPressed: () async {
                    widget.currentPage != 'settings'
                        ? context.pushNamed('Settings')
                        : null;
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
