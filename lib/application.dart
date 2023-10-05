import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:let_tutor/presentation/app_setting/bloc/app_setting_bloc.dart';
import 'package:let_tutor/routes/routes.dart';
import 'package:localization/localization.dart';

class Application extends StatefulWidget {
  final AdaptiveThemeMode? themeSaved;
  final String initialRoute;
  final String title;
  final GlobalKey<NavigatorState>? navigationKey;
  final ThemeData? themeData;
  final List<BlocProvider> providers;

  const Application({
    Key? key,
    this.themeSaved,
    required this.initialRoute,
    required this.title,
    this.navigationKey,
    this.themeData,
    required this.providers,
  }) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  Widget _buildMaterialApp(
      {required String lang, ThemeData? light, ThemeData? dark}) {
    final locale = S.delegate.supportedLocales
            .firstWhereOrNull((element) => element.languageCode == lang) ??
        S.delegate.supportedLocales.first;

    return MaterialApp(
      title: widget.title,
      theme: light,
      darkTheme: dark,
      localizationsDelegates: [
        ...AppLocalization.localizationsDelegates,
      ],
      supportedLocales: AppLocalization.supportedLocales,
      locale: locale,
      debugShowCheckedModeBanner: false,
      routes: Routes.getAll(),
      initialRoute: widget.initialRoute,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData.light(useMaterial3: true)
      // .copyWith(
      //   primaryColor: const Color.fromARGB(1, 1, 82, 176),
      //   colorScheme: const ColorScheme.light().copyWith(
      //     primary: Color.fromARGB(1, 1, 82, 176),
      //     onPrimary: Color.fromARGB(1, 1, 82, 176),
      //   ),
      // )
      ,
      dark: ThemeData.dark(useMaterial3: true)
      // .copyWith(
      //   primaryColor: Color.fromARGB(1, 53, 136, 231),
      //   colorScheme: ColorScheme.dark().copyWith(
      //     primary: Color.fromARGB(1, 1, 82, 176),
      //     onPrimary: Color.fromARGB(1, 53, 136, 231),
      //   ),
      // )
      ,
      initial: widget.themeSaved ?? AdaptiveThemeMode.light,
      builder: (ThemeData light, ThemeData dark) => MultiBlocProvider(
        providers: widget.providers,
        child: BlocBuilder<AppSettingBloc, AppSettingState>(
          builder: (_, state) => _buildMaterialApp(
            lang: state.langCode,
            light: light,
            dark: dark,
          ),
        ),
      ),
    );
  }
}
