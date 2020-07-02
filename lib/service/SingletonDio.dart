import 'package:dio/dio.dart';

class SingletonDio {
  static final SingletonDio _singleton = SingletonDio._internal();

  factory SingletonDio() => _singleton;

  Dio dio;

  Dio getEntityManagerFactory() {
    if (dio == null) {
      dio = new Dio(
        BaseOptions(
          baseUrl: "https://pokeapi.co/api/v2",
        ),
      );
    }
    return dio;
  }

  SingletonDio._internal();
}
