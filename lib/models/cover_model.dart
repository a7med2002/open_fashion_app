class CoverModel {
  final String image;
  final String name;

  CoverModel({required this.image, required this.name});

  static List<CoverModel> covers = [
    CoverModel(
        image: "assets/cover/Rectangle 440.png", name: "Black collection"),
    CoverModel(image: "assets/cover/Rectangle 441.png", name: "HAE BY HAEKIM"),
    CoverModel(
        image: "assets/cover/Rectangle 440.png", name: "Black collection"),
  ];
}
