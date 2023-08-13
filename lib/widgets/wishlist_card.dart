import 'package:flutter/material.dart';
import 'package:shamo_app/style.dart';

class WishlistCard extends StatelessWidget {
  const WishlistCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      padding: const EdgeInsets.only(
        top: 10,
        left: 12,
        right: 20,
        bottom: 14,
      ),
      decoration: BoxDecoration(
        color: bgColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/img_shoes.png',
              width: 60,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Predator 20.3 Firm Ground Boots',
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  '\$143,98',
                  style: priceTextStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/images/btn_wishlist_blue.png',
            height: 34,
          )
        ],
      ),
    );
  }
}
