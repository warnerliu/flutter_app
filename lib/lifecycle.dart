import 'package:flutter/material.dart';

class LifecycleExample extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    print('createState');
    return _LifecycleExampleState();
  }
}

class _LifecycleExampleState extends State<LifecycleExample> {
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('生命周期'),
      ),
      body: Center(
        child: Text('生命周期Demo页面'),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initState');
  }

  @override
  void didUpdateWidget(LifecycleExample oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }
}
