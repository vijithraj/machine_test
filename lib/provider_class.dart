import 'package:flutter/cupertino.dart';

class Provider_class extends ChangeNotifier {
  List favname = [];
  List favimage = [];
  List favprice = [];
  List favunit = [];
  List get favoritename => favname;
  List get favoriteimage => favimage;
  List get favoriteprice => favprice;
  List get favoriteunit => favunit;
  void favorites(String imagepath, name, unit, price) {
    final favnameList = favname.contains(name);
    if (favnameList) {
      favname.remove(name);
      favimage.remove(imagepath);
      favunit.remove(unit);
      favprice.remove(price);
    } else {
      favname.add(name);
      favimage.add(imagepath);
      favunit.add(unit);
      favprice.add(price);
    }
    notifyListeners();
  }
}
