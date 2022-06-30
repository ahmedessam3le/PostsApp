import 'package:flutter/material.dart';
import 'package:posts/core/utils/app_colors.dart';
import 'package:posts/core/utils/app_responsive.dart';
import 'package:posts/data/models/characters.dart';

class PostItem extends StatelessWidget {
  final Posts post;
  const PostItem({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.r),
      child: Container(
        width: double.infinity,
        height: 150.hp,
        decoration: BoxDecoration(
          color: AppColors.hintColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          children: [
            SizedBox(height: 20.hp),
            Text(
              post.title!,
              style: Theme.of(context).textTheme.bodyText1,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.hp),
            Expanded(
              child: Text(
                post.body!,
                style: Theme.of(context).textTheme.subtitle2,
                // overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
