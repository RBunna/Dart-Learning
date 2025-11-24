import 'package:flutter/material.dart';

import 'data/profile_data.dart';
import 'ui/screens/profile.dart';

class Week8Ex3 {
  void main() {
    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ProfileApp(profileData: ronanProfile),
      ),
    );
  }
}
