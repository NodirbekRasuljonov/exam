class MockData {
  String title;
  String price;
  String imgurl;
  String market;
  String detail;
  MockData(
      {required this.title,
      required this.price,
      required this.imgurl,
      required this.market,
      required this.detail});
}

class Vegetables {
  static List<String> vegetablesimg = [
    'assets/svg/data/broccoli.svg',
    'assets/svg/data/lettuce.svg',
    'assets/svg/data/paprika.svg',
    'assets/svg/data/potato.svg',
    'assets/svg/data/broccoli.svg',
    'assets/svg/data/lettuce.svg',
    'assets/svg/data/paprika.svg',
    'assets/svg/data/potato.svg',
    'assets/svg/data/broccoli.svg',
    'assets/svg/data/lettuce.svg',
  ];
  static List<String> title = [
    'Broccoli',
    'Lettuce',
    'Paprika',
    'Potato',
    'Broccoli',
    'Lettuce',
    'Paprika',
    'Potato',
    'Broccoli',
    'Lettuce',
  ];
  static List<MockData> vegetables = List.generate(
    10,
    (index) => MockData(
        title: title[index],
        price: "\$4.0",
        imgurl: vegetablesimg[index],
        market: 'Korzinka',
        detail:
            'Paprika is a fruit-producing plant that tastes sweet and slightly spicy from the eggplant or Solanaceae tribe. Its green, yellow, red, or purple fru..Read more'),
  );
}

class Categories {
  String name;
  String imgurl;
  Categories({required this.name, required this.imgurl});
}

class CategoriesData {
  static List<String> categoriesimg = [
    'assets/svg/data/broccoli.svg',
    'assets/svg/data/banana.svg',
    'assets/svg/data/meat.svg',
  ];

  static List<String> title = [
    'Vegetables',
    'Friuts',
    'Meats',
  ];

  static List<Categories> catList = List.generate(
    3,
    (index) => Categories(
      name: title[index],
      imgurl: categoriesimg[index],
    ),
  );
}
