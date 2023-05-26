import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/post.dart';
import '../repository/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository _repository;

  PostBloc(this._repository) : super(const PostState()) {
    on<GetAllPosts>(_getPosts);
  }

  void _getPosts(PostEvent event, Emitter<PostState> emit) async {
    emit(state.copyWith(status: PostStatus.loading));
    try {
      final posts = await _repository.getPosts();
      emit(state.copyWith(posts: posts, status: PostStatus.success));
    } catch(e) {
      emit(state.copyWith(status: PostStatus.failure, errorMessage: e.toString()));
    }
  }
}
