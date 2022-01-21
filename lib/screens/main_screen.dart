import 'package:clippy_flutter/arc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kat_kat/constant/constant.dart';
import 'package:kat_kat/models/product-render.dart';
import 'package:kat_kat/models/user_data.dart';


import 'package:kat_kat/providers/products_render.dart';
import 'package:kat_kat/providers/user_provider.dart';
import 'package:kat_kat/widgets/bottom_nav_bar.dart';
import 'package:kat_kat/widgets/card_product.dart';
import 'package:kat_kat/widgets/custom_bottom_sheetProfile.dart';
import 'package:kat_kat/widgets/custom_bottom_sheet_shop.dart';
import 'package:provider/provider.dart';
import 'package:search_widget/search_widget.dart';

bool _show = false;

class MainScreen extends StatefulWidget {
  static const String routeName = "/MainScreen";
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool xbox = false;
  bool netflix = false;
  bool play = true;
  bool google = false;
  bool all = false;
  LeaderBoard _selectedItem;
  ProductRender productsRender;
  bool _isLooding = true;

  
  List<Item> list1 = [];
  List<Item> list2 = [];

  void listProduct() async {
    await Provider.of<ProductsRender>(context,listen: false).productsRenderInfo().then((value){
      _isLooding = false;
    productsRender = Provider.of<ProductsRender>(context,listen: false).productRender;
        int l = (productsRender.items.length / 2).toInt();
    for (int i = 0; i < productsRender.items.length; i++) {
      if (i < l) {
        setState(() {
          list1.add(productsRender.items[i]);
        });
      } else {
        setState(() {
          list2.add(productsRender.items[i]);
        });
      }
    }
    });
  }

  @override
  void initState() {
    listProduct();
    // TODO: implement initState
    super.initState();
  }

  void selected(int index) {
    setState(() {
      if (index == 0) {
        xbox = true;
        netflix = false;
        play = false;
        google = false;
        all = false;
      } else if (index == 1) {
        xbox = false;
        netflix = true;
        play = false;
        google = false;
        all = false;
      } else if (index == 2) {
        xbox = false;
        netflix = false;
        play = true;
        google = false;
        all = false;
      } else if (index == 3) {
        xbox = false;
        netflix = false;
        play = false;
        google = true;
        all = false;
      } else if (index == 4) {
        xbox = false;
        netflix = false;
        play = false;
        google = false;
        all = true;
      }
    });
  }

  List<LeaderBoard> list = <LeaderBoard>[
    LeaderBoard("Flutter", 54),
    LeaderBoard("React", 22.5),
    LeaderBoard("Ionic", 24.7),
    LeaderBoard("Xamarin", 22.1),
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var heightStack = height*0.35;
    var userData = Provider.of<UserProvider>(context).userData;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        child: Column(
          children: [
            Container(
              width: width,
              height: heightStack,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Arc(
                    edge: Edge.BOTTOM,
                    arcType: ArcType.CONVEX,
                    height: heightStack*0.09,
                    child: Container(
                      width: width,
                      decoration: BoxDecoration(
                        gradient: linearGradientM1,
                      ),
                    ),
                  ),
                  Positioned(
                    top:  heightStack*0.09,
                    child: Container(
                      width: width,
                      height: heightStack - ((heightStack*0.09*2)),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                width: width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            showModalBottomSheet(
                                                context: context,
                                                isScrollControlled: true,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.only(
                                                    topRight: Radius.circular(41.0),
                                                    topLeft: Radius.circular(41.0),
                                                  ),
                                                ),
                                                builder: (BuildContext context) =>
                                                    CustomBottomSheetShop(),backgroundColor: Colors.transparent);
                                          },
                                          icon: Icon(Icons.shopping_cart,color: Colors.white,
                                            size: 20,),
                                        ),
                                        _show
                                            ? Container()
                                            : IconButton(
                                          onPressed: () {
                                            setState(() {
                                              _show = !_show;
                                            });
                                          },
                                          icon: Icon(
                                            Icons.search,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    _show
                                        ? Container(
                                      width: width * 0.53,
                                      height: height * 0.1,
                                      child: SearchWidget<LeaderBoard>(
                                        dataList: list,
                                        hideSearchBoxWhenItemSelected: false,
                                        listContainerHeight:
                                        MediaQuery.of(context).size.height /
                                            4,
                                        queryBuilder: (query, list) {
                                          return list
                                              .where((item) => item.username
                                              .toLowerCase()
                                              .contains(
                                              query.toLowerCase()))
                                              .toList();
                                        },
                                        popupListItemBuilder: (item) {
                                          return PopupListItemWidget(item);
                                        },
                                        selectedItemBuilder:
                                            (selectedItem, deleteSelectedItem) {
                                          return SelectedItemWidget(
                                              selectedItem, deleteSelectedItem);
                                        },
                                        // widget customization
                                        noItemsFoundWidget: NoItemsFound(),
                                        textFieldBuilder:
                                            (controller, focusNode) {
                                          return MyTextField(
                                              controller, focusNode);
                                        },
                                        onItemSelected: (item) {
                                          setState(() {
                                            _selectedItem = item;
                                          });
                                        },
                                      ),
                                    )
                                        : Container(),
                                    InkWell(
                                      onTap: (){
                                        showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          builder: (BuildContext context) => CustomBottomSheetProfile(),
                                          backgroundColor: Colors.transparent,
                                        );
                                      },
                                      child: Image.asset(
                                        "assets/images/menu.png",
                                        width: 22,
                                        height: 15,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  // Text("${userData.firstname}",                                    style: textm1.copyWith(
                                  //     fontSize: heightStack*0.06
                                  // )),
                                  Text(
                                    "،مرحبا ",
                                    style: textm1.copyWith(
                                      fontSize: heightStack*0.06
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "اختر بطاقتك",
                                style: textm1.copyWith(
                                    fontSize: heightStack*0.07
                                ),
                              ),
                              SizedBox(height:  heightStack*0.03,),
                              Container(
                                width: width,
                                alignment: Alignment.center,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () => selected(0),
                                        child: Container(
                                          width: heightStack*0.27,
                                          height: heightStack*0.33,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                "assets/images/xbox.png",
                                                width:  heightStack*0.12,
                                                height:  heightStack*0.17,
                                              ),
                                              SizedBox(
                                                height:5,
                                              ),
                                              Text(
                                                "Xbox",
                                                style: textm2.copyWith(
                                                  fontSize: heightStack*0.05
                                                ),
                                              )
                                            ],
                                          ),
                                          decoration: BoxDecoration(
                                              color: xbox
                                                  ? Color.fromRGBO(255, 255, 255, 0.2)
                                                  : null,
                                              border: xbox
                                                  ? Border.all(
                                                  color: color3, width: 1)
                                                  : null,
                                              borderRadius:
                                              BorderRadius.circular(10)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      InkWell(
                                        onTap: () => selected(1),
                                        child: Container(
                                          width: heightStack*0.27,
                                          height: heightStack*0.33,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                "assets/images/netflix.png",
                                                width:  heightStack*0.11,
                                                height:  heightStack*0.16,
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                "Netflix",
                                                style: textm2.copyWith(
                                                    fontSize: heightStack*0.05
                                                ),
                                              )
                                            ],
                                          ),
                                          decoration: BoxDecoration(
                                              color: netflix
                                                  ? Color.fromRGBO(255, 255, 255, 0.2)
                                                  : null,
                                              border: netflix
                                                  ? Border.all(
                                                  color: color3, width: 1)
                                                  : null,
                                              borderRadius:
                                              BorderRadius.circular(10)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      InkWell(
                                        onTap: () => selected(2),
                                        child: Container(
                                          width: heightStack*0.27,
                                          height: heightStack*0.33,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                "assets/images/plays.png",
                                                width:  heightStack*0.12,
                                                height:  heightStack*0.17,
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                "Playstation",
                                                style: textm2.copyWith(
                                                    fontSize: heightStack*0.05
                                                ),
                                              )
                                            ],
                                          ),
                                          decoration: BoxDecoration(
                                              color: play
                                                  ? Color.fromRGBO(255, 255, 255, 0.2)
                                                  : null,
                                              border: play
                                                  ? Border.all(
                                                  color: color3, width: 1)
                                                  : null,
                                              borderRadius:
                                              BorderRadius.circular(10)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      InkWell(
                                        onTap: () => selected(3),
                                        child: Container(
                                          width: heightStack*0.27,
                                          height: heightStack*0.33,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                "assets/images/google-play.png",
                                                width:  heightStack*0.12,
                                                height:  heightStack*0.17,
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                "iTunes",
                                                style: textm2.copyWith(
                                                    fontSize: heightStack*0.05
                                                ),
                                              )
                                            ],
                                          ),
                                          decoration: BoxDecoration(
                                              color: google
                                                  ? Color.fromRGBO(255, 255, 255, 0.2)
                                                  : null,
                                              border: google
                                                  ? Border.all(
                                                  color: color3, width: 1)
                                                  : null,
                                              borderRadius:
                                              BorderRadius.circular(10)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      InkWell(
                                        onTap: () => selected(4),
                                        child: Container(
                                          width: heightStack*0.27,
                                          height: heightStack*0.33,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                "assets/images/menu-grid.png",
                                                width:  heightStack*0.12,
                                                height:  heightStack*0.17,
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                "الكل",
                                                style: textm2.copyWith(
                                                    fontSize: heightStack*0.05
                                                ),
                                              )
                                            ],
                                          ),
                                          decoration: BoxDecoration(
                                              color: all
                                                  ? Color.fromRGBO(255, 255, 255, 0.2)
                                                  : null,
                                              border: all
                                                  ? Border.all(
                                                  color: color3, width: 1)
                                                  : null,
                                              borderRadius:
                                              BorderRadius.circular(10)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: width,
                height: height-(heightStack),
                child:_isLooding?Center(child: CircularProgressIndicator()): SingleChildScrollView(
                  primary: true,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: width * 0.4,
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            primary: false,
                            itemCount: list2.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CardOfProduct(product: list2[index],);
                            }),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                        width: width * 0.4,
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            primary: false,
                            itemCount: list1.length+1,
                            itemBuilder: (BuildContext context, int index) {
                              return index == 0
                                  ? Container(
                                child: Container(
                                  width: 132,
                                  height: 85,
                                  decoration: BoxDecoration(
                                      gradient: linearGradientM2,
                                      borderRadius:
                                      BorderRadius.circular(15)),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "أفضل الخصومات",
                                        style: textm5,
                                      ),
                                      Text(
                                        "25%",
                                        style: textm6,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                                  : CardOfProduct(product: list1[(index-1)],);
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LeaderBoard {
  LeaderBoard(this.username, this.score);

  final String username;
  final double score;
}

class SelectedItemWidget extends StatefulWidget {
  const SelectedItemWidget(this.selectedItem, this.deleteSelectedItem);
  final LeaderBoard selectedItem;
  final VoidCallback deleteSelectedItem;

  @override
  _SelectedItemWidgetState createState() => _SelectedItemWidgetState();
}

class _SelectedItemWidgetState extends State<SelectedItemWidget> {
  @override
  void initState() {
    setState(() {
      _show = !_show;
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // padding: const EdgeInsets.symmetric(
        //   vertical: 2,
        //   horizontal: 4,
        // ),
        // child: Row(
        //   children: <Widget>[
        //     Expanded(
        //       child: Padding(
        //         padding: const EdgeInsets.only(
        //           left: 16,
        //           right: 16,
        //           top: 8,
        //           bottom: 8,
        //         ),
        //         child: Text(
        //           selectedItem.username,
        //           style: const TextStyle(fontSize: 14),
        //         ),
        //       ),
        //     ),
        //     IconButton(
        //       icon: Icon(Icons.delete_outline, size: 22),
        //       color: Colors.grey[700],
        //       onPressed: deleteSelectedItem,
        //     ),
        //   ],
        // ),
        );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField(this.controller, this.focusNode);

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          style: TextStyle(fontSize: 16, color: Colors.white),
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: new BorderSide(color: Colors.white)),
            focusedBorder: UnderlineInputBorder(
                borderSide: new BorderSide(color: Colors.white)),
            suffixIcon: InkWell(
              onTap: (){
                _show = !_show;
              },
              child: Icon(
                Icons.search,
                color: Colors.white,
                size: 20,
              ),
            ),
            border: InputBorder.none,
            hintText: "ابحث هنا..",
            hintStyle: TextStyle(color: Colors.white, fontSize: 15),
            contentPadding: const EdgeInsets.only(
              left: 10,
              right: 10,
              top: 8,
              bottom: 8,
            ),
          ),
        ),
      ),
    );
  }
}

class NoItemsFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(
          Icons.folder_open,
          size: 24,
          color: Colors.grey[900].withOpacity(0.7),
        ),
        const SizedBox(width: 10),
        Text(
          "No Items Found",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[900].withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}

class PopupListItemWidget extends StatelessWidget {
  const PopupListItemWidget(this.item);

  final LeaderBoard item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Text(
        item.username,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
