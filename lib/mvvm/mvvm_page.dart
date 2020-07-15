import 'package:flutter/material.dart';
import 'package:flutter_app/mvvm/mvvm_home_page.dart';
import 'package:flutter_app/mvvm/mvvm_model.dart';
import 'package:flutter_app/mvvm/view_model_provider.dart';

class ViewModelDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: ViewModelProvider(
        viewModel: HomeModel(),
        child: HomePage(),
      ),
    );
  }
}
