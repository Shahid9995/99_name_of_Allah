import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Color? setLearntButtonColor(dynamic learnt) {
  if (learnt == null) {
    return null;
  }
  return learnt ? Color.fromRGBO(102, 164, 164, 1) : Color(0xFFD4D4D8);
}

dynamic newCustomFunction2(dynamic test) {
  bool learnt = test['learnt'];
  return {'learnt': !learnt};
}

Color? setFavourite(dynamic favourite) {
  if (favourite == null) {
    return null;
  }
  return favourite ? Color.fromRGBO(209, 85, 85, 100) : Color(0xFFD4D4D8);
}

bool? quantityFuncBool(
  List<dynamic> names,
  String type,
) {
  List<int> namesIndices = [];

  for (int i = 0; i < names.length; i++) {
    if (names[i][type] == true) {
      namesIndices.add(i);
    }
  }

  return namesIndices.length > 0 ? true : false;
}

List<int> learntNamesFunc(
  List<dynamic> learntNames,
  String type,
) {
  List<int> learntIndices = [];

  for (int i = 0; i < learntNames.length; i++) {
    if (learntNames[i][type] == true) {
      learntIndices.add(i);
    }
  }

  return learntIndices;
}

int? quantityFunc(
  List<dynamic> names,
  String type,
) {
  List<int> namesIndices = [];

  for (int i = 0; i < names.length; i++) {
    if (names[i][type] == true) {
      namesIndices.add(i);
    }
  }
  print("namesIndices=====${namesIndices.length}");

  return namesIndices.length;
}

int randomNumber() {
  DateTime now = DateTime.now();
  DateFormat formatter = DateFormat('yyyyMMdd');
  String formattedDate = formatter.format(now);
  int seed = int.parse(formattedDate);

  math.Random random = math.Random(seed);
  int num = random.nextInt(4) + 1;
  return num;
}
