
import 'package:flutter/material.dart';
import 'package:techdev/backend/functions.dart';
import 'package:techdev/utils/colors.dart';
import 'package:techdev/components/components.dart';
import 'package:techdev/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List> news;
  @override
  void initState() {
    super.initState();
    news = fetchNews();
  }


 void refreshNews() {
    setState(() {
      news = fetchNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    var sw = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppColors.black,
        appBar: appBar(),
        body: Column(
          children: [
             SearchBox(onSearch: refreshNews),
            Expanded(
                child: SizedBox(
              width: sw,
              child: FutureBuilder(
                  future: news,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Newsbox(
                                url: snapshot.data![index]['url'],
                                title:snapshot.data![index]['title'],
                                time: snapshot.data![index]['publishedAt'],
                                description: snapshot.data![index]['description'].toString(),
                                imageurl: snapshot.data![index]['urlToImage'] ?? Constants.imgUrl);
                          });
                    } else {
                      return const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 100),
                        child: Center(
                          child: LinearProgressIndicator(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                          ),
                        ),
                      );
                    }
                  }),
            ))
          ],
        ));
  }
}
