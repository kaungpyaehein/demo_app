import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iapp_flutter_interview_app/data/models/demo_app_model.dart';
import 'package:meta/meta.dart';

import '../../data/vos/post_vo.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final DemoAppModel demoAppModel = DemoAppModel();

  PostsBloc() : super(PostsInitial()) {
    on<GetAllPostsEvent>((event, emit) {
      /// Show Loading or Loading state emit
      emit(GetPostsLoadingState());

      final List<PostVO> postsFromLocal =
          demoAppModel.getAllPostsFromLocalStorage();
      if (postsFromLocal.isEmpty) {
        /// Get posts from network
        demoAppModel.getAllPosts().then((posts) {
          /// EMIT SUCCESS STATE
          emit(GetPostsSuccessState(postVOList: posts));
        }).catchError((error) {
          /// EMIT FAIL STATE
          emit(GetPostsFailureState(errorMessage: error.toString()));
        });
      } else {
        emit(GetPostsSuccessState(postVOList: postsFromLocal));
      }
    });

    on<OnDeletePostEvent>(
      (event, emit) {
        demoAppModel.deletePostById(event.id);
        emit(DeletePostSuccessState());
      },
    );

    on<OnEditPostConfirmEvent>(
      (event, emit) {
        demoAppModel.editPost(event.postVO);
        emit(DeletePostSuccessState());
      },
    );
    on<OnAddPostConfirmedEvent>(
      (event, emit) {
        demoAppModel.addNewPost(event.postVO);
        emit(AddPostSuccessState());
      },
    );
  }
}
