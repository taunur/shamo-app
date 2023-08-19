import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_app/providers/page_provider.dart';
import 'package:shamo_app/providers/wishlist_provider.dart';
import 'package:shamo_app/style.dart';
import 'package:shamo_app/widgets/wishlist_card.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    // header
    Widget header() {
      return AppBar(
        backgroundColor: bgColor1,
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Favorite Shoes',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      );
    }

    // empty
    Widget emptyWishlist() {
      return Expanded(
        child: Container(
          color: bgColor3,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/img_wishlist.png',
                height: 62,
              ),
              const SizedBox(
                height: 23,
              ),
              Text(
                " You don't have dream shoes?",
                style: primaryTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "Let's find your favorite shoes",
                style: secondaryTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: regular,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 44,
                child: TextButton(
                    onPressed: () {
                      pageProvider.currentIndex = 0;
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 24,
                      ),
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Explore Store',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 16,
                      ),
                    )),
              )
            ],
          ),
        ),
      );
    }

    // content
    Widget content() {
      return Expanded(
        child: Container(
          color: bgColor3,
          child: ListView(
              padding: EdgeInsets.only(
                left: defaultMargin,
                right: defaultMargin,
                top: 10,
                bottom: defaultMargin,
              ),
              children: wishlistProvider.wishlist
                  .map((product) => WishlistCard(
                        productModel: product,
                      ))
                  .toList()),
        ),
      );
    }

    return Column(
      children: [
        header(),
        wishlistProvider.wishlist.isEmpty ? emptyWishlist() : content(),
      ],
    );
  }
}
