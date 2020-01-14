import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ListViewInfiniteDownLoadSlidablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("无限下拉加载可滑动的listview"),
      ),
      body: Container(
        child: InfiniteListView(),
      ),
    );
  }
}

class InfiniteListView extends StatefulWidget {
  @override
  _InfiniteListViewState createState() => new _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      //reverse: false, 默认为false 表示下拉加载 true表示上拉加载
      itemCount: _words.length,
      itemBuilder: (context, index) {
        //如果到了表尾
        if (_words[index] == loadingTag) {
          //不足100条，继续获取数据
          if (_words.length - 1 < 100) {
            //获取数据
            _retrieveData();
            //加载时显示loading
            return Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(strokeWidth: 2.0)),
            );
          } else {
            //已经加载了100条数据，不再获取数据。
            return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "没有更多了",
                  style: TextStyle(color: Colors.grey),
                ));
          }
        }
        //显示单词列表项
        return Slidable(
          key: Key(index.toString()),
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          child: ListTile(title: Text(_words[index])),
          actions: <Widget>[
            IconSlideAction(
              caption: '归档',
              color: Colors.blue,
              icon: Icons.archive,
              onTap: () => Fluttertoast.showToast(msg: 'Archive'),
              closeOnTap: false,
            ),
            IconSlideAction(
              caption: '分享',
              color: Colors.indigo,
              icon: Icons.share,
              onTap: () => Fluttertoast.showToast(msg: 'Share'),
            ),
          ],
          secondaryActions: <Widget>[
            IconSlideAction(
              caption: '更多',
              color: Colors.black45,
              icon: Icons.more_horiz,
              onTap: () => Fluttertoast.showToast(msg: 'More'),
            ),
            IconSlideAction(
              caption: '删除',
              color: Colors.red,
              icon: Icons.delete,
              onTap: () => Fluttertoast.showToast(msg: 'delete'),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => Divider(height: .0),
    );
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(
          _words.length - 1,
          //每次生成20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      setState(() {
        //重新构建列表
      });
    });
  }
}
