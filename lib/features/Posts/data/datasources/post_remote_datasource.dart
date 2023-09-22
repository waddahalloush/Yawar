// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:yawar_test/Core/Api/api_consumer.dart';
import 'package:yawar_test/Core/Api/end_points.dart';
import 'package:yawar_test/features/Posts/data/models/post_model.dart';

abstract class PostRemoteDataSource {
  Future<PostDataModel> getAllPosts(int page);
  Future<String> addPost(Map<String, dynamic> postData);
}

class PostRemoteDataSourceImp implements PostRemoteDataSource {
  final ApiConsumer apiConsumer;
  PostRemoteDataSourceImp({
    required this.apiConsumer,
  });

  @override
  Future<String> addPost(Map<String, dynamic> postData) async {
    var res = await apiConsumer.post(EndPoints.addPost, body:postData['src_url']==null?{  "content": postData['content']}: {
      "content": postData['content'], //required without media.
      "media": [
        {
          "src_url": postData['src_url'], //required

          "media_type": "Image", //required
          "mime_type": "jpeg", //required
          "fullPath":
              "posts/${postData['src_url']}", //required ex:posts/media-3702f

          "size": 8242 //required
        }
      ],
    });
    return res['message'];
  }

  @override
  Future<PostDataModel> getAllPosts(int page) async {
    var res = await apiConsumer.get(EndPoints.getPosts, queryParameter: {
      'limit': 10,
      'page': page,
    });
    return PostDataModel.fromJson(res['data']);
  }
}
