import 'package:bloc_learing/name_cububit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _nameCubit = NamesCubit();
  @override
  void initState() {
    super.initState();
    // _nameCubit = NamesCubit();
  }

  @override
  void dispose() {
    _nameCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit Test'),
      ),
      body: Center(
        child: Column(
          children: [
            StreamBuilder<String?>(
                stream: _nameCubit.stream,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return const Text('None');
                    case ConnectionState.waiting:
                      return const Text('Waiting');
                    case ConnectionState.active:
                      return Text(snapshot.data ?? '');
                    case ConnectionState.done:
                      return const Text('Done');
                  }
                }),
            ElevatedButton(
              child: const Text('Get new Name'),
              onPressed: () {
                _nameCubit.pickRandomName();
              },
            )
          ],
        ),
      ),
    );
  }
}
