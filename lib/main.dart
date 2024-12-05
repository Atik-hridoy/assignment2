import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/post_model.dart';
import 'screens/post_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(PostModelAdapter());
  await Hive.openBox<PostModel>('posts');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Offline Viewer',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PostScreen(),
    );
  }
}
