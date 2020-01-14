import 'package:flutter/material.dart';
import 'package:flutter_list_view/list_view_Infinite_down_load_page.dart';
import 'package:flutter_list_view/slidable_list_page.dart';
import 'list_view_common_page.dart';
import 'list_view_infinite_down_load_slidable_page.dart';
import 'list_view_infinite_up_load_page.dart';
import 'list_view_refresh_load_page.dart';
import 'list_view_refresh_load_slidable_page.dart';

void main() => runApp(new MaterialApp(home: new MyApp()));


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) { 
    
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),

      routes: {
        //"nameRoute":(BuildContext context)=>new SecondPage(),

      },
    );
  }
  
}


class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('展示listview的用法'),
        ),
        body: new Center(
          child: new Column(
            children: <Widget>[
              FlatButton(
                child: Text("普通listview"),
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context1) => ListViewCommonPage())
                  );
                },
              ),
              FlatButton(
                child: Text("可滑动显示按钮的列表"),
                onPressed: (){
                  Navigator.of(context).push( 
                    MaterialPageRoute(builder: (context1) => SlidableListPage())
                  );
                },
              ),
              FlatButton(
                child: Text("无限下拉加载listview"),
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context1) => ListViewInfiniteDownLoadPage())
                  );
                },
              ),
              FlatButton(
                child: Text("无限上拉加载listview"),
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context1) => ListViewInfiniteUpLoadPage())
                  );
                },
              ),
              FlatButton(
                child: Text("上拉刷新listview"),
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context1) => ListViewRefreshLoadPage())
                  );
                },
              ),
              FlatButton(
                child: Text("无限下拉加载可滑动的listview"),
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context1) => ListViewInfiniteDownLoadSlidablePage())
                  );
                },
              ),
              FlatButton(
                child: Text("上拉刷新可滑动的listview"),
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context1) => ListViewRefreshLoadSlidablePage())
                  );
                },
              ),
            ],
          ),
        ),
    );
  }
}
