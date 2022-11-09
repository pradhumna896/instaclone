import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newinstagram/Utils/colors.dart';
import 'package:newinstagram/Widget/post_card.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        centerTitle: false,
        title: SvgPicture.asset(
          "assets/ic_instagram.svg",
          color: primaryColor,
          height: 32,),
          actions: [
            IconButton(onPressed: (){},
             icon: Icon(Icons.messenger_outline))
          ],

      ),
      body:StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (
          context,
          AsyncSnapshot<QuerySnapshot<Map<String ,dynamic>>> snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(
               child: const CircularProgressIndicator(),
              );
            }

            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: ((context, index) {
              return PostCard(
                snap: snapshot.data!.docs[index].data(),
              );
              
            }));
        
      },) ,
    );
    
  }
}