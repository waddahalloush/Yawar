// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:yawar_test/Core/error/failures.dart';
import 'package:yawar_test/Core/network/network_info.dart';
import 'package:yawar_test/features/Posts/data/datasources/post_remote_datasource.dart';
import 'package:yawar_test/features/Posts/domain/entities/post.dart';
import 'package:yawar_test/features/Posts/domain/repositories/posts_repository.dart';

import '../../../../Core/Helpers/map_exception_to_failure.dart';

class PostsRepositoryImp implements PostsRepository {
  final NetworkInfo networkInfo;
  final PostRemoteDataSource postRemoteDataSource;
  PostsRepositoryImp({
    required this.networkInfo,
    required this.postRemoteDataSource,
  });

  @override
  Future<Either<Failure, String>> addPost(Map<String, dynamic> postData) async{
     if (await networkInfo.isConnected) {
      try {
        final data = await postRemoteDataSource.addPost(postData);

        return Right(data);
      } on Exception catch (e) {
        return left(mapExceptionToFailure(e));
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, PostData>> getAllPosts(int page) async {
    if (await networkInfo.isConnected) {
      try {
        final data = await postRemoteDataSource.getAllPosts(page);

        return Right(data);
      } on Exception catch (e) {
        return left(mapExceptionToFailure(e));
      }
    } else {
      return Left(NoInternetFailure());
    }
  }
}
