import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //    SizedBox(height: 20), // Add some space between the text and the existing content
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Profile',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 35, // Set the desired height
              width: MediaQuery.of(context).size.width *
                  0.2, // Adjust the width as needed
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: const OutlineInputBorder(),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 8, horizontal: 12), // Adjust padding
                  suffixIcon: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 1), // Adjust the horizontal padding
                    child: IconButton(
                      icon: const Icon(
                          Icons.search), // Icon for the search action
                      onPressed: () {
                        // Handle search action
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
            height:
                20), // Add some space between the search bar and the existing content
        const Align(
          alignment: Alignment.center,
          child: Text('Profile Body Content'), // Existing content
        ),
      ],
    );
  }
}
