import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_app/pages/home/chat_page.dart';
import 'package:shamo_app/pages/home/home_page.dart';
import 'package:shamo_app/pages/home/profile_page.dart';
import 'package:shamo_app/pages/home/wishlist_page.dart';
import 'package:shamo_app/providers/page_provider.dart';
import 'package:shamo_app/style.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to exit an App'),
            actions: <Widget>[
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(false), //<-- SEE HERE
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(true), // <-- SEE HERE
                child: const Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    // cart
    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
        backgroundColor: secondaryColor,
        shape: const CircleBorder(),
        child: Image.asset(
          'assets/images/ic_cart.png',
          width: 20,
        ),
      );
    }

    // bottom Nav
    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        child: BottomAppBar(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          color: bgColor4,
          height: 80,
          shape: const CircularNotchedRectangle(),
          notchMargin: 16,
          clipBehavior: Clip.antiAlias,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                  icon: Image.asset(
                    'assets/images/ic_home.png',
                    width: 21,
                    color: pageProvider.currentIndex == 0
                        ? primaryColor
                        : const Color(0xff808191),
                  ),
                  onPressed: () {
                    setState(() {
                      pageProvider.currentIndex = 0;
                    });
                  }),
              IconButton(
                  icon: Image.asset(
                    'assets/images/ic_message.png',
                    width: 20,
                    color: pageProvider.currentIndex == 1
                        ? primaryColor
                        : const Color(0xff808191),
                  ),
                  onPressed: () {
                    setState(() {
                      pageProvider.currentIndex = 1;
                    });
                  }),
              const SizedBox(width: 30), // The dummy child
              IconButton(
                  icon: Image.asset(
                    'assets/images/ic_wishlist.png',
                    width: 20,
                    color: pageProvider.currentIndex == 2
                        ? primaryColor
                        : const Color(0xff808191),
                  ),
                  onPressed: () {
                    setState(() {
                      pageProvider.currentIndex = 2;
                    });
                  }),
              IconButton(
                  icon: Image.asset(
                    'assets/images/ic_profile.png',
                    width: 18,
                    color: pageProvider.currentIndex == 3
                        ? primaryColor
                        : const Color(0xff808191),
                  ),
                  onPressed: () {
                    setState(() {
                      pageProvider.currentIndex = 3;
                    });
                  }),
            ],
          ),
        ),
      );
    }

    // body
    Widget bodyMain() {
      switch (pageProvider.currentIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const ChatPage();
        case 2:
          return const WishlistPage();
        case 3:
          return const ProfilePage();
        default:
          return const HomePage(); // Return a default widget here
      }
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: pageProvider.currentIndex == 0 ? bgColor1 : bgColor3,
        floatingActionButton: cartButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: customBottomNav(),
        body: bodyMain(),
      ),
    );
  }
}
