import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timesheet_app/core/common/blocs/theme_cubit.dart';
import 'package:timesheet_app/core/theme/theme_colors.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Center(
              child: Column(
                children: [
                  Icon(
                    Icons.timer_sharp,
                    color: ThemeColors.onPrimary(context),
                    size: 30,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Timesheet App',
                    style: TextStyle(
                      color: ThemeColors.onPrimary(context),
                      fontSize: 20
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: const Text('Dark Mode'),
            trailing: Platform.isIOS
                ? CupertinoSwitch(
                    value: context.read<ThemeCubit>().state == ThemeMode.dark,
                    onChanged: (bool value) {
                      context.read<ThemeCubit>().toggleTheme();
                    },
                  )
                : Switch(
                    value: context.read<ThemeCubit>().state == ThemeMode.dark,
                    onChanged: (bool value) {
                      context.read<ThemeCubit>().toggleTheme();
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
