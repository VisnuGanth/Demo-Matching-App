import 'package:frideos/frideos.dart';

class UserFieldsBloc{

  UserFieldsBloc(){

    //Initial set of fields for non-student users
    jobTitle.addElement(StreamedValue<String>());
    empType.addElement(StreamedValue<String>());
    compName.addElement(StreamedValue<String>());
    workingFrom.addElement(StreamedValue<String>());
    workingTo.addElement(StreamedValue<String>());

    //Initial set of fields for student users
    schoolName.addElement(StreamedValue<String>());
    courseOfStudy.addElement(StreamedValue<String>());
    studyingFrom.addElement(StreamedValue<String>());
    studyingTo.addElement(StreamedValue<String>());

    for(var item in jobTitle.value){
      item.onChange(checkWorkerForm);
    }
    for(var item in empType.value){
      item.onChange(checkWorkerForm);
    }
    for(var item in compName.value){
      item.onChange(checkWorkerForm);
    }
    for(var item in workingFrom.value){
      item.onChange(checkWorkerForm);
    }
    for(var item in workingTo.value){
      item.onChange(checkWorkerForm);
    }
    for(var item in schoolName.value){
      item.onChange(checkStudentForm);
    }
    for(var item in courseOfStudy.value){
      item.onChange(checkStudentForm);
    }
    for(var item in studyingFrom.value){
      item.onChange(checkStudentForm);
    }
    for(var item in studyingTo.value){
      item.onChange(checkStudentForm);
    }

  }

  //Set of lists to hold non-student user's details
  final jobTitle = StreamedList<StreamedValue<String>>(initialData: []);
  final empType = StreamedList<StreamedValue<String>>(initialData: []);
  final compName = StreamedList<StreamedValue<String>>(initialData: []);
  final workingFrom = StreamedList<StreamedValue<String>>(initialData: []);
  final workingTo = StreamedList<StreamedValue<String>>(initialData: []);

  //Set of lists to hold student details
  final schoolName = StreamedList<StreamedValue<String>>(initialData: []);
  final courseOfStudy = StreamedList<StreamedValue<String>>(initialData: []);
  final studyingFrom = StreamedList<StreamedValue<String>>(initialData: []);
  final studyingTo = StreamedList<StreamedValue<String>>(initialData: []);

  //Flags to check if the form is valid
  final isWorkerFormValid = StreamedValue<bool>();
  final isStudentFormValid = StreamedValue<bool>();

  //Variables to hold values after step1
  bool isStudent;
  bool isStuFreelance;
  bool isIntern;
  bool isJob;
  bool isNetwork;
  bool isPro;
  bool isInvest;
  bool isOther;
  String location;
  String description;

  void newWorkerFields() {

    //Add fields for non-students
    jobTitle.addElement(StreamedValue<String>());
    empType.addElement(StreamedValue<String>());
    compName.addElement(StreamedValue<String>());
    workingFrom.addElement(StreamedValue<String>());
    workingTo.addElement(StreamedValue<String>());

    jobTitle.value.last.onChange(checkWorkerForm);
    empType.value.last.onChange(checkWorkerForm);
    compName.value.last.onChange(checkWorkerForm);
    workingFrom.value.last.onChange(checkWorkerForm);
    workingTo.value.last.onChange(checkWorkerForm);

    // This is used to force the checking of the form so that, adding
    // the new fields, it can reveal them as empty and sets the form
    // to not valid.
    checkWorkerForm(null);
  }

  void newStudentFields(){
    //Add fields for students
    schoolName.addElement(StreamedValue<String>());
    courseOfStudy.addElement(StreamedValue<String>());
    studyingFrom.addElement(StreamedValue<String>());
    studyingTo.addElement(StreamedValue<String>());

    schoolName.value.last.onChange(checkStudentForm);
    courseOfStudy.value.last.onChange(checkStudentForm);
    studyingFrom.value.last.onChange(checkStudentForm);
    studyingTo.value.last.onChange(checkStudentForm);

    // This is used to force the checking of the form so that, adding
    // the new fields, it can reveal them as empty and sets the form
    // to not valid.
    checkStudentForm(null);
}

  void checkWorkerForm(String _){

    //Validation flags for non-student form
    bool isJobTitleValid = true;
    bool isEmpTypeValid = true;
    bool isCompNameValid = true;
    bool isWorkingFromValid = true;
    bool isWorkingToValid = true;

    //Validation checks for non-student form
    for(var item in jobTitle.value){
      if(item.value != null) {
        if (item.value.isEmpty) {
          item.stream.sink.addError('Enter job title');
          isJobTitleValid = false;
        }
      }
      else{
        isJobTitleValid = false;
      }
    }

    for(var item in empType.value){
      if(item.value != null) {
        if (item.value.isEmpty) {
          item.stream.sink.addError('Choose employment type');
          isEmpTypeValid = false;
        }
      }
      else{
        isEmpTypeValid = false;
      }
    }

    for(var item in compName.value){
      if(item.value != null) {
        if (item.value.isEmpty) {
          item.stream.sink.addError('Enter Company Name');
          isCompNameValid = false;
        }
      }
      else{
        isCompNameValid = false;
      }
    }

    for(var item in workingFrom.value){
      if(item.value != null) {
        if (item.value.isEmpty) {
          item.stream.sink.addError('Choose from date');
          isWorkingFromValid = false;
        }
      }
      else{
        isWorkingFromValid = false;
      }
    }

    for(var item in workingTo.value){
      if(item.value != null) {
        if (item.value.isEmpty) {
          item.stream.sink.addError('Choose to date');
          isWorkingToValid = false;
        }
      }
      else{
        isWorkingToValid = false;
      }
    }

    if(isJobTitleValid && isEmpTypeValid && isCompNameValid && isWorkingFromValid && isWorkingToValid){
      isWorkerFormValid.value = true;
    }
    else{
      isWorkerFormValid.value = null;
    }

  }

  void checkStudentForm(String _){

    //Validation flags for student form
    bool isSchoolNameValid = true;
    bool isCourseOfStudyValid = true;
    bool isStudyingFromValid = true;
    bool isStudyingToValid = true;

    //Validation checks for student form
    for(var item in schoolName.value){
      if(item.value != null) {
        if (item.value.isEmpty) {
          item.stream.sink.addError('Enter school name');
          isSchoolNameValid = false;
        }
      }
      else{
        isSchoolNameValid = false;
      }
    }

    for(var item in courseOfStudy.value){
      if(item.value != null) {
        if (item.value.isEmpty) {
          item.stream.sink.addError('Enter course of study');
          isCourseOfStudyValid = false;
        }
      }
      else{
        isCourseOfStudyValid = false;
      }
    }

    for(var item in studyingFrom.value){
      if(item.value != null) {
        if (item.value.isEmpty) {
          item.stream.sink.addError('Select from date');
          isStudyingFromValid = false;
        }
      }
      else{
        isStudyingFromValid = false;
      }
    }

    for(var item in studyingTo.value){
      if(item.value != null) {
        if (item.value.isEmpty) {
          item.stream.sink.addError('Select to date');
          isStudyingToValid = false;
        }
      }
      else{
        isStudyingToValid = false;
      }
    }


    if(isSchoolNameValid && isCourseOfStudyValid && isStudyingFromValid && isStudyingToValid){
      isStudentFormValid.value = true;
    }
    else{
      isStudentFormValid.value = null;
    }


  }

  void submit() {
    for(int i =0; i<jobTitle.length;i++){
      print(jobTitle.value[i].value);
      print(empType.value[i].value);
      print(compName.value[i].value);
      print(workingFrom.value[i].value);
      print(workingTo.value[i].value);
      print(schoolName.value[i].value);
      print(courseOfStudy.value[i].value);
      print(studyingFrom.value[i].value);
      print(studyingTo.value[i].value);
    }
    print(isStudent);
    print(isStuFreelance);
    print(isIntern);
    print(isJob);
    print(isNetwork);
    print(isPro);
    print(isInvest);
    print(isOther);
    print(location);
    print(description);
  }

  void removeWorkerFields(int index) {
    jobTitle.removeAt(index);
    empType.removeAt(index);
    compName.removeAt(index);
    workingFrom.removeAt(index);
    workingTo.removeAt(index);

    checkWorkerForm(null);
  }

  void removeStudentFields(int index) {
    schoolName.removeAt(index);
    courseOfStudy.removeAt(index);
    studyingFrom.removeAt(index);
    studyingTo.removeAt(index);

    checkStudentForm(null);
  }

  void dispose() {
    print('-------DynamicFields BLOC DISPOSE--------');

    //Dispose non-student variables
    for (int i=0; i<jobTitle.length; i++) {
      jobTitle.value[i] = StreamedValue<String>();
      jobTitle.value[i].dispose();
    }
    jobTitle.dispose();

    for (int i=0; i<empType.length; i++) {
      empType.value[i] = StreamedValue<String>();
      empType.value[i].dispose();
    }
    empType.dispose();

    for (int i=0; i<compName.length; i++) {
      compName.value[i] = StreamedValue<String>();
      compName.value[i].dispose();
    }
    compName.dispose();

    for (int i=0; i<workingFrom.length; i++) {
      workingFrom.value[i] = StreamedValue<String>();
      workingFrom.value[i].dispose();
    }
    workingFrom.dispose();

    for (int i=0; i<workingTo.length; i++) {
      workingTo.value[i] = StreamedValue<String>();
      workingTo.value[i].dispose();
    }
    workingTo.dispose();

    isWorkerFormValid.dispose();

    //Dispose student variables
    for (int i=0; i<schoolName.length; i++) {
      schoolName.value[i] = StreamedValue<String>();
      schoolName.value[i].dispose();
    }
    schoolName.dispose();

    for (int i=0; i<courseOfStudy.length; i++) {
      courseOfStudy.value[i] = StreamedValue<String>();
      courseOfStudy.value[i].dispose();
    }
    courseOfStudy.dispose();

    for (int i=0; i<studyingFrom.length; i++) {
      studyingFrom.value[i] = StreamedValue<String>();
      studyingFrom.value[i].dispose();
    }
    studyingFrom.dispose();

    for (int i=0; i<studyingTo.length; i++) {
      studyingTo.value[i] = StreamedValue<String>();
      studyingTo.value[i].dispose();
    }
    studyingTo.dispose();

    isStudentFormValid.dispose();
  }

}

final bloc = UserFieldsBloc();