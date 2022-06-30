import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts/business_logic/characters_cubit/characters_cubit.dart';
import 'package:posts/business_logic/locale_cubit/locale_cubit.dart';
import 'package:posts/config/routers/routes.dart';
import 'package:posts/core/utils/app_strings.dart';
import 'package:posts/data/models/characters.dart';
import 'package:posts/data/repository/characters_repository.dart';
import 'package:posts/data/web_services/characters_web_service.dart';
import 'package:posts/presentation/screens/character_details_screen.dart';
import 'package:posts/presentation/screens/characters_screen.dart';
import 'package:posts/presentation/screens/splash_screen.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;
  late LocaleCubit localeCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebService());
    charactersCubit = CharactersCubit(charactersRepository);
    localeCubit = LocaleCubit();
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => localeCubit,
            child: SplashScreen(),
          ),
        );

      case Routes.allCharactersRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                charactersCubit..retrieveAllCharacters(),
            child: AllCharactersScreen(),
          ),
        );

      case Routes.characterDetailsRoute:
        final character = settings.arguments as Users;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charactersCubit,
            child: CharacterDetailsScreen(
              user: character,
            ),
          ),
        );

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
