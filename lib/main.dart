import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shazam',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 2,
      length: 3,
      child: Builder(builder: (context) {
        DefaultTabController.of(context)?.addListener(() {
          setState(() {});
        });

        return Scaffold(
          body: Stack(
            children: [
              TabBarView(
                children: [
                  FirstTab(),
                  SecondTab(),
                  ThirdTab(),
                ],
              ),
              SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  child: Column(
                    children: [
                      semiAppBar(
                          index: DefaultTabController.of(context)!.index),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TabPageSelector(
                            color: DefaultTabController.of(context)?.index == 1
                                ? Colors.blue[300]
                                : Colors.grey[400],
                            selectedColor:
                                DefaultTabController.of(context)?.index == 1
                                    ? Colors.white
                                    : Colors.blue,
                            indicatorSize: 8,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class semiAppBar extends StatelessWidget {
  const semiAppBar({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemWidth = size.width - 32; //padding 제외
    return Stack(
      children: [
        Expanded(
          child: Center(
            child: Text(
              index == 0
                  ? "라이브러리"
                  : index == 1
                      ? ""
                      : "차트",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        if (index == 0)
          Icon(
            Icons.settings,
            size: 25,
          ),
        if (index == 1)
          Row(
            children: [
              Column(
                children: [
                  Icon(
                    Icons.person,
                    size: 25,
                  ),
                  Text(
                    "라이브러리",
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
              Expanded(child: SizedBox()),
              Column(
                children: [
                  Icon(
                    Icons.show_chart,
                    size: 25,
                  ),
                  Text(
                    "차트",
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ],
          )
      ],
    );
  }
}

// 첫번째 페이지
class FirstTab extends StatefulWidget {
  const FirstTab({Key? key}) : super(key: key);

  @override
  State<FirstTab> createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    const songs = [
      {
        'imageUrl': 'https://i.ytimg.com/vi/jAO0KXRdz_4/hqdefault.jpg',
        'title': '가을밤에 든 생각',
        'artist': '잔나비',
      },
      {
        'imageUrl': 'https://i.ytimg.com/vi/jAO0KXRdz_4/hqdefault.jpg',
        'title': '가을밤에 든 생각',
        'artist': '잔나비',
      },
      {
        'imageUrl': 'https://i.ytimg.com/vi/jAO0KXRdz_4/hqdefault.jpg',
        'title': '가을밤에 든 생각',
        'artist': '잔나비',
      },
      {
        'imageUrl': 'https://i.ytimg.com/vi/jAO0KXRdz_4/hqdefault.jpg',
        'title': '가을밤에 든 생각',
        'artist': '잔나비',
      },
      {
        'imageUrl': 'https://i.ytimg.com/vi/jAO0KXRdz_4/hqdefault.jpg',
        'title': '가을밤에 든 생각todolsfd',
        'artist': '잔나비',
      },
      {
        'imageUrl': 'https://i.ytimg.com/vi/jAO0KXRdz_4/hqdefault.jpg',
        'title': '가을밤에 든 생각',
        'artist': '잔나비',
      },
    ];

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      //color: Colors.yellow,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 120, bottom: 20),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 0.5,
                          color: Color.fromARGB(247, 194, 191, 191),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 4,
                          ),
                          ImageIcon(
                            NetworkImage("https://i.ibb.co/hxNbZ8p/shazam.png"),
                            size: 18,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            "Shazam",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 0.5,
                          color: Color.fromARGB(247, 194, 191, 191),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 4,
                          ),
                          Icon(
                            Icons.person,
                            size: 18,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            "아티스트",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 4,
                        ),
                        Icon(
                          Icons.music_note,
                          size: 18,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "회원님을 위한 재생 목록",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        "최근 Shazam",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  //GridViewPage(songList: songs),
                ]),
              ),
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => gridItemView(songItem: songs[index]),
                  childCount: songs.length,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio:
                      (itemWidth / itemHeight), //item 의 가로 1, 세로 2 의 비율
                  mainAxisSpacing: 10, //수평 Padding
                  crossAxisSpacing: 10, //수직 Padding),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class gridItemView extends StatelessWidget {
  const gridItemView({super.key, required this.songItem});
  final Map songItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      elevation: 1.0,
      child: Column(
        children: [
          Image.network(
            height: 150,
            width: double.infinity,
            songItem["imageUrl"].toString(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    songItem["title"].toString(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    songItem["artist"].toString(),
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 두번째 페이지
class SecondTab extends StatelessWidget {
  const SecondTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 97, 178, 243).withOpacity(1.0),
        Color.fromARGB(255, 15, 73, 163)
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.headphones,
                  color: Colors.white,
                  size: 25,
                ),
                SizedBox(width: 15),
                Text(
                  "Shazam하려면 탭하세요",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 80),
            CircleAvatar(
              radius: 90,
              backgroundColor: Color.fromRGBO(100, 181, 246, 1.0),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.network(
                  "https://i.ibb.co/hxNbZ8p/shazam.png",
                  color: Colors.white,
                  width: 100,
                ),
              ),
            ),
            SizedBox(height: 80),
            CircleAvatar(
              radius: 30,
              backgroundColor: Color.fromRGBO(100, 181, 246, 1.0),
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

// 세번째 페이지
class ThirdTab extends StatelessWidget {
  const ThirdTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const chartData = {
      'korea': [
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite',
          'artist': 'BTS',
        },
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite',
          'artist': 'BTS',
        },
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite',
          'artist': 'BTS',
        },
      ],
      'global': [
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite',
          'artist': 'BTS',
        },
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite',
          'artist': 'BTS',
        },
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite',
          'artist': 'BTS',
        },
      ],
      'newyork': [
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite',
          'artist': 'BTS',
        },
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite',
          'artist': 'BTS',
        },
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite',
          'artist': 'BTS',
        },
      ],
    };

    const keySet = ['korea', 'global', 'newyork'];

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 120),
        child: Container(
          color: Colors.grey,
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                    color: Color.fromRGBO(74, 20, 140, 1.0),
                    height: 150,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              "국가 및 도시별 차트",
                              style: TextStyle(
                                color: Color.fromRGBO(74, 20, 140, 1.0),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "전 세계",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                ]),
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return vertiListItem(
                      index: index,
                      chartItems: chartData[keySet[index].toString()]);
                },
                childCount: 3,
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class vertiListItem extends StatelessWidget {
  const vertiListItem(
      {super.key, required this.index, required this.chartItems});
  final int index;
  final chartItems;

  @override
  Widget build(BuildContext context) {
    const listTitle = ["대한민국 차트", "글로벌 차트", "뉴욕 차트"];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: double.infinity,
        height: 250,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    listTitle[index].toString(),
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Text(
                    "모두보기",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: chartItems.length,
                  itemBuilder: (BuildContext context, int idx) {
                    return horiListItem(chartItem: chartItems[idx]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class horiListItem extends StatelessWidget {
  const horiListItem({super.key, required this.chartItem});
  final chartItem;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
              chartItem["imageUrl"],
              height: 130,
            ),
            Container(
              child: Text(
                chartItem["name"],
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              chartItem["artist"],
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
