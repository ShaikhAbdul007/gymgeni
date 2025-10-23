class ApiEndPoint {
  static final String urls = 'https://gymgennie.dynsimulation.com/';
  static final String servicePath = 'api/v1/gymmate/';
  static final String fullBaseUrl = "$urls$servicePath";

  //Headers
  static final String contentType = "application/json; charset=UTF-8";
  static final String authorization = "Authorization";
  static final String acceptLanguage = "Accept-Language";
  static final String accept = 'application/json';

  //Timeout

  static final int connectTimerOutsMs = 15000;
  static final int receiveTimerOutsMs = 15000;
  static final int sendTimerOutsMs = 15000;
  // Auth
  static final String loginEndPoint = "loginuser";
  static final String registerEndPoint = "registeruser";

  // 🔹 Training Mode
  static final String createTrainingModeEndPoint = "createtrainingmode";
  static final String getTrainingMode = "gettrainingmode";
  static final String updateTrainingMode = "updatetrainingmode";
  static final String deleteTrainingMode = "deletetrainingmode";

  // 🔹 Training Type
  static final String createTrainingType = "createtrainingtype";
  static final String getTrainingType = "gettrainingtype";
  static final String updateTrainingType = "updatetrainingtype";
  static final String deleteTrainingType = "deletetrainingtype";

  // 🔹 Plan
  static final String createPlan = "createplan";
  static final String getPlan = "getplan";
  static final String updatePlan = "updateplan/";
  static final String deletePlan = "deleteplan/";

  // 🔹 Group
  static final String createGroup = "creategroup";
  static final String getGroup = "getgroup";
  static final String updateGroup = "updategroup/";
  static final String deleteGroup = "deletegroup/";

  // 🔹 Goal
  static final String createGoal = "creategoal";
  static final String getGoal = "getgoal";
  static final String updateGoal = "updategoal/";
  static final String deleteGoal = "deletegoal/";

  // 🔹 Source
  static final String createSource = "createsource";
  static final String getSource = "getsource";
  static final String updateSource = "updatesource";
  static final String deleteSource = "deletesource";

  // 🔹 Lead Category
  static final String createLeadCategory = "createleadcategory";
  static final String getLeadCategory = "getleadcategory";
  static final String updateLeadCategory = "updateleadcategory";
  static final String deleteLeadCategory = "deleteleadcategory";

  // 🔹 Lead Follow Type
  static final String createLeadFollowType = "createleadfollowtype";
  static final String getLeadFollowType = "getleadfollowtype";
  static final String updateLeadFollowType = "updateleadfollowtype";
  static final String deleteLeadFollowType = "deleteleadfollowtype";

  // 🔹 Lead Source
  static final String createLeadSource = "createleadsource";
  static final String getLeadSource = "getleadsource";
  static final String updateLeadSource = "updateleadsource";
  static final String deleteLeadSource = "deleteleadsource";

  // 🔹 Lead Status
  static final String createLeadStatus = "createleadstatus";
  static final String getLeadStatus = "getleadstatus";
  static final String updateLeadStatus = "updateleadstatus";
  static final String deleteLeadStatus = "deleteleadstatus";

  // 🔹 Member Management
  static final String createMember = "createmember";
  static final String transferMember = "transfermember";
  static final String freezeMember = "freezemember";
  static final String updateMember = "updatemember";
  static final String deleteMember = "deletemember";
  static final String getMembers = "getmembers?status=active";
  static final String getUserImage = "getuserimage/";
}
