import 'package:sample_trading_app/core/utils/item_loader.dart';
import 'package:sample_trading_app/presentation/reusable_widgets/item_model.dart';

class NavigationItems {
  NavigationItems() {
    loadItemsFromJson();
  }


 Future<List<DrawerItemModel>>  loadItemsFromJson() async {
    ItemLoader itemLoader = ItemLoader();
    Map<String,dynamic> itemMaps= await itemLoader.loadItems();
    return (itemMaps['bottomNavigationItems'] as List).map((item) {
      return DrawerItemModel.fromJson(item);
    }).toList();
  }
}
