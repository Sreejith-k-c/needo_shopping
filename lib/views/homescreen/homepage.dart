import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needo_shopping/controller/controller_model.dart';
import 'package:needo_shopping/location/locationPage.dart';
import 'package:needo_shopping/views/merchant/merchant.dart';

class NeedoHome extends StatelessWidget {
  final ModelController controller = Get.put(ModelController());

  var images = [
    'assets/image/banner_four.jpg',
    'assets/image/banner_three.jpg',
    'assets/image/grocery_banner.jpg',
    'assets/image/banner_two.jpg',
  ];
  var catimage = [
    "assets/image/food.png",
    "assets/image/grocery.jpg",
    "assets/image/electronics.jpg",
    "assets/image/clothing.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationPage()));
          },

          icon: Icon(
            Icons.location_on_outlined,size: 30,
            color: Color.fromARGB(255, 44, 108, 49),
          ),
        ),
        title: Text("Home",style: TextStyle(color: Color.fromARGB(255, 44, 108, 49),
        fontWeight: FontWeight.bold),),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "You will get on your doorstep!",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      itemCount: controller.productList.value.shopCategories?.length ?? 0,
                      itemBuilder: (context, index) {
                        String category = controller.productList.value.shopCategories![index];
                        String imagePath = catimage[index % images.length];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Get.to(() => ShopPage(category: category));
                            },
                            child: Container(
                              height: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey)
                              ),
                              child: ListTile(
                                title: Container(
                                  child: Text(
                                    '$category',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                  ),
                                ),
                                leading: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: AssetImage(imagePath),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                trailing: Icon(Icons.chevron_right_rounded),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CarouselSlider.builder(
                    itemCount: images.length,
                    itemBuilder: (context, index, realIndex) {
                      String imagePath = images[index];
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      autoPlay: true,
                      enableInfiniteScroll: true,
                      viewportFraction: 1,
                    ),
                  ),
                ),
              ],
            ),
      ),
    );
  }
}
