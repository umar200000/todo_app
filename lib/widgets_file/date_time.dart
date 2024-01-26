import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DateTime10 extends StatelessWidget {
  final void Function(BuildContext context) timeCountroller;
  final DateTime dateTime;
  final void Function(bool t) increaseDecreaseDay;
  final bool a = true;
  final bool b = false;

  DateTime10({
    required this.timeCountroller,
    required this.dateTime,
    required this.increaseDecreaseDay,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              increaseDecreaseDay(b);
            },
            icon: const Icon(
              Icons.arrow_left,
              size: 35,
            ),
          ),
          TextButton(
            onPressed: () {
              timeCountroller(context);
            },
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: GoogleFonts.montserrat().fontFamily,
                ),
                children: [
                  TextSpan(
                    text: "${DateFormat.EEEE().format(dateTime)}, ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "${DateFormat("d MMM").format(dateTime)}",
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              increaseDecreaseDay(a);
            },
            icon: const Icon(
              Icons.arrow_right,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}
