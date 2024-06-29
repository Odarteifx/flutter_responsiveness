class Attachment {
  Attachment({
    required this.url
    });
  final String url;
}

class User {
  final Name name;
  final String avatarUrl;
  final DateTime lastActive;

  User({
    required this.name, 
    required this.avatarUrl, 
    required this.lastActive
    });

}

class Name {
  final String firstname;
   final String lastname;
   String get fullName => '$firstname $lastname';

  Name({
    required this.firstname, 
    required this.lastname,
    });

}

class Email {
final User sender;
final List<User> recipients;
final String subject;
final String content;
final List<Attachment> attachments;
  final double replies;

  Email( {
    required this.sender, 
    required this.recipients, 
    required this.subject, 
    required this.content,
    this.attachments = const [], 
    this.replies = 0
    });
  
}