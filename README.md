# FlutterPageEnable

Adding pageEnable to Flutter ScrollView as in iOS 

给Flutter的ScrollView添加类似iOS的pageEnable效果

# usage

ListView.builder(
  physics: PageEnableScrollPhysics(
    pageSize: 150, //require
    parent: AlwaysScrollableScrollPhysics() 
  ),
  ...
)
