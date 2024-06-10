import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timesheet_app/core/common/blocs/internet_bloc/internet_bloc.dart';
import 'package:timesheet_app/core/common/utils/custom_text_style.dart';
import 'package:timesheet_app/core/common/widgets/colored_button.dart';
import 'package:timesheet_app/core/constants/app_strings.dart';
import 'package:timesheet_app/core/theme/app_colors.dart';
import 'package:timesheet_app/core/theme/brightness.dart';
import 'package:timesheet_app/core/theme/theme_colors.dart';
import 'package:timesheet_app/core/utility_functions/show_snackbar.dart';
import 'package:timesheet_app/features/home/presentation/bloc/timesheet_bloc.dart';
import 'package:timesheet_app/features/home/presentation/pages/timesheet_form_page.dart';
import 'package:timesheet_app/features/home/presentation/widgets/app_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: ThemeColors.onPrimary(context)),
        backgroundColor: ThemeColors.primary(context),
        title: Text(
          AppStrings.appName,
          style: CustomTextStyle.appBarTextStyle(context),
        ),
      ),
      body: BlocConsumer<InternetBloc, InternetState>(
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
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                color: Theme.of(context).brightness == Brightness.light
                    ? containerColorLight
                    : containerColorDark,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'TIMESHEETS',
                      style: TextStyle(
                        color: getBrightness(context) == Brightness.light
                            ? textColorLight
                            : textColorDark,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ColoredButton(
                      iconData: Icons.add,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const TimeSheetFormPage()));
                      },
                      color: Colors.green,
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
