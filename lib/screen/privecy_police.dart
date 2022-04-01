import 'package:flutter/material.dart';

import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

final playServices = "https://policies.google.com/privacy";
final email = "121userfeedback@gmail.com";
final developer ="akashlilhare15@gmail.com";
final newsProvider = "support@newsapi.org";
final sourceOfNews = "https://newsapi.org/sources";
final newApiPP = "https://newsapi.org/privacy";

String privacyPolicy =
    '''Akash Lilhare built the In-News app as a free new reading app. This SERVICE is provided by Akash Lilhare at no cost and is intended for use as it.

This page is used to inform visitors regarding my policies with the collection, use, and disclosure of Personal Information if anyone decided to use my Service.

If you choose to use my Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that I collect is used for providing and improving the Service. I will not use or share your information with anyone except as described in this Privacy Policy.

The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at In-news app unless otherwise defined in this Privacy Policy.''';

String informationCollection = '''
For a better experience, while using our Service, I may require you to provide us with certain personally identifiable information, including but not limited to com.newsapp.akash. The information that I request will be retained on your device and is not collected by me in any way.

The app does use third party services that may collect information used to identify you.

Link to privacy policy of third party service providers used by the app''';

String logData =
    '''I want to inform you that whenever you use my Service, in a case of an error in the app I collect data and information (through third party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing my Service, the time and date of your use of the Service, and other statistics.''';

String coockies = '''
Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device's internal memory.

This Service does not use these “cookies” explicitly. However, the app may use third party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service.''';

String serviceProvidedHeading = '''
I may employ third-party companies and individuals due to the following reasons:
''';
String sp1 = "To facilitate our Service.";
String sp2 = "To provide the Service on our behalf.";
String sp3 = "To perform Service-related services.";
String sp4 = "To assist us in analyzing how our Service is used.";
String serviceProvidedTrailing = '''
I want to inform users of this Service that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.
''';

String security = '''
I value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and I cannot guarantee its absolute security.
''';

String linkToOther = '''
This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by me. Therefore, I strongly advise you to review the Privacy Policy of these websites. I have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.
''';

String childrenPrivacy = '''
These Services do not address anyone under the age of 13. I do not knowingly collect personally identifiable information from children under 13. In the case I discover that a child under 13 has provided me with personal information, I immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact me so that I will be able to do necessary actions.
''';

String changesToPolicy = '''
I may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Privacy Policy on this page.

This policy is effective as of 2020-12-21
''';

String contactUs = '''
If you have any questions or suggestions about my Privacy Policy, do not hesitate to contact me at 
''';

String source = '''
For Showing news I use news api as the source of news ''';

class PrivacyPolicy extends StatefulWidget {
  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    var titleFontStyle = TextStyle(fontWeight: FontWeight.w800, fontSize: 20);
    var contentTextStyle = TextStyle(
        fontWeight: FontWeight.w400, fontSize: 16, color: Colors.blueGrey);
    var hyperLinkStyle = TextStyle(
        fontWeight: FontWeight.w600, fontSize: 18, color: Colors.blue.shade700,decoration: TextDecoration.underline);



    Widget title(String title) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: titleFontStyle,
        ),
      );
    }

    Widget content(String content) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          content,
          style: contentTextStyle,
        ),
      );
    }

    Widget myBullet(String sp) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 10.0,
              width: 10.0,
              decoration: new BoxDecoration(
                color: Colors.blueGrey,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Text(
                sp,
                style: contentTextStyle.copyWith(
                    color: Colors.black, fontSize: 17),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title:

         Text(" In-News",style: TextStyle(color: Colors.white,fontSize: 20),),


        elevation: 0,
        backgroundColor: Colors.blue.shade900,

      ),
      body: SafeArea(
        child: (loading)
            ? CircularProgressIndicator()
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left:8.0, right:4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      title("Contact Information"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          content("News Provider :"),
                          GestureDetector(
                            child: Text(
                              newsProvider,
                             style: contentTextStyle.copyWith(color:Colors.blue,decoration:TextDecoration.underline),
                            ),
                            onTap: () async {
                              final url = newsProvider;
                              setState(() {
                                loading = true;
                              });
                              if (await canLaunch(url)) {
                                await launch(
                                  url,
                                  forceSafariVC: false,
                                );
                              }
                              setState(() {
                                loading = false;
                              });
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          content("Developer:"),
                          GestureDetector(
                            child: Text(
                              developer,
                              style: contentTextStyle.copyWith(color:Colors.blue,decoration:TextDecoration.underline),
                            ),
                            onTap: () async {
                              final url = developer;
                              setState(() {
                                loading = true;
                              });
                              if (await canLaunch(url)) {
                                await launch(
                                  url,
                                  forceSafariVC: false,
                                );
                              }
                              setState(() {
                                loading = false;
                              });
                            },
                          ),
                        ],
                      ),

                      title("Privacy Policy"),
                      content(privacyPolicy),
                      title("Source of News"),
                      content(source),
                      GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom:10.0,left: 10),
                          child: Text(
                            "newsapi.org",
                            style: hyperLinkStyle,
                          ),
                        ),
                        onTap: () async {
                          final url = sourceOfNews;
                          setState(() {
                            loading = true;
                          });
                          if (await canLaunch(url)) {
                            await launch(
                              url,
                              forceSafariVC: false,
                            );
                          }
                          setState(() {
                            loading = false;
                          });
                        },
                      ),
                      title("Information Collection and Use"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                style: contentTextStyle,
                                text: informationCollection,
                              ),

                              TextSpan(
                                  style: hyperLinkStyle,
                                  text: "\n \nGoogle Play Services",
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      final url = playServices;
                                      setState(() {
                                        loading = true;
                                      });
                                      if (await canLaunch(url)) {
                                        await launch(
                                          url,
                                          forceSafariVC: false,
                                        );
                                      }
                                      setState(() {
                                        loading = false;
                                      });
                                    }),
                              WidgetSpan(child: Container()),
                              TextSpan(
                                  style: hyperLinkStyle,
                                  text: "newsapi Privacy Policy",
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      final url = newApiPP;
                                      setState(() {
                                        loading = true;
                                      });
                                      if (await canLaunch(url)) {
                                        await launch(
                                          url,
                                          forceSafariVC: false,
                                        );
                                      }
                                      setState(() {
                                        loading = false;
                                      });
                                    }),
                            ],
                          ),
                        ),
                      ),
                      title('Log Data'),
                      content(logData),
                      title("Cookies"),
                      content(coockies),
                      title("Service Providers"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                style: contentTextStyle,
                                text: serviceProvidedHeading,
                              ),
                              WidgetSpan(child: myBullet(sp1)),
                              WidgetSpan(child: myBullet(sp2)),
                              WidgetSpan(child: myBullet(sp3)),
                              WidgetSpan(child: myBullet(sp4)),
                              TextSpan(
                                style: contentTextStyle,
                                text: serviceProvidedTrailing,
                              ),
                            ],
                          ),
                        ),
                      ),
                      title("Security"),
                      content(security),
                      title("Links to Other Sites"),
                      content(linkToOther),
                      title("Children\'s Privacy "),
                      content(childrenPrivacy),
                      title("Contact Us"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                style: contentTextStyle,
                                text: contactUs,
                              ),
                              TextSpan(
                                style: hyperLinkStyle,
                                text: email,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    setState(() {
                                      loading = true;
                                    });
                                    final Uri _emailLaunchUri = Uri(
                                        scheme: 'mailto',
                                    path: '121userfeedback@gmail.com',
                                        queryParameters: {
                                          'subject': '',
                                        });
                                    await launch(_emailLaunchUri.toString());
                                    setState(() {
                                      loading = false;
                                    });
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
