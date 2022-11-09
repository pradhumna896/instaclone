import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:newinstagram/Utils/colors.dart';

class PostCard extends StatelessWidget {
  final snap;
  const PostCard({Key? key, required this.snap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: mobileBackgroundColor,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4)
                .copyWith(right: 0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(snap['profImage']),
                  radius: 16,
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snap['username'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )),
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => Dialog(
                                child: ListView(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  shrinkWrap: true,
                                  children: ['Delete']
                                      .map((e) => InkWell(
                                            onTap: () {},
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 12,
                                                      horizontal: 16),
                                              child: Text(e),
                                            ),
                                          ))
                                      .toList(),
                                ),
                              ));
                    },
                    icon: Icon(Icons.more_vert))
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            child: Image.network(
              snap['postUrl'],
              fit: BoxFit.cover,
            ),
          ),
          //Like & Comment Section
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite, color: Colors.red)),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.comment_outlined,)),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.send,)),   
              Expanded(child: Align(alignment: Alignment.centerRight,
              child: IconButton(icon: Icon(Icons.bookmark_border),
              onPressed: (){},
              ),
              ))     
            ],
          ),
          //Description and members of comments

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
           child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultTextStyle(
                style: Theme.of(context)
                .textTheme.bodyText2!.
                copyWith(
                  fontWeight: FontWeight.w800),
                child: Text("${snap['likes'].length} Likes",
                style: Theme.of(context)
                .textTheme.bodyText2,)),

            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 8),
            child: RichText(text: TextSpan(text: snap['username'],
            style: const TextStyle(fontWeight: FontWeight.bold),
            children: [
               TextSpan(text: "  ${snap['description']}",
            style: const TextStyle(fontWeight: FontWeight.bold),),

              

            ]
            )),
            ),
            InkWell(
              onTap: (){},
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: const Text("View all 200 comments",style: TextStyle(
                  fontSize: 16,
                  color: secondaryColor,
                    
                ),),
              ),
            ),
            Container(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(DateFormat.yMMMd().format(snap['datePublished'].toDate()),style: TextStyle(
                  fontSize: 16,
                  color: secondaryColor,
                    
                ),),
              )    

            ],
           ),
            )
        ],
      ),
    );
  }
}
