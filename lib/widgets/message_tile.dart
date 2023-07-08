import 'package:flutter/material.dart';

class MessageTile extends StatefulWidget {
  final String sender;
  final String message;
  final bool sentByMe;
  const MessageTile(
      {Key? key,
      required this.sender,
      required this.message,
      required this.sentByMe})
      : super(key: key);

  @override
  State<MessageTile> createState() => _MessageTileState();
}

class _MessageTileState extends State<MessageTile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            top: 10,
            bottom: 10,
            left: widget.sentByMe ? 0 : 24,
            right: widget.sentByMe ? 24 : 0),
        alignment:
            widget.sentByMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          margin: widget.sentByMe
              ? const EdgeInsets.only(
                  left: 150,
                  bottom: 90,
                )
              : const EdgeInsets.only(
                  right: 150,
                  bottom: 90,
                ),
          padding:
              const EdgeInsets.only(top: 17, bottom: 17, left: 20, right: 20),
          decoration: BoxDecoration(
              borderRadius: widget.sentByMe
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30))
                  : const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
              color: widget.sentByMe
                  ? Theme.of(context).primaryColor.withOpacity(0.3)
                  : Colors.grey.shade400),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.sender.toUpperCase(),
                textAlign: TextAlign.start,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: -0.5),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                widget.message,
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
