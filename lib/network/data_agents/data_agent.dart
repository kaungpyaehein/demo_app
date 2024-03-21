
import 'package:iapp_flutter_interview_app/data/vos/post_vo.dart';

abstract class DemoAppDataAgent{

  Future<List<PostVO>> getPosts();
}