// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:newsapplication/src/utility/boxborder.dart';
import 'package:newsapplication/src/utility/logos.dart';
import 'package:newsapplication/src/utility/style.dart';
import 'package:newsapplication/src/view/newspages/newspage.dart';
import 'package:newsapplication/src/viewmodel/data.dart';
import '../utility/colors.dart';

class HomePage extends StatefulWidget {
  var page;
  Data obj;
  HomePage({super.key, this.page, required this.obj});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.obj.selectedCategory = widget.obj.categoryItems[0];
    widget.obj.future = widget.obj.getNewsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: pureblack,
      ),
      backgroundColor: pureblack,
      body: SingleChildScrollView(
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
                return homepagewidget();
              } else {
                return const Center(
                  child: Text("No news available"),
                );
              }
            }
          },
          future: widget.obj.future,
        ),
      ),
    );
  }

  //home design
  Widget homepagewidget() {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 20,
        ),
        Text(
          "Choose your area",
          style: appleindivitualauttextstyle,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 72,
        ),
        Text(
          "of interest",
          style: appleindivitualauttextstyle,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 25,
        ),
        Row(
          //container one
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              //Technews
              onTap: () {
                widget.obj.selectedCategory = widget.obj.categoryItems[0];
                widget.obj.future = widget.obj.getNewsData();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsPagess(
                        navigatenewses: widget.obj.future,
                        selecteditem: widget.obj.selectedCategory),
                  ),
                );
              },
              child: Container(
                height: MediaQuery.of(context).size.height / 5.5,
                width: MediaQuery.of(context).size.width / 2.6,
                decoration: BoxDecoration(
                  borderRadius: containerBorders,
                  color: purewhite,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 40,
                    ),
                    Center(
                        child: Image.asset(
                      techImage,
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height / 9,
                    )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 72,
                    ),
                    Text(
                      "TECHNOLOGY",
                      style: subtitlestyle,
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              //BUSINESS news
              onTap: () {
                widget.obj.selectedCategory = widget.obj.categoryItems[1];
                widget.obj.future = widget.obj.getNewsData();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsPagess(
                        navigatenewses: widget.obj.future,
                        selecteditem: widget.obj.selectedCategory),
                  ),
                );
              },
              child: Container(
                  height: MediaQuery.of(context).size.height / 5.5,
                  width: MediaQuery.of(context).size.width / 2.6,
                  decoration: BoxDecoration(
                    borderRadius: containerBorders,
                    color: purewhite,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 40,
                      ),
                      Center(
                        child: Image.asset(
                          businessImage,
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.height / 9,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 72,
                      ),
                      Text(
                        "BUSINESS",
                        style: subtitlestyle,
                      )
                    ],
                  )),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              //ENTERTAINMENT news
              onTap: () {
                widget.obj.selectedCategory = widget.obj.categoryItems[2];
                widget.obj.future = widget.obj.getNewsData();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsPagess(
                        navigatenewses: widget.obj.future,
                        selecteditem: widget.obj.selectedCategory),
                  ),
                );
              },
              child: Container(
                height: MediaQuery.of(context).size.height / 5.5,
                width: MediaQuery.of(context).size.width / 2.6,
                decoration: BoxDecoration(
                  borderRadius: containerBorders,
                  color: purewhite,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 40,
                    ),
                    Center(
                      child: Image.asset(
                        enviormentImage,
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height / 9,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 72,
                    ),
                    Text(
                      "ENTERTAINMENT",
                      style: subtitlestyle,
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              //HEALTH news
              onTap: () {
                widget.obj.selectedCategory = widget.obj.categoryItems[3];
                widget.obj.future = widget.obj.getNewsData();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsPagess(
                        navigatenewses: widget.obj.future,
                        selecteditem: widget.obj.selectedCategory),
                  ),
                );
              },
              child: Container(
                height: MediaQuery.of(context).size.height / 5.5,
                width: MediaQuery.of(context).size.width / 2.6,
                decoration: BoxDecoration(
                  borderRadius: containerBorders,
                  color: purewhite,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 40,
                    ),
                    Center(
                      child: Image.asset(
                        health,
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height / 9,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 72,
                    ),
                    Text(
                      "HEALTH",
                      style: subtitlestyle,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              //SCIENCE news
              onTap: () {
                widget.obj.selectedCategory = widget.obj.categoryItems[4];
                widget.obj.future = widget.obj.getNewsData();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsPagess(
                        navigatenewses: widget.obj.future,
                        selecteditem: widget.obj.selectedCategory),
                  ),
                );
              },
              child: Container(
                height: MediaQuery.of(context).size.height / 5.5,
                width: MediaQuery.of(context).size.width / 2.6,
                decoration: BoxDecoration(
                  borderRadius: containerBorders,
                  color: purewhite,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 40,
                    ),
                    Center(
                      child: Image.asset(
                        scienceImage,
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height / 9,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 72,
                    ),
                    Text(
                      "SCIENCE",
                      style: subtitlestyle,
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              //SPORTS news
              onTap: () {
                widget.obj.selectedCategory = widget.obj.categoryItems[5];
                widget.obj.future = widget.obj.getNewsData();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsPagess(
                        navigatenewses: widget.obj.future,
                        selecteditem: widget.obj.selectedCategory),
                  ),
                );
              },
              child: Container(
                height: MediaQuery.of(context).size.height / 5.5,
                width: MediaQuery.of(context).size.width / 2.6,
                decoration: BoxDecoration(
                  borderRadius: containerBorders,
                  color: purewhite,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 40,
                    ),
                    Center(
                        child: Image.asset(
                      sportImage,
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height / 9,
                    )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 72,
                    ),
                    Text(
                      "SPORTS",
                      style: subtitlestyle,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
