// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:yawar_test/Core/error/failures.dart';
import 'package:yawar_test/Core/usecases/usecase.dart';
import '../entities/post.dart';
import '../repositories/posts_repository.dart';

class GetAllPostsUsecase implements UseCase<PostData, int> {
  final PostsRepository postsRepository;
  GetAllPostsUsecase({
    required this.postsRepository,
  });

  @override
  Future<Either<Failure,PostData>> call(int params) async {
    return await postsRepository.getAllPosts(params);
  }
}
