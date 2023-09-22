// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:yawar_test/Core/error/failures.dart';
import 'package:yawar_test/Core/usecases/usecase.dart';

import '../repositories/posts_repository.dart';

class AddPostUsecase implements UseCase<String, Map<String, dynamic>> {
  final PostsRepository postsRepository;
  AddPostUsecase({
    required this.postsRepository,
  });

  @override
  Future<Either<Failure, String>> call(Map<String, dynamic> params) async {
    return await postsRepository.addPost(params);
  }
}
