import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListViewRefreshLoadSlidablePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("上拉刷新可滑动listview"),
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
    refreshController = new RefreshController(initialRefresh: true);
    //_retrieveData();
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