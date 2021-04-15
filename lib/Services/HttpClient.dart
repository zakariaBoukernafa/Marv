import 'package:dio/dio.dart' as dio;
import 'package:get_storage/get_storage.dart';
import 'package:gql/language.dart' as gqlLang;
import 'package:gql_dio_link/gql_dio_link.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../config.dart';

class HttpClient {
  final dio.Dio client = dio.Dio();
  late Link link;
  final box = GetStorage();

  HttpClient() {
    this.link = DioLink(
      endpoint,
      client: client,
    );
  }

  Future<Response> post({bool storeCookie= false, required String gql, Map<String, String>? variables}) async {
    client.interceptors
        .add(dio.InterceptorsWrapper(onRequest: (options, handler) async {
      options.headers = {"cookie": await this.box.read("cookie") ?? ""};
      return handler.next(options);
    },
        onResponse: (response, handler) async {


      if (storeCookie) {
        await this.box.write("cookie", response.headers.value("set-cookie"));
      }

      return handler.next(response);
    }, onError: (dio.DioError e, handler) {
      return handler.next(e);
    }));
    Response res = await link
        .request(Request(
          operation:
              Operation(document: gqlLang.parseString(gql)),
          variables: variables ?? {},
        ))
        .first;


    return res;
  }
}
