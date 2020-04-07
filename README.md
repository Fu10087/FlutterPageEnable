# FlutterPageEnable

Adding pageEnable to Flutter ScrollView as in iOS 

给Flutter的ScrollView添加类似iOS的pageEnable效果

WebDemo: https://fu10087.github.io/FlutterProjectDemo/flutterpageenable/index.html#/

# usage
in pubspec.yaml
```dart
  flutter_page_enable:
    git:
      url: https://github.com/Fu10087/FlutterPageEnable.git
```

```dart
import 'package:flutter_page_enable/flutter_page_enable.dart';

ListView.builder(
  physics: PageEnableScrollPhysics(
    pageSize: 150, //require
    parent: AlwaysScrollableScrollPhysics() 
  ),
  ...
);
```
