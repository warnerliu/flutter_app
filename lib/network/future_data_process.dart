import 'package:dio/dio.dart';

class FutureDataProcess {
  Future<Response> getRequest() async {
    Dio dio = new Dio();
    Response response = await dio.get("http://192.168.18.164:8080/flutter");
    print('rsp : ' + response.data.toString());
    return response;
  }

  Future<Response> postRequest() async {
    Dio dio = new Dio();
    Response response = await dio
        .post("http://192.168.18.164:8080/flutter", data: {'name': 'warner'});
    print('rsp : ' + response.data.toString());
    return response;
  }
}
