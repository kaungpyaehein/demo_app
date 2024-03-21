//
//
//
//
//
// abstract class  DemoAppApi{
//   /// Dio as the parameter
//   factory DemoAppApi(Dio dio,) = _DemoAppApi;
//   //
//   // @GET(kEndPointGetNowPlaying)
//   // Future<MovieListResponse?> getNowPlayingMovies(
//   //   @Query(kParamApiKey) String apiKey,
//   //   @Query(kParamLanguage) String language,
//   //   @Query(kParamPage) String page,
//   // );
//
// }

import 'package:dio/dio.dart';
import 'package:iapp_flutter_interview_app/data/vos/post_vo.dart';
import 'package:iapp_flutter_interview_app/network/api_constants.dart';
import 'package:retrofit/http.dart';

part "app_api.g.dart";

@RestApi(baseUrl: kBaseUrl)
abstract class DemoAppApi {
  factory DemoAppApi(
    Dio dio,
  ) = _DemoAppApi;

  @GET(kEndPointPosts)
  Future<List<PostVO>> getPostList();
}
