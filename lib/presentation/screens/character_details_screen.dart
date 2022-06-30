import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts/business_logic/characters_cubit/characters_cubit.dart';
import 'package:posts/core/utils/app_colors.dart';
import 'package:posts/core/utils/app_responsive.dart';
import 'package:posts/core/utils/assets_manager.dart';
import 'package:posts/data/models/characters.dart';
import 'package:posts/presentation/widgets/post_item.dart';

class CharacterDetailsScreen extends StatelessWidget {
  static const routeName = '/character-details-screen';
  final Users user;
  const CharacterDetailsScreen({Key? key, required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List userPosts = BlocProvider.of<CharactersCubit>(context)
        .allCharacters!
        .posts!
        .where((element) => element.userId == user.userId)
        .toList();
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(user.name!),
      ),
      body: Column(
        children: [
          Container(
            height: 250.hp,
            width: double.infinity,
            color: AppColors.scaffoldBackgroundColor,
            child: user.url!.isNotEmpty
                ? FadeInImage.assetNetwork(
                    placeholder: ImageAssets.loadingIMG,
                    image: user.url!,
                    fit: BoxFit.cover,
                  )
                : Image.asset(ImageAssets.placeHolderIMG),
          ),
          SizedBox(height: 30.hp),
          Expanded(
            child: ListView.builder(
              itemCount: userPosts.length,
              itemBuilder: (context, index) {
                return PostItem(post: userPosts[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
