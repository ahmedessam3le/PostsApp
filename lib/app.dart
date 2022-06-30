import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts/business_logic/locale_cubit/locale_cubit.dart';
import 'package:posts/config/locale/app_localizations_setup.dart';
import 'package:posts/config/routers/app_router.dart';
import 'package:posts/config/themes/app_theme.dart';
import 'package:posts/core/utils/app_strings.dart';

class PostsApp extends StatelessWidget {
  PostsApp({Key? key}) : super(key: key);

  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocaleCubit()..getSavedLanguage(),
        ),
      ],
      child: BlocConsumer<LocaleCubit, LocaleStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            theme: appTheme(),
            onGenerateRoute: appRouter.generateRoute,
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            localeListResolutionCallback:
                AppLocalizationsSetup.localeResolutionCallback,
            localizationsDelegates:
                AppLocalizationsSetup.localizationsDelegates,
            locale: state.locale,
          );
        },
      ),
    );
  }
}
