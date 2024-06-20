import 'package:cool_alert/cool_alert.dart';
import 'package:dokter_app/components/global/PrimaryButton.dart';
import 'package:dokter_app/components/pages/TransaksiPage/PaymentCard.dart';
import 'package:dokter_app/components/pages/TransaksiPage/RowTransaksi.dart';
import 'package:dokter_app/config/ColorConfig.dart';
import 'package:dokter_app/pages/MainPage/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ReportPage extends StatefulWidget {
  final Map data;
  const ReportPage({super.key, required this.data});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  bool isShow = false;
  int indexPayment = 0;

  List paymentMethod = [
    {
      'name': 'Bca',
      'icon': 'assets/images/bca.png',
    },
    {
      'name': 'Mandiri',
      'icon': 'assets/images/mandiri.png',
    },
    {
      'name': 'Gopay',
      'icon': 'assets/images/gopay.png',
    },
    {
      'name': 'OVO',
      'icon': 'assets/images/ovo.png',
    },
    {
      'name': 'Dana',
      'icon': 'assets/images/dana.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          title: Text(
            'Detail Transaction',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Container(
            height: double.infinity,
            color: Colors.grey[100],
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        RowTransaksi(
                          title: 'Transaction ID',
                          content: 'TRX-123456',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RowTransaksi(
                          title: "Patient's Name",
                          content: "Albireo",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RowTransaksi(
                          title: 'Doctor',
                          content: widget.data['name'],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RowTransaksi(
                          title: 'Date',
                          content: widget.data['schedule']['hari'] +
                              ', ' +
                              widget.data['schedule']['tanggal'] +
                              " Nov 2021",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RowTransaksi(
                          title: 'Time Consultation',
                          content: widget.data['time'],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RowTransaksi(
                          title: 'Price',
                          content: widget.data['price'].toString(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Payment Method",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                            children:
                                List.generate(paymentMethod.length, (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                indexPayment = index;
                              });
                            },
                            child: CardPayment(
                              name: paymentMethod[index]['name'],
                              icon: paymentMethod[index]['icon'],
                              isSelected: index == indexPayment,
                            ),
                          );
                        })),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Summary",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RowTransaksi(
                          title: 'Payment',
                          content: widget.data['price'].toString(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RowTransaksi(
                          title: 'Admin Fee',
                          content: 'Rp 3000',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Total Payment",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            Text(
                              'Rp 103.000',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        PrimaryButton(
                          text: 'Pay Now',
                          icon: Icons.payment,
                          onpress: () {
                            CoolAlert.show(
                              backgroundColor: ColorConfig.primaryColor,
                              context: context,
                              type: CoolAlertType.success,
                              title: "Success",
                              text: "Payment Success",
                              confirmBtnColor: ColorConfig.primaryColor,
                              onConfirmBtnTap: () {
                                print('Payment Success');
                                Navigator.of(context)
                                  ..pop()
                                  ..pop();
                              },
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
