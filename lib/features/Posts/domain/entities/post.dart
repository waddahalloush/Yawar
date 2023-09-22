// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class PostData extends Equatable {
  final int currentPage;
  final int lastPage;
  final List<Post> posts;
  PostData({
    required this.currentPage,
    required this.lastPage,
    required this.posts,
  });

  @override
  List<Object> get props => [currentPage, lastPage, posts];
}

class Post extends Equatable {
  final String content;
  final String name;
  final int commentsCount;
  final int sharesCount;
  final int tagsCount;
  final bool hasMedia;
  final InteractionsCountTypes interactionsCountTypes;
  final List<Media> media;
  Post({
    required this.content,
    required this.name,
    required this.commentsCount,
    required this.sharesCount,
    required this.tagsCount,
    required this.hasMedia,
    required this.interactionsCountTypes,
    required this.media,
  });

  @override
  List<Object> get props {
    return [
      content,
      name,
      commentsCount,
      sharesCount,
      tagsCount,
      hasMedia,
      interactionsCountTypes,
      media,
    ];
  }
}

class InteractionsCountTypes extends Equatable {
  final int like;
  final int love;
  final int care;
  final int haha;
  final int wow;
  final int sad;
  final int angry;
  InteractionsCountTypes({
    required this.like,
    required this.love,
    required this.care,
    required this.haha,
    required this.wow,
    required this.sad,
    required this.angry,
  });

  @override
  List<Object> get props {
    return [
      like,
      love,
      care,
      haha,
      wow,
      sad,
      angry,
    ];
  }
}

class Media extends Equatable {
  final String mediaType;
  final String srcUrl;
  Media({
    required this.mediaType,
    required this.srcUrl,
  });

  @override
  List<Object> get props => [mediaType, srcUrl];
}
