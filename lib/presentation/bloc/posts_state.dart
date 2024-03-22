part of 'posts_bloc.dart';

@immutable
sealed class PostsState {}

final class PostsInitial extends PostsState {}

final class GetPostsLoadingState extends PostsState {}

final class GetPostsSuccessState extends PostsState {
  final List<PostVO> postVOList;

  GetPostsSuccessState({required this.postVOList});
}

final class GetPostsFailureState extends PostsState {
  final String errorMessage;

  GetPostsFailureState({required this.errorMessage});
}

final class DeletePostSuccessState extends PostsState {}

final class AddPostSuccessState extends PostsState {}
