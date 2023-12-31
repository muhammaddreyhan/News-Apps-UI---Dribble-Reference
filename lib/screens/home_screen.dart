import 'package:flutter/material.dart';
import 'package:tgs_pemrograman_mobile/models/article_model.dart';
import 'package:tgs_pemrograman_mobile/screens/article_screen.dart';
import 'package:tgs_pemrograman_mobile/widgets/custom_tag.dart';
import 'package:tgs_pemrograman_mobile/screens/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/bottom_nav_bar.dart';
import '../widgets/image_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    String? username = ModalRoute.of(context)?.settings.arguments as String?;
    Article article = Article.articles[0];

    if(username == null){
      username = 'Guest';
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: (){},
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(index: 0),
      extendBodyBehindAppBar: true,
      body: ListView(padding: EdgeInsets.zero, children: [
        _NewsOfTheDay(article: article),
        _BreakingNews(articles: Article.articles, username: username,),
      ]),
    );
  }
}

class _BreakingNews extends StatelessWidget {
  const _BreakingNews({
    required this.articles,
    required this.username,
    super.key,
  });

  final List<Article> articles;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Breaking News',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Text('More',style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
         const SizedBox(height: 20),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: articles.length,
                itemBuilder: (context, index){
                return Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  margin: const EdgeInsets.only(right: 10),
                  child: InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, 
                        ArticleScreen.routeName,
                        arguments: articles[index],
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      ImageContainer(
                          width: MediaQuery.of(context).size.width * 0.5,
                          imageUrl: articles[index].imageUrl,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        articles[index].title,
                        maxLines: 2,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold, height: 1.5),
                      ),
                        const SizedBox(height: 5),
                        Text(
                          '${DateTime.now().difference(articles[index].createdAt).inHours} hours ago',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!),
                        const SizedBox(height: 5),
                        Text(
                        'by ${(articles[index].author)}',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!),
                    ],
                    ),
                  ),
                );
                },
            ),
          ),
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image.asset('assets/images/Frame 12.png',
                // height: 200, color: Colors.grey[700]),
                SizedBox(height: 2),
                Text(
                  "Welcome to the Home Page, ${username ?? 'Guest'}!",
                  style: GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.bold,),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  "We hope you see an amazing news here! ",
                  style: TextStyle(fontSize: 16, color: Colors.grey[500]),
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          )
      ],),
    );
  }
}

class _NewsOfTheDay extends StatelessWidget {
  const _NewsOfTheDay({
    super.key,
    required this.article,

  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return ImageContainer(
      height: MediaQuery.of(context).size.height * 0.45,
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      imageUrl: article.imageUrl,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTag(backgroundColor: Colors.grey.withAlpha(150),
              children: [
          Text('News of the Day',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.white,),
          ),
              ],
          ),
          const SizedBox(height: 10),
          Text(article.title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(
                fontWeight: FontWeight.bold,
              height: 1.25,
              color: Colors.white),
          ),
          TextButton(
              onPressed: () {},
            style: TextButton.styleFrom(padding:EdgeInsets.zero ),
              child: Row(
                children: [
                  Text(
                    'Learn More',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.white,),
                  ),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.arrow_right_alt,
                    color: Colors.white,
                  ),
                ],
              ),
          ),
        ]
      )
    );

  }
}




