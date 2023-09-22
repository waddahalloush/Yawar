import 'package:dartz/dartz.dart';

import '../../../../Core/error/failures.dart';
import '../entities/post.dart';

abstract class PostsRepository {
  Future<Either<Failure, PostData>> getAllPosts(int page);
  Future<Either<Failure, String>> addPost(Map<String, dynamic> postData);
}
