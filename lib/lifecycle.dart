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
  int _clickCount = 0;

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('生命周期'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _clickAction,
          child: Center(
            child: Container(
              width: 100,
              height: 100,
              color: Colors.grey,
              child: Text('click me :$_clickCount'),
            ),
          ),
        ),
      ),
    );
  }

  _clickAction() {
    print('click action');
    setState(() {
      _clickCount++;
    });
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
