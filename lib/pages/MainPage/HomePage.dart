import 'package:dokter_app/config/ColorConfig.dart';
import 'package:dokter_app/pages/DetailPage/DokterDetail.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _articleCategory = [
    "All",
    "Health",
    "Disease",
    "Medicine",
    "Tips",
    "Mental Health",
    "HIV/AIDS",
    "Covid-19"
  ];

  int indexCategoryArticle = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        leadingWidth: 200,
        leading: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Location",
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey,
                ),
              ),
              Row(
                children: [
                  Text(
                    "Jakarta, Indonesia",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: 15,
                  ),
                ],
              )
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Icon(
              Iconsax.notification5,
              color: ColorConfig.primaryColor,
              size: 25,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 180,
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 10),
                        width: 320,
                        height: 180,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Recommended Doctor",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 172,
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DokterDetail()));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 17),
                          margin: EdgeInsets.only(right: 10),
                          width: 170,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade100,
                                blurRadius: 10,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: 65,
                                height: 65,
                                decoration: BoxDecoration(
                                  color: ColorConfig.secondaryColor,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/doctor.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Dr. John Doe",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Dokter Umum",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: ColorConfig.primaryColor,
                                    size: 15,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: ColorConfig.primaryColor,
                                    size: 15,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: ColorConfig.primaryColor,
                                    size: 15,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: ColorConfig.primaryColor,
                                    size: 15,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: ColorConfig.primaryColor,
                                    size: 15,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Article",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 30,
                  child: ListView.builder(
                    itemCount: _articleCategory.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            indexCategoryArticle = index;
                          });
                        },
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: index != indexCategoryArticle
                                ? Colors.transparent
                                : ColorConfig.primaryColor,
                            borderRadius: BorderRadius.circular(10),
                            border: indexCategoryArticle != index
                                ? Border.all(
                                    color: ColorConfig.primaryColor,
                                    width: 1,
                                  )
                                : null,
                          ),
                          child: Text(
                            _articleCategory[index],
                            style: TextStyle(
                              fontSize: 13,
                              color: index != indexCategoryArticle
                                  ? ColorConfig.primaryColor
                                  : Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 200,
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(right: 10),
                        width: 300,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade100,
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 130,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/article.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "The Benefits of Papaya",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Health",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
