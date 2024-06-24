import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/domain/entities/post.dart';
import 'package:mobile/presentation/screens/post_screen.dart';
import 'package:mobile/utils/get_image_url.dart';

class RankingWidget extends ConsumerWidget {
  const RankingWidget({Key? key, required this.posts}) : super(key: key);

  final List<Post> posts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          // return FutureBuilder(
          //   future: getImageUrl(posts[index].imgUrl),
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return Center(child: CircularProgressIndicator());
          //     } else if (snapshot.hasError) {
          //       return Center(child: Icon(Icons.error),);
          //     } else {
          //       final imageUrl = snapshot.data as String;
          //       print(imageUrl);
          //       return GestureDetector(
          //         onTap: () {
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //               builder: (context) => PostScreen(post: posts[0], imageUrl: imageUrl,),
          //             ),
          //           );
          //         },
          //         child: Container(
          //           margin: EdgeInsets.all(30),
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(10.0),
          //             boxShadow: [
          //               BoxShadow(
          //                 color: Colors.black.withOpacity(0.25),
          //                 spreadRadius: 0,
          //                 blurRadius: 2,
          //                 offset: Offset(4, 5), // changes position of shadow
          //               ),
          //             ],
          //           ),
          //           child: Stack(
          //             children: [
          //               ClipRRect(
          //                 borderRadius: BorderRadius.circular(10.0), // 角を丸くする
          //                 child: Image.network(
          //                   imageUrl ?? 'https://via.placeholder.com/480x640', // ここにiPhoneで撮った写真のURLを指定します
          //                   fit: BoxFit.cover,
          //                 ),
          //               ),
          //               if (index == 0)
          //                 Positioned(
          //                   top: 10,
          //                   left: 10,
          //                   child: SvgPicture.asset(
          //                     'assets/medal_images/gold_medal.svg', // SVGアイコンのパスを指定
          //                     width: 70,
          //                     height: 70,
          //                   ),
          //                 )
          //               else if (index == 1) 
          //                 Positioned(
          //                   top: 10,
          //                   left: 10,
          //                   child: SvgPicture.asset(
          //                     'assets/medal_images/silver_medal.svg', // SVGアイコンのパスを指定
          //                     width: 70,
          //                     height: 70,
          //                   ),
          //                 )
          //               else if (index == 2) 
          //                 Positioned(
          //                   top: 10,
          //                   left: 10,
          //                   child: SvgPicture.asset(
          //                     'assets/medal_images/bronze_medal.svg', // SVGアイコンのパスを指定
          //                     width: 70,
          //                     height: 70,
          //                   ),
          //                 )
          //             ],
          //           ),
          //         )
                
          //       );
          //     }
          //   },
          // );
          return Container(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostScreen(post: posts[0]),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: 0,
                      blurRadius: 2,
                      offset: Offset(4, 5), // changes position of shadow
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0), // 角を丸くする
                      child: Image.network(
                        'https://via.placeholder.com/480x640', // ここにiPhoneで撮った写真のURLを指定します
                        fit: BoxFit.cover,
                      ),
                    ),
                    if (index == 0)
                      Positioned(
                        top: 10,
                        left: 10,
                        child: SvgPicture.asset(
                          'assets/medal_images/gold_medal.svg', // SVGアイコンのパスを指定
                          width: 70,
                          height: 70,
                        ),
                      )
                    else if (index == 1) 
                      Positioned(
                        top: 10,
                        left: 10,
                        child: SvgPicture.asset(
                          'assets/medal_images/silver_medal.svg', // SVGアイコンのパスを指定
                          width: 70,
                          height: 70,
                        ),
                      )
                    else if (index == 2) 
                      Positioned(
                        top: 10,
                        left: 10,
                        child: SvgPicture.asset(
                          'assets/medal_images/bronze_medal.svg', // SVGアイコンのパスを指定
                          width: 70,
                          height: 70,
                        ),
                      )
                  ],
                ),
              )
            
            ),
          );
        },
      ),
    );
  }
}
