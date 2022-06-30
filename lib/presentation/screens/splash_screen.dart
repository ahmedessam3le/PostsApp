import 'dart:async';

import 'package:flutter/material.dart';
import 'package:posts/config/locale/app_localizations.dart';
import 'package:posts/config/routers/routes.dart';
import 'package:posts/core/utils/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  _goNext() =>
      Navigator.of(context).pushReplacementNamed(Routes.allCharactersRoute);

  _startDelay() {
    _timer = Timer(Duration(milliseconds: 2000), _goNext);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          AppLocalizations.of(context)!.translate('app_name')!,
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(color: AppColors.hintColor),
        ),
      ),
    );
  }
}
