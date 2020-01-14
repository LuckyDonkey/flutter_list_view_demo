import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListViewRefreshLoadPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("上拉刷新listview"),
      ),
      body: Container(
        child: RefreshListView(),
      ),
    );
  }
}

class RefreshListView extends StatefulWidget {
  @override
  _RefreshListViewState createState() => new _RefreshListViewState();
}

class _RefreshListViewState extends State<RefreshListView> {
  RefreshController refreshController;
  var _words = <String>[];

  @override
  void initState() {
    super.initState();
    refreshController = new RefreshController(initialRefresh: false);
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
        header: ClassicHeader(),
        controller: refreshController,
        onRefresh: (){
          _retrieveData();
        },
        child: ListView.separated(
          itemCount: _words.length,
          itemBuilder: (context, index) {
            //显示单词列表项
            return ListTile(title: Text(_words[index]));
          },
          separatorBuilder: (context, index) => Divider(height: .0),
        ),
      );
    }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words = generateWordPairs().take(20).map((e) => e.asPascalCase).toList();
      setState(() {
        //重新构建列表
        refreshController.refreshCompleted();
      });
    });
  }
}