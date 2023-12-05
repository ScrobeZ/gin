mixin TextHelpers {
  bool areEmpty(List<String> list) {
    for (var controller in list) {
      if (controller.isEmpty) {
        return false;
      }
    }

    return true;
  }
}
