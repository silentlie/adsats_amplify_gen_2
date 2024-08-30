import 'package:flutter/material.dart';

class HelpWidget extends StatelessWidget {
  const HelpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //    SizedBox(height: 20), // Add some space between the text and the existing content
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Help',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 100), // Add some space between the search bar
        Align(
          alignment: Alignment.center,
          child: Text(
            'Please email Ben or contact the IT helpdesk.',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
