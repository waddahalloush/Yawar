import '../../domain/entities/post.dart';

class PostDataModel extends PostData {
  PostDataModel(
      {required super.currentPage,
      required super.lastPage,
      required super.posts});
  factory PostDataModel.fromJson(Map<String, dynamic> json) {
    return PostDataModel(
        currentPage: json['current_page'],
        lastPage: json['last_page'],
        posts: List<Post>.from(
            (json['items'] as List).map((e) => PostModel.fromJson(e))));
  }
}

class PostModel extends Post {
  PostModel(
      {required super.content,
      required super.name,
      required super.commentsCount,
      required super.sharesCount,
      required super.tagsCount,
      required super.hasMedia,
      required super.interactionsCountTypes,
      required super.media});
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        content: json['content']??"",
        name: json['model']['name'],
        commentsCount: json['comments_count'],
        sharesCount: json['shares_count'],
        tagsCount: json['tags_count'],
        hasMedia: json['has_media'],
        interactionsCountTypes: InteractionsCountTypesModel.fromJson(
            json['interactions_count_types']),
        media: List<Media>.from(
            (json['media'] as List).map((e) => MediaModel.fromJson(e))));
  }
}

class InteractionsCountTypesModel extends InteractionsCountTypes {
  InteractionsCountTypesModel(
      {required super.like,
      required super.love,
      required super.care,
      required super.haha,
      required super.wow,
      required super.sad,
      required super.angry});
  factory InteractionsCountTypesModel.fromJson(Map<String, dynamic> json) {
    return InteractionsCountTypesModel(
        like: json['like'],
        love: json['love'],
        care: json['care'],
        haha: json['haha'],
        wow: json['wow'],
        sad: json['sad'],
        angry: json['angry']);
  }
}

class MediaModel extends Media {
  MediaModel({required super.mediaType, required super.srcUrl});
  factory MediaModel.fromJson(Map<String, dynamic> json) {
    return MediaModel(mediaType: json['media_type'], srcUrl: json['src_url']);
  }
}
