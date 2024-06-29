import 'models.dart';

final User user_0 = User(
  name: Name(
    firstname: 'William',
    lastname: 'Lamptey',
  ),
  avatarUrl: 'assets/avatar_4.jpg',
  lastActive: DateTime.now(),
);

final User user_1 = User(
    name: Name(firstname: 'Eric', lastname: ''),
    avatarUrl: 'assets/avatar_1.jpg',
    lastActive: DateTime.now().subtract(const Duration(minutes: 20)));

final User user_2 = User(
    name: Name(firstname: 'Jeff', lastname: 'O.'),
    avatarUrl: 'assets/avatar_2.jpg',
    lastActive: DateTime.now().subtract(const Duration(minutes: 30)));

final User user_3 = User(
    name: Name(firstname: 'Benjamin', lastname: 'Adu'),
    avatarUrl: 'assets/avatar_3.jpg',
    lastActive: DateTime.now().subtract(const Duration(hours: 1)));

final User user_4 = User(
    name: Name(firstname: 'David', lastname: 'Kyei'),
    avatarUrl: 'assets/avatar_5.jpg',
    lastActive: DateTime.now().subtract(const Duration(hours: 2)));

final User user_5 = User(
    name: Name(firstname: 'Olivia', lastname: 'Daniels'),
    avatarUrl: 'assets/avatar_6.jpg',
    lastActive: DateTime.now().subtract(const Duration(hours: 2, minutes: 30)));

List<Email> emails = [
  Email(
      sender: user_1,
      recipients: [],
      subject: 'Day trip to Aqua Safari',
      content: 'This contains the total budget of the day trip to Aqua Safari'),
  Email(
      sender: user_2,
      recipients: [],
      subject: 'Sankofa',
      content:
          'A Twi word from the Akan Tribe of Ghana that loosely translates to, “go back and get it.”'),
  Email(
      sender: user_3,
      recipients: [],
      subject: 'Think Flutter',
      content: 'In-Depth knowledge on Flutter'),
  Email(
      sender: user_4,
      recipients: [],
      subject: 'Arts',
      content: 'Checkout my newly completed Artwork',
      attachments: [Attachment(url: 'assets/thumbnail.jpg')])
];

List<Email> replies = [
  Email(
      sender: user_1,
      recipients: [user_2, user_3],
      subject: 'Day trip to Aqua Safari',
      content: 'There will be a need to raise the budget.'),
  Email(
      sender: user_0,
      recipients: [user_2, user_3],
      subject: 'Day trip to Aqua Safari',
      content: 'Well Noted.'
      ),
];
