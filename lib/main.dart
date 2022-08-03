import 'package:bloc_learing/constant/theme.dart';
import 'package:bloc_learing/theme_bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final stroage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  HydratedBlocOverrides.runZoned(
    () => runApp(const MyApp()),
    storage: stroage,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc(),
        )
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: state.themeMode
                ? AppThemes.appThemeData[AppTheme.darkTheme]
                : AppThemes.appThemeData[AppTheme.lightTheme],
            home: const MyHomePage(),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('theme'),
        actions: [
          Container(
            width: 60,
            child: BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return Switch(
                    value: state.themeMode,
                    onChanged: (c) {
                      c
                          ? context.read<ThemeBloc>().add(ThemeLightEvent())
                          : context.read<ThemeBloc>().add(ThemeDarkEvent());
                    });
              },
            ),
          ),
        ],
      ),
      body: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Theme Mode: ${state.themeMode.toString()}',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Switch(
                    value: state.themeMode,
                    onChanged: (v) {
                      v
                          ? context.read<ThemeBloc>().add(ThemeLightEvent())
                          : context.read<ThemeBloc>().add(ThemeDarkEvent());
                    })
              ],
            ),
          );
        },
      ),
    );
  }
}
