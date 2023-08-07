import 'dart:developer';

import '/backend/backend.dart';
import '/components/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'search_model.dart';
export 'search_model.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget>
    with TickerProviderStateMixin {
  late SearchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'listViewOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 200.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchModel());

    _model.textController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFECF8FF),
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 108.0,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.85,
                            height: 80.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFE8F1F6),
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: Color(0xFFDCE8ED),
                                width: 2.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 4.0, 0.0),
                                    child: Icon(
                                      Icons.search_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: StreamBuilder<
                                          List<NamesOfAllahRecord>>(
                                        stream: FFAppState().namesOfAllahSearch(
                                          requestFn: () =>
                                              queryNamesOfAllahRecord(
                                            singleRecord: true,
                                          ),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 40.0,
                                                height: 40.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                              ),
                                            );
                                          }
                                          List<NamesOfAllahRecord>
                                              textFieldNamesOfAllahRecordList =
                                              snapshot.data!;
                                          final textFieldNamesOfAllahRecord =
                                              textFieldNamesOfAllahRecordList
                                                      .isNotEmpty
                                                  ? textFieldNamesOfAllahRecordList
                                                      .first
                                                  : null;
                                          return TextFormField(
                                            controller: _model.textController,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              _model.textController.text,
                                              Duration(milliseconds: 2000),
                                              () async {
                                                FFAppState().learnView = false;

                                                await queryNamesOfAllahRecordOnce()
                                                    .then(
                                                  (records) => _model
                                                          .simpleSearchResults =
                                                      TextSearch(
                                                    records
                                                        .map(
                                                          (record) =>
                                                              TextSearchItem(
                                                                  record, [
                                                            record.name!,
                                                            record.translation!
                                                          ]),
                                                        )
                                                        .toList(),
                                                  )
                                                          .search(_model
                                                              .textController
                                                              .text)
                                                          .map((r) => r.object)
                                                          .take(10)
                                                          .toList(),
                                                )
                                                    .onError((_, __) {
                                                  log("awaischeck reach");
                                                  return _model
                                                      .simpleSearchResults = [];
                                                }).whenComplete(
                                                        () => setState(() {
                                                              FFAppState()
                                                                      .learnView ==
                                                                  false;
                                                            }));
                                                log("awaischeck 111");
                                              },
                                            ),
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Search for a Name...',
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              errorBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedErrorBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                            validator: _model
                                                .textControllerValidator
                                                .asValidator(context),
                                          );
                                        },
                                      ),
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
                ),
                if (!valueOrDefault<bool>(
                  FFAppState().learnView,
                  true,
                ))
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(-0.65, -1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(),
                          child: Visibility(
                            visible: !FFAppState().learnView,
                            child: Builder(
                              builder: (context) {
                                final searchedNamesOfAllah =
                                    _model.simpleSearchResults.toList();
                                log("REACHING HERE1-=--=-=-");
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: searchedNamesOfAllah.length,
                                  itemBuilder:
                                      (context, searchedNamesOfAllahIndex) {
                                    final searchedNamesOfAllahItem =
                                        searchedNamesOfAllah[
                                            searchedNamesOfAllahIndex];
                                    log("REACHING HERE-=--=-=- $searchedNamesOfAllahItem");
                                    return Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 15.0),
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
                                                  searchedNamesOfAllahItem
                                                      .order,
                                                  ParamType.int,
                                                ),
                                                'image': serializeParam(
                                                  searchedNamesOfAllahItem
                                                      .image,
                                                  ParamType.String,
                                                ),
                                                'name': serializeParam(
                                                  searchedNamesOfAllahItem.name,
                                                  ParamType.String,
                                                ),
                                                'translation': serializeParam(
                                                  searchedNamesOfAllahItem
                                                      .translation,
                                                  ParamType.String,
                                                ),
                                                'definition': serializeParam(
                                                  searchedNamesOfAllahItem
                                                      .definition,
                                                  ParamType.String,
                                                ),
                                                'verse': serializeParam(
                                                  searchedNamesOfAllahItem
                                                      .verse,
                                                  ParamType.String,
                                                ),
                                                'verseEnglish': serializeParam(
                                                  searchedNamesOfAllahItem
                                                      .verseEnglish,
                                                  ParamType.String,
                                                ),
                                                'verseArabic': serializeParam(
                                                  searchedNamesOfAllahItem
                                                      .verseArabic,
                                                  ParamType.String,
                                                ),
                                                'prevPage': serializeParam(
                                                  'search',
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Container(
                                            width: 331.0,
                                            height: 68.0,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 0.0,
                                                  color: Color(0xFFEFF7F5),
                                                  offset: Offset(0.0, 1.0),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              border: Border.all(
                                                color: Color(0xFFEFF7F5),
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 12.0, 16.0, 12.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: 27.0,
                                                      height: 27.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFD0EBFD),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        (searchedNamesOfAllahItem
                                                                    .order +
                                                                1)
                                                            .toString(),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Roboto',
                                                              color: Color(
                                                                  0xFF334155),
                                                              fontSize: 12.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      12.0,
                                                                      0.0),
                                                          child: Text(
                                                            searchedNamesOfAllahItem
                                                                .name,
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: Color(
                                                                      0xFF111417),
                                                                  fontSize:
                                                                      20.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      12.0,
                                                                      0.0),
                                                          child: Text(
                                                            searchedNamesOfAllahItem
                                                                .translation,
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: Color(
                                                                      0xFF111417),
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      await actions
                                                          .changeLearntState(
                                                        context,
                                                        FFAppState()
                                                                .localNamesOfAllah[
                                                            searchedNamesOfAllahItem
                                                                .order],
                                                        searchedNamesOfAllahItem
                                                            .order,
                                                      );
                                                    },
                                                    child: Icon(
                                                      Icons
                                                          .check_circle_rounded,
                                                      color: functions
                                                          .setLearntButtonColor(
                                                              getJsonField(
                                                        FFAppState()
                                                                .localNamesOfAllah[
                                                            searchedNamesOfAllahItem
                                                                .order],
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
                                  },
                                ).animateOnPageLoad(animationsMap[
                                    'listViewOnPageLoadAnimation']!);
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: wrapWithModel(
              model: _model.navBar1Model,
              updateCallback: () => setState(() {}),
              child: NavBar1Widget(
                currentPage: 'search',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
