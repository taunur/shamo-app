import 'package:flutter/material.dart';
import 'package:shamo_app/pages/home/chat_page.dart';
import 'package:shamo_app/pages/home/home_page.dart';
import 'package:shamo_app/pages/home/profile_page.dart';
import 'package:shamo_app/pages/home/wishlist_page.dart';
import 'package:shamo_app/style.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
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
                    color: _currentIndex == 0
                        ? primaryColor
                        : const Color(0xff808191),
                  ),
                  onPressed: () {
                    setState(() {
                      _currentIndex = 0;
                    });
                  }),
              IconButton(
                  icon: Image.asset(
                    'assets/images/ic_message.png',
                    width: 20,
                    color: _currentIndex == 1
                        ? primaryColor
                        : const Color(0xff808191),
                  ),
                  onPressed: () {
                    setState(() {
                      _currentIndex = 1;
                    });
                  }),
              const SizedBox(width: 40), // The dummy child
              IconButton(
                  icon: Image.asset(
                    'assets/images/ic_wishlist.png',
                    width: 20,
                    color: _currentIndex == 2
                        ? primaryColor
                        : const Color(0xff808191),
                  ),
                  onPressed: () {
                    setState(() {
                      _currentIndex = 2;
                    });
                  }),
              IconButton(
                  icon: Image.asset(
                    'assets/images/ic_profile.png',
                    width: 18,
                    color: _currentIndex == 3
                        ? primaryColor
                        : const Color(0xff808191),
                  ),
                  onPressed: () {
                    setState(() {
                      _currentIndex = 3;
                    });
                  }),
            ],
          ),
        ),
      );
    }

    // body
    Widget bodyMain() {
      switch (_currentIndex) {
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

    return Scaffold(
      backgroundColor: _currentIndex == 0 ? bgColor1 : bgColor3,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: bodyMain(),
    );
  }
}
