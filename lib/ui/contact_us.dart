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
bool isHover1 = false;
bool isHover2 = false;
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
                MouseRegion(
                  onEnter: (event) {setState(() =>isHover1=true);},
                  onExit: (event) {setState(() =>isHover1=false);},
                  child: Container(
                    height: screenWidth>=1400?695:640,
                    width: screenWidth>=1400?600:400,
                    padding:EdgeInsets.all(screenWidth>=1400?45:25),
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
                        Container(
                          height:screenWidth>=1400?250:200,
                          width:screenWidth>=1400?550:350,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // image: DecorationImage(image: AssetImage("images/contact1.png"),fit: BoxFit.cover,scale: isHover1?1.1:1.0)
                          ),
                          child: AnimatedScale(
                            duration: Duration(milliseconds: 280),
                            scale: isHover1?1.1:1.0,
                            child: Image.asset("images/contact1.png",fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(height: 25),
                        Text("You have an idea, I am here to turn your dream into real digital solution.",style: GoogleFonts.poppins(
                          fontSize: 18,color: Color(0xFF3C3E41),fontWeight: FontWeight.w600
                        ),),
                        const SizedBox(height: 25),
                        Text("I am available for freelance work. Connect with me via and call in to my account.",style: GoogleFonts.poppins(
                            fontSize: 17,color: Color(0xFF4C4E49),fontWeight: FontWeight.w400
                        ),),
                        const SizedBox(height: 20),
                        _buildContactInfo(
                          'icons/email.png',
                          'Email:',
                          AppConstants.mail,
                        ),
                        const SizedBox(height: 8),
                        _buildContactInfo(
                          'icons/call.png',
                          'Phone:',
                          AppConstants.phone,
                        ),
                        const SizedBox(height: 8),
                        _buildContactInfo(
                          'icons/pin.png',
                          'Visit:',
                          AppConstants.location,
                        ),
                        // const SizedBox(height: 15),
                        SizedBox(height: 15,),
                        Text("find with us".toUpperCase(),style: GoogleFonts.montserrat(color: Color(0xFF1E2125),fontWeight:FontWeight.w600,fontSize: 15),),
                       SizedBox(height: 5,),
                      Row(
                        children: [
                          ContactSection.SocialIconWidget("images/facebook_icon.png", isHover2,
                                () {},
                                () {setState(() =>isHover2 = true);},
                                () {setState(() =>isHover2 = false);},
                          ),
                          ContactSection.SocialIconWidget("images/linkedin_icon.png", isHover2,
                                () {},
                                () {setState(() =>isHover2 = true);},
                                () {setState(() =>isHover2 = false);},
                          ),
                          ContactSection.SocialIconWidget("images/instagram_icon.png", isHover2,
                                () {},
                                () {setState(() =>isHover2 = true);},
                                () {setState(() =>isHover2 = false);},
                          ),
                        ],
                      )

                      ],
                    ),
                  ),
                ),
                SizedBox(width: screenWidth>=1400?50:40,),
                Container(
                  height:screenWidth>=1400?695: 640,
                  width: screenWidth>=1400?750:550,
                  padding:EdgeInsets.all(screenWidth>=1400?45:25),
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
                      Text("Have Something To Write?",style: GoogleFonts.montserrat(fontSize: 25,fontWeight: FontWeight.w700,color: Color(0xFF3C3e41)),),
                      // Spacer(),
                      SizedBox(height:screenWidth>=1400?27: 12,),
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
          // AppIcon(imagePath, color: AppColors.black.withOpacity(.7), size: 20),
          Text(
            title,
            style: GoogleFonts.poppins(
              color: Color(0xFF3C3E41),
              fontWeight:FontWeight.w500,
              fontSize: 17
            ),
          ),
          const SizedBox(width: 10),
          Text(
            content,
            style: GoogleFonts.poppins(color:  Color(0xFF3C3E41),fontSize: 17,fontWeight: FontWeight.w400),
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
