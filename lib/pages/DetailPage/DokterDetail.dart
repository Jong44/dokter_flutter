import 'package:dokter_app/components/global/PrimaryButton.dart';
import 'package:dokter_app/components/pages/DokterDetail/CardMetode.dart';
import 'package:dokter_app/components/pages/DokterDetail/CardTanggalSchedule.dart';
import 'package:dokter_app/components/pages/DokterDetail/CardTime.dart';
import 'package:dokter_app/config/ColorConfig.dart';
import 'package:dokter_app/pages/TransaksiPage/ReportPage.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DokterDetail extends StatefulWidget {
  const DokterDetail({super.key});

  @override
  State<DokterDetail> createState() => DokterDetailState();
}

class DokterDetailState extends State<DokterDetail> {
  List _categoryDokter = [
    "Dokter Umum",
    "Spesialis Anak",
    "Sakit Dalam",
  ];

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

  List _tanggalHari = [
    {"tanggal": "15", "hari": "Mon"},
    {"tanggal": "16", "hari": "Tue"},
    {"tanggal": "17", "hari": "Wed"},
    {"tanggal": "18", "hari": "Thu"},
    {"tanggal": "19", "hari": "Fri"},
    {"tanggal": "20", "hari": "Sat"},
    {"tanggal": "21", "hari": "Sun"},
  ];

  int indexSelectedSchedule = 0;

  List _time = [
    "09:00 AM",
    "10:00 AM",
    "11:00 AM",
    "12:00 PM",
    "01:00 PM",
    "02:00 PM",
  ];

  int indexSelectedTime = 0;

  List _metode = [
    {"title": "Online Consultation", "icon": Iconsax.video},
    {"title": "Clinic Consultation", "icon": Iconsax.map},
  ];

  int indexSelectedMetode = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/dokter.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dr. John Doe',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          'MBBS, MD - General Medicine',
                          style: TextStyle(
                            fontSize: 14,
                            color: ColorConfig.textGrey,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow),
                            const SizedBox(width: 4),
                            Text(
                              '4.5  (200)',
                              style: TextStyle(
                                  fontSize: 14, color: ColorConfig.textGrey),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: List.generate(
                    _categoryDokter.length,
                    (index) => Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      margin: EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: _colorCategoryDokter[index],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        _categoryDokter[index],
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: _colorTextCategoryDokter[index],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Doctor\'s Biography',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Dr. John Doe is a General Physician with 10 years of experience. He completed his MBBS from the University of Delhi in 2009 and MD in General Medicine from the University of Mumbai in 2013. He is a member of the Indian Medical Association (IMA). Some of the services provided by the doctor are: Health Checkup (General), Infectious Disease Treatment, Fever Treatment, and Diabetes Management.',
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 14,
                    color: ColorConfig.textGrey,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Doctor\'s Schedule',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 100,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _tanggalHari.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              setState(() {
                                indexSelectedSchedule = index;
                              });
                            },
                            child: CardTanggalSchedule(
                              tanggal: _tanggalHari[index]['tanggal'],
                              hari: _tanggalHari[index]['hari'],
                              isSelected: index == indexSelectedSchedule,
                            ),
                          ),
                          const SizedBox(width: 8),
                        ],
                      );
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Available Time',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(
                    _time.length,
                    (index) => InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          indexSelectedTime = index;
                        });
                      },
                      child: CardTime(
                          time: _time[index],
                          isSelected: index == indexSelectedTime),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Consultation Method',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Choose the consultation method',
                  style: TextStyle(
                    fontSize: 14,
                    color: ColorConfig.textGrey,
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(
                    _metode.length,
                    (index) => InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          indexSelectedMetode = index;
                        });
                      },
                      child: CardMetode(
                          title: _metode[index]['title'],
                          icon: _metode[index]['icon'],
                          isSelected: index == indexSelectedMetode),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: PrimaryButton(
          text: 'Book (Rp 100.000)',
          icon: Iconsax.calendar,
          onpress: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ReportPage()));
          },
        ),
      ),
    );
  }
}
