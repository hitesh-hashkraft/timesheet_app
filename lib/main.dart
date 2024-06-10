import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timesheet_app/core/common/blocs/internet_bloc/internet_bloc.dart';
import 'package:timesheet_app/core/common/blocs/theme_cubit.dart';
import 'package:timesheet_app/core/constants/app_strings.dart';
import 'package:timesheet_app/core/theme/theme.dart';
import 'package:timesheet_app/features/home/presentation/bloc/timesheet_bloc.dart';
import 'package:timesheet_app/features/home/presentation/pages/home_page.dart';
import 'package:timesheet_app/init_dependencies.dart';

void main() async {
  await initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => InternetBloc(),
        ),
        BlocProvider(
          create: (_) => ThemeCubit(),
        ),
        BlocProvider(
          create: (_) => serviceLocator<TimesheetBloc>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppStrings.appName,
          theme: getLightTheme(),
          darkTheme: getDarkTheme(),
          themeMode: themeMode,
          home: const HomePage(),
        );
      },
    );
  }
}
