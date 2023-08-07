import 'dart:developer';

import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _learnView = prefs.getBool('ff_learnView') ?? _learnView;
    });
    _safeInit(() {
      _localNamesOfAllah =
          prefs.getStringList('ff_localNamesOfAllah')?.map((x) {
                try {
                  return jsonDecode(x);
                } catch (e) {
                  print("Can't decode persisted json. Error: $e.");
                  return {};
                }
              }).toList() ??
              _localNamesOfAllah;
    });
    _safeInit(() {
      _notifications = prefs.getBool('ff_notifications') ?? _notifications;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _learnView = true;
  bool get learnView => _learnView;
  set learnView(bool _value) {
    log("_Checking_value $_value");
    _learnView = _value;
    log("_Checking__learnView $_learnView");

    prefs.setBool('ff_learnView', _value);
  }

  bool _test = true;
  bool get test => _test;
  set test(bool _value) {
    _test = _value;
  }

  List<dynamic> _localNamesOfAllah = [
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
    jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  ];

  // List<dynamic> _localNamesOfAllah = [
  //   jsonDecode('{\"learnt\":true,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":true,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":true,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":true,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":true,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":true,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":true,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":true,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":true,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":true,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":true,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":true,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":true,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":true,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":true,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":true,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":true,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":true,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":true,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":true,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":true,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":true,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":true,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":true,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":true,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":true,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":true,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":true,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":true,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  //   jsonDecode('{\"learnt\":false,\"favourite\":false}'),
  // ];

  List<dynamic> get localNamesOfAllah => _localNamesOfAllah;
  set localNamesOfAllah(List<dynamic> _value) {
    _localNamesOfAllah = _value;
    prefs.setStringList(
        'ff_localNamesOfAllah', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToLocalNamesOfAllah(dynamic _value) {
    _localNamesOfAllah.add(_value);
    prefs.setStringList('ff_localNamesOfAllah',
        _localNamesOfAllah.map((x) => jsonEncode(x)).toList());
  }

  void removeFromLocalNamesOfAllah(dynamic _value) {
    _localNamesOfAllah.remove(_value);
    prefs.setStringList('ff_localNamesOfAllah',
        _localNamesOfAllah.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromLocalNamesOfAllah(int _index) {
    _localNamesOfAllah.removeAt(_index);
    prefs.setStringList('ff_localNamesOfAllah',
        _localNamesOfAllah.map((x) => jsonEncode(x)).toList());
  }

  void updateLocalNamesOfAllahAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _localNamesOfAllah[_index] = updateFn(_localNamesOfAllah[_index]);
    prefs.setStringList('ff_localNamesOfAllah',
        _localNamesOfAllah.map((x) => jsonEncode(x)).toList());
  }

  bool _notifications = true;
  bool get notifications => _notifications;
  set notifications(bool _value) {
    _notifications = _value;
    prefs.setBool('ff_notifications', _value);
  }

  final _namesOfAllahSearchManager =
      StreamRequestManager<List<NamesOfAllahRecord>>();
  Stream<List<NamesOfAllahRecord>> namesOfAllahSearch({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<NamesOfAllahRecord>> Function() requestFn,
  }) =>
      _namesOfAllahSearchManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearNamesOfAllahSearchCache() => _namesOfAllahSearchManager.clear();
  void clearNamesOfAllahSearchCacheKey(String? uniqueKey) =>
      _namesOfAllahSearchManager.clearRequest(uniqueKey);
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
