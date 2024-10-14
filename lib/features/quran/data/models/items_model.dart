class ItemsModel {
  final String title, subTitle;
  final void Function()? onPress;

  ItemsModel(
      {required this.title, required this.subTitle, required this.onPress});
}
