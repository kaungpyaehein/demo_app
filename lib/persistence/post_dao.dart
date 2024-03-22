import 'package:hive_flutter/hive_flutter.dart';
import 'package:iapp_flutter_interview_app/data/vos/post_vo.dart';
import 'package:iapp_flutter_interview_app/persistence/hive_constants.dart';

class PostsDao {
  /// Must be singleton
  static final PostsDao _singleton = PostsDao._internal();

  factory PostsDao() {
    return _singleton;
  }
  PostsDao._internal();

  /// SAVE POSTS FROM NETWORK
  void savePosts(List<PostVO> posts) async {
     getPostsBox().clear();
    Map<int, PostVO> postMap = {for (var post in posts) post.id ?? 0: post};
    await getPostsBox().putAll(postMap);
  }

  //// EDIT A POST IN HIVE
  void editPost(PostVO post) async {
    await getPostsBox().put(post.id, post);
  }

  /// CREATE NEW POST in Hive
  void addNewPost(PostVO post) async {
    await getPostsBox().put(post.id, post);
  }

  /// GET ALL POSTS
  List<PostVO>? getAllPosts() {
    return getPostsBox().values.toList();
  }

  /// GET ONE POST
  PostVO? getPostById(int id) {
    return getPostsBox().get(id);
  }

  /// DELETE ONE POST
  void deletePostAtId(int id) {
    getPostsBox().delete(id);
  }
  void deleteAllPosts() {
    getPostsBox().clear();
  }

  /// Get POSTS Box from HIVE
  Box<PostVO> getPostsBox() {
    return Hive.box<PostVO>(kBoxNamePostVO);
  }
}
