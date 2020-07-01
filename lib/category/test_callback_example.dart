import 'package:flutter_app/category/user_model.dart';

typedef OnSuccess = void Function(UserModel user);
typedef OnFail = void Function(Exception e);

class TestCallback {
  OnSuccess onSuccess;
  OnFail onFail;
  TestCallback(this.onSuccess, this.onFail);
}

// This class shows example how to use call in dart
class TestCallbackExample {
  TestCallback _callback = TestCallback((user) {
    print("user info : " + user.toString());
  }, (e) {
    print("exception : " + e.toString());
  });

  void doTest(bool success) {
    if (success) {
      UserModel model = UserModel("warner_callback", 18);
      _callback.onSuccess(model);
    } else {
      Exception exception = Exception("Exception happen");
      _callback.onFail(exception);
    }
  }
}
