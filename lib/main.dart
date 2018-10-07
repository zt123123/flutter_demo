import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'home',
      home: new HomePage(),
    );
  }
}



class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int index = 0;

  var homePage;
  var bookPage;
  var musicPage;

  _getbody() {
    switch (index) {
      case 0:
        if (homePage == null) {
          homePage = new TabBarView(
            children: [
              new Center(
                child: new ListView(
                  children: <Widget>[
                    new ListTile(
                      leading: const Icon(Icons.event_seat),
                      title: const Text('The seat for the narrator'),
                      onTap: (){
                        print('123465');
                      },
                    )
                  ],
                )
              ),
              new Center(
                  child: new Text("图书")
              ),
              new Center(
                  child: new Text("我的")
              ),
            ],
          );
        }
        return homePage;
      case 1:
        if (bookPage == null) {
          bookPage = new Center(child: new Text("图书"));
        }
        return bookPage;
      case 2:
        musicPage = new Center(
          child: new Text('音乐'),
        );
        return musicPage;
    }
  }
  //获取标题的方法
  _getTitle() {
    switch (index) {
      case 0:
        return _forMatchTitle('电影');
      case 1:
        return _forMatchTitle('图书');
      case 2:
        return _forMatchTitle('音乐');
    }
  }

  //formatch标题
  _forMatchTitle(String data) {
    return new Text(data);
  }

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 3,// 长度为3
      initialIndex: 0,// 默认索引0
      child: new Scaffold(
        appBar: new AppBar(
          title: _getTitle(),
          // 如果是第一个则显示tab，否则不显示
          bottom: index == 0 ? new TabBar(
              tabs: [
                new Tab(icon: new Icon(Icons.video_call)),
                new Tab(icon: new Icon(Icons.book)),
                new Tab(icon: new Icon(Icons.person)),
              ]
          ) : null,
        ),

        body: _getbody(),

        drawer: new Drawer(
          elevation: 8.0,
          semanticLabel: '滑动抽屉',
          child: new DrawerLayout(),
        ),
        bottomNavigationBar: new BottomNavigationBar(
            onTap: _selectPosition,
            currentIndex: index,
            type: BottomNavigationBarType.fixed,
            iconSize: 24.0,
            items: new List<BottomNavigationBarItem>.generate(3, (index) {
              switch (index) {
                case 0:
                  return new BottomNavigationBarItem(
                      icon: new Icon(Icons.movie), title: new Text('电影'));
                case 1:
                  return new BottomNavigationBarItem(
                      icon: new Icon(Icons.book), title: new Text('图书'));
                case 2:
                  return new BottomNavigationBarItem(
                      icon: new Icon(Icons.music_note), title: new Text('音乐'));
              }
            })),
      ),
    );
  }

  _selectPosition(int index) {
    if (this.index == index) return;
    setState(() {
      this.index = index;
    });
  }

}
// 抽屉
class DrawerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        new DrawerHeader(
          decoration: new BoxDecoration(
            color: Colors.grey[400],
          ),
          child: new Column(
            children: <Widget>[
              new Expanded(
                child: new Align(
                  alignment: Alignment.bottomCenter,
                  child: new Column(
                    children: <Widget>[
                      new CircleAvatar(
                        child: new Text('R'),
                      ),
                      new Text('YangZhe', style: Theme
                          .of(context)
                          .textTheme
                          .title),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        new AboutListTile(
          icon: new Icon(Icons.person),
          child: new Text('关于项目'),
          applicationLegalese: '',
          applicationName: 'Flutter Demo',
          applicationVersion: 'version:0.1',
        ),
      ],
    );
  }
}