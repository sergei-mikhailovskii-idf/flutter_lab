import 'package:dio/dio.dart';
import 'package:domain/repository/base_repository.dart';

abstract class ApiBaseRepositoryImpl implements BaseRepository {
  final CancelToken? cancelToken;

  ApiBaseRepositoryImpl({this.cancelToken});

  @override
  void dispose() => cancelToken?.cancel();
}
