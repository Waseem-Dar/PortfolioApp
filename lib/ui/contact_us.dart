import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/main.dart';
import 'package:flutter_web_portfolio/ui/icon.dart';
import 'package:flutter_web_portfolio/widgets/contact_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mailto/mailto.dart';

import 'responsive_widget.dart';
import '../config/constants.dart';
import '../config/styles.dart';
import '../config/colors.dart';
import '../utils/extensions.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController(),
      _emailController = TextEditingController(),
      _contentController = TextEditingController();
bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      tabletScreen: Container(),
      desktopScreen: Container(
        color: Color(0xFFECF0F3),
        padding: EdgeInsets.symmetric(
          vertical: 100,

        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                AppTitle('GET IN TOUCH', 50, 0.05),
                AppTitle('GET IN TOUCH', 35, 0.8),
              ],
            ),
            Container(width: 100, height: 2, color: AppColors.yellow),
            const SizedBox(height: 3),
            Container(width: 75, height: 2, color: AppColors.yellow),
            const SizedBox(height: 50),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 600,
                  width: screenWidth>=1400?600:400,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white, Color(0xFFe2e8ec)],
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 10,
                        offset: Offset(-5, -5),
                      ),
                      BoxShadow(
                        color: Color(0xFFD1D9E6),
                        blurRadius: 15,
                        offset: Offset(5, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      _buildContactInfo(
                        'icons/email.png',
                        'Mail Us:',
                        AppConstants.mail,
                      ),
                      const SizedBox(height: 20),
                      _buildContactInfo(
                        'icons/call.png',
                        'Call Us:',
                        AppConstants.phone,
                      ),
                      const SizedBox(height: 20),
                      _buildContactInfo(
                        'icons/pin.png',
                        'Visit Us:',
                        AppConstants.location,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: screenWidth>=1400?50:40,),
                Container(
                  height: 600,
                  width: screenWidth>=1400?750:550,
                  padding:EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white, Color(0xFFe2e8ec)],
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 10,
                        offset: Offset(-5, -5),
                      ),
                      BoxShadow(
                        color: Color(0xFFD1D9E6),
                        blurRadius: 15,
                        offset: Offset(5, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: ContactSection.TextFieldWidget("your name",false)),
                          SizedBox(width: 20,),
                          Expanded(child: ContactSection.TextFieldWidget("phone number",false)),
                        ],
                      ),
                      SizedBox(height: 20,),
                      ContactSection.TextFieldWidget("Email",false),
                      SizedBox(height: 20,),
                      ContactSection.TextFieldWidget("subject",false),
                      SizedBox(height: 20,),
                      ContactSection.TextFieldWidget("your message",true),
                      SizedBox(height: 30,),
                      MouseRegion(
                        onEnter: (event) { setState(() =>isHover=true);},
                        onExit: (event) { setState(() =>isHover=false);},

                        child: InkWell(
                          onTap: () {},
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            height:50,

                            margin:EdgeInsets.only(top:isHover?0: 5),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors:isHover?[AppColors.yellow!,AppColors.yellow!]: [Colors.white, Color(0xFFe2e8ec)],
                                begin: Alignment.bottomRight, end: Alignment.topLeft,
                              ),
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white,blurRadius: 10, offset: Offset(-5, -5),
                                ),
                                BoxShadow(
                                  color: Color(0xFFD1D9E6), blurRadius: 15, offset: Offset(5, 5),
                                ),
                              ],
                            ),
                            child: Center(child: Text("SEND MESSAGE",style: GoogleFonts.poppins(color:isHover?Colors.white:AppColors.yellow,fontWeight: FontWeight.w500,fontSize: 14,),)),
                          ),
                        ),
                      )
                    ],
                  ),
                )
                // Expanded(
                //   child: _buildContactForm(context),
                // ),
              ],
            )
          ],
        ),
      ),
      mobileScreen: Container(
        decoration: BoxDecoration(
        color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .15,
          vertical: 100,
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                AppTitle('GET IN TOUCH', 33, 0.05),
                AppTitle('GET IN TOUCH', 20, 0.8),
              ],
            ),
            Container(width: 75, height: 2, color: AppColors.yellow),
            const SizedBox(height: 3),
            Container(width: 50, height: 2, color: AppColors.yellow),
            const SizedBox(height: 50),
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildContactInfo(
                      'icons/email.png',
                      'Mail Us:',
                      AppConstants.mail,
                    ),
                    const SizedBox(height: 20),
                    _buildContactInfo(
                      'icons/call.png',
                      'Call Us:',
                      AppConstants.phone,
                    ),
                    const SizedBox(height: 20),
                    _buildContactInfo(
                      'icons/pin.png',
                      'Visit Us:',
                      AppConstants.location,
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                _buildContactForm(context),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo(String imagePath, String title, String content) {
    return FittedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppIcon(imagePath, color: AppColors.black.withOpacity(.7), size: 20),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                content,
                style: TextStyle(color: AppColors.black.withOpacity(.7)),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildContactForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Have Something To Write?',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 25),
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                     cursorColor: Colors.black54,
                      validator: (text) {
                        return (text!.isValidName())
                            ? null
                            : 'Please insert valid name!';
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Your Name',
                        disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(3),borderSide: BorderSide(width: 0.5,color: Colors.black)),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(3),borderSide: BorderSide(width: 0.5,color: Colors.black54)),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(3),borderSide: BorderSide(width: 0.5,color: Colors.black54)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: TextFormField(
                      cursorColor: Colors.black54,
                      validator: (text) {
                        return (text!.isValidEmail)
                            ? null
                            : 'Please insert valid email!';
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Your Email',
                        disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(3),borderSide: BorderSide(width: 0.5,color: Colors.black)),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(3),borderSide: BorderSide(width: 0.5,color: Colors.black54)),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(3),borderSide: BorderSide(width: 0.5,color: Colors.black54)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextFormField(
                minLines: 3,
                maxLines: 10,
                cursorColor: Colors.black54,
                validator: (text) {
                  return (text!.isValidName(minLength: 10))
                      ? null
                      : 'Please insert valid message!, at least 10 characters';
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Your Message',
                  disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(3),borderSide: BorderSide(width: 0.5,color: Colors.black)),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(3),borderSide: BorderSide(width: 0.5,color: Colors.black54)),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(3),borderSide: BorderSide(width: 0.5,color: Colors.black54)),
                  // border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.yellow,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                ),

                onPressed: _sendMail,
                child: Text('Send',style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        )
      ],
    );
  }

  void _sendMail() async {
    bool isValidForm = _formKey.currentState!.validate();
    if (!isValidForm) return;

    final mailto = Mailto(
      to: [AppConstants.mail],
      subject: _nameController.text.trim(),
      body: _contentController.text.trim(),
    );

    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 3000);
    String renderHtml(Mailto mailto) =>
        '''<html><head><title>mailto example</title></head><body><a href="$mailto">Open mail client</a></body></html>''';
    await for (HttpRequest request in server) {
      request.response
        ..statusCode = HttpStatus.ok
        ..headers.contentType = ContentType.html
        ..write(renderHtml(mailto));
      await request.response.close();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _contentController.dispose();
    super.dispose();
  }
}
