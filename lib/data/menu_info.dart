class MenuInfo {
  int id;
  String menuName;

  MenuInfo({
    required this.id,
    required this.menuName,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'menu_name': menuName,
    };
  }

  factory MenuInfo.fromMap(Map<String, dynamic> map) {
    return MenuInfo(
      id: map['id'],
      menuName: map['menu_name'],
    );
  }
}

