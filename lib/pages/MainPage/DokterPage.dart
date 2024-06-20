import 'package:dokter_app/components/pages/DokterPage/CardKategoriDokter.dart';
import 'package:dokter_app/config/ColorConfig.dart';
import 'package:dokter_app/components/pages/DokterPage/CardDokter.dart';
import 'package:dokter_app/pages/DetailPage/DokterDetail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DokterPage extends StatefulWidget {
  const DokterPage({super.key});

  @override
  State<DokterPage> createState() => _DokterPageState();
}

class _DokterPageState extends State<DokterPage> {
  List<String> kategori = ['Specialist', 'General', 'Dentist'];
  int selectedIndex = 0;
  List<Color> _colorCategoryDokter = [
    ColorConfig.primaryColor.withOpacity(0.2),
    ColorConfig.secondaryColor.withOpacity(0.2),
    ColorConfig.tertiaryColor.withOpacity(0.2),
  ];

  List<Color> _colorTextCategoryDokter = [
    ColorConfig.primaryTextColor,
    ColorConfig.secondaryTextColor,
    ColorConfig.tertiaryTextColor,
  ];

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: ColorConfig.primaryColor, width: 1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Iconsax.search_normal,
                                color: Colors.grey[400]),
                          ),
                          Expanded(
                            child: TextField(
                              onChanged: (value) {
                                setState(() {});
                              },
                              controller: _searchController,
                              style: TextStyle(fontSize: 14),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search Doctor',
                              ),
                            ),
                          ),
                          _searchController.text.isNotEmpty
                              ? InkWell(
                                  onTap: () {
                                    setState(() {
                                      _searchController.clear();
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(8),
                                    width: 25,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: ColorConfig.primaryColor,
                                          width: 2),
                                    ),
                                    child: Icon(
                                      CupertinoIcons.xmark,
                                      color: ColorConfig.primaryColor,
                                      size: 15,
                                    ),
                                  ))
                              : const SizedBox.shrink(),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            color: ColorConfig.primaryColor, width: 1),
                      ),
                      child: const Icon(Iconsax.setting_4,
                          color: ColorConfig.primaryColor),
                    ),
                  )
                ],
              ),
              SizedBox(height: 16),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                spacing: 2,
                runSpacing: 16,
                children: List.generate(
                  kategori.length,
                  (index) => CardCategoriDokter(
                    textColor: _colorTextCategoryDokter[index],
                    color: _colorCategoryDokter[index],
                    text: kategori[index],
                    onDeleted: () {
                      setState(() {
                        kategori.removeAt(index);
                        _colorCategoryDokter.removeAt(index);
                        _colorTextCategoryDokter.removeAt(index);
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Result for Doctor',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return CardDokter(
                    onpressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DokterDetail(),
                        ),
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    ));
  }
}
