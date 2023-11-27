class Translations {
  translateCategories(List<String> list) {
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
}
