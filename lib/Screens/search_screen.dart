import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:newinstagram/Utils/colors.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  bool isShowUser = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: TextFormField(
          decoration: const InputDecoration(
            hintText: "Search for a user",
          ),
          onFieldSubmitted: (String _) {
            setState(() {
              isShowUser = true;
            });
          },
        ),
      ),
      body:isShowUser? FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('users')
              .where('username', isGreaterThanOrEqualTo: searchController.text)
              .get(),
          builder: ((context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      (snapshot.data! as dynamic).docs[index]['photoUrl']),
                ),
                title: (snapshot.data! as dynamic).docs[index]['username'],
              );
            });
          })):FutureBuilder(
            future: FirebaseFirestore.instance.collection('posts').get(),
            builder: ((context, snapshot) {
              if(!snapshot.hasData){
                return const CircularProgressIndicator();
              }
            return StaggeredGridView.countBuilder(
              crossAxisCount:3,
              itemCount:(snapshot.data! as dynamic).docs.length,
              
              itemBuilder:
              (context , index)=> Image.network((
              snapshot.data! as dynamic)
              .docs[index]['postUrl'],fit: BoxFit.cover,),
              staggeredTileBuilder:(index)=> 
              StaggeredTile.count(
                (index%7==0)?2:1,
                (index%7==0?2:1),
                ),
    
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,

            );
          })
          ),
    );
  }
}
