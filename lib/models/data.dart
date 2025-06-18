import 'models.dart';

final User user_0 = User(
  name: const Name(first: '철수', last: '김'),
  avatarUrl: 'assets/images/avatar_1.png',
  lastActive: DateTime.now(),
);

final User user_1 = User(
  name: const Name(first: '장군', last: '박'),
  avatarUrl: 'assets/images/avatar_2.png',
  lastActive: DateTime.now().subtract(const Duration(minutes: 10)),
);

final User user_2 = User(
  name: const Name(first: '도령', last: '이'),
  avatarUrl: 'assets/images/avatar_3.png',
  lastActive: DateTime.now().subtract(const Duration(minutes: 10)),
);

final User user_3 = User(
  name: const Name(first: '선비', last: '최'),
  avatarUrl: 'assets/images/avatar_4.png',
  lastActive: DateTime.now().subtract(const Duration(minutes: 10)),
);

final User user_4 = User(
  name: const Name(first: '서방', last: '장'),
  avatarUrl: 'assets/images/avatar_5.png',
  lastActive: DateTime.now().subtract(const Duration(minutes: 10)),
);

final List<Email> emails = [
  Email(
    sender: user_1,
    recipients: [],
    subject: '豆花鱼',
    content: '最近忙吗？昨晚我去了你最爱的那家饭馆，点了他们的特色豆花鱼，吃着吃着就想你了。',
  ),
  Email(
    sender: user_2,
    recipients: [],
    subject: 'Dinner Club',
    content:
        "I think it's time for us to finally try that new noodle shop downtown that doesn't use menus. Anyone else have other suggestions for dinner club this week? I'm so intrigued by this idea of a noodle restaurant where no one gets to order for themselves - could be fun, or terrible, or both :)\n\nSo",
  ),
  Email(
    sender: user_3,
    recipients: [],
    subject: 'This food show is made for you',
    content:
        "Ping– you'd love this new food show I started watching. It' s produced by a Thai drummer who started getting recognized for the amazing vegan food she always brought to shows.",
    attachments: [const Attachment(url: 'assets/images/thumbnail_1.png')],
  ),
  Email(
    sender: user_4,
    recipients: [],
    subject: 'Volunteer EMT with me?',
    content:
        'What do you think about training to be volunteer EMTs? We could do it together for moral support. Think about it??',
  ),
];

final List<Email> replies = [
  Email(
    sender: user_2,
    recipients: [user_3, user_2],
    subject: 'Dinner Club',
    content:
        "I think it's time for us to finally try that new noodle shop downtown that doesn't use menus. Anyone else have other suggestions for dinner club this week? I'm so intrigued by this idea of a noodle restaurant where no one gets to order for themselves - could be fun, or terrible, or both :)\n\nSo",
  ),
  Email(
    sender: user_0,
    recipients: [user_3, user_2],
    subject: 'Dinner Club',
    content:
        "Yes! I forgot about that place! I'm definitely up for taking a risk this week and handing control over to this mysterious noodle chef. I wonder what happens if you have allergies though? Lucky none of us have any otherwise I'd be a bit concerned.\n\nThis is going to be great. See you all at the usual time?",
  ),
];
