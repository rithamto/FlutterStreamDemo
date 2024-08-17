import 'package:flutter/material.dart';
import 'package:flutter_stream_demo/stream_logic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyStreamApp(),
    );
  }
}

class MyStreamApp extends StatefulWidget {
  const MyStreamApp({super.key});

  @override
  _MyStreamAppState createState() => _MyStreamAppState();
}

class _MyStreamAppState extends State<MyStreamApp> {
  final stream = StreamLogic();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.send),
        onPressed: () {
          stream.imageStream();
        },
      ),
      body: Scaffold(
        body: Center(
          child: StreamBuilder<String>(
            stream: stream.mainStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Image.network(snapshot.data!);
              } else if (snapshot.hasError) {
                return Text('Lỗi: ${snapshot.error}');
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
