import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newinstagram/Utils/colors.dart';
import 'package:newinstagram/Utils/global_variable.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  //   String username = '';
  // @override
  // void initState() {
  // TODO: implement initState
  //   super.initState();
  //   getUsername();
  // }
  // void getUsername()async{
  //  DocumentSnapshot snap = await FirebaseFirestore.instance.collection('users')
  //   .doc(FirebaseAuth.instance.currentUser!.uid)
  //   .get();

  //   setState(() {
  //     username = (snap.data() as Map<String , dynamic>)['username'];
  //   });
  // }
  late PageController pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }
  int _page = 0;
  void navigationTapped(int page){
    pageController.jumpToPage(page);
  }
  void onPageChange(int page){
    setState(() {
      _page = page;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChange,
        children:homeScreenItem),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: mobileBackgroundColor,
        onTap: navigationTapped,
        items:  [
        BottomNavigationBarItem(
            backgroundColor: primaryColor, icon: Icon(Icons.home,color: _page==0?primaryColor:secondaryColor,)),
        BottomNavigationBarItem(
            backgroundColor: primaryColor, icon: Icon(Icons.search,color: _page==1?primaryColor:secondaryColor,)),
        BottomNavigationBarItem(
            backgroundColor: primaryColor, icon: Icon(Icons.add_circle,color: _page==2?primaryColor:secondaryColor,)),
        BottomNavigationBarItem(
            backgroundColor: primaryColor, icon: Icon(Icons.favorite,color: _page==3?primaryColor:secondaryColor,)),
        BottomNavigationBarItem(
            backgroundColor: primaryColor, icon: Icon(Icons.person,color: _page==4?primaryColor:secondaryColor,)),
      ]),
    );
  }
}
