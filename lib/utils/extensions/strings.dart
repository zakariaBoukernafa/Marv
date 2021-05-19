extension Operations on String {
  List<int> slipitAtSlash() {
    return split("/").map((e) => int.parse(e)).toList();
  }

  String? filterPaymentErrorMessage() {
    try {
      return split(',')[1].split('.')[0];
    }
    catch(e){
      return null;
    }
  }
}
