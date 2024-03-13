import 'package:get/get.dart';
import 'package:needo_shopping/model/api_model.dart';
import 'package:needo_shopping/service/service.dart';

class ModelController extends GetxController {
  var isLoading = true.obs;
  var productList = ModelApi().obs;

  @override
  void onInit() {
    getProduct();
    super.onInit();
  }

  void getProduct() async {
    try {
      isLoading(true);
      var products = await NeedoService.fetchProducts();
      if (products != null) {
        productList.value = products;
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
