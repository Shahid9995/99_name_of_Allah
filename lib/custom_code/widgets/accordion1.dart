// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';

class Accordion1 extends StatefulWidget {
  const Accordion1({
    Key? key,
    this.width,
    this.height,
    required this.firstTitle,
    required this.firstContent,
    required this.secondTitle,
    required this.secondContent,
    required this.thirdTitle,
    required this.thirdContent,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String firstTitle;
  final String firstContent;
  final String secondTitle;
  final String secondContent;
  final String thirdTitle;
  final String thirdContent;

  @override
  _Accordion1State createState() => _Accordion1State();
}

class _Accordion1State extends State<Accordion1> {
  @override
  Widget build(BuildContext context) {
    final _headerStyle = const TextStyle(
        color: Color.fromARGB(255, 51, 65, 65),
        fontSize: 15,
        fontWeight: FontWeight.bold);
    final _contentStyleHeader = const TextStyle(
        color: Color.fromARGB(255, 51, 65, 65),
        fontSize: 14,
        fontWeight: FontWeight.w700);
    final _contentStyle = const TextStyle(
        color: Color.fromARGB(255, 51, 65, 65),
        fontSize: 14,
        fontWeight: FontWeight.normal);
    final _loremIpsum =
        '''Lorem ipsum is typically a corrupted version of 'De finibus bonorum et malorum', a 1st century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin.''';

    return Accordion(
      maxOpenSections: 1,
      headerBackgroundColorOpened: Colors.black54,
      scaleWhenAnimating: true,
      openAndCloseAnimation: true,
      paddingListTop: 0,
      headerPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
      sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
      sectionClosingHapticFeedback: SectionHapticFeedback.light,
      children: [
        AccordionSection(
          isOpen: false,
          headerBackgroundColor: Color.fromRGBO(232, 232, 232, 0.26),
          headerBackgroundColorOpened: Color.fromRGBO(232, 232, 232, 0.26),
          header: Text(widget.firstTitle, style: _headerStyle),
          content: Text(widget.firstContent, style: _contentStyle),
          contentHorizontalPadding: 12,
          contentBorderColor: const Color.fromRGBO(232, 232, 232, 0.26),
          contentBackgroundColor: Color.fromRGBO(232, 232, 232, 0.26),
          headerPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
          rightIcon: const Icon(Icons.keyboard_arrow_down,
              color: Color.fromARGB(255, 51, 65, 65)),
        ),
        AccordionSection(
          isOpen: false,
          headerBackgroundColor: Color.fromRGBO(232, 232, 232, 0.26),
          headerBackgroundColorOpened: Color.fromRGBO(232, 232, 232, 0.26),
          header: Text(widget.secondTitle, style: _headerStyle),
          content: Text(widget.secondContent, style: _contentStyle),
          contentHorizontalPadding: 12,
          contentBorderColor: const Color.fromRGBO(232, 232, 232, 0.26),
          contentBackgroundColor: Color.fromRGBO(232, 232, 232, 0.26),
          headerPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
          rightIcon: const Icon(Icons.keyboard_arrow_down,
              color: Color.fromARGB(255, 51, 65, 65)),
        ),
        AccordionSection(
          isOpen: false,
          headerBackgroundColor: Color.fromRGBO(232, 232, 232, 0.26),
          headerBackgroundColorOpened: Color.fromRGBO(232, 232, 232, 0.26),
          header: Text(widget.thirdTitle, style: _headerStyle),
          content: Text(widget.thirdContent, style: _contentStyle),
          contentHorizontalPadding: 12,
          contentBorderColor: const Color.fromRGBO(232, 232, 232, 0.26),
          contentBackgroundColor: Color.fromRGBO(232, 232, 232, 0.26),
          headerPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
          rightIcon: const Icon(Icons.keyboard_arrow_down,
              color: Color.fromARGB(255, 51, 65, 65)),
        ),
        // Add more AccordionSection widgets as needed
        // with the desired headers and content
      ],
    );
  }
}
