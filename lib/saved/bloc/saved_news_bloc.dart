import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:news_repository/news_repository.dart';

part 'saved_news_event.dart';
part 'saved_news_state.dart';

class SavedNewsBloc extends HydratedBloc<SavedNewsEvent, SavedNewsState> {
  SavedNewsBloc() : super(const SavedNewsState()) {
    on<SavedNewsEvent>((event, emit) {
      if (event is SavedNewsAdded) {
        final currentSavedArticles = List<Article>.from(state.savedArticles)
          ..add(event.article);

        emit(SavedNewsState(savedArticles: currentSavedArticles));
      }
    });
  }

  @override
  SavedNewsState fromJson(Map<String, dynamic> json) {
    return SavedNewsState.fromMap(json);
  }

  @override
  Map<String, dynamic> toJson(SavedNewsState state) {
    return state.toMap();
  }
}
