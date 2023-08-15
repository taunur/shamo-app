import 'package:flutter/material.dart';
import 'package:shamo_app/style.dart';

class CheckoutSussesPage extends StatelessWidget {
  const CheckoutSussesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Header
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: bgColor1,
        leading: IconButton(
          color: primaryTextColor,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Checkout Details",
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      );
    }

    Widget content() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 70,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/ic_empty_cart.png"),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "You made a transaction",
            style: primaryTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            "Stay at home while we\nprepare your dream shoes",
            style: secondaryTextStyle,
            textAlign: TextAlign.center,
          ),
          Container(
            width: 196,
            height: 44,
            margin: EdgeInsets.only(
              top: defaultMargin,
              bottom: 12,
            ),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  "/home",
                  (route) => false,
                );
              },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: primaryColor,
              ),
              child: Text(
                "Order Other Shoes",
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 196,
            height: 44,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: const Color(0xff39374B),
              ),
              child: Text(
                "Order Other Shoes",
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                  color: const Color(0xffB7B6BF),
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: bgColor3,
      appBar: header(),
      body: content(),
    );
  }
}
