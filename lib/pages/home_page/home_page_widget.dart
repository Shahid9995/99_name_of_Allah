import 'dart:developer';

import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:the_names/pages/learnt_names/test_class.dart';
import '/backend/backend.dart';
import '/components/card_widget.dart';
import '/components/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class Slide {
  Slide({
    required this.title,
    required this.height,
    required this.color,
  });

  final Color color;
  final double height;
  final String title;
}

var slides = List.generate(
  1,
  (index) => Slide(
    title: 'Slide ${index}',
    height: 100.0 + index * 50,
    color: Colors.primaries[index % Colors.primaries.length],
  ),
);

// final List<Widget> sliders =
class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'listViewOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 100.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 1500.ms,
          duration: 900.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(-120.0, 0.0),
        ),
      ],
    ),
    'listViewOnPageLoadAnimation2': AnimationInfo(
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
    _model = createModel(context, () => HomePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double togglePadding = screenHeight > 700 ? 190 : 40;

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFdef4ff),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFDEF4FF),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/bg.png',
              ).image,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 20),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 15.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          10.0, 10.0, 10.0, 10.0),
                      child: Container(
                        width: 61.0,
                        height: 63.0,
                        decoration: BoxDecoration(
                          color: Color(0x1E767680),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0x25767680),
                            width: 1.0,
                          ),
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            // if (functions.quantityFuncBool(FFAppState().localNamesOfAllah.toList(), 'learnt')!)
                            // Navigator.push(context, MaterialPageRoute(builder: (_)=>TestClass()));
                            // print("====testClass=========");
                            if (functions.quantityFuncBool(FFAppState().localNamesOfAllah.toList(), 'learnt')!) {
                              context.pushNamed(
                                'LearntNames',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.rightToLeft,
                                  ),
                                },
                              );
                            }
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CachedNetworkImage(
                                fadeInDuration: Duration(milliseconds: 500),
                                fadeOutDuration: Duration(milliseconds: 500),
                                imageUrl: () {
                                  if (functions.quantityFunc(
                                          FFAppState()
                                              .localNamesOfAllah
                                              .toList(),
                                          'learnt')! < 33) {
                                    return 'https://thenamesapp.s3.amazonaws.com/namesOfAllah/progress1.png';
                                  } else if (functions.quantityFunc(
                                          FFAppState()
                                              .localNamesOfAllah
                                              .toList(),
                                          'learnt')! <
                                      66) {
                                    return 'https://thenamesapp.s3.amazonaws.com/namesOfAllah/progress2.png';
                                  } else if (functions.quantityFunc(
                                          FFAppState()
                                              .localNamesOfAllah
                                              .toList(),
                                          'learnt')! <
                                      99) {
                                    return 'https://thenamesapp.s3.amazonaws.com/namesOfAllah/progress3.png';
                                  } else {
                                    return 'https://thenamesapp.s3.amazonaws.com/namesOfAllah/progress4.png';
                                  }
                                }(),
                                width: 25,
                                height: 25,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                functions.quantityFunc(FFAppState().localNamesOfAllah.toList(), 'learnt').toString(),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Text(
                          '99 Names\nof Allah',
                          // '$screenHeight height, $screenWidth width',
                          textAlign: TextAlign.end,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    color: Color(0xFF334155),
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    0.0, togglePadding, 0.0, 30.0),
                child: Container(
                  width: 245.0,
                  height: 46.0,
                  decoration: BoxDecoration(
                    color: Color(0x58D0EBFD),
                    borderRadius: BorderRadius.circular(31.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (valueOrDefault<bool>(
                        FFAppState().learnView == true,
                        true,
                      ))
                        Container(
                          width: 112.0,
                          height: 36.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(35.0),
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                FFAppState().learnView = true;
                              });
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Learn',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF333333),
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      if (FFAppState().learnView == false)
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            setState(() {
                              FFAppState().learnView = true;
                            });
                          },
                          child: Container(
                            width: 112.0,
                            height: 36.0,
                            decoration: BoxDecoration(
                              color: Color(0x56D0EBFD),
                              borderRadius: BorderRadius.circular(35.0),
                            ),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  FFAppState().learnView = true;
                                });
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Learn',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Color(0xFF333333),
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      if (FFAppState().learnView == true)
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            setState(() {
                              FFAppState().learnView = false;
                            });
                          },
                          child: Container(
                            width: 112.0,
                            height: 36.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'List',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF333333),
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      if (FFAppState().learnView == false)
                        Container(
                          width: 112.0,
                          height: 36.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(35.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'List',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Color(0xFF333333),
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              if (valueOrDefault<bool>(
                FFAppState().learnView == true,
                true,
              ))
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(-0.65, -1.0),
                    child: Container(
                      width: double.infinity,
                      height: 279.0,
                      decoration: BoxDecoration(),
                      child: Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: PagedListView<DocumentSnapshot<Object?>?,
                              NamesOfAllahRecord>(
                            pagingController: () {
                              final Query<Object?> Function(Query<Object?>)
                                  queryBuilder = (namesOfAllahRecord) =>
                                      namesOfAllahRecord.orderBy('order');
                              if (_model.pagingController != null) {
                                final query =
                                    queryBuilder(NamesOfAllahRecord.collection);
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
                              _model.pagingQuery =
                                  queryBuilder(NamesOfAllahRecord.collection);
                              _model.pagingController!
                                  .addPageRequestListener((nextPageMarker) {
                                queryNamesOfAllahRecordPage(
                                  queryBuilder: (namesOfAllahRecord) =>
                                      namesOfAllahRecord.orderBy('order'),
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
                                      final itemIndexes = _model
                                          .pagingController!.itemList!
                                          .asMap()
                                          .map((k, v) =>
                                              MapEntry(v.reference.id, k));
                                      final index =
                                          itemIndexes[item.reference.id];
                                      final items =
                                          _model.pagingController!.itemList!;
                                      if (index != null) {
                                        items.replaceRange(
                                            index, index + 1, [item]);
                                        _model.pagingController!.itemList = {
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
                            scrollDirection: Axis.horizontal,
                            builderDelegate:
                                PagedChildBuilderDelegate<NamesOfAllahRecord>(
                              // Customize what your widget looks like when it's loading the first page.
                              firstPageProgressIndicatorBuilder: (_) => Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),

                              itemBuilder: (context, _, listViewIndex) {
                                final listViewNamesOfAllahRecord = _model
                                    .pagingController!.itemList![listViewIndex];
                                //log('check Image ${listViewNamesOfAllahRecord.image}');
                                return FlutterCarousel(
                                    options: CarouselOptions(
                                      physics: NeverScrollableScrollPhysics(),
                                      autoPlay: true,
                                      autoPlayInterval:
                                          const Duration(seconds: 10),
                                      viewportFraction: 1.5,
                                      aspectRatio: 6 / 6.5,
                                      //  enlargeCenterPage: true,
                                      slideIndicator:
                                          CircularWaveSlideIndicator(),
                                      floatingIndicator: true,
                                    ),
                                    items: [
                                      Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            width: 250.0,
                                            height: 299.0,
                                            decoration: BoxDecoration(),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 12.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 279.0,
                                                  constraints: BoxConstraints(
                                                    maxWidth: 218.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 3,
                                                        color: Color.fromARGB(
                                                            15, 0, 0, 0),
                                                        offset:
                                                            Offset(0.0, 1.0),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    border: Border.all(
                                                      color: Color(0xFFEFF7F5),
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: wrapWithModel(
                                                    model: _model.cardModels
                                                        .getModel(
                                                      listViewNamesOfAllahRecord
                                                          .order
                                                          .toString(),
                                                      listViewIndex,
                                                    ),
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: CardWidget(
                                                      key: Key(
                                                        'Keytxn_${listViewNamesOfAllahRecord.order.toString()}',
                                                      ),
                                                      order:
                                                          listViewNamesOfAllahRecord
                                                              .order,
                                                      image:
                                                          listViewNamesOfAllahRecord
                                                              .image,
                                                      name:
                                                          listViewNamesOfAllahRecord
                                                              .name,
                                                      translation:
                                                          listViewNamesOfAllahRecord
                                                              .translation,
                                                      definition:
                                                          listViewNamesOfAllahRecord
                                                              .definition,
                                                      verse:
                                                          listViewNamesOfAllahRecord
                                                              .verse,
                                                      verseEnglish:
                                                          listViewNamesOfAllahRecord
                                                              .verseEnglish,
                                                      verseArabic:
                                                          listViewNamesOfAllahRecord
                                                              .verseArabic,
                                                      audio:
                                                          listViewNamesOfAllahRecord
                                                              .audio,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ))
                                    ]);
                              },
                            ),
                          )),
                    ),
                  ),
                ),
              // Second List
              if (FFAppState().learnView == false)
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(-0.65, -1.0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(),
                      child: StreamBuilder<List<NamesOfAllahRecord>>(
                        stream: queryNamesOfAllahRecord(
                          queryBuilder: (namesOfAllahRecord) =>
                              namesOfAllahRecord.orderBy('order'),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            );
                          }
                          List<NamesOfAllahRecord>
                              listViewNamesOfAllahRecordList = snapshot.data!;
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewNamesOfAllahRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewNamesOfAllahRecord =
                                  listViewNamesOfAllahRecordList[listViewIndex];
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
                                            listViewNamesOfAllahRecord.order,
                                            ParamType.int,
                                          ),
                                          'image': serializeParam(
                                            listViewNamesOfAllahRecord.image,
                                            ParamType.String,
                                          ),
                                          'name': serializeParam(
                                            listViewNamesOfAllahRecord.name,
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
                                            listViewNamesOfAllahRecord.verse,
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
                                            listViewNamesOfAllahRecord.audio,
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
                                      width: 331.0,
                                      height: 68.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 3,
                                            color: Color.fromARGB(15, 0, 0, 0),
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 16.0, 12.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                width: 27.0,
                                                height: 27.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFD0EBFD),
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  (listViewNamesOfAllahRecord
                                                              .order +
                                                          1)
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color:
                                                            Color(0xFF334155),
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
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
                                                            fontSize: 20.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
                                                    child: Text(
                                                      listViewNamesOfAllahRecord
                                                          .translation,
                                                      textAlign:
                                                          TextAlign.start,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFF111417),
                                                                fontSize: 14.0,
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
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await actions.changeLearntState(
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
                                                Icons.check_circle_rounded,
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
                          ).animateOnPageLoad(
                              animationsMap['listViewOnPageLoadAnimation2']!);
                        },
                      ),
                    ),
                  ),
                ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.navBar1Model,
                  updateCallback: () => setState(() {}),
                  child: NavBar1Widget(
                    currentPage: 'home',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
