import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_app/models/message_mode.dart';
import 'package:shamo_app/providers/auth_provider.dart';
import 'package:shamo_app/providers/page_provider.dart';
import 'package:shamo_app/services/message_service.dart';
import 'package:shamo_app/style.dart';
import 'package:shamo_app/widgets/chat_tile.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    // Header
    Widget header() {
      return AppBar(
        backgroundColor: bgColor1,
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          'Message Support',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      );
    }

    Widget emptyChat() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: bgColor3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/ic_headset.png',
                width: 80,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Opss no message yet?',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "You have never done a transaction",
                style: secondaryTextStyle,
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
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    ),
                  ))
            ],
          ),
        ),
      );
    }

    // Content
    Widget content() {
      return StreamBuilder<List<MessageModel>>(
          stream: MessageService()
              .getMessagesByUserId(userId: authProvider.user.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return emptyChat();
              }

              return Expanded(
                child: Container(
                  width: double.infinity,
                  color: bgColor3,
                  child: ListView(
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultMargin,
                    ),
                    children: [
                      ChatTile(
                        messageModel: snapshot.data![snapshot.data!.length - 1],
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return emptyChat();
            }
          });
    }

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
