import 'package:flutter/material.dart';
import '../components/bottom_nav_bar.dart';
import '../database.dart';

class favouritesscreen extends StatefulWidget {
  const favouritesscreen({Key? key}) : super(key: key);

  @override
  State<favouritesscreen> createState() => _favouritesscreenState();
}

class _favouritesscreenState extends State<favouritesscreen> {
  var size,
      height,
      width;
  var listlength=0;
  late Databases db;
  List favouriteItems = [["Kapili Canteen","Aloo Seez Paratha",25],["Disang Canteen","Duck Curry",60],["Lohit Canteen","Lays Masala Dosa",40]];

  // Map Menu={};
  // initialise(){
  //   db=Databases();
  //   db.initialise();
  // }
  // @override
  // void initState(){
  //   super.initState();
  //   initialise();
  //   db.retrieve_menu("").then((value){
  //     setState(() {
  //       Menu=value;
  //       listlength=Menu['menu'].length;
  //     });
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    double h = size.height;
    double w = size.width;
    return Stack(
      children: [
        Image.asset(
          height: h,
          width: w,
          fit: BoxFit.cover,
          "assets/images/bgImage1.png",
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 20,
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Center(
                child: Container(
                  height:50,
                  width:50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),

                  child: const Image(
                    image: AssetImage("assets/images/appLogo.png"),
                  ),
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 100.0,
              leading: IconButton(
                onPressed: (){},
                icon: const Icon(Icons.arrow_back_ios_new , color: Colors.black ),
              ),
              actions: [
                Transform.scale(
                  scale: 1.5,
                  child: IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.account_circle_outlined , color: Colors.black),
                  ),
                ),
              ],
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        // decoration: BoxDecoration(
                        //     border: Border.all(color: Colors.black)
                        // ),
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: Text("Favourites", style: TextStyle(fontSize: 40,fontWeight: FontWeight.w400)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 550,
                      child: ListView.builder(
                        itemCount: favouriteItems.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(top: 20),
                            child: FavouritesCard(
                              name: favouriteItems[index][1],
                              price: favouriteItems[index][2],
                              shopName: favouriteItems[index][0],
                            ),
                          );
                          // if(Menu['menu'][index]['Available']==1) {
                          //   return Container(
                          //     margin: EdgeInsets.only(bottom: 20, top: 20),
                          //     child: FavouritesCard(
                          //       name: Menu['menu'][index]['Name'],
                          //       price: Menu['menu'][index]['Price'],
                          //     ),
                          //   );
                          // }else{
                          //   return Container();
                          // }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: const BottomNavBar(),
          ),
        )
      ],
    );
  }
}

class FavouritesCard extends StatelessWidget {
  final String name;
  num price;
  final String shopName;

  FavouritesCard({
    this.name = "",
    this.price = 0,
    this.shopName = "",
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
        height: 200,
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(188, 157, 255, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              height: 60,
              width: 280,
              child: Center(
                child: Text(
                  shopName,
                  style: TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 249, 240, 1.0),
                ),
                padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                height: 80,
                width: 280,
                child: Text.rich(
                    TextSpan(
                        style: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 20,
                        ),
                        children: [
                          TextSpan(text: name),
                          TextSpan(text: '\n'),
                          TextSpan(text: '\n'),
                          TextSpan(text: "₹ "),
                          TextSpan(text: price.toString()),
                        ]
                    )
                )
            ),
            Container(
                height: 60,
                width: 280,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 249, 240, 1.0),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)
                    )
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 10, 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: StadiumBorder(),
                            backgroundColor: Color.fromRGBO(188, 157, 255, 1),
                          ),
                          child: const Text(
                            'Add to Cart',
                            style: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 15,
                            ),
                          ),
                          onPressed: (){
                            showDialog(context: context, builder: (BuildContext context){
                              return AlertDialog(
                                contentPadding: EdgeInsets.all(0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                content: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.indigo,
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                  ),
                                  height: 400,
                                ),
                              );
                            });
                          },
                        ),
                      )
                    ]
                )
            )
          ],
        ),
      ),
    );
  }
}
