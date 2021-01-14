import 'package:demo_matching_apps/ind_profile_view.dart';
import 'package:demo_matching_apps/locale/app_localization.dart';
import 'package:demo_matching_apps/models/user_fields_bloc.dart';
import 'package:flutter/material.dart';
import 'package:frideos/frideos.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';


class IndProfile1 extends StatefulWidget {
  @override
  _IndProfile1State createState() => _IndProfile1State();
}

//flags for toggle switch
bool isStudent = false;
bool isWorking = false;
bool isStudying = false;

class _IndProfile1State extends State<IndProfile1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 35.0, 30.0, 90.0),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          //Change step number based on student toggle button
                          isStudent ?
                          AppLocalization.of(context).step("1/4")
                              :
                          AppLocalization.of(context).step("1/5"),
                          style: TextStyle(
                            color: Color.fromRGBO(127, 127, 127, 1),
                            fontSize: 27,
                          ),
                        ),
                      ),

                      //If student toggle button is clicked, skip button should not be visible
                      isStudent
                          ?
                      Container()
                          :
                      //Skip Button
                      SizedBox(
                        height: 50,
                        width: 75,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Color.fromRGBO(191, 191, 191, 1),
                          child: MaterialButton(
                            padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),

                            onPressed: () {
                              //If skip is pressed, then isStudent must be passed to next page because it's value is used in the subsequent pages.
                              bloc.isStudent = isStudent;
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) =>
                              //           IndProfile2_1()),
                              // );
                            },
                            child: Text(
                              AppLocalization.of(context).skip_btn,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 35.0),
                  Text(
                      AppLocalization.of(context).phrase1,
                    style: TextStyle(
                      color: Color.fromRGBO(127, 127, 127, 1),
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 35.0),

                  //Toggle Switch
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalization.of(context).phrase2,
                        style:
                        TextStyle(color: Color.fromRGBO(127, 127, 127, 1),
                            fontSize: 20),
                      ),
                      Switch(
                        value: isStudent,
                        onChanged: (value) {
                          setState(() {
                            isStudent = value;
                          });
                        },
                        activeTrackColor: Colors.lightBlueAccent,
                        activeColor: Colors.blue,
                      ),
                      Text(
                        AppLocalization.of(context).yes,
                        style:
                        TextStyle(color: Color.fromRGBO(127, 127, 127, 1),
                            fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(height: 45.0),
                  DynamicFieldsWidget(),
                ],
              ),
            )
          ]
      ),
    );

  }
}

class DynamicFieldsWidget extends StatefulWidget {
  @override
  _DynamicFieldsWidgetState createState() => _DynamicFieldsWidgetState();
}

class _DynamicFieldsWidgetState extends State<DynamicFieldsWidget> {
  final jobTitleController = List<TextEditingController>();
  final compNameController = List<TextEditingController>();
  final schoolNameController = List<TextEditingController>();
  final courseOfStudyController = List<TextEditingController>();
  final workingFromValues = List<String>();
  final workingToValues = List<String>();
  final studyingFromValues = List<String>();
  final studyingToValues = List<String>();



  @override
  Widget build(BuildContext context) {

    List<Widget> _buildFields(int length) {

      if(isStudent){
        // Clear the TextEditingControllers lists
        jobTitleController.clear();
        compNameController.clear();
        schoolNameController.clear();
        courseOfStudyController.clear();
        workingFromValues.clear();
        workingToValues.clear();
        studyingFromValues.clear();
        studyingToValues.clear();


        for (int i = 0; i < length; i++) {
          final schoolName = bloc.schoolName.value[i].value;
          final courseOfStudy = bloc.courseOfStudy.value[i].value;
          var studyingFrom = bloc.studyingFrom.value[i].value;
          var studyingTo = bloc.studyingTo.value[i].value;

          if(studyingFrom == null){
            studyingFrom = AppLocalization.of(context).from;
          }
          if(studyingTo == null){
            studyingTo = AppLocalization.of(context).to;
          }

          schoolNameController.add(TextEditingController(text: schoolName));
          courseOfStudyController.add(TextEditingController(text: courseOfStudy));
          studyingFromValues.add(studyingFrom);
          studyingToValues.add(studyingTo);
        }

        return List<Widget>.generate(
          length,
              (i) => FieldsWidget(
              index: i,
              schoolNameController: schoolNameController[i],
              courseOfStudyController: courseOfStudyController[i],
              studyingFrom: studyingFromValues[i],
              studyingTo: studyingToValues[i]
          ),
        );
      }
      else{
        // Clear the TextEditingControllers lists
        jobTitleController.clear();
        compNameController.clear();
        schoolNameController.clear();
        courseOfStudyController.clear();
        workingFromValues.clear();
        workingToValues.clear();
        studyingFromValues.clear();
        studyingToValues.clear();

        for (int i = 0; i < length; i++) {
          final jobTitle = bloc.jobTitle.value[i].value;
          final compName = bloc.compName.value[i].value;
          var workingFrom = bloc.workingFrom.value[i].value;
          var workingTo = bloc.workingTo.value[i].value;

          if(workingFrom == null){
            workingFrom = AppLocalization.of(context).from;
          }
          if(workingTo == null){
            workingTo = AppLocalization.of(context).to;
          }

          jobTitleController.add(TextEditingController(text: jobTitle));
          compNameController.add(TextEditingController(text: compName));
          workingFromValues.add(workingFrom);
          workingToValues.add(workingTo);

        }


        return List<Widget>.generate(
          length,
              (i) => FieldsWidget(
            index: i,
            jobTitleController: jobTitleController[i],
            compNameController: compNameController[i],
            workingFrom: workingFromValues[i],
            workingTo: workingToValues[i],
          ),
        );
      }

    }

    return Column(
      children: [
        isStudent ?
        ValueBuilder<List<StreamedValue<String>>>(
          streamed: bloc.schoolName,
          builder: (context, snapshot) {
            return Column(
              children: _buildFields(bloc.schoolName.length),
            );
          },
          noDataChild: const Text('NO DATA'),
        )
            :
        ValueBuilder<List<StreamedValue<String>>>(
          streamed: bloc.jobTitle,
          builder: (context, snapshot) {
            return Column(
              children: _buildFields(bloc.jobTitle.length),
            );
          },
          noDataChild: const Text('NO DATA'),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: Icon(
              Icons.add_circle,
              size: 35,
            ),
            onPressed: isStudent ? bloc.newStudentFields : bloc.newWorkerFields,
          ),
        ),
        SizedBox(height: 45.0),
        StreamBuilder<bool>(
            stream: isStudent ? bloc.isStudentFormValid.outStream : bloc.isWorkerFormValid.outStream,
            builder: (context, snapshot) {
              return Material(
                borderRadius: BorderRadius.circular(20.0),
                //Grey out the button if there is no data or if the fields are added but there are no data
                color: Color.fromRGBO(141, 169, 219, 1),
                child: MaterialButton(
                    padding: EdgeInsets.fromLTRB(50.0, 15.0, 50.0, 15.0),
                    child: Text(
                      AppLocalization.of(context).next_btn,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: (){
                      bloc.isStudent = isStudent;

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => IndProfileView()),
                          );
                    }
                ),
              );
            }),
        SizedBox(height: 30),
      ],
    );
  }
}


class FieldsWidget extends StatefulWidget {
  final int index;
  final TextEditingController jobTitleController;
  final TextEditingController compNameController;
  final TextEditingController schoolNameController;
  final TextEditingController courseOfStudyController;
  final String workingFrom;
  final String workingTo;
  final String studyingFrom;
  final String studyingTo;

  const FieldsWidget({
    this.index,
    this.jobTitleController,
    this.compNameController,
    this.schoolNameController,
    this.courseOfStudyController,
    this.workingFrom,
    this.workingTo,
    this.studyingFrom,
    this.studyingTo,
  });

  @override
  _FieldsWidgetState createState() => _FieldsWidgetState();
}

class _FieldsWidgetState extends State<FieldsWidget> {

  //Variables for the calender
  DateTime selectedFromDate = DateTime.now();
  DateTime selectedToDate = DateTime.now();


  final List employmentType = [
    "Full-time",
    "Part-time",
    "Self-employed",
    "Internship",
    "Contract",
    "Freelance"
  ];

  @override
  Widget build(BuildContext context) {

    var fromPlaceholder = isStudent ? widget.studyingFrom : widget.workingFrom;
    var toPlaceholder = isStudent ? widget.studyingTo : widget.workingTo;

    //Function to pick the from date
    selectFromDate(BuildContext context) async {
      final DateTime picked = await showMonthPicker(
        context: context,
        firstDate: DateTime(1920),
        lastDate: DateTime(DateTime.now().year, DateTime.now().month),
        initialDate: selectedFromDate,
      );
      if (picked != null) {
        selectedFromDate = picked;
        fromPlaceholder =
        "${selectedFromDate.month}/${selectedFromDate.year}"; //to display in the text widget
        isStudent ?
        bloc.studyingFrom.value[widget.index]
            .inStream("${selectedFromDate.month}/${selectedFromDate.year}")
            :
        bloc.workingFrom.value[widget.index]
            .inStream("${selectedFromDate.month}/${selectedFromDate.year}");
      }
    }

    //Function to pick the to date
    selectToDate(BuildContext context) async {
      final DateTime picked = await showMonthPicker(
        context: context,
        firstDate: selectedFromDate,
        lastDate: DateTime(DateTime.now().year, DateTime.now().month),
        initialDate: selectedToDate,
      );
      if (picked != null) {
        selectedToDate = picked;
        toPlaceholder =
        "${selectedToDate.month}/${selectedToDate.year}"; //to display in the text widget
        isStudent ?
        bloc.studyingTo.value[widget.index]
            .inStream("${selectedToDate.month}/${selectedToDate.year}")
            :
        bloc.workingTo.value[widget.index]
            .inStream("${selectedToDate.month}/${selectedToDate.year}");
      }
    }

    return Column(
      children: <Widget>[
        widget.index == 0?
        Container()
            :
        Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              //To remove the added widgets
              icon: Icon(
                Icons.remove_circle,
                size: 35,
              ),
              onPressed: () {
                isStudent ? bloc.removeStudentFields(widget.index) : bloc.removeWorkerFields(widget.index);
              },
            )
        ),

        //Ternary condition to switch screens on toggle switch
        isStudent
            ?
        //Container that shows fields when toggle switch is true
        Column(
          children: [
            StreamBuilder<String>(
                initialData: ' ',
                stream: bloc.schoolName.value[widget.index].outStream,
                builder: (context, snapshot) {
                  return TextField(
                    controller: widget.schoolNameController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(
                            20.0, 15.0, 20.0, 15.0),
                        labelText: AppLocalization.of(context).schoolName,
                        labelStyle: TextStyle(color: Color.fromRGBO(127, 127, 127, 1),),
                        errorText: snapshot.error,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(12.0)))),
                    onChanged: bloc.schoolName.value[widget.index].inStream,
                  );
                }),
            SizedBox(height: 35.0),
            StreamBuilder<String>(
                initialData: ' ',
                stream: bloc.courseOfStudy.value[widget.index].outStream,
                builder: (context, snapshot) {
                  return TextField(
                    controller: widget.courseOfStudyController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(
                            20.0, 15.0, 20.0, 15.0),
                        labelText: AppLocalization.of(context).course,
                        labelStyle: TextStyle(color: Color.fromRGBO(127, 127, 127, 1),),
                        errorText: snapshot.error,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(12.0)))),
                    onChanged: bloc.courseOfStudy.value[widget.index].inStream,
                  );
                }),
            SizedBox(height: 35.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalization.of(context).studyPeriod,
                  style: TextStyle(
                    color: Color.fromRGBO(127, 127, 127, 1),
                    fontSize: 18,
                  ),
                ),

                //Show still studying toggle button only for the first set of fields
                widget.index == 0
                    ?
                Row(
                  children: [
                    Text(
                      AppLocalization.of(context).studying,
                      style: TextStyle(
                        color: Color.fromRGBO(127, 127, 127, 1),
                        fontSize: 18,
                      ),
                    ),
                    Switch(
                      value: isStudying,
                      onChanged: (value) {
                        /*If user toggles it on, set it to a null string to enable submit button.
                        * Else, if the user doesn't select a date, switches it on and then back off, set to null to disable submit
                        * Else, if user selects a date, switches it on and then back off, show the old selected date.*/
                        if (value == true) {
                          bloc.studyingTo.value[widget.index].inStream(
                              "null");
                        }
                        else{
                          if(toPlaceholder == "To"){
                            bloc.studyingTo.value[widget.index].inStream(null);
                          }
                          else{
                            bloc.studyingTo.value[widget.index].inStream(toPlaceholder);
                          }

                        }
                        setState(() {
                          isStudying = value;
                        });
                      },
                      activeTrackColor:
                      Colors.lightBlueAccent,
                      activeColor: Colors.blue,
                    ),
                  ],
                )
                    :
                Container()
              ],
            ),
            Padding(
              //Give padding for everything except the first set of fields
              padding: widget.index != 0 ? const EdgeInsets.only(top: 12.0) : const EdgeInsets.only(top: 0.0),
              child: Row(
                children: [
                  Expanded(
                    child: StreamBuilder<String>(
                        initialData: ' ',
                        stream: bloc.studyingFrom.value[widget.index].outStream,
                        builder: (context, snapshot) {
                          return FlatButton(
                            padding: EdgeInsets.only(
                                top: 15.0, bottom: 15.0, left: 20.0),
                            onPressed: () => selectFromDate(context),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                fromPlaceholder,
                                style: TextStyle(
                                  color: Color.fromRGBO(127, 127, 127, 1),
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(12.0)),
                              side: BorderSide(color: Colors.grey),
                            ),
                          );
                        }),
                  ),
                  SizedBox(width: 30.0),
                  isStudying
                      ? Expanded(child: Container())
                      :
                  Expanded(
                    child: StreamBuilder<String>(
                        initialData: ' ',
                        stream: bloc.studyingTo.value[widget.index].outStream,
                        builder: (context, snapshot) {
                          return FlatButton(
                            padding: EdgeInsets.only(
                                top: 15.0, bottom: 15.0, left: 20.0),
                            onPressed: () => selectToDate(context),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                toPlaceholder,
                                style: TextStyle(
                                  color: Color.fromRGBO(127, 127, 127, 1),
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(12.0)),
                              side: BorderSide(color: Colors.grey),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        )
            :
        //Column widget that shows fields when toggle switch is false
        Column(
          children: <Widget>[
            StreamBuilder<String>(
                initialData: ' ',
                stream: bloc.jobTitle.value[widget.index].outStream,
                builder: (context, snapshot) {
                  return TextField(
                    controller: widget.jobTitleController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(
                            20.0, 15.0, 20.0, 15.0),
                        labelText: AppLocalization.of(context).jobTitle,
                        labelStyle: TextStyle(color: Color.fromRGBO(127, 127, 127, 1),),
                        errorText: snapshot.error,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(12.0)))),
                    onChanged: bloc.jobTitle.value[widget.index].inStream,
                  );
                }),
            SizedBox(height: 25.0),
            StreamBuilder<String>(
                initialData: ' ',
                stream: bloc.empType.value[widget.index].outStream,
                builder: (context, snapshot) {
                  return Container(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButtonFormField(
                        decoration:InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(
                                20.0, 8.0, 20.0, 8.0),
                            labelText: AppLocalization.of(context).empType,
                            labelStyle: TextStyle(color: Color.fromRGBO(127, 127, 127, 1),),
                            errorText: snapshot.error,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(12.0)))),
                        icon: Icon(
                          Icons.arrow_drop_down_rounded,
                          color: Color.fromRGBO(127, 127, 127, 1),
                        ),
                        iconSize: 36.0,
                        isExpanded: true,
                        onChanged: bloc.empType.value[widget.index].inStream,
                        items: employmentType.map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                }),
            SizedBox(height: 25.0),
            StreamBuilder<String>(
                initialData: ' ',
                stream: bloc.compName.value[widget.index].outStream,
                builder: (context, snapshot) {
                  return TextField(
                    controller: widget.compNameController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(
                            20.0, 15.0, 20.0, 15.0),
                        labelText: AppLocalization.of(context).compName,
                        labelStyle: TextStyle(color: Color.fromRGBO(127, 127, 127, 1),),
                        errorText: snapshot.error,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(12.0)))),
                    onChanged: bloc.compName.value[widget.index].inStream,
                  );
                }),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalization.of(context).period,
                  style: TextStyle(
                    color: Color.fromRGBO(127, 127, 127, 1),
                    fontSize: 18,
                  ),
                ),

                //Show still working toggle button only for the first set of fields
                widget.index == 0
                ?
                Row(
                  children: [
                    Text(
                      AppLocalization.of(context).working,
                      style: TextStyle(
                        color: Color.fromRGBO(127, 127, 127, 1),
                        fontSize: 18,
                      ),
                    ),
                    Switch(
                      value: isWorking,
                      onChanged: (value) {
                        /*If user toggles it on, set it to a null string to enable submit button.
                        * Else, if the user doesn't select a date, switches it on and then back off, set to null to disable submit
                        * Else, if user selects a date, switches it on and then back off, show the old selected date.*/
                        if (value == true) {
                          bloc.workingTo.value[widget.index].inStream(
                              "null");
                        }
                        else{
                          if(toPlaceholder == "To"){
                            bloc.workingTo.value[widget.index].inStream(null);
                          }
                          else{
                            bloc.workingTo.value[widget.index].inStream(toPlaceholder);
                          }

                        }
                        setState(() {
                          isWorking = value;
                        });
                      },
                      activeTrackColor:
                      Colors.lightBlueAccent,
                      activeColor: Colors.blue,
                    ),
                  ],
                )
                    :
                    Container()
              ],
            ),
            Padding(
              //Give padding for everything except the first set of fields
              padding: widget.index != 0 ? const EdgeInsets.only(top: 12.0) : const EdgeInsets.only(top: 0.0),
              child: Row(
                children: [
                  Expanded(
                    child: StreamBuilder<String>(
                        initialData: ' ',
                        stream: bloc.workingFrom.value[widget.index].outStream,
                        builder: (context, snapshot) {
                          return FlatButton(
                            padding: EdgeInsets.only(
                                top: 15.0, bottom: 15.0, left: 20.0),
                            onPressed: () => selectFromDate(context),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                fromPlaceholder,
                                style: TextStyle(
                                  color: Color.fromRGBO(127, 127, 127, 1),
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(12.0)),
                              side: BorderSide(color: Colors.grey),
                            ),
                          );
                        }),
                  ),
                  SizedBox(width: 30.0),
                  isWorking
                      ? Expanded(child: Container())
                      :
                  Expanded(
                    child: StreamBuilder<String>(
                        initialData: ' ',
                        stream: bloc.workingTo.value[widget.index].outStream,
                        builder: (context, snapshot) {
                          return FlatButton(
                            padding: EdgeInsets.only(
                                top: 15.0, bottom: 15.0, left: 20.0),
                            onPressed: () => selectToDate(context),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                toPlaceholder,
                                style: TextStyle(
                                  color: Color.fromRGBO(127, 127, 127, 1),
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(12.0)),
                              side: BorderSide(color: Colors.grey),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}




