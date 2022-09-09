import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/api/auth/auth_api_controller.dart';
import 'package:smart_store/main.dart';
import 'package:smart_store/models/api_response.dart';
import 'package:smart_store/utils/colors.dart';
import 'package:smart_store/utils/context_extenssion.dart';
import 'package:smart_store/widgets/app/setting_card.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String _language = 'en';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Settings',
          style: GoogleFonts.montserrat(
            color: mainFontColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: mainFontColor,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                bottomLeft: Radius.circular(16.r),
                bottomRight: Radius.circular(16.r),
              ),
            ),
            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              leading: const CircleAvatar(
                backgroundImage: AssetImage('images/slider1.png'),
              ),
              title: Text(
                'Jessica Biber',
                style: GoogleFonts.montserrat(
                  color: mainFontColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Row(
                children: [
                  const Icon(
                    Icons.phone_android,
                    color: mainColor,
                    size: 16,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    '0123 456 789',
                    style: GoogleFonts.montserrat(
                      color: secondFontColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              trailing: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/profile_screen');
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: greyColor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                bottomLeft: Radius.circular(16.r),
                bottomRight: Radius.circular(16.r),
              ),
            ),
            child: Column(
              children: [
                SettingContent(
                  color: orange,
                  icon: Icons.language,
                  title: 'Language',
                  subTitle: 'English',
                  onPressed: () {
                    _showLanguageBottomSheet();
                  },
                ),
                Divider(
                  color: secondFontColor,
                  indent: 20.w,
                  endIndent: 20.w,
                ),
                SettingContent(
                  color: blue,
                  icon: Icons.location_on,
                  title: 'My Address',
                  subTitle: 'Manage delivery address',
                  onPressed: () {
                    Navigator.pushNamed(context, '/show_addresses_screen');
                  },
                ),
                Divider(
                  color: secondFontColor,
                  indent: 20.w,
                  endIndent: 20.w,
                ),
                SettingContent(
                  color: yellow,
                  icon: Icons.credit_card,
                  title: 'My Cards',
                  subTitle: 'Manage my cards',
                  onPressed: () {
                    Navigator.pushNamed(context, '/card_screen');
                  },
                ),
                Divider(
                  color: secondFontColor,
                  indent: 20.w,
                  endIndent: 20.w,
                ),
                SettingContent(
                  color: purple,
                  icon: Icons.support,
                  title: 'Contact Us',
                  subTitle: 'Terms of use',
                  onPressed: () {
                    Navigator.pushNamed(context, '/contact_us_screen');
                  },
                ),
                Divider(
                  color: secondFontColor,
                  indent: 20.w,
                  endIndent: 20.w,
                ),
                SettingContent(
                  color: shadePink,
                  icon: Icons.info,
                  title: 'Adout Shop',
                  subTitle: 'Terms of use',
                  onPressed: () {
                    Navigator.pushNamed(context, '/about_screen');
                  },
                ),
                Divider(
                  color: secondFontColor,
                  indent: 20.w,
                  endIndent: 20.w,
                ),
                SettingContent(
                  color: orange,
                  icon: Icons.notifications,
                  title: 'Notifications',
                  subTitle: 'show all new events',
                  onPressed: () {
                    Navigator.pushNamed(context, '/notifications_screen');
                  },
                ),
                Divider(
                  color: secondFontColor,
                  indent: 20.w,
                  endIndent: 20.w,
                ),
                SettingContent(
                  color: blue,
                  icon: Icons.password,
                  title: 'Change Password',
                  subTitle: 'forgot your password',
                  onPressed: () {
                    Navigator.pushNamed(context, '/forgot_password_screen');
                  },
                ),
                Divider(
                  color: secondFontColor,
                  indent: 20.w,
                  endIndent: 20.w,
                ),
                SettingContent(
                  color: yellow,
                  icon: Icons.phone_android,
                  title: 'Edit Mobile',
                  subTitle: 'change your phone number',
                  onPressed: () {
                    Navigator.pushNamed(context, '/change_mobile_screen');
                  },
                ),
                Divider(
                  color: secondFontColor,
                  indent: 20.w,
                  endIndent: 20.w,
                ),
                SettingContent(
                  color: purple,
                  icon: Icons.logout,
                  title: 'Logout',
                  subTitle: 'sign out from account',
                  onPressed: () => _logout(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _logout() async {
    ApiResponse processResponse = await AuthApiController().logout();
    if (processResponse.success) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/login_screen');
    }
    // ignore: use_build_context_synchronously
    context.showSnackBar(
      message: processResponse.message,
      error: !processResponse.success,
    );
  }

  void _showLanguageBottomSheet() async {
    String? langCode = await showModalBottomSheet<String>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      backgroundColor: Colors.white,
      clipBehavior: Clip.antiAlias,
      context: context,
      builder: (context) {
        return BottomSheet(
          onClosing: () {},
          builder: (context) {
            return StatefulBuilder(
              builder: (context, setState) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Change Application Language",
                        style: GoogleFonts.montserrat(
                          fontSize: 18.sp,
                          color: mainFontColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Choose suitable language',
                        style: GoogleFonts.montserrat(
                          fontSize: 14.sp,
                          color: secondFontColor,
                          height: 1.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Divider(),
                      RadioListTile<String>(
                        activeColor: mainColor,
                        title: Text('English', style: GoogleFonts.montserrat()),
                        value: 'en',
                        groupValue: _language,
                        onChanged: (String? value) {
                          if (value != null) {
                            setState(() => _language = value);
                            Navigator.pop(context, 'en');
                          }
                        },
                      ),
                      RadioListTile<String>(
                        activeColor: mainColor,
                        title: Text('العربية', style: GoogleFonts.montserrat()),
                        value: 'ar',
                        groupValue: _language,
                        onChanged: (String? value) {
                          if (value != null) {
                            setState(() => _language = value);
                            Navigator.pop(context, 'ar');
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );

    if (langCode != null) {
      Future.delayed(const Duration(milliseconds: 500), () {});
    }
  }
}
