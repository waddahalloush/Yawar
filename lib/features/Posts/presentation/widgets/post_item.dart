import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heroicons/heroicons.dart';
import 'package:yawar_test/Core/Config/Extensions/media_query_ex.dart';

import '../../domain/entities/post.dart';
import 'action_button.dart';
import 'image_viewer.dart';
import 'video_player.dart';

class PostItem extends StatelessWidget {
  const PostItem({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      padding: EdgeInsets.all(5.w),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 5,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              HeroIcon(
                HeroIcons.userCircle,
                style: HeroIconStyle.solid,
                color: Colors.grey,
                size: 15.sp,
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                post.name,
                style: Theme.of(context).primaryTextTheme.labelSmall,
              ),
              SizedBox(
                width: 5.w,
              ),
              HeroIcon(
                HeroIcons.checkBadge,
                style: HeroIconStyle.solid,
                color: Colors.indigo,
                size: 15.sp,
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: HeroIcon(HeroIcons.ellipsisHorizontal,
                    style: HeroIconStyle.outline),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            post.content,
            style: Theme.of(context).primaryTextTheme.bodyMedium,
          ),
          if (post.media.isNotEmpty && post.media[0].mediaType == "Image")
            ImageViewer(url: post.media[0].srcUrl),
          if (post.media.isNotEmpty && post.media[0].mediaType == "Video")
            VideoPlayerWidget(videoUrl: post.media[0].srcUrl),
          SizedBox(
            height: 10.h,
          ),
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ActionButton(
                  label: post.commentsCount.toString(),
                  heroIcons: HeroIcons.chatBubbleLeft,
                  heroIconStyle: post.commentsCount != 0
                      ? HeroIconStyle.solid
                      : HeroIconStyle.outline,
                  color: post.commentsCount != 0 ? Colors.indigo : null,
                ),
                ActionButton(
                  label: post.interactionsCountTypes.love.toString(),
                  heroIcons: HeroIcons.heart,
                  heroIconStyle: post.interactionsCountTypes.love != 0
                      ? HeroIconStyle.solid
                      : HeroIconStyle.outline,
                  color:
                      post.interactionsCountTypes.love != 0 ? Colors.red : null,
                  onTap: () {},
                ),
                ActionButton(
                  label: post.interactionsCountTypes.haha.toString(),
                  heroIcons: HeroIcons.faceSmile,
                  heroIconStyle: post.interactionsCountTypes.haha != 0
                      ? HeroIconStyle.solid
                      : HeroIconStyle.outline,
                  color: post.interactionsCountTypes.haha != 0
                      ? Colors.amber
                      : null,
                  onTap: () {},
                ),
                ActionButton(
                  label: post.interactionsCountTypes.sad.toString(),
                  heroIcons: HeroIcons.faceFrown,
                  heroIconStyle: post.interactionsCountTypes.sad != 0
                      ? HeroIconStyle.solid
                      : HeroIconStyle.outline,
                  color: post.interactionsCountTypes.sad != 0
                      ? Colors.orange
                      : null,
                  onTap: () {},
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Text(
                    "${post.sharesCount} مشاركة",
                    style: Theme.of(context).primaryTextTheme.labelSmall,
                  ),
                )
              ],
            ),
          ),
          Divider(color: Colors.grey, thickness: 0.2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ActionButton(
                onTap: () {},
                label: "أعجبني",
                heroIcons: HeroIcons.handThumbUp,
                heroIconStyle: HeroIconStyle.outline,
              ),
              ActionButton(
                onTap: () {},
                label: "تعليق",
                heroIcons: HeroIcons.chatBubbleBottomCenter,
                heroIconStyle: HeroIconStyle.outline,
              ),
              ActionButton(
                onTap: () {},
                label: "مشاركة",
                heroIcons: HeroIcons.share,
                heroIconStyle: HeroIconStyle.outline,
              ),
            ],
          ),
          Divider(color: Colors.grey, thickness: 0.2),
        ],
      ),
    );
  }
}
