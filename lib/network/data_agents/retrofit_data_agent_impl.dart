import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:iapp_flutter_interview_app/data/vos/post_vo.dart';
import 'package:iapp_flutter_interview_app/network/app_api.dart';
import 'package:iapp_flutter_interview_app/network/data_agents/data_agent.dart';

import '../../data/vos/error_vo.dart';
import '../../exception/custom_exception.dart';

class RetrofitDataAgentImpl extends DemoAppDataAgent {
  //demo app api as a dependency
  late DemoAppApi appApi;

  //setup singleton
  static RetrofitDataAgentImpl? _singleton;

  factory RetrofitDataAgentImpl() {
    _singleton ??= RetrofitDataAgentImpl._internal();
    return _singleton!;
  }

  RetrofitDataAgentImpl._internal() {
    final dio = Dio();
    appApi = DemoAppApi(dio);
  }

  @override
  Future<List<PostVO>> getPosts() {
    return appApi.getPostList().catchError(
      (error) {
        throw _createException(error);
      },
    );
  }

  CustomException _createException(dynamic error) {
    ErrorVO errorVO;
    if (error is DioException) {
      errorVO = _parseDioError(error);
    } else {
      errorVO = ErrorVO(
        statusCode: 0,
        statusMessage: "Unexpected Error",
        success: false,
      );
    }
    return CustomException(errorVO);
  }

  ErrorVO _parseDioError(DioException error) {
    try {
      if (error.response != null && error.response!.data != null) {
        var data = error.response!.data;

        ///Json parsing to map<string,dynamic>
        if (data is String) {
          data = jsonDecode(data);
        }

        /// Map<String,dynamic> to ErrorVO
        return ErrorVO.fromJson(data);
      } else {
        return ErrorVO(
          statusCode: 0,
          statusMessage: "No response data",
          success: false,
        );
      }
    } catch (e) {
      return ErrorVO(
        statusCode: 0,
        statusMessage: "Invalid DioException Format $e",
        success: false,
      );
    }
  }
}
