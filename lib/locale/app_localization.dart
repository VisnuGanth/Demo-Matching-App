import 'package:demo_matching_apps/l10n/messages_all.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


//class used to implement localization
class AppLocalization {
  //loads up strings based on locale of the app
  static Future<AppLocalization> load(Locale locale) {
    //get locale name
    final String name = locale.countryCode.isEmpty
        ? locale.languageCode
        : locale.toString();
    //format locale
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return AppLocalization();
    });
  }

  //Allows us to access applocalizations content from anywhere within app
  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  // Content to be translated

  //ind_profile_1.dart
  String step(step_num) {
    return Intl.message(
      "Step $step_num",
      name: 'step',
      args: [step_num],
    );
  }

  String get phrase1 {
    return Intl.message(
      "What do you do?",
      name: 'phrase1',
    );
  }

  String get phrase2 {
    return Intl.message(
      "I'm a student  No",
      name: 'phrase2',
    );
  }

  String get yes {
    return Intl.message(
      "Yes",
      name: 'yes',
    );
  }

  String get jobTitle {
    return Intl.message(
      "Recent Job Title",
      name: 'jobTitle',
    );
  }

  String get empType {
    return Intl.message(
      "Employment Type",
      name: 'empType',
    );
  }

  String get fullTime {
    return Intl.message(
      "Full-time",
      name: 'fullTime',
    );
  }

  String get partTime {
    return Intl.message(
      "Part-time",
      name: 'partTime',
    );
  }

  String get selfEmp {
    return Intl.message(
      "Self-employed",
      name: 'selfEmp',
    );
  }

  String get intern {
    return Intl.message(
      "Internship",
      name: 'intern',
    );
  }

  String get contract {
    return Intl.message(
      "Contract",
      name: 'contract',
    );
  }

  String get freelance {
    return Intl.message(
      "Freelance",
      name: 'freelance',
    );
  }

  String get compName {
    return Intl.message(
      "Company Name",
      name: 'compName',
    );
  }

  String get period {
    return Intl.message(
      "Period",
      name: 'period',
    );
  }

  String get working {
    return Intl.message(
      "Still working?",
      name: 'working',
    );
  }

  String get studying {
    return Intl.message(
      "Still studying?",
      name: 'studying',
    );
  }

  String get from {
    return Intl.message(
      "From",
      name: 'from',
    );
  }

  String get to {
    return Intl.message(
      "To",
      name: 'to',
    );
  }

  String get next_btn {
    return Intl.message(
      "NEXT",
      name: 'next_btn',
    );
  }

  String get skip_btn {
    return Intl.message(
      "Skip",
      name: 'skip_btn',
    );
  }

  String get schoolName {
    return Intl.message(
      "Name of School",
      name: 'schoolName',
    );
  }

  String get course {
    return Intl.message(
      "Course of Study",
      name: 'course',
    );
  }

  String get studyPeriod {
    return Intl.message(
      "Period of Study:",
      name: 'studyPeriod',
    );
  }

  //ind_profile_2.dart

  String get interests {
    return Intl.message(
      "Fields of Interest",
      name: 'interests',
    );
  }

  String get phrase3 {
    return Intl.message(
      "Tell us what fields you would like to work in",
      name: 'phrase3',
    );
  }

  String get job {
    return Intl.message(
      "Job",
      name: 'job',
    );
  }

  String get network {
    return Intl.message(
      "Network",
      name: 'network',
    );
  }

  String get back_btn {
    return Intl.message(
      "Back",
      name: 'back_btn',
    );
  }

  //ind_profile_3.dart

  String get location {
    return Intl.message(
      "Location",
      name: 'location',
    );
  }

  String get phrase4 {
    return Intl.message(
      "Narrow down your search",
      name: 'phrase4',
    );
  }

  String get locField {
    return Intl.message(
      "Region/Country Name",
      name: 'locField',
    );
  }

  //ind_profile_4.dart

  String get phrase5 {
    return Intl.message(
      "About You",
      name: 'phrase5',
    );
  }

  String get descField {
    return Intl.message(
      "Write a short description",
      name: 'descField',
    );
  }

  String get start_btn {
    return Intl.message(
      "Start!",
      name: 'start_btn',
    );
  }

  //Login_Registration.dart

  String get login {
    return Intl.message(
      "Login",
      name: 'login',
    );
  }

  String get registration {
    return Intl.message(
      "Registration",
      name: 'registration',
    );
  }

  String get email {
    return Intl.message(
      "Email",
      name: 'email',
    );
  }

  String get password {
    return Intl.message(
      "Password",
      name: 'password',
    );
  }

  String get remember {
    return Intl.message(
      "Remember Me",
      name: 'remember',
    );
  }

  String get forgot {
    return Intl.message(
      "Forgot Password",
      name: 'forgot',
    );
  }

  String get emailMsg {
    return Intl.message(
      "Enter your registered email",
      name: 'emailMsg',
    );
  }

  String get verifyMsg {
    return Intl.message(
      "Link to verify account has been sent to your email.",
      name: 'verifyMsg',
    );
  }

  String get ind_btn {
    return Intl.message(
      "Individual",
      name: 'ind_btn',
    );
  }

  String get corp_btn {
    return Intl.message(
      "Corporate",
      name: 'corp_btn',
    );
  }

  String get valFname {
    return Intl.message(
      "Enter First Name",
      name: 'valFname',
    );
  }

  String get valLname {
    return Intl.message(
      "Enter Last Name",
      name: 'valLname',
    );
  }

  String get valPass {
    return Intl.message(
      "Enter a password",
      name: 'valPass',
    );
  }

  //Forgot_Password.dart

  String get send_btn {
    return Intl.message(
      "Send",
      name: 'send_btn',
    );
  }

  String get emailSent {
    return Intl.message(
      "Email Sent",
      name: 'emailSent',
    );
  }

  String get backToLogin_btn {
    return Intl.message(
      "Back to Login",
      name: 'backToLogin_btn',
    );
  }

  //registration.dart
  String get fname {
    return Intl.message(
      "First Name",
      name: 'fname',
    );
  }

  String get lname {
    return Intl.message(
      "Last Name",
      name: 'lname',
    );
  }

  String get confPass {
    return Intl.message(
      "Confirm Password",
      name: 'confPass',
    );
  }

  String get userType {
    return Intl.message(
      "Choose user type",
      name: 'userType',
    );
  }

  String get tandc {
    return Intl.message(
      "Accept Terms & Conditions",
      name: 'tandc',
    );
  }

  String get reg_btn {
    return Intl.message(
      "Register",
      name: 'reg_btn',
    );
  }

  //cop_reg_step_one.dart
  String get phrase6 {
    return Intl.message(
      "Company Profile",
      name: 'phrase6',
    );
  }

  String get mnc {
    return Intl.message(
      "MNC",
      name: 'mnc',
    );
  }

  String get startup {
    return Intl.message(
      "Startup",
      name: 'startup',
    );
  }

  String get designation {
    return Intl.message(
      "Designation",
      name: 'designation',
    );
  }

  String get compEmail {
    return Intl.message(
      "Company Email",
      name: 'compEmail',
    );
  }

  String get contact {
    return Intl.message(
      "Contact Number",
      name: 'contact',
    );
  }

  String get cancel_btn {
    return Intl.message(
      "Cancel",
      name: 'cancel_btn',
    );
  }

  String get valCompName {
    return Intl.message(
      "Enter your company name",
      name: 'valCompName',
    );
  }

  String get valEmail {
    return Intl.message(
      "Enter an email",
      name: 'valEmail',
    );
  }

  String get valCountryName {
    return Intl.message(
      "Enter your country name",
      name: 'valCountryName',
    );
  }


  //cop_reg_step_two.dart

  String get phrase7 {
    return Intl.message(
      "About your company",
      name: 'phrase7',
    );
  }

  //ind_profile_view.dart

  String get profile_name {
    return Intl.message(
      "Hiro Ishida",
      name: 'profile_name',
    );
  }

  String get bookmark_btn {
    return Intl.message(
      "Bookmark",
      name: 'bookmark_btn',
    );
  }

  String get apply_btn {
    return Intl.message(
      "Apply",
      name: 'apply_btn',
    );
  }

  String get recommend_btn {
    return Intl.message(
      "Recommend",
      name: 'recommend_btn',
    );
  }

  String get follow_btn {
    return Intl.message(
      "Follow",
      name: 'follow_btn',
    );
  }

  String get help_btn {
    return Intl.message(
      "Help",
      name: 'help_btn',
    );
  }

  String get settings_btn {
    return Intl.message(
      "Settings",
      name: 'settings_btn',
    );
  }

  //ind_profile_view1.dart

  String get profile {
    return Intl.message(
      "Profile",
      name: 'profile',
    );
  }

  String get ceo {
    return Intl.message(
      "CEO",
      name: 'ceo',
    );
  }

  String get mosaique {
    return Intl.message(
      "Mosaique",
      name: 'mosaique',
    );
  }

  String get loc {
    return Intl.message(
      "Bangalore, India",
      name: 'loc',
    );
  }

  String get selfIntro {
    return Intl.message(
      "Self Introduction",
      name: 'selfIntro',
    );
  }

  String get workExp {
    return Intl.message(
      "Work Experience",
      name: 'workExp',
    );
  }

  String get edu {
    return Intl.message(
      "Education",
      name: 'edu',
    );
  }

  String get skill {
    return Intl.message(
      "Skill",
      name: 'skill',
    );
  }

  String get resume {
    return Intl.message(
      "Resume",
      name: 'resume',
    );
  }

  String get upload {
    return Intl.message(
      "Upload a File",
      name: 'upload',
    );
  }

  String get browse_btn {
    return Intl.message(
      "Browse..",
      name: 'browse_btn',
    );
  }

  String get noFile {
    return Intl.message(
      "No file selected",
      name: 'noFile',
    );
  }

  String get upload_btn {
    return Intl.message(
      "Upload File",
      name: 'upload_btn',
    );
  }

  String get projects {
    return Intl.message(
      "Projects",
      name: 'projects',
    );
  }

  String get accomp {
    return Intl.message(
      "Accomplishments",
      name: 'accomp',
    );
  }

  String get lang {
    return Intl.message(
      "Language",
      name: 'lang',
    );
  }

  String get qual {
    return Intl.message(
      "Qualifications",
      name: 'qual',
    );
  }

  String get other {
    return Intl.message(
      "Other",
      name: 'other',
    );
  }

  String get following {
    return Intl.message(
      "Following",
      name: 'following',
    );
  }

  //view_company_profile.dart

  String get compProfName {
    return Intl.message(
      "Kamal",
      name: 'compProfName',
    );
  }

  String get director {
    return Intl.message(
      "Director",
      name: 'director',
    );
  }

  String get about {
    return Intl.message(
      "About",
      name: 'about',
    );
  }

  String get compDet {
    return Intl.message(
      "Company Details",
      name: 'compDet',
    );
  }

  String get industry {
    return Intl.message(
      "Industry",
      name: 'industry',
    );
  }

  //Ind_Drawer.dart

  String get terms_conditions {
    return Intl.message(
      "Terms & Conditions",
      name: 'terms_conditions',
    );
  }

  String get logout {
    return Intl.message(
      "Logout",
      name: 'logout',
    );
  }

  String get logoutWarn{
    return Intl.message(
      "Do you want to Logout?",
      name: 'logoutWarn',
    );
  }

  String get no_btn {
    return Intl.message(
      "No",
      name: 'no_btn',
    );
  }

  //Ind_bottomNavBar.dart

  String get home {
    return Intl.message(
      "Home",
      name: 'home',
    );
  }

  String get feed {
    return Intl.message(
      "Feed",
      name: 'feed',
    );
  }

  String get notif {
    return Intl.message(
      "Notification",
      name: 'notif',
    );
  }

  //Ind_HomePageInfo.dart

  String get work{
    return Intl.message(
      ".work",
      name: 'work',
    );
  }

  String get search{
    return Intl.message(
      "Search",
      name: 'search',
    );
  }

  String get webEng{
    return Intl.message(
      "Web Engineer",
      name: 'webEng',
    );
  }

  String get mssg{
    return Intl.message(
      "Looking for Java Developer",
      name: 'mssg',
    );
  }

  //Ind_HomePage_Post_Detail.dart

  String get jobs{
    return Intl.message(
      "Jobs",
      name: 'jobs',
    );
  }


  //Ind_Feed_Details.dart

  String get php{
    return Intl.message(
      "About PHP",
      name: 'php',
    );
  }

  //Search_Filter.dart

  String get sort{
    return Intl.message(
      "Sort",
      name: 'sort',
    );
  }

  String get area{
    return Intl.message(
      "Area",
      name: 'area',
    );
  }

  String get india{
    return Intl.message(
      "India",
      name: 'india',
    );
  }

  String get japan{
    return Intl.message(
      "Japan",
      name: 'japan',
    );
  }

  String get lookFor{
    return Intl.message(
      "Looking For",
      name: 'lookFor',
    );
  }

  String get sortIntern{
    return Intl.message(
      "Intern",
      name: 'sortIntern',
    );
  }

  String get sortProject{
    return Intl.message(
      "Project",
      name: 'sortProject',
    );
  }


  String get invest{
    return Intl.message(
      "Investment",
      name: 'invest',
    );
  }

  String get fee{
    return Intl.message(
      "Fee",
      name: 'fee',
    );
  }

  String get gtSymbol{
    return Intl.message(
      "> L",
      name: 'gtSymbol',
    );
  }

  String get pos{
    return Intl.message(
      "Position",
      name: 'pos',
    );
  }

  String get keyword{
    return Intl.message(
      "Keyword",
      name: 'keyword',
    );
  }

  //post_openings.dart

  String get postOp{
    return Intl.message(
      "Post Openings",
      name: 'postOp',
    );
  }

  String get jobCat{
    return Intl.message(
      "Job Category",
      name: 'jobCat',
    );
  }

  String get softEng{
    return Intl.message(
      "Software Engineer",
      name: 'softEng',
    );
  }

  String get mechEng{
    return Intl.message(
      "Mechanical Engineer",
      name: 'mechEng',
    );
  }

  String get eleEng{
    return Intl.message(
      "Electrical Engineer",
      name: 'eleEng',
    );
  }

  String get hr{
    return Intl.message(
      "Human Resources",
      name: 'hr',
    );
  }

  String get postJobTitle{
    return Intl.message(
      "Job Title",
      name: 'postJobTitle',
    );
  }

  String get yearExp{
    return Intl.message(
      "Years of Experience",
      name: 'yearExp',
    );
  }

  String get salary{
    return Intl.message(
      "Salary",
      name: 'salary',
    );
  }

  String get jobDesc{
    return Intl.message(
      "Job Description",
      name: 'jobDesc',
    );
  }

  String get post_btn{
    return Intl.message(
      "Post",
      name: 'post_btn',
    );
  }

  //cop_notifications.dart

  String get tag{
    return Intl.message(
      "Applied",
      name: 'tag',
    );
  }

  //messages.dart

  String get msg{
    return Intl.message(
      "Messages",
      name: 'msg',
    );
  }

  //cop_drawer.dart

  String get postedJobs{
    return Intl.message(
      "Posted Jobs",
      name: 'postedJobs',
    );
  }

  //posted_jobs.dart

  String get edit_btn{
    return Intl.message(
      "Edit",
      name: 'edit_btn',
    );
  }

  //cop_home_page.dart

  String get loading{
    return Intl.message(
      "Loading..",
      name: 'loading',
    );
  }

  //homePageContent_model.dart

  String copExp(num) {
    return Intl.message(
      "$num years experience",
      name: 'copExp',
      args: [num],
    );
  }

  String get copName1{
    return Intl.message(
      "Ramalingam",
      name: 'copName1',
    );
  }

  String get copName2{
    return Intl.message(
      "Symphony",
      name: 'copName2',
    );
  }

  String get copName3{
    return Intl.message(
      "Candice",
      name: 'copName3',
    );
  }

  String get copDesig1{
    return Intl.message(
      "System Engineer, L&T",
      name: 'copDesig1',
    );
  }

  String get copDesig2{
    return Intl.message(
      "Testing, Jarvis",
      name: 'copDesig2',
    );
  }

  String get copDesig3{
    return Intl.message(
      "HR, TVS Inc",
      name: 'copDesig3',
    );
  }


  //welcome.dart

  String get welcome{
    return Intl.message(
      "Welcome!",
      name: 'welcome',
    );
  }

  String get user{
    return Intl.message(
      "User",
      name: 'user',
    );
  }

  String get createMsg{
    return Intl.message(
      "Create your profile",
      name: 'createMsg',
    );
  }

  //ind_settings.dart & cop_settings.dart

  String get setLang{
    return Intl.message(
      "Select Language:",
      name: 'setLang',
    );
  }

  String get english{
    return Intl.message(
      "English",
      name: 'english',
    );
  }

  String get japanese{
    return Intl.message(
      "Japanese",
      name: 'japanese',
    );
  }

  //UI.dart

  String get together{
    return Intl.message(
      "together",
      name: 'together',
    );
  }

  //slidable_widget.dart

  String get archive{
    return Intl.message(
      "Archive",
      name: 'archive',
    );
  }

  //cop_candidate_profile.dart

  String get accept_btn{
    return Intl.message(
      "Accept",
      name: 'accept_btn',
    );
  }

  String get deny_btn{
    return Intl.message(
      "Deny",
      name: 'deny_btn',
    );
  }

  //Search_Filter.dart

  String get sortApply{
    return Intl.message(
      "Apply",
      name: 'sortApply',
    );
  }

  //cop_profile.dart

  String get photos{
    return Intl.message(
      "Photos",
      name: 'photos',
    );
  }

  String get website{
    return Intl.message(
      "Website",
      name: 'website',
    );
  }

  String get notifPref{
    return Intl.message(
      "Notification Preferences",
      name: 'notifPref',
    );
  }

  String get feedback{
    return Intl.message(
      "Feedback",
      name: 'feedback',
    );
  }

  String get followers{
    return Intl.message(
      "Followers",
      name: 'followers',
    );
  }

}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization>{
  final Locale overriddenLocale;

  const AppLocalizationDelegate(this.overriddenLocale);

  //Check if locale is a supported language code
  @override
  bool isSupported(Locale locale) => ['en', 'ja'].contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) => AppLocalization.load(locale);

  //whether or not app should reload everything
  @override
  bool shouldReload(LocalizationsDelegate<AppLocalization> old) => true;
}

/* Command to generate int_messages.arb:
* flutter pub run intl_translation:extract_to_arb --output-dir=lib/l10n lib/locale/app_localization.dart*/

/*Command to generate .dart files to manage the resource files:
* flutter pub run intl_translation:generate_from_arb --output-dir=lib/l10n --no-use-deferred-loading lib/l10n/intl_messages.arb lib/l10n/intl_ja.arb lib/l10n/intl_en.arb lib/locale/app_localization.dart*/