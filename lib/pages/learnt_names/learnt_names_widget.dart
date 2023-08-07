import '/backend/backend.dart';
import '/components/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'learnt_names_model.dart';
export 'learnt_names_model.dart';

class LearntNamesWidget extends StatefulWidget {
  const LearntNamesWidget({Key? key}) : super(key: key);

  @override
  _LearntNamesWidgetState createState() => _LearntNamesWidgetState();
}

class _LearntNamesWidgetState extends State<LearntNamesWidget>
    with TickerProviderStateMixin {
   LearntNamesModel _model=LearntNamesModel();

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
    print("=====initState===${NamesOfAllahRecord}=======");
    _model = createModel(context, () => LearntNamesModel());
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
        backgroundColor: Color(0xFFDEF4FF),
        body: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 20),
                Container(
                  width: double.infinity,
                  height: 140.0,
                  decoration: BoxDecoration(),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 20.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.safePop();
                            },
                            child: Icon(
                              Icons.arrow_back_ios_rounded,
                              color: Color(0xFF334155),
                              size: 30.0,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 20.0),
                            child: Text(
                              'Learnt Names',
                              textAlign: TextAlign.end,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF334155),
                                    fontSize: 34.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(-0.65, -1.0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(),
                      child: SingleChildScrollView(
                        child: Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (functions.quantityFuncBool(FFAppState().localNamesOfAllah.toList(), 'learnt') ?? true)
                                PagedListView<DocumentSnapshot<Object?>?,
                                    NamesOfAllahRecord>(
                                  pagingController: () {
                                    final Query<Object?> Function(Query<Object?>)
                                        queryBuilder = (namesOfAllahRecord) => namesOfAllahRecord.whereIn('order', functions.learntNamesFunc(FFAppState().localNamesOfAllah.toList(),'learnt'));
                                    if (_model.pagingController != null) {
                                      final query = queryBuilder(NamesOfAllahRecord.collection);
                                      if (query != _model.pagingQuery) {
                                        // The query has changed
                                        _model.pagingQuery = query;
                                        _model.streamSubscriptions
                                            .forEach((s) => s?.cancel());
                                        _model.streamSubscriptions.clear();
                                        _model.pagingController!.refresh();
                                      }
                                      return _model.pagingController!;
                                    }
                                    _model.pagingController =
                                        PagingController(firstPageKey: null);
                                    _model.pagingQuery = queryBuilder(
                                        NamesOfAllahRecord.collection);
                                    _model.pagingController!
                                        .addPageRequestListener((nextPageMarker) {
                                      queryNamesOfAllahRecordPage(
                                        queryBuilder: (namesOfAllahRecord) =>
                                            namesOfAllahRecord.whereIn(
                                                'order',
                                                functions.learntNamesFunc(
                                                    FFAppState()
                                                        .localNamesOfAllah
                                                        .toList(),
                                                    'learnt')),
                                        nextPageMarker: nextPageMarker,
                                        pageSize: 25,
                                        isStream: true,
                                      ).then((page) {
                                        _model.pagingController!.appendPage(
                                          page.data,
                                          page.nextPageMarker,
                                        );
                                        final streamSubscription =
                                            page.dataStream?.listen((data) {
                                          data.forEach((item) {
                                            final itemIndexes = _model.pagingController!.itemList!.asMap().map((k, v) => MapEntry(v.reference.id, k));
                                            final index =
                                                itemIndexes[item.reference.id];
                                            final items = _model
                                                .pagingController!.itemList!;
                                            if (index != null) {
                                              items.replaceRange(
                                                  index, index + 1, [item]);
                                              _model.pagingController!.itemList =
                                                  {
                                                for (var item in items)
                                                  item.reference: item
                                              }.values.toList();
                                            }
                                          });
                                          setState(() {});
                                        });
                                        _model.streamSubscriptions
                                            .add(streamSubscription);
                                      });
                                    });
                                    return _model.pagingController!;
                                  }(),
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  reverse: false,
                                  scrollDirection: Axis.vertical,
                                  builderDelegate: PagedChildBuilderDelegate<
                                      NamesOfAllahRecord>(
                                    // Customize what your widget looks like when it's loading the first page.
                                    firstPageProgressIndicatorBuilder: (_) =>
                                        Image.network(
                                      '',
                                    ),

                                    itemBuilder: (context, _, listViewIndex) {
                                      final listViewNamesOfAllahRecord = _model.pagingController!.itemList![listViewIndex];
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
                                                    listViewNamesOfAllahRecord
                                                        .order,
                                                    ParamType.int,
                                                  ),
                                                  'image': serializeParam(
                                                    listViewNamesOfAllahRecord
                                                        .image,
                                                    ParamType.String,
                                                  ),
                                                  'name': serializeParam(
                                                    listViewNamesOfAllahRecord
                                                        .name,
                                                    ParamType.String,
                                                  ),
                                                  'translation': serializeParam(
                                                    listViewNamesOfAllahRecord
                                                        .translation,
                                                    ParamType.String,
                                                  ),
                                                  'definition': serializeParam(
                                                    listViewNamesOfAllahRecord
                                                        .definition,
                                                    ParamType.String,
                                                  ),
                                                  'verse': serializeParam(
                                                    listViewNamesOfAllahRecord
                                                        .verse,
                                                    ParamType.String,
                                                  ),
                                                  'verseEnglish': serializeParam(
                                                    listViewNamesOfAllahRecord
                                                        .verseEnglish,
                                                    ParamType.String,
                                                  ),
                                                  'verseArabic': serializeParam(
                                                    listViewNamesOfAllahRecord
                                                        .verseArabic,
                                                    ParamType.String,
                                                  ),
                                                  'audio': serializeParam(
                                                    listViewNamesOfAllahRecord
                                                        .audio,
                                                    ParamType.String,
                                                  ),
                                                  'prevPage': serializeParam(
                                                    'myNames',
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
                                                    BorderRadius.circular(6.0),
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
                                                          (listViewNamesOfAllahRecord
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
                                                              listViewNamesOfAllahRecord
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
                                                              listViewNamesOfAllahRecord
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
                                                              listViewNamesOfAllahRecord
                                                                  .order],
                                                          listViewNamesOfAllahRecord
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
                                                              listViewNamesOfAllahRecord
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
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'listViewOnPageLoadAnimation']!),

                              if (!functions.quantityFuncBool(FFAppState().localNamesOfAllah.toList(), 'learnt')!)
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 50.0, 0.0, 0.0),
                                    child: Container(
                                      width: 320.0,
                                      constraints: BoxConstraints(
                                        maxWidth: 700.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                        borderRadius: BorderRadius.circular(16.0),
                                      ),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 20.0, 20.0, 20.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/images/quiz.png',
                                              width: 100.0,
                                              height: 100.0,
                                              fit: BoxFit.fill,
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 15.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Nothing learnt yet',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 18.0,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 15.0),
                                                  child: Text(
                                                    'You haven\'t learnt any names',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              Color(0xFF5C6D88),
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            FFButtonWidget(
                                              onPressed: () async {
                                                context.pushNamed('HomePage');
                                              },
                                              text: 'Back Home',
                                              options: FFButtonOptions(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 10.0, 20.0, 10.0),
                                                iconPadding: EdgeInsetsDirectional
                                                    .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                color: Color(0xFFD0EBFD),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              Color(0xFF334155),
                                                        ),
                                                elevation: 1.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: wrapWithModel(
                model: _model.navBar1Model,
                updateCallback: () => setState(() {}),
                child: NavBar1Widget(
                  currentPage: 'myNames',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
