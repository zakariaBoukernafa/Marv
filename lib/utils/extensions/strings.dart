
extension Operations on String {

  String? filterPaymentErrorMessage() {
    try {
      return split(',')[1].split('.')[0];
    } catch (e) {
      return null;
    }
  }
  List<int> splitAtSlash() => split("/").map((e) => int.parse(e)).toList();


}
