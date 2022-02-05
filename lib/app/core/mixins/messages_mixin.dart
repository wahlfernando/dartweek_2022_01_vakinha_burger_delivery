import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin MessagesMixin on GetxController {
  void messageListner(Rxn<MessageModel> message) {
    ever<MessageModel?>(message, (model) async {
      if (model != null) {
        Get.snackbar(
          model.title,
          model.message,
          backgroundColor: model.type.color(),
          colorText: model.type.textColor(),
          margin: const EdgeInsets.all(20)
        );
      }
    });
  }
}

class MessageModel {
  final String title;
  final String message;
  final MessageTyoe type;

  MessageModel({
    required this.title,
    required this.message,
    required this.type,
  });
}

enum MessageTyoe { error, info }

extension MessageTypeColorExt on MessageTyoe {
  Color color() {
    switch (this) {
      case MessageTyoe.error:
        return Colors.red[800]!;
      case MessageTyoe.info:
        return Colors.blue[200]!;
    }
  }

  Color textColor() {
    switch (this) {
      case MessageTyoe.error:
        return Colors.white;
      case MessageTyoe.info:
        return Colors.black;
    }
  }
}
