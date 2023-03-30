class Message {
  final String id;
  final String text;
  final String senderId;
  final String receiverId;
  final Timestamp timestamp;

  Message({
    required this.id,
    required this.text,
    required this.senderId,
    required this.receiverId,
    required this.timestamp,
  });

  factory Message.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Message(
      id: doc.id,
      text: data['text'],
      senderId: data['senderId'],
      receiverId: data['receiverId'],
      timestamp: data['timestamp'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'text': text,
      'senderId': senderId,
      'receiverId': receiverId,
      'timestamp': FieldValue.serverTimestamp(),
    };
  }

  @override
  String toString() {
    return 'Message{id: $id, text: $text, senderId: $senderId, receiverId: $receiverId, timestamp: $timestamp}';
  }
}
