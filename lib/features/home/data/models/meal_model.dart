class MealModel {
  final int? id;
  final String name;
  final String imageUrl;
  final String description;
  final String time; // عدد الدقائق مثلاً
  final double rate;

  MealModel({
    this.id,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.time,
    required this.rate,
  });

  /// لتحويل الكائن إلى Map لتخزينه في SQLite
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'name': name,
      'imageUrl': imageUrl,
      'description': description,
      'time': time,
      'rate': rate,
    };

    // نضيف id فقط لو موجود
    if (id != null) {
      map['id'] = id;
    }

    return map;
  }

  /// لتحويل Map من قاعدة البيانات إلى كائن MealModel
  factory MealModel.fromMap(Map<String, dynamic> map) {
    return MealModel(
      id: map['id'],
      name: map['name'],
      imageUrl: map['imageUrl'],
      description: map['description'],
      time: map['time'],
      rate: (map['rate'] as num).toDouble(), // تأكد من النوع double
    );
  }
}
