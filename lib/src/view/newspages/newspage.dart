// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:news_api_flutter_package/model/article.dart';
import 'package:newsapplication/src/utility/boxborder.dart';
import 'package:newsapplication/src/utility/colors.dart';
import 'package:newsapplication/src/utility/style.dart';
import 'package:newsapplication/src/view/newspages/newswebview.dart';
import 'package:newsapplication/src/viewmodel/data.dart';

class NewsPagess extends StatefulWidget {
  String selecteditem;
  Future navigatenewses;
  Data obj = Data();
  NewsPagess(
      {super.key, required this.selecteditem, required this.navigatenewses});

  @override
  State<NewsPagess> createState() => _NewsPagessState();
}

class _NewsPagessState extends State<NewsPagess> {
  @override
  void initState() {
    widget.obj.selectedCategory = widget.obj.categoryItems[0];
    widget.obj.future = widget.obj.getNewsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: pureblack,
          title: Text(
            "Leatest Updates",
            style: appbartextstyle,
          ),
          centerTitle: true,
        ),
        backgroundColor: pureblack,
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text("Error loading the news"),
                    );
                  } else {
                    if (snapshot.hasData && snapshot.hasData) {
                      return _buildNewsListView(snapshot.data as List<Article>);
                    } else {
                      return const Center(
                        child: Text("No news available"),
                      );
                    }
                  }
                },
                future: widget.navigatenewses,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildNewsListView(List<Article> articleList) {
    return ListView.builder(
      itemBuilder: (context, index) {
        Article article = articleList[index];
        return _buildNewsItem(article);
      },
      itemCount: articleList.length,
    );
  }

  Widget _buildNewsItem(Article article) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewsWebview(url: article.url!),
            ));
      },
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 450,
            height: 100,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: SizedBox(
                    width: 120,
                    height: 90,
                    child: ClipRRect(
                      borderRadius: containerBorders,
                      child: Image.network(
                        article.urlToImage ?? "",
                        fit: BoxFit.fitHeight,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.image_not_supported,
                            color: purewhite,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 150),
                  child: SizedBox(
                      width: 300,
                      child: Text(
                        article.title!,
                        maxLines: 2,
                        style: newstitletextstyle,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 160),
                  child: Text(
                    article.source.name ?? "",
                    style: newsauthortextstyle,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
