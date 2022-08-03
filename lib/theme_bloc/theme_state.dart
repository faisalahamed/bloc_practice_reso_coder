part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final bool themeMode;
  const ThemeState({required this.themeMode});

  @override
  List<Object> get props => [themeMode];

  Map<String, dynamic> toMap() {
    return {'themeMode': themeMode};
  }

  factory ThemeState.fromMap(Map<String, dynamic> map) {
    return ThemeState(themeMode: map['themeMode']);
  }
}

class ThemeInitial extends ThemeState {
  const ThemeInitial({required themeMode}) : super(themeMode: themeMode);
}

class ThemeLightState extends ThemeState {
  const ThemeLightState({required themeMode}) : super(themeMode: themeMode);
}

class ThemeDarkState extends ThemeState {
  const ThemeDarkState({required themeMode}) : super(themeMode: themeMode);
}
