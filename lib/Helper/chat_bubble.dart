import 'package:chat_app/Pages/chat_page.dart';
import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

import '../model/massege.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.message});
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 16),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade600, spreadRadius: 0, blurRadius: 4)
              ],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                  bottomRight: Radius.circular(32)),
              color: Colors.white,
            ),
            child: Text(
              message.message,
              style: const TextStyle(
                  color: Color.fromRGBO(141, 141, 141, 1),
                  fontWeight: FontWeight.w700,
                  fontSize: 13.66),
            ),
          ),
          Text(formatDate(message.createdAt.toDate()),
              style: TextStyle(fontSize: 10, color: Colors.grey)),
        ],
      ),
    );
  }
}

class ChatBubblemyfrind extends StatelessWidget {
  const ChatBubblemyfrind({super.key, required this.message});
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 16),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade600,
                    spreadRadius: 1,
                    blurRadius: 15)
              ],
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                  bottomLeft: Radius.circular(32)),
              color: kPrimaryColor,
            ),
            child: Text(message.message,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 13.66)),
          ),
          Text(formatDate(message.createdAt.toDate()),
              style: TextStyle(fontSize: 10, color: Colors.grey)),
        ],
      ),
    );
  }
}
