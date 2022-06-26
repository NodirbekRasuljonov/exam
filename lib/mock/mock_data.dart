class MockData {
  String title;
  String price;
  String imgurl;
  String market;
  MockData({required this.title, required this.price, required this.imgurl,required this.market});
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
      market: 'Korzinka'
    ),
  );
}
