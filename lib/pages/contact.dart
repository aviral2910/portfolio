import 'dart:convert';

import 'package:aviralportfolio/common/global.dart';
import 'package:aviralportfolio/provider/themeProvider.dart';
import 'package:aviralportfolio/widgets/Common/headingCard.dart';
import 'package:aviralportfolio/widgets/inwardTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Contact extends StatefulWidget {
  Contact({super.key, required this.scrollController, required this.height});
  ScrollController scrollController;
  double height;
  @override
  State<Contact> createState() => _ContactState();
}

final contactPositionKey = GlobalKey();

class _ContactState extends State<Contact> {
  RenderBox? box;
  double? y;
  Offset? position;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.scrollController.addListener(() {
      box ??=
          contactPositionKey.currentContext!.findRenderObject() as RenderBox;
      position = box!.localToGlobal(Offset.zero); //this is global position

      if (position!.dy < widget.height * .6) {
        if (changeAppBar == false) {
          setState(() {
            changeAppBar = true;
          });
        }
      } else {
        if (changeAppBar == true) {
          setState(() {
            changeAppBar = false;
          });
        }
      }
    });
  }

  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController message = TextEditingController();
  bool changeAppBar = false;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: w,
      key: contactPositionKey,
      padding: EdgeInsets.only(
          left: w < mobileSize ? 20 : 0, right: w < mobileSize ? 20 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeIn,
            height: changeAppBar ? h * .1 : h * .15,
          ),
          HeadingCard(
            icon: "assets/images/contact.png",
            text: "CONTACT",
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeIn,
            height: changeAppBar ? 25 : 50,
          ),
          SizedBox(
            width: w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Feel free to Contact me by submitting the form below and I will get back to you as soon as possible",
                  style: GoogleFonts.titilliumWeb(
                      color: const Color.fromARGB(207, 255, 255, 255),
                      fontWeight: FontWeight.w400,
                      fontSize: w < mobileSize ? 13 : 16),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeIn,
                  height: changeAppBar ? 45 : 60,
                ),
                ContactCard(
                    w: w,
                    name: name,
                    changeAppBar: changeAppBar,
                    phone: phone,
                    email: email,
                    message: message)
              ],
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
            height: changeAppBar ? 100 : 110,
          ),
        ],
      ),
    );
  }
}

class ContactCard extends StatefulWidget {
  const ContactCard({
    super.key,
    required this.w,
    required this.name,
    required this.changeAppBar,
    required this.phone,
    required this.email,
    required this.message,
  });

  final double w;
  final TextEditingController name;
  final bool changeAppBar;
  final TextEditingController phone;
  final TextEditingController email;
  final TextEditingController message;

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  bool isLoading = false;
  Future sendEmail(
    String name,
    String email,
    String message,
    String phone,
  ) async {
    final serviceId = 'service_raopw1k';
    final templateId = 'template_f28mjrc';
    final userId = 'PQRzhg6kh0s_pVp0q';

    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'accessToken': "qltDvyGkraugzh89I6OFS",
          'template_params': {
            'user_email': email,
            'user_phone': phone,
            'user_name': name,
            'user_message': message,
          }
        }));
    print(response.body);
  }

  bool ishover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (value) {
        ishover = value;
        setState(() {});
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.all(widget.w < mobileSize ? 15 : 35),
        width: widget.w < mobileSize ? widget.w * .9 : widget.w * .6,
        // height: 700,
        decoration: BoxDecoration(
            // color: darkthemeColor,
            gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 19, 19, 19),
                  Color.fromARGB(255, 15, 15, 15)
                ]),
            boxShadow: [
              BoxShadow(
                  blurRadius: ishover ? 2 : 7,
                  offset: ishover ? const Offset(-2, -2) : const Offset(-8, -8),
                  color: ishover
                      ? Provider.of<ThemeProvider>(context)
                          .getThemeColor
                          .withOpacity(.8)
                      : const Color.fromARGB(121, 32, 32, 32)),
              BoxShadow(
                  blurRadius: ishover ? 2 : 8,
                  offset: ishover ? const Offset(2, 2) : const Offset(8, 8),
                  color: ishover
                      ? Provider.of<ThemeProvider>(context)
                          .getThemeColor
                          .withOpacity(.8)
                      : const Color.fromARGB(121, 15, 15, 15))
            ],
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "YOUR NAME",
                      style: GoogleFonts.titilliumWeb(
                          color: const Color.fromARGB(255, 214, 231, 240),
                          fontWeight: FontWeight.w200,
                          fontSize: widget.w < mobileSize ? 13 : 16),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                InwardTextFormField(
                  controller: widget.name,
                  maxlines: 1,
                )
              ],
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 1500),
              curve: Curves.easeIn,
              height: widget.changeAppBar ? 30 : 45,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "PHONE NUMBER",
                  style: GoogleFonts.titilliumWeb(
                      color: const Color.fromARGB(255, 214, 231, 240),
                      fontWeight: FontWeight.w200,
                      fontSize: widget.w < mobileSize ? 13 : 16),
                ),
                const SizedBox(height: 15),
                InwardTextFormField(
                  controller: widget.phone,
                  maxlines: 1,
                )
              ],
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 1500),
              curve: Curves.easeIn,
              height: widget.changeAppBar ? 30 : 45,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "EMAIL",
                  style: GoogleFonts.titilliumWeb(
                      color: const Color.fromARGB(255, 214, 231, 240),
                      fontWeight: FontWeight.w200,
                      fontSize: widget.w < mobileSize ? 13 : 16),
                ),
                const SizedBox(height: 15),
                InwardTextFormField(
                  controller: widget.email,
                  maxlines: 1,
                )
              ],
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 1500),
              curve: Curves.easeIn,
              height: widget.changeAppBar ? 30 : 45,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "MESSAGE",
                  style: GoogleFonts.titilliumWeb(
                      color: const Color.fromARGB(255, 214, 231, 240),
                      fontWeight: FontWeight.w200,
                      fontSize: widget.w < mobileSize ? 13 : 16),
                ),
                const SizedBox(height: 15),
                InwardTextFormField(
                  controller: widget.message,
                  maxlines: 7,
                )
              ],
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 1500),
              curve: Curves.easeIn,
              height: widget.changeAppBar ? 30 : 45,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: CustomShadowButton(
                  isHover: ishover,
                  onTap: () async {
                    setState(() {
                      isLoading = true;
                    });
                    if (widget.name.text.isEmpty ||
                        widget.email.text.isEmpty ||
                        widget.message.text.isEmpty) {
                      IconSnackBar.show(
                          context: context,
                          snackBarType: SnackBarType.alert,
                          label: 'Name, Email and Message cannot be Empty !');
                    } else {
                      await sendEmail(widget.name.text, widget.email.text,
                          widget.message.text, widget.phone.text);
                      widget.name.clear();
                      widget.email.clear();
                      widget.message.clear();
                      widget.phone.clear();
                      IconSnackBar.show(
                          context: context,
                          snackBarType: SnackBarType.save,
                          label: 'Submitted Successfully !');
                    }
                    setState(() {
                      isLoading = false;
                    });
                  },
                  isLoading: isLoading,
                )),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class CustomShadowButton extends StatefulWidget {
  CustomShadowButton({
    required this.onTap,
    required this.isLoading,
    required this.isHover,
    Key? key,
  }) : super(key: key);
  bool isHover;
  void Function()? onTap;
  bool isLoading;
  @override
  State<CustomShadowButton> createState() => _CustomShadowButtonState();
}

class _CustomShadowButtonState extends State<CustomShadowButton> {
  bool ishover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: (value) {
        setState(() {
          ishover = value;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.only(top: ishover ? 0 : 5, bottom: ishover ? 5 : 0),
        child: Container(
          height: 50,
          width: 200,
          padding: const EdgeInsets.only(left: 15, right: 15),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: widget.isHover ? 2 : 7,
                    offset: widget.isHover
                        ? const Offset(-2, -2)
                        : const Offset(-8, -8),
                    color: widget.isHover
                        ? Provider.of<ThemeProvider>(context)
                            .getThemeColor
                            .withOpacity(.55)
                        : const Color.fromARGB(121, 32, 32, 32)),
                BoxShadow(
                    blurRadius: widget.isHover ? 2 : 10,
                    offset: widget.isHover
                        ? const Offset(2, 2)
                        : const Offset(8, 8),
                    color: widget.isHover
                        ? Provider.of<ThemeProvider>(context)
                            .getThemeColor
                            .withOpacity(.55)
                        : const Color.fromARGB(121, 15, 15, 15))
              ],
              gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 15, 15, 15),
                    Color.fromARGB(255, 15, 15, 15)
                  ]),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: widget.isLoading
                ? const SizedBox(
                    height: 30, width: 30, child: CircularProgressIndicator())
                : Text(
                    "SEND MESSAGE",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.titilliumWeb(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        letterSpacing: 1,
                        color: widget.isHover
                            ? Provider.of<ThemeProvider>(context).getThemeColor
                            : Colors.white),
                  ),
          ),
        ),
      ),
    );
  }
}
