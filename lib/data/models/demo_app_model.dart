import 'package:flutter/foundation.dart';
import 'package:iapp_flutter_interview_app/data/vos/post_vo.dart';
import 'package:iapp_flutter_interview_app/network/data_agents/data_agent.dart';
import 'package:iapp_flutter_interview_app/persistence/post_dao.dart';

import '../../network/data_agents/retrofit_data_agent_impl.dart';

class DemoAppModel {
  static DemoAppModel? _singleton;

  factory DemoAppModel() {
    _singleton ??= DemoAppModel._internal();
    return _singleton!;
  }
  DemoAppModel._internal();

  /// Dao of Hive or Dependency of Persistence Layer
  final PostsDao _postsDao = PostsDao();

  // /Data agent or Dependency of Network Layer
  DemoAppDataAgent mDataAgent = RetrofitDataAgentImpl();

  /// GET POSTS FROM NETWORK
  Future<List<PostVO>> getAllPosts() {
    debugPrint("getAlliscalled");
    return mDataAgent.getPosts().then((posts) {
      /// SAVE POST TO LOCAL STORAGE
      _postsDao.savePosts(posts);
      return posts;
    });
  }

  /// GET POSTS FROM LOCAL STORAGE
  List<PostVO> getAllPostsFromLocalStorage() {
    return _postsDao.getAllPosts() ?? [];
  }

  void deletePostById(id) {
    return _postsDao.deletePostAtId(id);
  }

  void addNewPost(PostVO postVO) {
    return _postsDao.addNewPost(postVO);
  }

  void editPost(PostVO postVO) {
    return _postsDao.editPost(postVO);
  }
  void deletePostFromLocalStorage() {
    return _postsDao.deleteAllPosts();
  }

}
