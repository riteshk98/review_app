class Product {
  final String id;
  final String title;
  final String description;
  final int totalUsers;
  final double rating;

  Product(
      {this.id, this.title, this.description, this.totalUsers, this.rating});

  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
        title: json['title'],
        description: json['description'],
        totalUsers: json['totalUsers'],
        rating: json['rating'],
        id: json['id']
    );
  }
}
