import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';

//代码来源：https://juejin.im/post/5d81ed75f265da03cf7ac43f

class SlidableListPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('可滑动显示操作按钮的列表'),
      ),
      body: Container(
        child: MyListSlidable()
      ),
    );
  }
  
}

class MyListSlidable extends StatefulWidget {
  @override
  _MyListSlidableState createState() => _MyListSlidableState();
}

class _MyListSlidableState extends State<MyListSlidable> {
  List<int> datas = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

  Widget _itemBuilder(BuildContext context, int position) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: Slidable(
        key: Key(datas[position].toString()),
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        child: Container(
          height: 80,
          width: double.infinity,
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text(
            "product${datas[position]}",
            style: TextStyle(color: Colors.white),
          ),
        ),
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          ListView.builder(itemBuilder: _itemBuilder, itemCount: datas.length),
    );
  }
}