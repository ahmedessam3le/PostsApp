import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:posts/business_logic/characters_cubit/characters_cubit.dart';
import 'package:posts/config/locale/app_localizations.dart';
import 'package:posts/core/utils/app_colors.dart';
import 'package:posts/core/utils/app_constants.dart';
import 'package:posts/presentation/screens/splash_screen.dart';
import 'package:posts/presentation/widgets/character_item.dart';

import '../../business_logic/locale_cubit/locale_cubit.dart';

class AllCharactersScreen extends StatelessWidget {
  const AllCharactersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CharactersCubit, CharactersStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CharactersCubit.of(context);
        return Scaffold(
          backgroundColor: AppColors.scaffoldBackgroundColor,
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.translate('app_name')!),
            actions: [
              IconButton(
                onPressed: () {
                  if (AppLocalizations.of(context)!.isEnLocale) {
                    BlocProvider.of<LocaleCubit>(context).toArabic();
                  } else {
                    BlocProvider.of<LocaleCubit>(context).toEnglish();
                  }
                },
                icon: Icon(
                  Icons.translate_outlined,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          body: OfflineBuilder(
            connectivityBuilder: (
              BuildContext context,
              ConnectivityResult connectivity,
              Widget child,
            ) {
              final bool connected = connectivity != ConnectivityResult.none;
              if (connected) {
                return ConditionalBuilder(
                  condition: state is! CharactersLoadingState &&
                      cubit.allCharacters != null,
                  builder: (context) => ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: cubit.allCharacters!.users!.length,
                    itemBuilder: (ctx, index) {
                      return CharacterItem(
                        user: cubit.allCharacters!.users![index],
                      );
                    },
                  ),
                  fallback: (context) => AppConstants.showLoadingIndicator(),
                );
              } else {
                return AppConstants.buildNoInternetWidget(context);
              }
            },
            child: SplashScreen(),
          ),
        );
      },
    );
  }
}
