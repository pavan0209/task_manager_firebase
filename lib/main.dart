import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:task_manager_firebase/app.dart';
import 'package:task_manager_firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

