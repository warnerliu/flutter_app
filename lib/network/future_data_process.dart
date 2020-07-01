import 'package:dio/dio.dart';
import 'package:flutter_app/network_config.dart';

class FutureDataProcess {
  Future<Response> getRequest() async {
    Dio dio = new Dio();
    Response response =
        await dio.get(NetworkConfig.BASE_URL + "/flutter", data: {
      'name': 'warner',
      'userInfo': {'user': 'get_warner', 'age': 18}
    });
    print('rsp : ' + response.data.toString());
    return response;
  }

  Future<Response> postRequest() async {
    Dio dio = new Dio();
    Response response =
        await dio.post(NetworkConfig.BASE_URL + "/flutter", data: {
      'name': 'warner',
      'userInfo': {'user': 'post_warner', 'age': 18}
    });
    print('rsp : ' + response.data.toString());
    return response;
  }

  Future<String> asyncPost() async {
    Dio dio = new Dio();
    Response response =
        await dio.post(NetworkConfig.BASE_URL + "/flutter", data: {
      'name': 'warner',
      'userInfo': {'user': 'click_post_warner', 'age': 18}
    });
    print('async rsp : ' + response.data.toString());
    return response.data.toString();
  }
}
