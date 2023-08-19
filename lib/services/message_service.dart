import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shamo_app/models/message_mode.dart';
import 'package:shamo_app/models/product_model.dart';
import 'package:shamo_app/models/users_model.dart';
import 'package:logger/logger.dart';

class MessageService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final Logger logger = Logger();

  Stream<List<MessageModel>> getMessagesByUserId({int? userId}) {
    try {
      return firestore
          .collection('messages')
          .where('userId', isEqualTo: userId)
          .snapshots()
          .map((QuerySnapshot list) {
        var result = list.docs.map<MessageModel>((DocumentSnapshot message) {
          final messageData = message.data() as Map<String, dynamic>?;

          if (messageData != null) {
            logger.i(message.data());
            return MessageModel.fromJson(messageData);
          } else {
            throw Exception('Invalid message data');
          }
        }).toList();

        result.sort(
          (MessageModel a, MessageModel b) =>
              a.createdAt!.compareTo(b.createdAt!),
        );
        return result;
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addMessage({
    UserModel? userModel,
    bool? isFormUser,
    String? message,
    ProductModel? productModel,
  }) async {
    try {
      firestore.collection('messages').add({
        'userId': userModel!.id,
        'userName': userModel.name,
        'userImage': userModel.profilePhotoUrl,
        'isFromUser': isFormUser,
        'message': message,
        'product': productModel is UninitializedProductModel
            ? {}
            : productModel!.toJson(),
        'createdAt': DateTime.now().toString(),
        'updatedAt': DateTime.now().toString(),
      }).then((value) => logger.i("Pesan Berhasil Dikirim!"));
    } catch (e) {
      throw Exception("Pesan Gagal Dikirim");
    }
  }
}
