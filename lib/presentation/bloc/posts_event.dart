part of 'posts_bloc.dart';

@immutable
sealed class PostsEvent {}

final class GetAllPostsEvent extends PostsEvent {}

final class OnDeletePostEvent extends PostsEvent {
  final int id;

  OnDeletePostEvent({required this.id});
}

final class OnEditPostConfirmEvent extends PostsEvent {
  final PostVO postVO;

  OnEditPostConfirmEvent({required this.postVO});
}

final class OnAddPostConfirmedEvent extends PostsEvent {
  final PostVO postVO;

  OnAddPostConfirmedEvent({required this.postVO});
}
