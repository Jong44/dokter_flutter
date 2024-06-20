import 'package:dokter_app/components/pages/SchedulePage/CardDokterSchedule.dart';
import 'package:dokter_app/config/ColorConfig.dart';
import 'package:flutter/material.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  List<String> _kategori = [
    "Upcoming",
    "Completed",
    "Cancelled",
  ];

  List<Map<String, dynamic>> _listSchedule = [
    {
      "name": "Dr. Stella Kane",
      "specialist": "General Practitioner",
      "time": "08:00 AM",
      "date": "Today, 20 July 2021",
      "image": "assets/images/doctor.png",
      "status": "Upcoming"
    },
    {
      "name": "Dr. Stella Kane",
      "specialist": "General Practitioner",
      "time": "08:00 AM",
      "date": "Today, 20 July 2021",
      "image": "assets/images/doctor.png",
      "status": "Upcoming"
    },
    {
      "name": "Dr. Stella Kane",
      "specialist": "General Practitioner",
      "time": "08:00 AM",
      "date": "Tomorrow, 21 July 2021",
      "image": "assets/images/doctor.png",
      "status": "Upcoming"
    },
    {
      "name": "Dr. Stella Kane",
      "specialist": "General Practitioner",
      "time": "08:00 AM",
      "date": "18 July 2021",
      "image": "assets/images/doctor.png",
      "status": "Completed"
    },
    {
      "name": "Dr. Stella Kane",
      "specialist": "General Practitioner",
      "time": "08:00 AM",
      "date": "18 July 2021",
      "image": "assets/images/doctor.png",
      "status": "Completed"
    },
    {
      "name": "Dr. Stella Kane",
      "specialist": "General Practitioner",
      "time": "08:00 AM",
      "date": "18 July 2021",
      "image": "assets/images/doctor.png",
      "status": "Completed"
    },
    {
      "name": "Dr. Stella Kane",
      "specialist": "General Practitioner",
      "time": "08:00 AM",
      "date": "18 July 2021",
      "image": "assets/images/doctor.png",
      "status": "Cancelled"
    },
    {
      "name": "Dr. Stella Kane",
      "specialist": "General Practitioner",
      "time": "08:00 AM",
      "date": "19 July 2021",
      "image": "assets/images/doctor.png",
      "status": "Cancelled"
    },
    {
      "name": "Dr. Stella Kane",
      "specialist": "General Practitioner",
      "time": "08:00 AM",
      "date": "29 July 2021",
      "image": "assets/images/doctor.png",
      "status": "Cancelled"
    },
  ];

  List result = [];
  int indexKategoriSelected = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    result = _listSchedule
        .where(
            (element) => element['status'] == _kategori[indexKategoriSelected])
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Schedule',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  _kategori.length,
                  (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          indexKategoriSelected = index;
                          result = _listSchedule
                              .where((element) =>
                                  element['status'] == _kategori[index])
                              .toList();
                        });
                      },
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: index == indexKategoriSelected
                                  ? ColorConfig.primaryColor
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                _kategori[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: index == indexKategoriSelected
                                      ? Colors.white
                                      : Colors.grey[600],
                                ),
                              ),
                            ),
                          ),
                          index == _kategori.length - 1
                              ? const SizedBox()
                              : Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 9, vertical: 6),
                                  width: 1,
                                  height: 40,
                                  color: Colors.grey[300],
                                ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: result.length,
                itemBuilder: (context, index) {
                  return CardDokterSchedule(
                    name: result[index]['name'],
                    specialist: result[index]['specialist'],
                    time: result[index]['time'],
                    date: result[index]['date'],
                    image: result[index]['image'],
                  );
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
