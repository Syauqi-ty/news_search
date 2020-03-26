import 'package:flutter/material.dart';
import 'package:news_search/article.dart';
import 'news.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading;

  List<Article> _search = [];

  var newsList;
  void getNews() async {
    News news = News();
    await news.getNews();
    setState(() {
      loading = false;
      newsList = news.news;
    });
  }

  @override
  void initState() {
    loading = true;
    // TODO: implement initState
    super.initState();
    getNews();
  }

  TextEditingController controller = new TextEditingController();

  onSearch(String text) async {
    _search.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    newsList.forEach((f) {
      if (f.title.contains(text) || f.autor.contains(text)) _search.add(f);
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Matagi News',
          style: TextStyle(fontFamily: 'Worksans', fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(),
            child: loading
                ? Center(child: CircularProgressIndicator())
                : Column(children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      child: Material(
                        elevation: 5,
                        shadowColor: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: ListTile(
                          leading: Icon(Icons.search),
                          title: TextField(
                            controller: controller,
                            onChanged: onSearch,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 15),
                                hintText: 'Search your title news'),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              controller.clear();
                              onSearch('');
                            },
                            icon: Icon(Icons.cancel),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: _search.length != 0 || controller.text.isNotEmpty
                          ? ListView.builder(
                              itemCount: _search.length,
                              itemBuilder: (context, i) {
                                final b = _search[i];
                                return GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Dialog(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            elevation: 0,
                                            child: Container(
                                                height: 450,
                                                decoration: BoxDecoration(
                                                    color: Colors.blue[400],
                                                    shape: BoxShape.rectangle,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                                child: Column(
                                                  children: <Widget>[
                                                    Image.network(b.urlToImage),
                                                    SizedBox(height: 10),
                                                    Text(
                                                      b.title,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              'Worksans'),
                                                    ),
                                                    Container(
                                                        child: Divider(
                                                      color: Colors.white,
                                                    )),
                                                    Text(
                                                      b.content,
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontFamily:
                                                              'Worksans'),
                                                    ),
                                                    Divider(
                                                      color: Colors.white,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        Text(
                                                          'Author:' + b.autor,
                                                          textAlign:
                                                              TextAlign.left,
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                )),
                                          );
                                        });
                                  },
                                  child: Card(
                                    child: Container(
                                        height: 100,
                                        child: Row(children: <Widget>[
                                          Container(
                                              height: 100,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: NetworkImage(
                                                          b.urlToImage)))),
                                          Container(
                                              padding: const EdgeInsets.only(),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.6,
                                              child: Column(
                                                children: <Widget>[
                                                  Text(
                                                    b.title,
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontFamily: 'Worksans'),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: Text(
                                                      b.autor,
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 13),
                                                    ),
                                                  ),
                                                ],
                                              ))
                                        ])),
                                  ),
                                );
                              })
                          : ListView.builder(
                              itemCount: newsList.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Dialog(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            elevation: 0,
                                            child: Container(
                                                height: 450,
                                                decoration: BoxDecoration(
                                                    color: Colors.blue[400],
                                                    shape: BoxShape.rectangle,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                                child: Column(
                                                  children: <Widget>[
                                                    Image.network(
                                                        newsList[index]
                                                            .urlToImage),
                                                    SizedBox(height: 10),
                                                    Text(
                                                      newsList[index].title,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              'Worksans'),
                                                    ),
                                                    Container(
                                                        child: Divider(
                                                      color: Colors.white,
                                                    )),
                                                    Text(
                                                      newsList[index].content,
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontFamily:
                                                              'Worksans'),
                                                    ),
                                                    Divider(
                                                      color: Colors.white,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        Text(
                                                          'Author:' +
                                                              newsList[index]
                                                                  .autor,
                                                          textAlign:
                                                              TextAlign.left,
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                )),
                                          );
                                        });
                                  },
                                  child: Card(
                                    child: Container(
                                        height: 100,
                                        child: Row(children: <Widget>[
                                          Container(
                                              height: 100,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: NetworkImage(
                                                          newsList[index]
                                                              .urlToImage)))),
                                          Container(
                                              padding: const EdgeInsets.only(),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.6,
                                              child: Column(
                                                children: <Widget>[
                                                  Text(
                                                    newsList[index].title,
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontFamily: 'Worksans'),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: Text(
                                                      newsList[index].autor,
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 13),
                                                    ),
                                                  ),
                                                ],
                                              ))
                                        ])),
                                  ),
                                );
                              }),
                    )
                  ])),
      ),
    );
  }
}
