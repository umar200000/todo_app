import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DateTime extends StatelessWidget {
  const DateTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_left,
              size: 35,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: GoogleFonts.montserrat().fontFamily,
                ),
                children: const [
                  TextSpan(
                    text: "Friday, ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "6 Aug",
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
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
