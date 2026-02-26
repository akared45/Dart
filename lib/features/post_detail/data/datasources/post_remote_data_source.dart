import 'dart:convert';
import 'package:api_hw/core/utils/constants.dart';
import 'package:http/http.dart' as http;
import '../../../../core/error/failures.dart';
import '../models/post_model.dart';

abstract class PostRemoteDataSource {
  Future<PostModel> getPost(int id);
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final http.Client client;

  PostRemoteDataSourceImpl({required this.client});

  @override
  Future<PostModel> getPost(int id) async {
    final url = '${AppConstants.baseUrl}/posts/$id';
    final response = await client
        .get(Uri.parse(url), headers: {'Content-Type': 'application/json'})
        .timeout(const Duration(milliseconds: AppConstants.connectionTimeout));

    if (response.statusCode == 200) {
      return PostModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
