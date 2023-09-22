part of 'posts_cubit.dart';

enum PostStatus { loading, success, error }

@freezed
class PostsState with _$PostsState {
  const factory PostsState({
    required PostStatus status,
    required PostData posts,
    required bool hasReachedMax,
    required String errorMessage,
  }) = _PostsState;

  factory PostsState.initial() => PostsState(status: PostStatus.loading, posts: PostData(currentPage: 0, lastPage: 0, posts: []), hasReachedMax: false, errorMessage: '');
}

