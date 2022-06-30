import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts/config/routers/routes.dart';
import 'package:posts/core/utils/app_colors.dart';
import 'package:posts/core/utils/app_responsive.dart';
import 'package:posts/core/utils/assets_manager.dart';
import 'package:posts/data/models/characters.dart';

import '../../business_logic/characters_cubit/characters_cubit.dart';

class CharacterItem extends StatelessWidget {
  final Users user;
  const CharacterItem({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userPosts = BlocProvider.of<CharactersCubit>(context)
        .allCharacters!
        .posts!
        .where((element) => element.userId == user.userId);
    return Container(
      width: double.infinity,
      height: 150.hp,
      margin: EdgeInsetsDirectional.all(8.r),
      padding: EdgeInsets.all(4.r),
      decoration: BoxDecoration(
        color: AppColors.hintColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: InkWell(
        onTap: () => Navigator.of(context)
            .pushNamed(Routes.characterDetailsRoute, arguments: user),
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: Row(
            children: [
              CircleAvatar(
                radius: 50.r,
                child: ClipOval(
                  child: user.thumbnailUrl!.isNotEmpty
                      ? FadeInImage.assetNetwork(
                          placeholder: ImageAssets.loadingIMG,
                          image: user.thumbnailUrl!,
                        )
                      : Image.asset(ImageAssets.placeHolderIMG),
                ),
              ),
              SizedBox(width: 20.wp),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      user.name!,
                      style: Theme.of(context).textTheme.bodyText1,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10.hp),
                    Text(
                      '${userPosts.length} Posts',
                      style: Theme.of(context).textTheme.bodyText1,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20.wp),
              InkWell(
                onTap: () => Navigator.of(context)
                    .pushNamed(Routes.characterDetailsRoute, arguments: user),
                child: Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
