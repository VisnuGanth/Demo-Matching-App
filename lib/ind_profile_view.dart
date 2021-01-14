import 'package:demo_matching_apps/ind_profile_view_1.dart';
import 'package:demo_matching_apps/locale/app_localization.dart';
import 'package:flutter/material.dart';


class IndProfileView extends StatefulWidget {
  @override
  _IndProfileViewState createState() => _IndProfileViewState();
}

class _IndProfileViewState extends State<IndProfileView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(141, 169, 219, 1),
        centerTitle: true,
        title: Text(AppLocalization.of(context).work,
            style: TextStyle(
                fontSize: 30.0, fontFamily: 'Avenir', color: Colors.white)),
      ),
      body:
          //Container that acts as button switching to detailed profile page
          Container(
            color: Colors.white,
            //height of screen that can display content by subtracting app bar, bottom nav bar and the toolbar height
            height: MediaQuery.of(context).size.height -
                kToolbarHeight -
                MediaQuery.of(context).padding.top,
            child: Column(
              children: [
                //Gesture Detector acts as a button and switches to detailed profile
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => IndProfileView1()),
                    );
                  },
                  child: Container(
                    color: Color.fromRGBO(179, 198, 231, 1),
                    child: Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('assets/profile_image.png'),
                          ),
                          SizedBox(width: 20.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                //Get the text based on the locale language from the applocalization class
                                AppLocalization.of(context).profile_name,
                                style: TextStyle(
                                  fontSize: 30.0,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Icon(Icons.thumb_up,
                                          size: 22, color: Colors.orangeAccent),
                                    ),
                                    TextSpan(
                                      text: '  200',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    //GridView to hold all the buttons
                    child: GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      childAspectRatio: 1.3 / 1,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FlatButton(
                            // shape: RoundedRectangleBorder(
                            //     side: BorderSide(
                            //         color: Colors.grey,
                            //         width: 1,
                            //         style: BorderStyle.solid),
                            //     borderRadius: BorderRadius.circular(20)),
                            onPressed: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.bookmark_border_outlined,
                                  size: 40,
                                  color: Colors.grey,
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  //Get the text based on the locale language from the applocalization class
                                  AppLocalization.of(context).bookmark_btn,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FlatButton(
                            onPressed: () {},
                            // shape: RoundedRectangleBorder(
                            //     side: BorderSide(
                            //         color: Colors.grey,
                            //         width: 1,
                            //         style: BorderStyle.solid),
                            //     borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.contact_page_outlined,
                                  size: 40,
                                  color: Colors.grey,
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  //Get the text based on the locale language from the applocalization class
                                  AppLocalization.of(context).apply_btn,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FlatButton(
                            onPressed: () {},
                            // shape: RoundedRectangleBorder(
                            //     side: BorderSide(
                            //         color: Colors.grey,
                            //         width: 1,
                            //         style: BorderStyle.solid),
                            //     borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.check,
                                  size: 40,
                                  color: Colors.grey,
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  //Get the text based on the locale language from the applocalization class
                                  AppLocalization.of(context).recommend_btn,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FlatButton(
                            onPressed: () {},
                            // shape: RoundedRectangleBorder(
                            //     side: BorderSide(
                            //         color: Colors.grey,
                            //         width: 1,
                            //         style: BorderStyle.solid),
                            //     borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.person_add_alt_1_rounded,
                                  size: 40,
                                  color: Colors.grey,
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  //Get the text based on the locale language from the applocalization class
                                  AppLocalization.of(context).follow_btn,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FlatButton(
                            onPressed: () {},
                            // shape: RoundedRectangleBorder(
                            //     side: BorderSide(
                            //         color: Colors.grey,
                            //         width: 1,
                            //         style: BorderStyle.solid),
                            //     borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.help_outline_rounded,
                                  size: 40,
                                  color: Colors.grey,
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  //Get the text based on the locale language from the applocalization class
                                  AppLocalization.of(context).help_btn,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FlatButton(
                            onPressed: () {
                              // Navigator.pushReplacement(
                              //     context, MaterialPageRoute(builder: (context) => IndSettings()));
                            },
                            // shape: RoundedRectangleBorder(
                            //     side: BorderSide(
                            //         color: Colors.grey,
                            //         width: 1,
                            //         style: BorderStyle.solid),
                            //     borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.settings,
                                  size: 40,
                                  color: Colors.grey,
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  //Get the text based on the locale language from the applocalization class
                                  AppLocalization.of(context).settings_btn,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
      ),
    );
  }
}
