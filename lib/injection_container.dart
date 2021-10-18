import 'package:get_it/get_it.dart';
import 'package:news_repository/news_repository.dart';
import 'package:portal_berita_indonesia/category/bloc/news_category_bloc.dart';
import 'package:portal_berita_indonesia/detail/bloc/recommendation_news_bloc.dart';
import 'package:portal_berita_indonesia/home/bloc/breaking_news_bloc.dart';
import 'package:portal_berita_indonesia/saved/bloc/saved_news_bloc.dart';
import 'package:portal_berita_indonesia/search/bloc/search_news_bloc.dart';

final services = GetIt.I;

Future<void> init() async {
  services
    // Blocs
    ..registerFactory<BreakingNewsBloc>(
        () => BreakingNewsBloc(newsRepository: services()))
    ..registerFactory<SavedNewsBloc>(() => SavedNewsBloc())
    ..registerFactory<NewsCategoryBloc>(
        () => NewsCategoryBloc(newsRepository: services()))
    ..registerFactory<SearchNewsBloc>(
        () => SearchNewsBloc(newsRepository: services()))
    ..registerFactory<RecommendationNewsBloc>(
        () => RecommendationNewsBloc(newsRepository: services()))
    // External dependencies
    ..registerLazySingleton<NewsRepository>(() => NewsRepository());
}
