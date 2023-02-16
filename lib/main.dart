import 'package:camera_image/pages/home.dart';
import 'package:camera_image/providers/image_path_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ImagePathProvider(),
        )
      ],
      child: const MaterialApp(
        home: Home(),
      ),
    );
  }
}
