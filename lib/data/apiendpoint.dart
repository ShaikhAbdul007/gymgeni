class ApiEndPoint {
  static final String urls = 'https://gymgennie.dynsimulation.com/';
  static final String servicePath = 'api/v1/gymmate/';
  static final String fullBaseUrl = "$urls$servicePath";

  // Headers
  static final String contentType = "application/x-www-form-urlencoded";
  static final String authorization = "Authorization";
  static final String acceptLanguage = "Accept-Language";
  static final String accept = 'application/json';

  // Timeout
  static final int connectTimerOutsMs = 15000;
  static final int receiveTimerOutsMs = 15000;
  static final int sendTimerOutsMs = 15000;

  // ---------------- AUTH ----------------
  static final String loginEndPoint = "login";
  static final String registerEndPoint = "register";

  // ---------------- TRAINING MODE ----------------
  static final String createTrainingModeEndPoint = "training-modes";
  static final String getTrainingMode = "training-modes";
  static final String updateTrainingMode = "training-modes/";
  static final String deleteTrainingMode = "training-modes/";

  // ---------------- TRAINING TYPE ----------------
  static final String createTrainingType = "training-types";
  static final String getTrainingType = "training-types";
  static final String updateTrainingType = "training-types/";
  static final String deleteTrainingType = "training-types/";

  // ---------------- PLAN ----------------
  static final String createPlan = "plans";
  static final String getPlan = "plans";
  static final String updatePlan = "plans/";
  static final String deletePlan = "plans/";

  // ---------------- GROUP ----------------
  static final String createGroup = "groups";
  static final String getGroup = "groups";
  static final String updateGroup = "groups/";
  static final String deleteGroup = "groups/";

  // ---------------- GOAL ----------------
  static final String createGoal = "goals";
  static final String getGoal = "goals";
  static final String updateGoal = "goals/";
  static final String deleteGoal = "goals/";

  // ---------------- SOURCE ----------------
  static final String createSource = "sources";
  static final String getSource = "sources";
  static final String updateSource = "sources/";
  static final String deleteSource = "sources/";

  // ---------------- LEAD CATEGORY ----------------
  static final String createLeadCategory = "lead-categories";
  static final String getLeadCategory = "lead-categories";
  static final String updateLeadCategory = "lead-categories/";
  static final String deleteLeadCategory = "lead-categories/";

  // ---------------- LEAD FOLLOW TYPE ----------------
  static final String createLeadFollowType = "lead-follow-types";
  static final String getLeadFollowType = "lead-follow-types";
  static final String updateLeadFollowType = "lead-follow-types/";
  static final String deleteLeadFollowType = "lead-follow-types/";

  // ---------------- LEAD SOURCE ----------------
  static final String createLeadSource = "lead-sources";
  static final String getLeadSource = "lead-sources";
  static final String updateLeadSource = "lead-sources/";
  static final String deleteLeadSource = "lead-sources/";

  // ---------------- LEAD STATUS ----------------
  static final String createLeadStatus = "lead-statuses";
  static final String getLeadStatus = "lead-statuses";
  static final String updateLeadStatus = "lead-statuses/";
  static final String deleteLeadStatus = "lead-statuses/";

  // ---------------- ADD LEADS ----------------
  static final String createLead = "all-leads"; // POST (multipart)
  static final String getLeads = "all-leads"; // GET

  // ---------------- MEMBER ----------------
  static final String createMember = "members";
  static final String getMembers =
      "members?status="; // ?status=active tum manually append kar sakte ho
  static final String updateMember = "members/";
  static final String deleteMember = "members/";

  // image fetch
  static final String getUserImage = "getuserimage/";

  //UserData
  static final String userData = "user/";

  // Member actions
  static final String transferMember = "transfermember";
  static final String freezeMember = "members/freeze";
  static final String unFreezeMember = "members/unfreeze?member_id=";

  // ---------------- MEMBER ATTENDANCE ----------------
  static final String memberAttendanceCheckIn = "member-attendance/check-in";
  static final String memberAttendanceCheckOut = "member-attendance/check-out";
  static final String memberAttendance = "member-attendance";

  // ---------------- EMPLOYEE TYPE MASTER ----------------
  static final String createEmployeeType = "employee-types";
  static final String getEmployeeType = "employee-types";
  static final String updateEmployeeType = "employee-types/";
  static final String deleteEmployeeType = "employee-types/";

  // ---------------- EMPLOYEE ----------------
  static final String createEmployee = "employees";
  static final String getEmployee = "employees";
  static final String updateEmployee = "employees/";
  static final String deleteEmployee = "employees/";

  // ---------------- EMPLOYEE ATTENDANCE ----------------
  static final String employeeAttendanceCheckIn =
      "employee-attendance/check-in";
  static final String employeeAttendanceCheckOut =
      "employee-attendance/check-out";
  static final String employeeAttendance = "employee-attendance";

  // ---------------- SALES ----------------
  static final String getTodaySales = "sales/today?date=";

  // ---------------- PAYMENT ----------------
  static final String getAllPayments = "payments";
  static final String getPendingPayments = "payments/pending";

  // payment modes
  static final String getPaymentModes = "payment-modes";
  static final String createPaymentModes = "payment-modes";
  static final String updatePaymentModes = "payment-modes";
  static final String deletePaymentModes = "payment-modes";

  // payment status (failed / pending)
  static final String paymentStatus = "payments/pending";

  //Dashboard
  static final String dashboardStats = 'dashboard/stats';

  //PIE DIAGRA
  static final String pieDaigram = 'dashboard/plan-stats';

  //Recent Activities
  static final String recentActivities = 'dashboard/recent-activity';

  //Upcomming Sessions

  static final String expiryMembersData = 'dashboard/upcomming-sessions';

  //Create BRM
  static final String createBmr = 'bmr';
  static final String updateBmr = 'bmr';
  static final String deleteBmr = 'bmr';
  static final String getBmr = 'bmr';
}
