关于flutter中如何使用JSON的问题
1、在yaml文件中添加如下依赖
```json
  build_runner: ^1.7.2
  json_annotation: ^3.0.1
  json_serializable: ^3.2.5
```
2、新建文件的时候，文件名和文件内部加的代码
part 'xxx.g.dart';
xxx和文件名必须一致，剩下的可以参考Person类的设置