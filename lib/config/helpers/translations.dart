class Translations {
  List<String> translateCategories(List<String> list) {
    Map<String, String> translationMap = {
      'electronics': 'Electrónicos',
      'jewelery': 'Joyería',
      "men's clothing": 'Ropa para hombres',
      "women's clothing": 'Ropa para mujeres',
    };

    List<String> categoriesInSpanish = list.map((category) {
      return translationMap[category] ?? category;
    }).toList();

    return categoriesInSpanish;
  }

  String translateCategory(String categoryEN) {
    switch (categoryEN) {
      case 'electronics':
        return 'Electrónicos';
      case 'jewelery':
        return 'Joyería';
      case "men's clothing":
        return 'Ropa para hombres';
      case "women's clothing":
        return 'Ropa para mujeres';
      default:
        return 'Nada';
    }
  }
}
