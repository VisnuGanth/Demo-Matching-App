import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:demo_matching_apps/custom_expansion_tile.dart';
import 'package:demo_matching_apps/edit_icon_icons.dart';
import 'package:demo_matching_apps/locale/app_localization.dart';
import 'package:demo_matching_apps/models/update_profile.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


import 'package:percent_indicator/percent_indicator.dart';
import 'package:http/http.dart' as http;

class IndProfileView1 extends StatefulWidget {
  @override
  _IndProfileView1State createState() => _IndProfileView1State();
}

class _IndProfileView1State extends State<IndProfileView1> with TickerProviderStateMixin{


  //Adds the previously navigated page to the list
  ListQueue<int> _navigationQueue =ListQueue();
  int index=0;

  //To navigate back to the initial profile page on clicking back button of the phone.
  Future<bool> _willPopCallback() async {
    //If the queue is empty, it will stay in the same page
    if(_navigationQueue.isEmpty)
      return true;

    //else it will save the index of the previous page and we can navigate to that on clicking back button
    setState(() {
      index = _navigationQueue.last;
      _navigationQueue.removeLast();
    });
    return false;
  }

  //Controller and variable for arrow animation
  Animation arrowAnimation;
  AnimationController arrowAnimationController;


  //flags to check if the edit button has been clicked
  bool selfIntroFlag = false;
  bool workExpFlag = false;
  bool eduFlag = false;
  bool skillFlag = false;
  bool resumeFlag = false;
  bool projectFlag = false;
  bool accomplishmentFlag = false;
  bool langFlag = false;
  bool qualificationFlag = false;
  bool otherFlag = false;
  bool followFLag = false;

  //initial text set to all the tabs
  String selfIntro =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id ultrices tellus, at molestie est. ";
  String workExp = "MOSAIQUE Pvt Ltd\nDirector\n2010-04 ~ 2020-08";
  String edu = "ABC University\nB.Tech Computer Science\n2005-04 ~ 2010-08";
  String skill = "Mobile Development\nWeb Development\nMachine Learning";
  String resume = "Resume.pdf";
  String projectName = "Project Helios";
  String userContribution = "Developed the frontend";
  String projectDetails =
      "Waste Management\n2011-05 ~ 2012-05\n8Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id ultrices tellus, at molestie est.";
  String accomplishment =
      "Publication in IEEE\nReceived Best Entrepreneur in 2015";
  String lang = "English\nTamil\nJapanese\nHindi";
  String qualification = "Artificial Intelligence\n2011-01 ~ 2011-09\nCoursera";
  String other = "State Chess Champion\n2010";

  //Controllers used to set updated text to the tabs
  TextEditingController selfIntroController;
  TextEditingController workExpController;
  TextEditingController eduController;
  TextEditingController skillController;
  TextEditingController resumeController;
  TextEditingController projectDetailsController;
  TextEditingController projectNameController;
  TextEditingController userContributionController;
  TextEditingController accomplishmentController;
  TextEditingController langController;
  TextEditingController qualificationController;
  TextEditingController otherController;

  //List of all text controllers
  List<TextEditingController> textControllerList;

  //Variable that holds profile completion percent
  double barPercent;

  @override
  void initState() {

    super.initState();

    //initialise animation controller and animation values
    arrowAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    arrowAnimation =
        Tween(begin: 0.0, end: pi).animate(arrowAnimationController);


    //set the initial text to all controllers
    selfIntroController = TextEditingController(text: selfIntro);
    workExpController = TextEditingController(text: workExp);
    eduController = TextEditingController(text: edu);
    skillController = TextEditingController(text: skill);
    resumeController = TextEditingController(text: resume);
    projectDetailsController = TextEditingController(text: projectDetails);
    projectNameController = TextEditingController(text: projectName);
    userContributionController = TextEditingController(text: userContribution);
    accomplishmentController = TextEditingController(text: accomplishment);
    langController = TextEditingController(text: lang);
    qualificationController = TextEditingController(text: qualification);
    otherController = TextEditingController(text: other);

    //Place all controllers into the list
    textControllerList = [
      selfIntroController,
      workExpController,
      eduController,
      skillController,
      resumeController,
      projectDetailsController,
      projectNameController,
      userContributionController,
      accomplishmentController,
      langController,
      qualificationController,
      otherController,
    ];

    progressBarValue();

  }

  @override
  void dispose() {

    //Dispose all the controllers
    for(int i = 0; i < textControllerList.length; i++){
      textControllerList[i].dispose();
    }

    super.dispose();
  }


  //Function to calculate the change in the progress bar
  void progressBarValue(){

    //Set initial progress to 100%
    barPercent = 100;

    for(int i = 0; i < textControllerList.length; i++){
      if(textControllerList[i].text == ""){
        barPercent -= 10;
      }
    }

    barPercent /= 100;

  }

  //Variable that will hold the updated values to send to the api
  Map<String,String> newData = {
    'email': 'tazki04@gmail.com',
    'first_name': 'Mark',
    'last_name': 'Bautista',
    'mobile_number': '123456789',
    'phone_number': '12345',
    'date_of_birth': '2010-11-11',
    'gender': 'male',
    'address': 'Bulacan',
    'about_you': 'About Myself',
    'fields_of_interest': '["Games","Gundam"]',
    'skills': '["PHP","MySQL"]',
    'language': '["English","Tagalog"]',
    'qualification': '["College Graduate"]',
    'other': 'Other Details About Me'};

  //Function to update data through a post request to the api
  Future<UpdateProfile> updateData(var data, var imagePath) async {

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5MjQ4NDU5YS02ODNmLTQ4MTEtYmJjNy1lM2NjYzkwNDg5ODYiLCJqdGkiOiIyYmY4NDQzNjA1NDEzMzM5OTBhOTdiMjdjZDllYTIzZmZiZWUwNjczMjkyNTVmOThiZjY5NmY2OWZhZTE1YWYyMWUzOWM1OGM4MzM1M2RjNSIsImlhdCI6MTYwODM5MTE4NywibmJmIjoxNjA4MzkxMTg3LCJleHAiOjE2Mzk5MjcxODcsInN1YiI6IjMiLCJzY29wZXMiOltdfQ.cbAL_ZSQpOXZejTbkf7d4P92Z4nwq-tlnPA-0SRhQ-Fz2xWOtDEckQaRlDxTzrQFL1gAzVr4lD03j4c2UKTL6C9mob5QQSKeJR4lpAr2MkAOrBNMtOL8JG-5UwspPp5As5bGp2V3HYQ5E6CMu_J1hfYLkZg6rUyGz3fpS6DJKd-GG5C5M1hQgnOabGgkgysfGkzkM9vQvJz9BeeEIzPZ4Rv7j724VrYTxQSyjYLm1UX2sI1E_EWwAKJE60N9FcL-g_QTkm_O_WsdGhhQORq44gXgtWGdOzQ7_tA_gKYaQZzztWsjw1quPnWLxUHtua3TAU2jncqR0K-Ka7CACrZBKDR4e3_2-EkwcOLTj4cAoYZdB2XEJ2YMMQa-Ky0kNhCZLWxBrF86yZr5a3aUpTBven5m_FOHkDzGk9MKXApVOj35N2BGLZ74vct0lBvxGSALDU5lIqp9-PCgLN04g_gkt1f5iZbodZ8p8-Gb7HwErybx7iadTZTmmKXxhbUhx9AJgtWSjbIJ6criVSkUnB2Qr2TCEFQkyNs58FELfk63zSLCg2gvheN9MG1-P1RkJCjHI1-xT_fFqhtE1hs8oL21xSWJosVLXzE3iAoQJoTHJ8NZu60at9TKFqmAPMkaXMrNUD8LIl4PjkcAPFRkRDO0tKegaDB9k5XHNPjWzaLv6qM'
    };

    var request = http.MultipartRequest('POST', Uri.parse('https://mosaique.work/matching-apps/public/api/user/3/update'));

    request.fields.addAll(data);
    if(imagePath != null) {
      request.files.add(await http.MultipartFile.fromPath('avatar', imagePath));
    }
    request.headers.addAll(headers);

    http.StreamedResponse streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      print("Response:${response.body}");
      //Pop the loading dialog box
      Navigator.of(context).pop();
      return UpdateProfile.fromJson(jsonDecode(response.body));
    }
    else {
      throw Exception(response.reasonPhrase);
    }

  }

  //Variable to hold the updated accomplishment
  String newAccomplishment;

  //Function to update accomplishments through a post request to the api
  updateAccomplishments(var data) async {
    final http.Response response = await http.post(
        'https://mosaique.work/matching-apps/public/api/user/1/update/accomplishments',
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5MjQ4NDU5YS02ODNmLTQ4MTEtYmJjNy1lM2NjYzkwNDg5ODYiLCJqdGkiOiI0MTNkYzhhMDkyOTc3NGQ3NjBhMmEwMDQ4NTJmOWQ0YWYzZjNlMDdiYjU5ZjVkMTVmMTExMTYxMWE1NWI2MWQ5MzFkMjUyOGFkNjQ3YTZjYSIsImlhdCI6MTYwODk5OTIxNCwibmJmIjoxNjA4OTk5MjE0LCJleHAiOjE2NDA1MzUyMTQsInN1YiI6IjMiLCJzY29wZXMiOltdfQ.YVZcmgu_olGqcOaha7ZBYq0TVLEOQl_QaCs3AQVKdYwqJXrBFxqdXOuAVGdrse2bDj1tFlQuERdoXHVNQ-jmlSuC9-Ux7Ocr_xKMBe6TRojWctVZ6vluWqXK0aMpevfFRzUsIMhhaU0Ze2tF5MGz5OPpkwrI9uc5wWsbboB5k6FHZwoZ6HmWwQFPsxDr0S67VLvnIwqa65EM5DzyfOjQfQvYPwLn_a5qoTllGWO86Mvul3OPqxd3-yP1GXIa7a-iyUJ51aNbNkWCabZPDzvuFLQgGJXnJIpCxRg41RFmnsgSaM7zHywN3rAhqzmLJBiqMRV-0qt8f_gz0XmBgTnahXjWngFYccCW3IKRQouhTNsMkR7OyRurL4MyliFIk0VGStOH4IuUR4ojzKAvlZANMTMh0ft8-7LuI3YJJB3qSrkJ4znLEjCCPfzmDt0KpwBWKmjDzUKKJxXzJTFvQCV5LueR6ZI7yAEK1CqYndyNtFIBCFVF65vSQItBlo6kT6cbQQ3av8UNAEfbHsHfV6a184RQqooTNwzcVKvYUkxwls2tGEeV7SDTciIZRGRIIKhv5pEuYzxuk1o5Xz5VStkhCOWh12vM-Hzx2V5g5DzgfkCXypRUTbJB7MZ3myUbrdekvVbuAkNBNKZwhYSF0T-rx5ZTCQUqS7arx40yua-gj1U'
        },
        body: {
          'accomplishment_name': 'Accomplishment',
          'accomplishment_detail': data,
        }
    );

    if (response.statusCode == 200) {
      print("Response:${response.body}");
      //Pop the loading dialog box
      Navigator.of(context).pop();
    }
    else {
      throw Exception(response.reasonPhrase);
    }
  }

  //Converts the string with newlines to a list and then into a json string to pass to the api
  String convertStringToJsonString(String str){
    List<String> lst = str.split("\n");
    return jsonEncode(lst);
  }

  //Variable to store the image path and to pick the image
  String imagePath;
  final picker = ImagePicker();

  //Function to pick image from camera
  Future imgFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        imagePath = pickedFile.path;
        showLoaderDialog(context);
        updateData(newData, imagePath);
      } else {
        print('No image selected.');
      }
    });
  }

  //Function to pick image from gallery
  Future imgFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        imagePath = pickedFile.path;
        showLoaderDialog(context);
        updateData(newData, imagePath);
      } else {
        print('No image selected.');
      }
    });
  }

  //A modal sheet showing option to pick image from camera or gallery
  void showImagePicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  //Display loader dialog box whenever an api request is made
  showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 7),child:Text("Updating..." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {


    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromRGBO(141, 169, 219, 1),
            centerTitle: true,
            title: Text(AppLocalization.of(context).profile,
                style: TextStyle(
                    fontSize: 30.0, fontFamily: 'Avenir', color: Colors.white)),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_rounded),
              onPressed: () => Navigator.pop(context, false),
            )),
        body: ListView(
          children: [
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height -
                  kToolbarHeight -
                  MediaQuery.of(context).padding.top,
              child: Column(
                children: [
                  Stack(
                    //alignment: Alignment.topCenter,
                    children: [
                      Container(
                        color: Color.fromRGBO(179, 198, 231, 1),
                        //Set a fixed height of the blue container
                        height:275,
                      ),
                      Container(
                        color: Colors.white,
                        height: 20.0,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                width: 170.0,
                                child: Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: imagePath == null
                                      ?
                                      CircleAvatar(
                                        radius: 50,
                                        backgroundImage: AssetImage(
                                            'assets/profile_image.png'),
                                      )
                                          :
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.file(
                                          File(imagePath),
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.fill,
                                        ),
                                      )
                                    ),
                                    ButtonTheme(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 2.0, horizontal: 4.0),
                                      //adds padding inside the button
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      //limits the touch area to the button area
                                      minWidth: 0,
                                      //wraps child's width
                                      height: 0,
                                      //wraps child's height
                                      child: FlatButton(
                                        onPressed: () {
                                          showImagePicker(context);
                                        },
                                        child: Icon(
                                          EditIcon.edit_icon,
                                          color:
                                              Color.fromRGBO(127, 127, 127, 1),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Text(
                                AppLocalization.of(context).profile_name,
                                style: TextStyle(
                                  fontSize: 25.0,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                AppLocalization.of(context).ceo+"|"+AppLocalization.of(context).mosaique,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                AppLocalization.of(context).loc,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 25.0),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Align(
                                  alignment:Alignment.centerLeft,
                                  child: Text(
                                    '${barPercent*100}% Profile Completed',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              //Profile Completion Indicator
                              LinearPercentIndicator(
                                lineHeight: 5.0,
                                padding: const EdgeInsets.only(left:20.0, right: 20.0, top: 8.0),
                                animation: true,
                                animationDuration: 1500,
                                animateFromLastPercent: true,
                                percent: barPercent,
                                backgroundColor: Colors.grey,
                                progressColor: Colors.blue,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  //Accordions
                  Flexible(
                    child: Container(
                        //ListView holding tiles for all the different fields in profile
                        child: ListView(
                      children: [
                        //Theme is used to remove the top and bottom lines that appear when expanding tile
                        Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          //CustomExpansionTile same as ExpansionTile but without the default arrow mark in trailing
                          child: CustomExpansionTile(
                            title:
                                //Container used to change box shape and background color
                                Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(216, 216, 216, 1),
                                border: Border.all(
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                //Row holds the title text and button
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppLocalization.of(context).selfIntro,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Color.fromRGBO(127, 127, 127, 1),
                                      ),
                                    ),
                                    //Ternary condition to change edit icon to check icon on click.
                                    selfIntroFlag ?
                                    ButtonTheme(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4.0, horizontal: 8.0),
                                      //adds padding inside the button
                                      materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                      //limits the touch area to the button area
                                      minWidth: 0,
                                      height: 0,
                                      //Button on click sets the flag
                                      child: FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              //change the edit flag to false and call progress bar function to calculate new percentage
                                              selfIntroFlag = false;
                                              progressBarValue();
                                            });
                                          },
                                          child: Icon(
                                            Icons.check,
                                            color:
                                            Color.fromRGBO(127, 127, 127, 1),
                                          )),
                                    )
                                        :
                                    ButtonTheme(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4.0, horizontal: 8.0),
                                      //adds padding inside the button
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      //limits the touch area to the button area
                                      minWidth: 0,
                                      height: 0,
                                      //Button on click sets the flag which
                                      child: FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              selfIntroFlag = true;
                                            });
                                          },
                                          child: Icon(
                                            EditIcon.edit_icon,
                                            color:
                                                Color.fromRGBO(127, 127, 127, 1),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            children: [
                              //Ternary condition to check if edit button has been clicked
                              selfIntroFlag
                                  ? Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 18.0, right: 18.0),
                                        child: TextField(
                                          //controller sets initial text and also gets updated text
                                          controller: selfIntroController,
                                          autofocus: true,
                                          maxLines: null,
                                          textInputAction: TextInputAction.newline,
                                          onChanged: (text) {
                                            //set the new edited text
                                            setState(() {
                                              selfIntro = text;
                                            });
                                          },
                                        ),
                                      ),
                                    )
                                  //Display text if false
                                  : Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 18.0, right: 18.0),
                                        child: Text(
                                          selfIntro,
                                          style: TextStyle(
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ),
                                    ),
                              SizedBox(height: 20.0),
                            ],
                          ),
                        ),
                        Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          //CustomExpansionTile same as ExpansionTile but without the default arrow mark in trailing
                          child: CustomExpansionTile(
                            title:
                                //Container used to change box shape and background color
                                Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(216, 216, 216, 1),
                                border: Border.all(
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                //Row holds the title text and button
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppLocalization.of(context).workExp,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Color.fromRGBO(127, 127, 127, 1),
                                      ),
                                    ),
                                    //Ternary condition to change edit icon to check icon on click.
                                    workExpFlag ?
                                    ButtonTheme(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4.0, horizontal: 8.0),
                                      //adds padding inside the button
                                      materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                      //limits the touch area to the button area
                                      minWidth: 0,
                                      height: 0,
                                      //Button on click sets the flag
                                      child: FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              //change the edit flag to false and call progress bar function to calculate new percentage
                                              workExpFlag = false;
                                              progressBarValue();
                                            });
                                          },
                                          child: Icon(
                                            Icons.check,
                                            color:
                                            Color.fromRGBO(127, 127, 127, 1),
                                          )),
                                    )
                                        :
                                    ButtonTheme(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4.0, horizontal: 8.0),
                                      //adds padding inside the button
                                      materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                      //limits the touch area to the button area
                                      minWidth: 0,
                                      height: 0,
                                      //Button on click sets the flag which
                                      child: FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              workExpFlag = true;
                                            });
                                          },
                                          child: Icon(
                                            EditIcon.edit_icon,
                                            color:
                                            Color.fromRGBO(127, 127, 127, 1),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            children: [
                              //Ternary condition to check if edit button has been clicked
                              workExpFlag
                                  ? Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 18.0, right: 18.0),
                                        child: TextField(
                                          //controller sets initial text and also gets updated text
                                          controller: workExpController,
                                          autofocus: true,
                                          maxLines: null,
                                          textInputAction: TextInputAction.newline,
                                          onChanged: (text) {
                                            //set the new edited text and change the edit flag
                                            setState(() {
                                              workExp = text;
                                            });
                                          },
                                        ),
                                      ),
                                    )
                                  //Display text if false
                                  : Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 18.0, right: 18.0),
                                        child: Text(
                                          workExp,
                                          style: TextStyle(
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ),
                                    ),
                              SizedBox(height: 20.0),
                            ],
                          ),
                        ),
                        Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          //CustomExpansionTile same as ExpansionTile but without the default arrow mark in trailing
                          child: CustomExpansionTile(
                            title:
                                //Container used to change box shape and background color
                                Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(216, 216, 216, 1),
                                border: Border.all(
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                //Row holds the title text and button
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppLocalization.of(context).edu,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Color.fromRGBO(127, 127, 127, 1),
                                      ),
                                    ),
                                    //Ternary condition to change edit icon to check icon on click.
                                    eduFlag ?
                                    ButtonTheme(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4.0, horizontal: 8.0),
                                      //adds padding inside the button
                                      materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                      //limits the touch area to the button area
                                      minWidth: 0,
                                      height: 0,
                                      //Button on click sets the flag
                                      child: FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              //change the edit flag to false and call progress bar function to calculate new percentage
                                              eduFlag = false;
                                              progressBarValue();
                                            });
                                          },
                                          child: Icon(
                                            Icons.check,
                                            color:
                                            Color.fromRGBO(127, 127, 127, 1),
                                          )),
                                    )
                                        :
                                    ButtonTheme(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4.0, horizontal: 8.0),
                                      //adds padding inside the button
                                      materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                      //limits the touch area to the button area
                                      minWidth: 0,
                                      height: 0,
                                      //Button on click sets the flag which
                                      child: FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              eduFlag = true;
                                            });
                                          },
                                          child: Icon(
                                            EditIcon.edit_icon,
                                            color:
                                            Color.fromRGBO(127, 127, 127, 1),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            children: [
                              //Ternary condition to check if edit button has been clicked
                              eduFlag
                                  ? Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 18.0, right: 18.0),
                                        child: TextField(
                                          //controller sets initial text and also gets updated text
                                          controller: eduController,
                                          autofocus: true,
                                          maxLines: null,
                                          textInputAction: TextInputAction.newline,
                                          onChanged: (text) {
                                            //set the new edited text and change the edit flag
                                            setState(() {
                                              edu = text;
                                            });
                                          },
                                        ),
                                      ),
                                    )
                                  //Display text if false
                                  : Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 18.0, right: 18.0),
                                        child: Text(
                                          edu,
                                          style: TextStyle(
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ),
                                    ),
                              SizedBox(height: 20.0),
                            ],
                          ),
                        ),
                        Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          //CustomExpansionTile same as ExpansionTile but without the default arrow mark in trailing
                          child: CustomExpansionTile(
                            title:
                                //Container used to change box shape and background color
                                Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(216, 216, 216, 1),
                                border: Border.all(
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                //Row holds the title text and button
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppLocalization.of(context).skill,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Color.fromRGBO(127, 127, 127, 1),
                                      ),
                                    ),
                                    //Ternary condition to change edit icon to check icon on click.
                                    skillFlag ?
                                    ButtonTheme(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4.0, horizontal: 8.0),
                                      //adds padding inside the button
                                      materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                      //limits the touch area to the button area
                                      minWidth: 0,
                                      height: 0,
                                      //Button on click sets the flag
                                      child: FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              //change the edit flag to false and call progress bar function to calculate new percentage
                                              skillFlag = false;
                                              progressBarValue();
                                              //Update modified value and call function to invoke the API
                                              newData['skills'] = convertStringToJsonString(skillController.text);
                                              showLoaderDialog(context);
                                              updateData(newData, imagePath);
                                            });
                                          },
                                          child: Icon(
                                            Icons.check,
                                            color:
                                            Color.fromRGBO(127, 127, 127, 1),
                                          )),
                                    )
                                        :
                                    ButtonTheme(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4.0, horizontal: 8.0),
                                      //adds padding inside the button
                                      materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                      //limits the touch area to the button area
                                      minWidth: 0,
                                      height: 0,
                                      //Button on click sets the flag which
                                      child: FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              skillFlag = true;
                                            });
                                          },
                                          child: Icon(
                                            EditIcon.edit_icon,
                                            color:
                                            Color.fromRGBO(127, 127, 127, 1),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            children: [
                              //Ternary condition to check if edit button has been clicked
                              skillFlag
                                  ? Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 18.0, right: 18.0),
                                        child: TextField(
                                          //controller sets initial text and also gets updated text
                                          controller: skillController,
                                          autofocus: true,
                                          maxLines: null,
                                          textInputAction: TextInputAction.newline,
                                          onChanged: (text) {
                                            //set the new edited text and change the edit flag
                                            setState(() {
                                              skill = text;
                                            });
                                          },
                                        ),
                                      ),
                                    )
                                  //Display text if false
                                  : Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 18.0, right: 18.0),
                                        child: Text(
                                          skill,
                                          style: TextStyle(
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ),
                                    ),
                              SizedBox(height: 20.0),
                            ],
                          ),
                        ),
                        Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          //CustomExpansionTile same as ExpansionTile but without the default arrow mark in trailing
                          child: CustomExpansionTile(
                            title:
                                //Container used to change box shape and background color
                                Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(216, 216, 216, 1),
                                border: Border.all(
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                //Row holds the title text and button
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppLocalization.of(context).resume,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Color.fromRGBO(127, 127, 127, 1),
                                      ),
                                    ),
                                    ButtonTheme(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4.0, horizontal: 8.0),
                                      //adds padding inside the button
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      //limits the touch area to the button area
                                      minWidth: 0,
                                      height: 0,
                                      //Button on click sets the flag
                                      child: FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              resumeFlag = true;
                                            });
                                          },
                                          child: Icon(
                                            EditIcon.edit_icon,
                                            color:
                                                Color.fromRGBO(127, 127, 127, 1),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            children: [
                              //Ternary condition to check if edit button has been clicked
                              resumeFlag
                                  ? Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 18.0, right: 16.0),
                                        child:
                                            //Upload file dialog box
                                            Container(
                                                child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    width: double.infinity,
                                                    padding: EdgeInsets.all(10.0),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color:
                                                              Colors.grey[200]),
                                                      color: Colors.grey[100],
                                                    ),
                                                    child: Text(AppLocalization.of(context).upload),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                      width: double.infinity,
                                                      padding:
                                                          EdgeInsets.all(20.0),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.grey[200]),
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              FlatButton(
                                                                onPressed: null,
                                                                child: Text(
                                                                    AppLocalization.of(context).browse_btn,
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black)),
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  side: BorderSide(
                                                                      color: Colors
                                                                              .grey[
                                                                          200],
                                                                      width: 1,
                                                                      style: BorderStyle
                                                                          .solid),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  width: 10.0),
                                                              Text(
                                                                AppLocalization.of(context).noFile),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              FlatButton.icon(
                                                                //On pressing upload, the flag is set to false to make the dialog box disappears
                                                                onPressed: () {
                                                                  setState(() {
                                                                    resumeFlag = false;
                                                                  });
                                                                },
                                                                icon: Icon(Icons
                                                                    .upload_rounded),
                                                                label: Text(
                                                                    AppLocalization.of(context).upload_btn,
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black)),
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  side: BorderSide(
                                                                      color: Colors
                                                                              .grey[
                                                                          200],
                                                                      width: 1,
                                                                      style: BorderStyle
                                                                          .solid),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                      ),
                                    )
                                  //Display text if false
                                  : Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 18.0, right: 18.0),
                                        child: Text(
                                          resume,
                                          style: TextStyle(
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ),
                                    ),
                              SizedBox(height: 20.0),
                            ],
                          ),
                        ),
                        Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          //CustomExpansionTile same as ExpansionTile but without the default arrow mark in trailing
                          child: CustomExpansionTile(
                            title:
                                //Container used to change box shape and background color
                                Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(216, 216, 216, 1),
                                border: Border.all(
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                //Row holds the title text and button
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppLocalization.of(context).projects,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Color.fromRGBO(127, 127, 127, 1),
                                      ),
                                    ),
                                    //Ternary condition to change edit icon to check icon on click.
                                    projectFlag ?
                                    ButtonTheme(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4.0, horizontal: 8.0),
                                      //adds padding inside the button
                                      materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                      //limits the touch area to the button area
                                      minWidth: 0,
                                      height: 0,
                                      //Button on click sets the flag
                                      child: FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              //change the edit flag to false and call progress bar function to calculate new percentage
                                              projectFlag = false;
                                              progressBarValue();
                                            });
                                          },
                                          child: Icon(
                                            Icons.check,
                                            color:
                                            Color.fromRGBO(127, 127, 127, 1),
                                          )),
                                    )
                                        :
                                    ButtonTheme(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4.0, horizontal: 8.0),
                                      //adds padding inside the button
                                      materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                      //limits the touch area to the button area
                                      minWidth: 0,
                                      height: 0,
                                      //Button on click sets the flag which
                                      child: FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              projectFlag = true;
                                            });
                                          },
                                          child: Icon(
                                            EditIcon.edit_icon,
                                            color:
                                            Color.fromRGBO(127, 127, 127, 1),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            children: [
                              //Ternary condition to check if edit button has been clicked
                              projectFlag
                                  ? Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 18.0, right: 18.0),
                                        child: Column(children:[
                                          TextField(controller: projectNameController,
                                            decoration: InputDecoration(
                                                hintText: "Project Name",
                                                ),
                                          autofocus: true,
                                          maxLines: null,
                                          textInputAction: TextInputAction.newline,
                                          onChanged: (text) {
                                            //set the new edited text and change the edit flag
                                            setState(() {
                                              projectName = text;
                                            });
                                          },
                                        ),
                                          TextField(
                                            //controller sets initial text and also gets updated text
                                            controller: projectDetailsController,
                                            decoration: InputDecoration(
                                              hintText: "Project details",
                                            ),
                                            autofocus: true,
                                            maxLines: null,
                                            textInputAction: TextInputAction.newline,
                                            onChanged: (text) {
                                              //set the new edited text and change the edit flag
                                              setState(() {
                                                projectDetails = text;
                                              });
                                            },
                                          ),
                                          TextField(
                                          //controller sets initial text and also gets updated text
                                          controller: userContributionController,
                                          autofocus: true,
                                          maxLines: null,
                                          textInputAction: TextInputAction.newline,
                                          onChanged: (text) {
                                            //set the new edited text and change the edit flag
                                            setState(() {
                                              userContribution = text;
                                            });
                                          },
                                        )]),
                                      ),
                                    )
                                  //Display text if false
                                  : Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 18.0, right: 18.0),
                                        child: Column(children:[Text(
                                          projectName,
                                          style: TextStyle(
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ])),
                                    ),
                              SizedBox(height: 20.0),
                            ],
                          ),
                        ),
                        Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          //CustomExpansionTile same as ExpansionTile but without the default arrow mark in trailing
                          child: CustomExpansionTile(
                            title:
                                //Container used to change box shape and background color
                                Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(216, 216, 216, 1),
                                border: Border.all(
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                //Row holds the title text and button
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppLocalization.of(context).accomp,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Color.fromRGBO(127, 127, 127, 1),
                                      ),
                                    ),
                                    //Ternary condition to change edit icon to check icon on click.
                                    accomplishmentFlag ?
                                    ButtonTheme(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4.0, horizontal: 8.0),
                                      //adds padding inside the button
                                      materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                      //limits the touch area to the button area
                                      minWidth: 0,
                                      height: 0,
                                      //Button on click sets the flag
                                      child: FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              //change the edit flag to false and call progress bar function to calculate new percentage
                                              accomplishmentFlag = false;
                                              progressBarValue();
                                              //Update modified value and call function to invoke the API
                                              newAccomplishment = accomplishmentController.text;
                                              showLoaderDialog(context);
                                              updateAccomplishments(newAccomplishment);
                                            });
                                          },
                                          child: Icon(
                                            Icons.check,
                                            color:
                                            Color.fromRGBO(127, 127, 127, 1),
                                          )),
                                    )
                                        :
                                    ButtonTheme(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4.0, horizontal: 8.0),
                                      //adds padding inside the button
                                      materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                      //limits the touch area to the button area
                                      minWidth: 0,
                                      height: 0,
                                      //Button on click sets the flag which
                                      child: FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              accomplishmentFlag = true;
                                            });
                                          },
                                          child: Icon(
                                            EditIcon.edit_icon,
                                            color:
                                            Color.fromRGBO(127, 127, 127, 1),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            children: [
                              //Ternary condition to check if edit button has been clicked
                              accomplishmentFlag
                                  ? Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 18.0, right: 18.0),
                                        child: TextField(
                                          //controller sets initial text and also gets updated text
                                          controller: accomplishmentController,
                                          autofocus: true,
                                          maxLines: null,
                                          textInputAction: TextInputAction.newline,
                                          onChanged: (text) {
                                            //set the new edited text and change the edit flag
                                            setState(() {
                                              accomplishment = text;
                                            });
                                          },
                                        ),
                                      ),
                                    )
                                  //Display text if false
                                  : Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 18.0, right: 18.0),
                                        child: Text(
                                          accomplishment,
                                          style: TextStyle(
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ),
                                    ),
                              SizedBox(height: 20.0),
                            ],
                          ),
                        ),
                        Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          //CustomExpansionTile same as ExpansionTile but without the default arrow mark in trailing
                          child: CustomExpansionTile(
                            title:
                                //Container used to change box shape and background color
                                Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(216, 216, 216, 1),
                                border: Border.all(
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                //Row holds the title text and button
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppLocalization.of(context).lang,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Color.fromRGBO(127, 127, 127, 1),
                                      ),
                                    ),
                                    //Ternary condition to change edit icon to check icon on click.
                                    langFlag ?
                                    ButtonTheme(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4.0, horizontal: 8.0),
                                      //adds padding inside the button
                                      materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                      //limits the touch area to the button area
                                      minWidth: 0,
                                      height: 0,
                                      //Button on click sets the flag
                                      child: FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              //change the edit flag to false and call progress bar function to calculate new percentage
                                              langFlag = false;
                                              progressBarValue();
                                              //Update modified value and call function to invoke the API
                                              newData['language'] = convertStringToJsonString(langController.text);
                                              showLoaderDialog(context);
                                              updateData(newData, imagePath);
                                            });
                                          },
                                          child: Icon(
                                            Icons.check,
                                            color:
                                            Color.fromRGBO(127, 127, 127, 1),
                                          )),
                                    )
                                        :
                                    ButtonTheme(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4.0, horizontal: 8.0),
                                      //adds padding inside the button
                                      materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                      //limits the touch area to the button area
                                      minWidth: 0,
                                      height: 0,
                                      //Button on click sets the flag which
                                      child: FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              langFlag = true;
                                            });
                                          },
                                          child: Icon(
                                            EditIcon.edit_icon,
                                            color:
                                            Color.fromRGBO(127, 127, 127, 1),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            children: [
                              //Ternary condition to check if edit button has been clicked
                              langFlag
                                  ? Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 18.0, right: 18.0),
                                        child: TextField(
                                          //controller sets initial text and also gets updated text
                                          controller: langController,
                                          autofocus: true,
                                          maxLines: null,
                                          textInputAction: TextInputAction.newline,
                                          onChanged: (text) {
                                            //set the new edited text and change the edit flag
                                            setState(() {
                                              lang = text;
                                          });
                                          },
                                        ),
                                      ),
                                    )
                                  //Display text if false
                                  : Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 18.0, right: 18.0),
                                        child: Text(
                                          lang,
                                          style: TextStyle(
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ),
                                    ),
                              SizedBox(height: 20.0),
                            ],
                          ),
                        ),
                        Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          //CustomExpansionTile same as ExpansionTile but without the default arrow mark in trailing
                          child: CustomExpansionTile(
                            title:
                                //Container used to change box shape and background color
                                Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(216, 216, 216, 1),
                                border: Border.all(
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                //Row holds the title text and button
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppLocalization.of(context).qual,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Color.fromRGBO(127, 127, 127, 1),
                                      ),
                                    ),
                                    //Ternary condition to change edit icon to check icon on click.
                                    qualificationFlag ?
                                    ButtonTheme(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4.0, horizontal: 8.0),
                                      //adds padding inside the button
                                      materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                      //limits the touch area to the button area
                                      minWidth: 0,
                                      height: 0,
                                      //Button on click sets the flag
                                      child: FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              //change the edit flag to false and call progress bar function to calculate new percentage
                                              qualificationFlag = false;
                                              progressBarValue();
                                              //Update modified value and call function to invoke the API
                                              newData['qualification'] = convertStringToJsonString(qualificationController.text);
                                              showLoaderDialog(context);
                                              updateData(newData, imagePath);
                                            });
                                          },
                                          child: Icon(
                                            Icons.check,
                                            color:
                                            Color.fromRGBO(127, 127, 127, 1),
                                          )),
                                    )
                                        :
                                    ButtonTheme(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4.0, horizontal: 8.0),
                                      //adds padding inside the button
                                      materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                      //limits the touch area to the button area
                                      minWidth: 0,
                                      height: 0,
                                      //Button on click sets the flag which
                                      child: FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              qualificationFlag = true;
                                            });
                                          },
                                          child: Icon(
                                            EditIcon.edit_icon,
                                            color:
                                            Color.fromRGBO(127, 127, 127, 1),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            children: [
                              //Ternary condition to check if edit button has been clicked
                              qualificationFlag
                                  ? Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 18.0, right: 18.0),
                                        child: TextField(
                                          //controller sets initial text and also gets updated text
                                          controller: qualificationController,
                                          autofocus: true,
                                          maxLines: null,
                                          textInputAction: TextInputAction.newline,
                                          onChanged: (text) {
                                            //set the new edited text and change the edit flag
                                            setState(() {
                                              qualification = text;
                                            });
                                          },
                                        ),
                                      ),
                                    )
                                  //Display text if false
                                  : Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 18.0, right: 18.0),
                                        child: Text(
                                          qualification,
                                          style: TextStyle(
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ),
                                    ),
                              SizedBox(height: 20.0),
                            ],
                          ),
                        ),
                        Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          //CustomExpansionTile same as ExpansionTile but without the default arrow mark in trailing
                          child: CustomExpansionTile(
                            title:
                                //Container used to change box shape and background color
                                Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(216, 216, 216, 1),
                                border: Border.all(
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                //Row holds the title text and button
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppLocalization.of(context).other,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Color.fromRGBO(127, 127, 127, 1),
                                      ),
                                    ),
                                    //Ternary condition to change edit icon to check icon on click.
                                    otherFlag ?
                                    ButtonTheme(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4.0, horizontal: 8.0),
                                      //adds padding inside the button
                                      materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                      //limits the touch area to the button area
                                      minWidth: 0,
                                      height: 0,
                                      //Button on click sets the flag
                                      child: FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              //change the edit flag to false and call progress bar function to calculate new percentage
                                              otherFlag = false;
                                              progressBarValue();
                                              //Update modified value and call function to invoke the API
                                              newData['other'] = convertStringToJsonString(otherController.text);
                                              showLoaderDialog(context);
                                              updateData(newData, imagePath);
                                            });
                                          },
                                          child: Icon(
                                            Icons.check,
                                            color:
                                            Color.fromRGBO(127, 127, 127, 1),
                                          )),
                                    )
                                        :
                                    ButtonTheme(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4.0, horizontal: 8.0),
                                      //adds padding inside the button
                                      materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                      //limits the touch area to the button area
                                      minWidth: 0,
                                      height: 0,
                                      //Button on click sets the flag which
                                      child: FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              otherFlag = true;
                                            });
                                          },
                                          child: Icon(
                                            EditIcon.edit_icon,
                                            color:
                                            Color.fromRGBO(127, 127, 127, 1),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            children: [
                              //Ternary condition to check if edit button has been clicked
                              otherFlag
                                  ? Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 18.0, right: 18.0),
                                        child: TextField(
                                          //controller sets initial text and also gets updated text
                                          controller: otherController,
                                          autofocus: true,
                                          maxLines: null,
                                          textInputAction: TextInputAction.newline,
                                          onChanged: (text) {
                                            //set the new edited text and change the edit flag
                                            setState(() {
                                              other = text;
                                            });
                                          },
                                        ),
                                      ),
                                    )
                                  //Display text if false
                                  : Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 18.0, right: 18.0),
                                        child: Text(
                                          other,
                                          style: TextStyle(
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ),
                                    ),
                              SizedBox(height: 20.0),
                            ],
                          ),
                        ),
                        Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child: CustomExpansionTile(
                            title: Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(216, 216, 216, 1),
                                border: Border.all(
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppLocalization.of(context).following,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Color.fromRGBO(127, 127, 127, 1),
                                      ),
                                    ),

                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 4.0, horizontal: 8.0),
                                      child: AnimatedBuilder(
                                        animation: arrowAnimationController,
                                        builder: (context, child) => Transform.rotate(
                                          angle: arrowAnimation.value,
                                          child: Icon(
                                            Icons.keyboard_arrow_down_sharp,
                                            color: Color.fromRGBO(127, 127, 127, 1),
                                          ),
                                        ),
                                      ),

                                    ),
                                  ],
                                ),
                              ),
                            ),
                            onExpansionChanged: (value) {
                              arrowAnimationController.isCompleted
                                  ? arrowAnimationController.reverse()
                                  : arrowAnimationController.forward();
                            },
                            children: [
                              //Display images under following section
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 18.0, right: 18.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            child: Image(
                                              image: AssetImage(
                                                  'images/following1.png'),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            child: Image(
                                              image: AssetImage(
                                                  'images/following2.png'),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            child: Image(
                                              image: AssetImage(
                                                  'images/following3.png'),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                              SizedBox(height: 20.0),
                            ],
                          ),
                        ),
                      ],
                    )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

