import 'package:cloud_firestore/cloud_firestore.dart';

class ChatMessage {
  final String senderId;
  final String senderName;
  final String receiverId;
  final String message;
  final Timestamp timestamp;
  ChatMessage({
    required this.senderId,
    required this.senderName,
    required this.receiverId,
    required this.message,
    required this.timestamp,
  });

  ChatMessage copyWith({
    String? senderId,
    String? senderName,
    String? receiverId,
    String? message,
    Timestamp? timestamp,
  }) {
    return ChatMessage(
      senderId: senderId ?? this.senderId,
      senderName: senderName ?? this.senderName,
      receiverId: receiverId ?? this.receiverId,
      message: message ?? this.message,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'senderId': senderId,
      'senderName': senderName,
      'receiverId': receiverId,
      'message': message,
      'timestamp': timestamp,
    };
  }

  factory ChatMessage.fromMap(Map<String, dynamic> map) {
    return ChatMessage(
        senderId: map['senderId'] as String,
        senderName: map['senderName'] as String,
        receiverId: map['receiverId'] as String,
        message: map['message'] as String,
        timestamp: map['timestamp']);
  }

  @override
  String toString() {
    return 'ChatMessage(senderId: $senderId, senderName: $senderName, receiverId: $receiverId, message: $message, timestamp: $timestamp)';
  }
}
