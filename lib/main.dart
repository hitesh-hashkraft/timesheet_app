import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timesheet_app/core/common/blocs/internet_bloc/internet_bloc.dart';
import 'package:timesheet_app/core/constants/app_strings.dart';
import 'package:timesheet_app/core/theme/theme.dart';
import 'package:timesheet_app/core/theme/theme_colors.dart';
import 'package:timesheet_app/core/utility_functions/show_snackbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: getLightTheme(),
      darkTheme: getDarkTheme(),
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  InternetBloc internetBloc = InternetBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.primary(context),
        title: Text(
          AppStrings.appName,
          style: TextStyle(
            color: ThemeColors.onPrimary(context),
          ),
        ),
      ),
      body: BlocConsumer<InternetBloc, InternetState>(
        bloc: internetBloc,
        listener: (context, state) {
          if (state is InternetGainedState) {
            showSnackBar(
                context: context,
                message: 'Connected to Internet!',
                bgColor: Colors.green);
          } else if (state is InternetLostState) {
            showSnackBar(
              context: context,
              message: 'No Internet!',
              bgColor: Colors.red,
            );
          }
        },
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                FloatingActionButton(
                  backgroundColor: ThemeColors.secondary(context),
                  onPressed: () {},
                  child: Icon(
                    Icons.add,
                    color: ThemeColors.onSecondary(context),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
