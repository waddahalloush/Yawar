// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../Core/Helpers/map_failure_to_msg.dart';
import '../../../../Core/error/failures.dart';
import '../../domain/entities/post.dart';
import '../../domain/usecases/get_all_posts_usecase.dart';

part 'posts_cubit.freezed.dart';
part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final GetAllPostsUsecase getAllPostsUsecase;
  int currentPageIndex = 0;
  PostsCubit({
    required this.getAllPostsUsecase,
  }) : super(PostsState.initial());
  Future<void> getAllPosts(int page) async {
    if (state.hasReachedMax) return;

    Either<Failure, PostData> data = await getAllPostsUsecase(page);
    emit(data.fold(
        (l) => state.copyWith(
              errorMessage: mapFailureToMessage(l),
              status: PostStatus.error,
            ), (r) {
      if (r.posts.isNotEmpty) {
        currentPageIndex = r.currentPage+1;
        log(currentPageIndex.toString());
      }
      return r.posts.isEmpty
          ? state.copyWith(
              hasReachedMax: true,
              status: PostStatus.success,
            )
          : state.copyWith(
              hasReachedMax: false,
              status: PostStatus.success,
              posts: PostData(
                  currentPage: r.currentPage,
                  lastPage: r.lastPage,
                  posts: List.of(state.posts.posts)..addAll(r.posts)));
    }));
  }
}
