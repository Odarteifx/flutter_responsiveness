class Attachment {
  Attachment({
    required this.url
    });
  final String url;
}

class User {
  
}

class Email {
final User sender;
final List<User> recipients;
final String subject;
final List<Attachment> attachments;
  final double replies;

  Email({
    required this.sender, 
    required this.recipients, 
    required this.subject, 
    this.attachments = const [], 
    this.replies = 0
    });
  
}