import 'package:dio/dio.dart';

class FutureDataProcess {
  Future<Response> getRequest() async {
    Dio dio = new Dio();
    Response response =
        await dio.get("http://192.168.31.71:8080/flutter", data: {
      'name': 'warner',
      'userInfo': {'user': 'get_warner', 'age': 18}
    });
    print('rsp : ' + response.data.toString());
    return response;
  }

  Future<Response> postRequest() async {
    Dio dio = new Dio();
    Response response =
        await dio.post("http://192.168.31.71:8080/flutter", data: {
      'name': 'warner',
      'userInfo': {'user': 'post_warner', 'age': 18}
    });
    print('rsp : ' + response.data.toString());
    return response;
  }

  Future<String> asyncPost() async {
    Dio dio = new Dio();
    Response response = await dio.post("http://192.168.31.71:8080/flutter", data: {
      'name': 'warner',
      'userInfo': {'user': 'click_post_warner', 'age': 18}
    });
    print('async rsp : ' + response.data.toString());
    return response.data.toString();
  }

  Future<String> asyncLogin(String account, String password) async {
    Dio dio = new Dio();
    Response response = await dio.post("http://192.168.18.164:8080/login", data: {
      'userAccount': account,
      'password': password,
    });
    return response.data.toString();
  }
}
