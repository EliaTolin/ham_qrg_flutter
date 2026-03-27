// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get error => 'Error';

  @override
  String get error_message => 'An error occurred while loading';

  @override
  String get error_message_retry =>
      'An error occurred while loading. Please try again later';

  @override
  String get retry => 'Retry';

  @override
  String get back => 'Back';

  @override
  String get loading => 'Loading';

  @override
  String get details => 'Details';

  @override
  String pages_number(Object number) {
    return '$number pages to explore';
  }

  @override
  String get january => 'January';

  @override
  String get february => 'February';

  @override
  String get march => 'March';

  @override
  String get april => 'April';

  @override
  String get may => 'May';

  @override
  String get june => 'June';

  @override
  String get july => 'July';

  @override
  String get august => 'August';

  @override
  String get september => 'September';

  @override
  String get october => 'October';

  @override
  String get november => 'November';

  @override
  String get december => 'December';

  @override
  String get logout => 'Log out';

  @override
  String get profile => 'Profile';

  @override
  String get settings => 'Settings';

  @override
  String get contact_us => 'Contact us';

  @override
  String get error_opening_email => 'An error occurred while opening the email';

  @override
  String get register_now => 'Register now';

  @override
  String get tracking_permission_title => 'Support the App';

  @override
  String get tracking_permission_message =>
      'To improve your experience and show you more relevant content, help us keep the app free.\n\nTap Allow to support us.';

  @override
  String get tracking_permission_next => 'Next';

  @override
  String get skip => 'Skip';

  @override
  String get done => 'Done';

  @override
  String get next => 'Next';

  @override
  String get joinCommunityTitle => 'Join our Community!';

  @override
  String get joinCommunityDescription =>
      'Discover the benefits of joining the Telegram community:';

  @override
  String get benefitSupportMembers => 'Support from members';

  @override
  String get benefitSuggestFeatures => 'Suggest new features';

  @override
  String get benefitContactDevelopers => 'Contact with developers';

  @override
  String get benefitExclusivePreviews => 'Exclusive previews and betas';

  @override
  String get benefitActiveCommunity => 'Active community';

  @override
  String get joinNowButton => 'Join now!';

  @override
  String get alreadyMemberButton => 'I\'m already a member';

  @override
  String get laterButton => 'Later';

  @override
  String get errorOpenTelegram => 'Error opening Telegram';

  @override
  String get disclaimerTitle => 'Data source';

  @override
  String get disclaimerDescription =>
      'The repeater data in this app comes from IZ8WNH.\n\nFor additional information, to download CSV files for programming radios, or to consult data not available in this app, visit the official website.';

  @override
  String get disclaimerVisitSite => 'Visit iz8wnh.it';

  @override
  String get disclaimerUnderstood => 'Got it';

  @override
  String get errorOpenDisclaimerSite => 'Error opening the website';

  @override
  String get repeatersMapTitle => 'Repeater map';

  @override
  String get repeatersListTitle => 'Repeater list';

  @override
  String get repeatersMapLoading => 'Loading repeater map…';

  @override
  String get repeatersMapGenericError => 'Unable to load repeaters.';

  @override
  String get repeatersMapEmpty => 'No repeaters found near you.';

  @override
  String get repeatersSearchHint =>
      'Search by name, callsign or frequency MHz…';

  @override
  String get repeatersSearchEmpty => 'No repeaters found.';

  @override
  String get repeatersSortDistance => 'Distance';

  @override
  String get repeatersSortLikes => 'Likes';

  @override
  String get repeatersSortFrequency => 'Frequency';

  @override
  String repeatersNearbyCount(int count) {
    return '$count ripetitori vicini';
  }

  @override
  String repeatersResultsCount(int count) {
    return '$count risultati';
  }

  @override
  String get repeatersMapRetry => 'Retry';

  @override
  String get repeatersMapOpenSettings => 'Open settings';

  @override
  String get repeatersMapPermissionMessage =>
      'Allow location access to show repeaters near you.';

  @override
  String get repeatersMapPermissionPermanentlyDenied =>
      'Location permission permanently denied. Enable it from system settings.';

  @override
  String get repeatersMapLocationServicesDisabled =>
      'Enable location services to find nearby repeaters.';

  @override
  String repeatersMapFound(int count) {
    return '$count repeaters found';
  }

  @override
  String get repeaterMode => 'Mode';

  @override
  String get repeaterModeAnalog => 'Analog';

  @override
  String get repeaterModeC4fm => 'C4FM';

  @override
  String get repeaterModeDstar => 'D-STAR';

  @override
  String get repeaterModeDmr => 'DMR';

  @override
  String get repeaterModeAllmode => 'All modes';

  @override
  String get repeaterModeEcholink => 'Echolink';

  @override
  String get repeaterModeAllstar => 'AllStar';

  @override
  String get repeaterModeWinlink => 'Winlink';

  @override
  String get repeaterFrequency => 'Frequency';

  @override
  String get repeaterShift => 'Shift';

  @override
  String get repeaterCtcss => 'CTCSS';

  @override
  String get repeaterLocation => 'Location';

  @override
  String get repeaterDistance => 'Distance';

  @override
  String get repeaterViewFullDetails => 'View full details';

  @override
  String get repeatersMapReturnToLocation => 'Return to my location';

  @override
  String clusterRepeatersTitle(int count) {
    return '$count repeaters at this location';
  }

  @override
  String get profileUnlockFeatures => 'Unlock all features';

  @override
  String get profileUnlockFeaturesDescription =>
      'Register to use review, favorite saving, and access detailed statistics.';

  @override
  String get profileSignUpOrLogin => 'Sign up or Log in';

  @override
  String get profileErrorOpeningEmail => 'Error opening email';

  @override
  String get profileJoinTelegramCommunity => 'Join the Telegram community';

  @override
  String get profileWelcomeTitle => 'Welcome to HamQRG';

  @override
  String get profileWelcomeDescription =>
      'Join our community of ham radio operators in Italy.';

  @override
  String get profileEditProfile => 'Edit Profile';

  @override
  String get profileChangePhoto => 'Change Photo';

  @override
  String get profileFirstName => 'First Name';

  @override
  String get profileLastName => 'Last Name';

  @override
  String get profileCallsign => 'Callsign';

  @override
  String get profileRestartIdentificationTitle =>
      'Need to change your status? You can restart the identification process to switch from Licensed Operator to SWL Listener.';

  @override
  String get profileRestartIdentificationButton =>
      'Restart Identification Process';

  @override
  String get profileSaveChanges => 'Save Changes';

  @override
  String get profileDangerZone => 'Danger Zone';

  @override
  String get profileDeleteAccount => 'Delete Account';

  @override
  String get profileDeleteAccountConfirmTitle => 'Delete Account';

  @override
  String get profileDeleteAccountConfirmMessage =>
      'Are you sure you want to delete your account? This action is irreversible.';

  @override
  String get profileDeleteAccountCancel => 'Cancel';

  @override
  String get profileDeleteAccountConfirm => 'Delete';

  @override
  String profileAppVersion(String version, String buildNumber) {
    return 'App Version $version (Build $buildNumber)';
  }

  @override
  String get profileSectionCommunity => 'Community & Support';

  @override
  String get profileSectionSupport => 'Support';

  @override
  String profileVersion(String version, String buildNumber) {
    return 'Version: $version+$buildNumber';
  }

  @override
  String profileVersionFormat(String version, String buildNumber) {
    return 'Version $version (Build $buildNumber)';
  }

  @override
  String profileError(String error) {
    return 'Error: $error';
  }

  @override
  String get authJoinTitle => 'Join HamQRG';

  @override
  String get authUnlockFeatures => 'Sign in to unlock all features!';

  @override
  String get authWhatYouGet => 'What you\'ll get:';

  @override
  String get authBenefitStatsTitle => 'Detailed statistics';

  @override
  String get authBenefitStatsDescription => 'Monitor your progress and improve';

  @override
  String get authBenefitQuizTitle => 'Various quiz modes';

  @override
  String get authBenefitQuizDescription =>
      'Practice in marathon, topic-based and other modes.';

  @override
  String get authBenefitSyncTitle => 'Synchronization';

  @override
  String get authBenefitSyncDescription => 'Access from any device';

  @override
  String get authOrSignInWithEmail => 'Or sign in with email';

  @override
  String get authEnterEmail => 'Enter email';

  @override
  String get authEnterPassword => 'Enter password';

  @override
  String get authForgotPassword => 'Forgot password?';

  @override
  String get authSignIn => 'Sign in';

  @override
  String get authSignUp => 'Sign up';

  @override
  String get authPasswordLengthError => 'Password must be longer';

  @override
  String get authDontHaveAccount => 'Don\'t have an account? Sign up';

  @override
  String get authHaveAccount => 'Already have an account? Sign in';

  @override
  String get authBackToSignIn => 'Back to sign in';

  @override
  String get authUnexpectedError => 'Authentication error: ';

  @override
  String get authValidEmailError => 'Enter a valid email';

  @override
  String get authSendPasswordReset => 'Send password reset';

  @override
  String get authPasswordResetSent => 'Password reset sent';

  @override
  String get authVerifyEmailMessage =>
      'Verify your email to complete registration, check your inbox.';

  @override
  String get authInvalidCredentials => 'Invalid email or password';

  @override
  String get authEmailNotConfirmed => 'Verify your email to sign in';

  @override
  String get authFirstName => 'First Name';

  @override
  String get authFirstNameRequired => 'First name is required';

  @override
  String get authLastName => 'Last Name';

  @override
  String get authLastNameRequired => 'Last name is required';

  @override
  String get authContinueAsGuest => 'Continue as guest';

  @override
  String get commonAppNamePart1 => 'Ham';

  @override
  String get commonAppNamePart2 => 'QRG';

  @override
  String get commonAppTagline => 'Discover the repeaters around you';

  @override
  String get commonPoweredBy => 'POWERED BY IU4VRB';

  @override
  String get homeQuickAccess => 'Quick access';

  @override
  String get homeRepeaterList => 'Repeater list';

  @override
  String get homeMyFavorites => 'My favorites';

  @override
  String get homeNearby => 'Near you';

  @override
  String get homeViewAll => 'View all';

  @override
  String get dashboardTabRepeaters => 'Ripetitori';

  @override
  String get dashboardTabPota => 'POTA';

  @override
  String get dashboardNearbyEmpty => 'Nessun ripetitore nelle vicinanze';

  @override
  String get dashboardViewAllRepeaters => 'Vedi tutti i ripetitori';

  @override
  String get dashboardViewAllPotaSpots => 'Vedi tutti gli spot POTA';

  @override
  String homeStations(int count) {
    return '$count stations';
  }

  @override
  String homeSaved(int count) {
    return '$count saved';
  }

  @override
  String get homeActive => 'Active';

  @override
  String get homeIdle => 'Idle';

  @override
  String get homeNavHome => 'Home';

  @override
  String get homeNavList => 'List';

  @override
  String get homeNavFavorites => 'Favorites';

  @override
  String get homeNavMap => 'Map';

  @override
  String get homeNavProfile => 'Profile';

  @override
  String get favoritesTitle => 'My favorites';

  @override
  String get favoritesSearchHint => 'Search saved repeaters...';

  @override
  String get favoritesFilterAllSaved => 'All saved';

  @override
  String get favoritesEmpty => 'No saved repeaters';

  @override
  String get favoritesEmptyDescription =>
      'Add repeaters to favorites to see them here';

  @override
  String favoritesShowing(int showing, int total) {
    return 'Showing $showing of $total favorite stations';
  }

  @override
  String get favoritesRemove => 'Remove from favorites';

  @override
  String get favoritesAdd => 'Add to favorites';

  @override
  String get repeaterDetailSave => 'Save';

  @override
  String get repeaterDetailShare => 'Share';

  @override
  String get repeaterDetailReport => 'Report';

  @override
  String get repeaterDetailTotalLikes => 'Total likes';

  @override
  String get repeaterDetailReports1Yr => 'Reports (1 year)';

  @override
  String get repeaterDetailHealthScore => 'Health score';

  @override
  String get repeaterDetailExcellent => 'Excellent';

  @override
  String get repeaterDetailGood => 'Good';

  @override
  String get repeaterDetailFair => 'Fair';

  @override
  String get repeaterDetailToVerify => 'To verify';

  @override
  String repeaterDetailScoreCalculated(int count) {
    return 'Score calculated from $count negative reports in the last year';
  }

  @override
  String get repeaterDetailLastLike => 'Last like';

  @override
  String get repeaterDetailLastDownReport => 'Last negative report';

  @override
  String get repeaterDetailTechnicalData => 'Technical data';

  @override
  String get repeaterDetailFrequency => 'Frequency';

  @override
  String get repeaterDetailShift => 'Shift';

  @override
  String get repeaterDetailSubtone => 'Subtone (SQL)';

  @override
  String get repeaterDetailMode => 'Mode';

  @override
  String get repeaterDetailLocation => 'Location';

  @override
  String repeaterDetailAway(String distance) {
    return '$distance away';
  }

  @override
  String get repeaterDetailCommunityReports => 'Community reports';

  @override
  String get repeaterDetailUpdateStatusFeedback => 'Update status and feedback';

  @override
  String get repeaterDetailEquipment => 'Equipment';

  @override
  String get repeaterDetailEquipmentRequired => 'Equipment *';

  @override
  String get repeaterDetailAccessModes => 'Access modes';

  @override
  String get repeaterDetailNetwork => 'Network';

  @override
  String get repeaterDetailLocationField => 'Location';

  @override
  String get repeaterDetailLocationRequired => 'Location *';

  @override
  String get repeaterDetailComment => 'Comment';

  @override
  String get repeaterDetailCommentOptional => 'Comment (Optional)';

  @override
  String get repeaterDetailCommentPlaceholder =>
      'Signal quality, audio report or general comments...';

  @override
  String get repeaterDetailReportDown => 'Report issue';

  @override
  String get repeaterDetailCheckinLike => 'Check-in and like';

  @override
  String get repeaterDetailYourFeedback => 'Your feedback';

  @override
  String get repeaterDetailPostedJustNow => 'Posted just now';

  @override
  String get repeaterDetailDeleteEntry => 'Delete entry';

  @override
  String repeaterDetailViewAllReports(int count) {
    return 'View all $count reports';
  }

  @override
  String get repeaterDetailStationPortable => 'Portable';

  @override
  String get repeaterDetailStationMobile => 'Mobile';

  @override
  String get repeaterDetailStationFixed => 'Fixed';

  @override
  String get repeaterDetailLike => 'Like';

  @override
  String get repeaterDetailReportLabel => 'Report';

  @override
  String get repeaterDetailSaved => 'Saved';

  @override
  String get repeaterDetailShareMessage => 'Check out this repeater on HamQRG!';

  @override
  String get repeaterDetailReportDescription =>
      'The reporting feature will be available soon. You will be able to report incorrect information or issues with this repeater.';

  @override
  String get commonClose => 'Close';

  @override
  String get favorite => 'Favorite';

  @override
  String get accessConfiguration => 'Access configuration';

  @override
  String get noAccessConfiguration => 'No configuration available';

  @override
  String get repeaterDetailAddFeedback => 'Add feedback';

  @override
  String get repeaterDetailOthersReports => 'Other users\' reports';

  @override
  String get repeaterDetailRemove => 'Remove';

  @override
  String get repeaterDetailSelectAccess => 'Select access';

  @override
  String repeaterDetailDistanceWarning(int distance) {
    return 'You must be within $distance km of the repeater to send feedback.';
  }

  @override
  String get repeaterDetailInteractive => 'Interactive';

  @override
  String get repeaterDetailLogYourSignal => 'Log your signal';

  @override
  String get repeaterDetailUsedEquipment => 'Equipment used';

  @override
  String get repeaterDetailYourLocation => 'Your location';

  @override
  String get repeaterDetailLocationPlaceholder => 'Where were you? (e.g. Rome)';

  @override
  String get repeaterDetailLocationSelectHint =>
      'Select a place from suggestions';

  @override
  String get feedbackDistanceConfirmTitle => 'Confirm submission';

  @override
  String feedbackDistanceConfirmMessage(String distance) {
    return 'The selected location is $distance km from the repeater. Do you confirm you want to send this feedback under your responsibility?';
  }

  @override
  String get feedbackDistanceConfirmButton => 'Confirm';

  @override
  String get feedbackDistanceConfirmCancel => 'Cancel';

  @override
  String get repeaterDetailSelectAccessInstance => 'Select access instance';

  @override
  String get repeaterDetailSignalObservations => 'Signal observations';

  @override
  String get repeaterDetailSignalObservationsPlaceholder =>
      'How was the audio quality?';

  @override
  String get repeaterDetailSendLike => 'Send Like';

  @override
  String get repeaterDetailReportIssue => 'Report Issue';

  @override
  String get repeaterDetailRecentActivity => 'Recent activity';

  @override
  String get reportIssueTitle => 'Report';

  @override
  String get reportIssueHeadline => 'Help us keep the data accurate';

  @override
  String get reportIssueDescription =>
      'Did you find something wrong or missing in this repeater? Let us know what needs to be changed and we\'ll verify it.';

  @override
  String get reportIssueWhatToCorrect =>
      'What would you like to correct or add?';

  @override
  String get reportIssuePlaceholder =>
      'E.g. The CTCSS tone has changed to 88.5Hz, or the location is slightly further north, the manager is...';

  @override
  String get reportIssueVerifiedTitle => 'Verified Submissions';

  @override
  String get reportIssueVerifiedDescription =>
      'Your report will be reviewed by the regional coordinator before the public database is updated. Thank you for your contribution to the community.';

  @override
  String get reportIssueConfirmCheckbox =>
      'I confirm that this information is correct based on my observation.';

  @override
  String get reportIssueSubmit => 'Submit';

  @override
  String get reportIssueMinChars => 'Minimum 10 characters required';

  @override
  String get reportIssueMaxChars => 'Maximum 2000 characters';

  @override
  String get reportIssueSuccess => 'Report submitted successfully';

  @override
  String get reportIssueError => 'Error submitting the report';

  @override
  String get registrationPromptTitle => 'Unlock full potential';

  @override
  String get registrationPromptDescription =>
      'Join the Italian ham radio community and take your experience to the next level.';

  @override
  String get registrationBenefitInteractTitle => 'Interact';

  @override
  String get registrationBenefitInteractDescription =>
      'Rate repeaters and leave comments for others.';

  @override
  String get registrationBenefitFavoritesTitle => 'Favorites';

  @override
  String get registrationBenefitFavoritesDescription =>
      'Save your most used frequencies and repeaters.';

  @override
  String get registrationBenefitLogbookTitle => 'Logbook';

  @override
  String get registrationBenefitLogbookDescription =>
      'Keep track of your QSOs and maintain a personal history.';

  @override
  String get registrationSignInApple => 'Sign in with Apple';

  @override
  String get registrationSignInGoogle => 'Sign in with Google';

  @override
  String get registrationPromptFooter =>
      'Free registration. No license required to browse public data.';

  @override
  String get postLoginOnboardingWelcome => 'Welcome to';

  @override
  String get postLoginOnboardingQuestion =>
      'Are you a licensed ham radio operator?';

  @override
  String get postLoginOnboardingHelpText =>
      'This helps us customize your experience and show you the right frequencies.';

  @override
  String get postLoginOnboardingYesLicensed => 'Yes, I am';

  @override
  String get postLoginOnboardingNoListener => 'No, I\'m just a listener';

  @override
  String get postLoginOnboardingCallsignTitle => 'Identify yourself';

  @override
  String get postLoginOnboardingCallsignSubtitle =>
      'Enter your official callsign to access network features.';

  @override
  String get postLoginOnboardingCallsignLabel => 'Callsign';

  @override
  String get postLoginOnboardingCallsignHint => 'E.g. IU2XYZ';

  @override
  String get postLoginOnboardingComplete => 'Complete profile';

  @override
  String get postLoginOnboardingBack => 'Back';

  @override
  String get postLoginOnboardingChangeInSettings =>
      'You can change this later in settings.';

  @override
  String get postLoginOnboardingSwlTitle => 'SWL Callsign';

  @override
  String get postLoginOnboardingSwlQuestion =>
      'Do you have an official SWL callsign?';

  @override
  String get postLoginOnboardingSwlHelpText =>
      'Short wave listener callsigns help identify you in the global monitoring community.';

  @override
  String get postLoginOnboardingSwlYes => 'Yes, I have one';

  @override
  String get postLoginOnboardingSwlNo => 'No, I don\'t have one';

  @override
  String get postLoginOnboardingSwlEnterCallsign => 'Enter callsign';

  @override
  String get postLoginOnboardingSwlCallsignHint => 'E.g. I1-12345-SWL';

  @override
  String get timeAgoJustNow => 'just now';

  @override
  String timeAgoMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minutes ago',
      one: '1 minute ago',
    );
    return '$_temp0';
  }

  @override
  String timeAgoHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hours ago',
      one: '1 hour ago',
    );
    return '$_temp0';
  }

  @override
  String timeAgoDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days ago',
      one: '1 day ago',
    );
    return '$_temp0';
  }

  @override
  String timeAgoWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count weeks ago',
      one: '1 week ago',
    );
    return '$_temp0';
  }

  @override
  String timeAgoMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count months ago',
      one: '1 month ago',
    );
    return '$_temp0';
  }

  @override
  String timeAgoYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count years ago',
      one: '1 year ago',
    );
    return '$_temp0';
  }

  @override
  String get profileThemeMode => 'Theme';

  @override
  String get profileThemeModeSystem => 'System';

  @override
  String get profileThemeModeLight => 'Light';

  @override
  String get profileThemeModeDark => 'Dark';

  @override
  String get repeaterDetailBeFirstFeedback =>
      'Be the first to leave feedback on this repeater!';

  @override
  String get repeaterDetailDistanceFromYou => 'Distance from you';

  @override
  String get repeaterDistanceMapNoLocation => 'Location not available';

  @override
  String get repeaterDetailNever => 'Never';

  @override
  String get repeaterDetailInfo => 'Information';

  @override
  String get repeaterDetailSource => 'Source';

  @override
  String get repeaterDetailManager => 'Manager';

  @override
  String get repeaterDetailSuggestManager =>
      'Do you know the repeater manager? Report it!';

  @override
  String get repeaterDetailViewFeedbackMap => 'Feedback map';

  @override
  String get repeaterDetailViewFeedbackMapSubtitle =>
      'View where likes and reports have been recorded';

  @override
  String get repeaterDetailAltimetricProfile => 'Altimetric profile';

  @override
  String get repeaterDetailAltimetricProfileSubtitle =>
      'View the terrain profile between you and the repeater';

  @override
  String get repeaterDetailLosClear =>
      'Clear line of sight between you and the repeater';

  @override
  String get repeaterDetailLosObstructed =>
      'Line of sight obstructed by terrain';

  @override
  String get repeaterDetailTerrainProfile => 'Terrain profile';

  @override
  String get repeaterDetailLineOfSight => 'Line of sight';

  @override
  String get repeaterDetailTotalDistance => 'Distance';

  @override
  String get repeaterDetailRepeaterElevation => 'Repeater elevation';

  @override
  String get repeaterDetailYourElevation => 'Your elevation';

  @override
  String get repeaterDetailYou => 'You';

  @override
  String get repeaterDetailRepeaterLabel => 'Repeater';

  @override
  String get repeaterDetailFunFacts => 'Did you know?';

  @override
  String get repeaterDetailWavelength => 'Wavelength';

  @override
  String repeaterDetailWavelengthValue(String value) {
    return 'The wavelength of this repeater is $value';
  }

  @override
  String get repeaterDetailOscillations => 'Oscillations per second';

  @override
  String repeaterDetailOscillationsValue(String value) {
    return 'The signal oscillates $value times per second';
  }

  @override
  String get repeaterDetailPropagationTime => 'Propagation time';

  @override
  String repeaterDetailPropagationTimeValue(String value) {
    return 'Your signal takes $value to reach the repeater';
  }

  @override
  String get repeaterDetailWaveCycles => 'Wave cycles in transit';

  @override
  String repeaterDetailWaveCyclesValue(String value) {
    return 'The wave completes $value full cycles in transit';
  }

  @override
  String get userReportsTitle => 'My reports';

  @override
  String get userReportsFilterAll => 'All';

  @override
  String get userReportsFilterOpen => 'Open';

  @override
  String get userReportsFilterClosed => 'Closed';

  @override
  String get userReportsEmpty => 'No reports submitted';

  @override
  String get userReportsEmptyDescription =>
      'Your repeater reports will appear here';

  @override
  String get userReportsEmptyFiltered => 'No reports with this filter';

  @override
  String get userReportsStatusPending => 'Pending';

  @override
  String get userReportsStatusReviewed => 'Under review';

  @override
  String get userReportsStatusResolved => 'Resolved';

  @override
  String get userReportsStatusRejected => 'Rejected';

  @override
  String get userReportsRetryBanner => 'Unable to update the list';

  @override
  String get userReportsProfileTile => 'My reports';

  @override
  String get userReportsProfileTileSubtitle =>
      'View the status of your reports';

  @override
  String get userReportsError => 'Error loading reports';

  @override
  String get userReportsCoordinatorResponse => 'Coordinator response';

  @override
  String get potaTitle => 'POTA Spots';

  @override
  String get potaSearchHint => 'Search by activator, park or mode…';

  @override
  String get potaNoSpots => 'No active POTA spots at the moment.';

  @override
  String get potaLoadError => 'Unable to load POTA spots';

  @override
  String get potaRetry => 'Retry';

  @override
  String get potaViewAll => 'View all';

  @override
  String get potaActivator => 'Activator';

  @override
  String get potaFrequency => 'Frequency';

  @override
  String get potaMode => 'Mode';

  @override
  String get potaPark => 'Park';

  @override
  String get potaReference => 'Reference';

  @override
  String get potaSpotter => 'Spotted by';

  @override
  String get potaComments => 'Comments';

  @override
  String get potaLastSpotted => 'Last spotted';

  @override
  String get potaOpenQrz => 'QRZ.com';

  @override
  String get potaQrzError => 'Unable to open QRZ.com';

  @override
  String get potaParkWebsite => 'Park website';

  @override
  String get potaParkType => 'Park type';

  @override
  String get potaLocation => 'Location';

  @override
  String get potaCountry => 'Country';

  @override
  String get potaFirstActivation => 'First activation';

  @override
  String get potaBand => 'Band';

  @override
  String potaDistanceAway(String distance) {
    return '$distance away';
  }

  @override
  String potaSpotsCount(int count) {
    return '$count active spots';
  }

  @override
  String get potaFilterAll => 'Tutte';

  @override
  String get potaFilterBand => 'Banda';

  @override
  String get potaFilterMode => 'Modo';

  @override
  String get potaSortByTime => 'Più recenti';

  @override
  String get potaSortByDistance => 'Più vicini';

  @override
  String get profileLanguage => 'Language';

  @override
  String get profileLanguageSystem => 'System';

  @override
  String get profileLanguageItalian => 'Italiano';

  @override
  String get profileLanguageEnglish => 'English';

  @override
  String get profileLanguageSpanish => 'Español';

  @override
  String get profileLanguageFrench => 'Français';

  @override
  String get onboardingSkip => 'Salta';

  @override
  String get onboardingGetStarted => 'Inizia';

  @override
  String get onboardingNext => 'Avanti';

  @override
  String get onboardingWelcomeTitle1 => 'Trova i ripetitori vicino a te';

  @override
  String get onboardingWelcomeSubtitle1 =>
      'Scopri i ponti radio attivi nella tua zona, con frequenze, toni e dettagli tecnici.';

  @override
  String get onboardingWelcomeCredits =>
      'Dati dei ponti radio forniti da IZ8WNH';

  @override
  String get onboardingWelcomeTitle2 => 'Filtra per modo';

  @override
  String get onboardingWelcomeSubtitle2 =>
      'Analogico, DMR, C4FM, D-STAR — trova subito il ripetitore che fa per te.';

  @override
  String get onboardingWelcomeTitle3 => 'Spot POTA in tempo reale';

  @override
  String get onboardingWelcomeSubtitle3 =>
      'Segui le attivazioni Parks on the Air con aggiornamenti live, filtri per banda e distanza.';

  @override
  String get onboardingWelcomeTitle4 => 'Salva i preferiti';

  @override
  String get onboardingWelcomeSubtitle4 =>
      'Tieni a portata di mano i ripetitori che usi di più per accesso rapido.';

  @override
  String get onboardingLocationTitle => 'Posizione';

  @override
  String get onboardingLocationSubtitle =>
      'Usiamo la tua posizione per mostrarti i ripetitori e le attivazioni POTA vicine.';

  @override
  String get onboardingLocationEnable => 'Attiva Posizione';

  @override
  String get onboardingLocationSkip => 'Non ora';

  @override
  String get onboardingDiscoveryTitle => 'Il tuo primo ripetitore';

  @override
  String get onboardingDiscoverySubtitle => 'Ecco cosa c\'è vicino a te!';

  @override
  String get onboardingDiscoveryViewDetails => 'Vedi Dettagli';

  @override
  String get onboardingDiscoveryViewSpot => 'Vedi Spot';

  @override
  String get onboardingDiscoveryExploreMap => 'Esplora la Mappa';

  @override
  String get onboardingDiscoveryNoLocation =>
      'Esplora la mappa per trovare ripetitori e attivazioni POTA';

  @override
  String get onboardingDiscoveryNearbyRepeater => 'Ripetitore vicino';

  @override
  String get onboardingDiscoveryLivePota => 'Spot POTA attivo';

  @override
  String get onboardingDiscoveryNoRepeaters =>
      'Nessun ripetitore trovato nelle vicinanze';

  @override
  String get onboardingTelegramTitle => 'Unisciti alla community';

  @override
  String get onboardingTelegramSubtitle =>
      'Entra nel gruppo Telegram di HamQRG per ricevere aggiornamenti, segnalare ripetitori e conoscere altri radioamatori.';

  @override
  String get onboardingTelegramJoin => 'Unisciti al Gruppo Telegram';

  @override
  String get onboardingTelegramLater => 'Forse dopo';

  @override
  String get onboardingTelegramAlreadyMember => 'Sono già membro';
}
