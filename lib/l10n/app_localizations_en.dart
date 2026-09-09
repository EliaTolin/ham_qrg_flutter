// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get proSectionTitle => 'Subscription';

  @override
  String get proCardUpgradeTitle => 'See what you reach';

  @override
  String get proCardUpgradeSubtitle => 'Coverage, repeaters and offline maps';

  @override
  String get proCardActiveTitle => 'HamQRG Pro active';

  @override
  String get proCardActiveSubtitle => 'Thanks for your support!';

  @override
  String proPriceFromMonth(String price) {
    return 'From $price per month · Cancel anytime';
  }

  @override
  String proPriceTrialThenMonth(String price) {
    return 'Free trial, then $price per month · Cancel anytime';
  }

  @override
  String proPriceLifetime(String price) {
    return '$price once · Yours forever';
  }

  @override
  String proPriceFromMonthUpfront(String price, String total) {
    return 'From $price per month · $total billed up front · Cancel anytime';
  }

  @override
  String proPriceTrialThenMonthUpfront(String price, String total) {
    return 'Free trial, then $price per month · $total billed up front · Cancel anytime';
  }

  @override
  String get proRestoreSuccess => 'Purchases restored: HamQRG Pro is active';

  @override
  String get proRestoreNone => 'No purchases to restore';

  @override
  String get proManageSubscription => 'Manage subscription';

  @override
  String get proLinkAccountTitle => 'Link your account';

  @override
  String get proLinkAccountBody =>
      'Link HamQRG Pro to an account to keep it on every device, even after a reinstall.';

  @override
  String get stationsShowcaseTitle => 'Your spots, even without a connection';

  @override
  String get stationsShowcaseBody =>
      'Save home, the hut, the activation site: what you reach is there even when the network isn\'t.';

  @override
  String get offlineMapsUpsellTitle => 'The map stays on your phone 🗺️';

  @override
  String get offlineMapsUpsellBody =>
      'Download the areas you need and open them where there\'s no signal: on a ridge, in a tunnel, abroad without data.';

  @override
  String get offlineMapsBenefitRegions => 'You choose which areas to download';

  @override
  String get reachUpsellBenefitSignal => 'Predicted signal for every repeater';

  @override
  String get reachUpsellBenefitTerrain =>
      'Terrain profile between you and the repeater';

  @override
  String get proRestoreCta => 'Restore purchases';

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
    return '$count nearby repeaters';
  }

  @override
  String repeatersResultsCount(int count) {
    return '$count results';
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
  String get dashboardTabRepeaters => 'Repeaters';

  @override
  String get dashboardTabPota => 'POTA';

  @override
  String get dashboardNearbyEmpty => 'No repeaters nearby';

  @override
  String get dashboardViewAllRepeaters => 'View all repeaters';

  @override
  String get dashboardViewAllPotaSpots => 'View all POTA spots';

  @override
  String homeStations(int count) {
    return '$count stations';
  }

  @override
  String homeSaved(int count) {
    return '$count saved';
  }

  @override
  String homeStationsLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'stations',
      one: 'station',
    );
    return '$_temp0';
  }

  @override
  String homeSavedLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'saved',
    );
    return '$_temp0';
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
  String repeaterDetailDistanceWarning(String distance) {
    return 'You must be within $distance of the repeater to send feedback.';
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
    return 'The selected location is $distance from the repeater. Do you confirm you want to send this feedback under your responsibility?';
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
  String get repeaterCoverageTitle => 'Coverage';

  @override
  String get repeaterCoverageCardTitle => 'Coverage map';

  @override
  String get repeaterCoverageCardSubtitle =>
      'Estimate the repeater\'s signal over the area';

  @override
  String get repeaterCoverageLoading => 'Calculating coverage…';

  @override
  String get repeaterCoverageError => 'Unable to calculate coverage';

  @override
  String get repeaterCoverageRetry => 'Retry';

  @override
  String get repeaterCoverageLegendTitle => 'Estimated signal (dBm)';

  @override
  String get repeaterCoverageCta => 'View coverage';

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
  String get userReportsTitle => 'My activities';

  @override
  String get userReportsTabReports => 'Reports';

  @override
  String get userReportsTabSubmissions => 'New repeaters';

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
  String get userSubmissionsEmpty => 'No repeaters submitted';

  @override
  String get userSubmissionsEmptyDescription =>
      'Repeaters you suggest will appear here';

  @override
  String get userSubmissionsEmptyFiltered => 'No repeaters with this filter';

  @override
  String get userSubmissionsStatusPending => 'Pending';

  @override
  String get userSubmissionsStatusApproved => 'Approved';

  @override
  String get userSubmissionsStatusRejected => 'Rejected';

  @override
  String get userSubmissionsCoordinatorResponse => 'Coordinator response';

  @override
  String get userSubmissionsFrequency => 'Frequency';

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
  String get potaFilterAll => 'All';

  @override
  String get potaFilterBand => 'Band';

  @override
  String get potaFilterMode => 'Mode';

  @override
  String get potaSortByTime => 'Most recent';

  @override
  String get potaSortByDistance => 'Nearest';

  @override
  String get profileLanguage => 'Language';

  @override
  String get profileUnitSystem => 'Units';

  @override
  String get profileUnitSystemAuto => 'Automatic';

  @override
  String get profileUnitSystemMetric => 'Metric';

  @override
  String get profileUnitSystemImperial => 'Imperial';

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
  String get profileLanguageGerman => 'Deutsch';

  @override
  String get profileLanguagePortuguese => 'Português';

  @override
  String get profileLanguageDutch => 'Nederlands';

  @override
  String get profileLanguagePolish => 'Polski';

  @override
  String get profileLanguageRomanian => 'Română';

  @override
  String get profileLanguageSlovenian => 'Slovenščina';

  @override
  String get profileLanguageCroatian => 'Hrvatski';

  @override
  String get profileLanguageHungarian => 'Magyar';

  @override
  String get profileLanguageCzech => 'Čeština';

  @override
  String get profileLanguageSlovak => 'Slovenčina';

  @override
  String get profileLanguageSerbian => 'Srpski';

  @override
  String get onboardingSkip => 'Skip';

  @override
  String get onboardingGetStarted => 'Get Started';

  @override
  String get onboardingNext => 'Next';

  @override
  String get onboardingWelcomeTitle1 => 'Find repeaters near you';

  @override
  String get onboardingWelcomeSubtitle1 =>
      'Discover active repeaters in your area, with frequencies, tones and technical details.';

  @override
  String get onboardingWelcomeCredits => 'Repeater data provided by IZ8WNH';

  @override
  String get onboardingWelcomeTitle2 => 'Filter by mode';

  @override
  String get onboardingWelcomeSubtitle2 =>
      'Analog, DMR, C4FM, D-STAR — find the right repeater for you instantly.';

  @override
  String get onboardingWelcomeTitle3 => 'Real-time POTA spots';

  @override
  String get onboardingWelcomeSubtitle3 =>
      'Follow Parks on the Air activations with live updates, band filters and distance.';

  @override
  String get onboardingWelcomeTitle4 => 'Save your favorites';

  @override
  String get onboardingWelcomeSubtitle4 =>
      'Keep your most used repeaters at hand for quick access.';

  @override
  String get onboardingLocationTitle => 'Location';

  @override
  String get onboardingLocationSubtitle =>
      'We use your location to show you nearby repeaters and POTA activations.';

  @override
  String get onboardingLocationEnable => 'Enable Location';

  @override
  String get onboardingLocationSkip => 'Not now';

  @override
  String get onboardingDiscoveryTitle => 'Your first repeater';

  @override
  String get onboardingDiscoverySubtitle => 'Here\'s what\'s near you!';

  @override
  String get onboardingDiscoveryViewDetails => 'View Details';

  @override
  String get onboardingDiscoveryViewSpot => 'View Spot';

  @override
  String get onboardingDiscoveryExploreMap => 'Explore the Map';

  @override
  String get onboardingDiscoveryNoLocation =>
      'Explore the map to find repeaters and POTA activations';

  @override
  String get onboardingDiscoveryNearbyRepeater => 'Nearby repeater';

  @override
  String get onboardingDiscoveryLivePota => 'Live POTA spot';

  @override
  String get onboardingDiscoveryNoRepeaters => 'No repeaters found nearby';

  @override
  String get onboardingTelegramTitle => 'Join the community';

  @override
  String get onboardingTelegramSubtitle =>
      'Join the HamQRG Telegram group to get updates, report repeaters and meet other ham radio operators.';

  @override
  String get onboardingTelegramJoin => 'Join the Telegram Group';

  @override
  String get onboardingTelegramLater => 'Maybe later';

  @override
  String get onboardingTelegramAlreadyMember => 'I\'m already a member';

  @override
  String get addRepeaterProfileTile => 'Suggest new repeater';

  @override
  String get addRepeaterProfileTileSubtitle =>
      'Report a repeater not yet listed';

  @override
  String get addRepeaterTitle => 'New Repeater';

  @override
  String get addRepeaterHeadline => 'Report a missing repeater';

  @override
  String get addRepeaterDescription =>
      'Fill in the repeater details you\'d like to add. The submission will be reviewed before publication.';

  @override
  String get addRepeaterSectionRepeater => 'Repeater data';

  @override
  String get addRepeaterSectionAccesses => 'Accesses';

  @override
  String get addRepeaterSectionLocation => 'Location';

  @override
  String get addRepeaterSectionNotes => 'Notes';

  @override
  String get addRepeaterName => 'Name';

  @override
  String get addRepeaterNameHint => 'E.g. Monte Cimone';

  @override
  String get addRepeaterCallsign => 'Callsign';

  @override
  String get addRepeaterCallsignHint => 'E.g. IR4AB';

  @override
  String get addRepeaterNameOrCallsignRequired =>
      'Enter at least a name or callsign';

  @override
  String get addRepeaterFrequency => 'Frequency (MHz)';

  @override
  String get addRepeaterFrequencyHint => 'E.g. 145.000 or 145,000';

  @override
  String get addRepeaterFrequencyRequired => 'Frequency required';

  @override
  String get addRepeaterFrequencyInvalid => 'Invalid frequency';

  @override
  String get addRepeaterShift => 'Shift (MHz)';

  @override
  String get addRepeaterShiftHint => 'E.g. -0.600 or -0,600';

  @override
  String get addRepeaterRegion => 'Region';

  @override
  String get addRepeaterRegionHint => 'E.g. Emilia-Romagna';

  @override
  String get addRepeaterProvinceCode => 'Province';

  @override
  String get addRepeaterProvinceCodeHint => 'E.g. MO';

  @override
  String get addRepeaterLocality => 'Locality';

  @override
  String get addRepeaterLocalityHint => 'E.g. Fanano';

  @override
  String get addRepeaterLatitude => 'Latitude';

  @override
  String get addRepeaterLatitudeHint => 'E.g. 44.2100';

  @override
  String get addRepeaterLongitude => 'Longitude';

  @override
  String get addRepeaterLongitudeHint => 'E.g. 10.7900';

  @override
  String get addRepeaterLocator => 'Locator';

  @override
  String get addRepeaterLocatorHint => 'E.g. JN54QF';

  @override
  String get addRepeaterNotes => 'Additional notes';

  @override
  String get addRepeaterNotesHint =>
      'Additional information about the repeater...';

  @override
  String get addRepeaterAddAccess => 'Add access';

  @override
  String get addRepeaterRemoveAccess => 'Remove';

  @override
  String get addRepeaterAccessMode => 'Mode';

  @override
  String get addRepeaterAccessCtcssTx => 'CTCSS TX (Hz)';

  @override
  String get addRepeaterAccessCtcssTxHint => 'E.g. 88.5';

  @override
  String get addRepeaterAccessCtcssRx => 'CTCSS RX (Hz)';

  @override
  String get addRepeaterAccessCtcssRxHint => 'E.g. 88.5';

  @override
  String get addRepeaterAccessDcsCode => 'DCS Code';

  @override
  String get addRepeaterAccessDcsCodeHint => 'E.g. 23';

  @override
  String get addRepeaterAccessColorCode => 'Color Code';

  @override
  String get addRepeaterAccessColorCodeHint => 'E.g. 1';

  @override
  String get addRepeaterAccessTalkgroup => 'Talkgroup';

  @override
  String get addRepeaterAccessTalkgroupHint => 'E.g. 222801';

  @override
  String get addRepeaterAccessDgId => 'DG-ID';

  @override
  String get addRepeaterAccessDgIdHint => 'E.g. 0';

  @override
  String get addRepeaterAccessNodeId => 'Node ID';

  @override
  String get addRepeaterAccessNodeIdHint => 'E.g. 1234';

  @override
  String get addRepeaterAccessNac => 'NAC';

  @override
  String get addRepeaterAccessNacHint => 'E.g. 659';

  @override
  String get addRepeaterAccessNetworkName => 'Network name';

  @override
  String get addRepeaterAccessNetworkNameHint => 'E.g. BM Italia';

  @override
  String get addRepeaterAccessNotes => 'Access notes';

  @override
  String get addRepeaterAccessNotesHint => 'Notes specific to this access...';

  @override
  String get addRepeaterConfirmCheckbox =>
      'I confirm that this information is correct to the best of my knowledge.';

  @override
  String get addRepeaterVerifiedTitle => 'Verified submission';

  @override
  String get addRepeaterVerifiedDescription =>
      'Your submission will be reviewed by the team before being published to the database.';

  @override
  String get addRepeaterSubmit => 'Submit';

  @override
  String get addRepeaterSuccess => 'Submission sent successfully!';

  @override
  String get addRepeaterError => 'Error sending the submission';

  @override
  String get addRepeaterAtLeastOneAccess => 'Add at least one access';

  @override
  String addRepeaterAccessNumber(int number) {
    return 'Access $number';
  }

  @override
  String get changelog1017PotaSpots =>
      'Real-time POTA spots with map and park details';

  @override
  String get changelog1017SubmitRepeater =>
      'Suggest a new repeater directly from the app';

  @override
  String get changelog1017MultiLanguage =>
      'App available in English, Spanish and French';

  @override
  String get changelog1017Onboarding => 'New first-launch experience';

  @override
  String get changelog1017ReportAnonymous =>
      'Reports available without registration';

  @override
  String get changelog1020ClusterSpots =>
      'Real-time cluster spots: see who\'s listening on repeaters, with notifications and preferences';

  @override
  String get changelog1020DetailTabs =>
      'Repeater page with Info, Cluster and Community tabs';

  @override
  String get changelog1020TabletLayout => 'Optimized layout for tablets';

  @override
  String get changelog110Coverage =>
      'Repeater coverage map: see the predicted signal right on the map (PRO)';

  @override
  String get changelog110Reachable =>
      'What you reach from here: discover the repeaters you hit from your position, with signal and terrain profile (PRO)';

  @override
  String get changelogTitle => 'What\'s New';

  @override
  String get changelogSubtitle => 'Here\'s what\'s new in this version';

  @override
  String get changelogCategoryAdded => 'New';

  @override
  String get changelogCategoryImproved => 'Improved';

  @override
  String get changelogCategoryFixed => 'Fixed';

  @override
  String get changelogDismiss => 'Got it!';

  @override
  String get spotCreateTitle => 'Spot yourself';

  @override
  String get spotCreateOtherTitle => 'Spot an OM';

  @override
  String get spotCreateDuration => 'Duration';

  @override
  String get spotCreateAccess => 'Mode (optional)';

  @override
  String get spotCreateCallsign => 'Callsign of OM heard';

  @override
  String get spotCreateCallsignHint => 'E.g. IZ0ABC';

  @override
  String get spotCreateConfirm => 'Confirm';

  @override
  String get spotCreateSuccessSelf => 'Spot created!';

  @override
  String get spotCreateSuccessOther => 'OM spotted!';

  @override
  String get spotActiveYou => 'You are spotted';

  @override
  String get spotActiveClose => 'Close spot';

  @override
  String spotActiveOn(String repeaterName) {
    return 'on $repeaterName';
  }

  @override
  String get spotActiveNone => 'Nobody spotted at the moment';

  @override
  String get spotActiveCta => 'Be the first!';

  @override
  String get spotActiveSection => 'Active spots';

  @override
  String get spotHistorySection => 'Spot history';

  @override
  String get spotListTitle => 'Latest spots';

  @override
  String get spotListViewAll => 'View all';

  @override
  String get spotListBadgeActive => 'Listening';

  @override
  String get spotListBadgeClosed => 'Ended';

  @override
  String get spotListBadgeReport => 'Report';

  @override
  String get spotListEmpty => 'No spots in the last 24 hours';

  @override
  String spotListSpottedBy(String callsign) {
    return 'Reported by $callsign';
  }

  @override
  String get spotNotificationToggle => 'Cluster notifications';

  @override
  String get spotNotificationDisabled =>
      'Cluster notifications disabled in profile settings';

  @override
  String get spotNotificationPerFavorite => 'Spot notifications';

  @override
  String get spotPreviousClosed => 'Your previous spot is no longer active';

  @override
  String get spotErrorAuthRequired => 'You must be logged in.';

  @override
  String get spotErrorCallsignRequired =>
      'Set your callsign in your profile to use the cluster.';

  @override
  String get spotErrorInvalidDuration =>
      'Duration must be between 5 and 60 minutes.';

  @override
  String get spotErrorRepeaterNotFound => 'Repeater not found.';

  @override
  String get spotErrorInvalidAccess => 'Invalid access mode for this repeater.';

  @override
  String get spotErrorSpotNotFound => 'Spot not found.';

  @override
  String get spotErrorForbidden => 'You cannot close a spot that isn\'t yours.';

  @override
  String get spotErrorAlreadyClosed => 'The spot is already closed.';

  @override
  String get spotErrorGeneric => 'Error creating spot. Please try again.';

  @override
  String get spotAccessUnavailable => '(mode no longer available)';

  @override
  String spotDurationMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get sotaTitle => 'SOTA Spots';

  @override
  String get sotaListEmpty => 'No SOTA spots at the moment';

  @override
  String get sotaLoadError => 'Failed to load SOTA spots';

  @override
  String get sotaRetry => 'Retry';

  @override
  String get sotaSummitPursuit => 'View toward the summit';

  @override
  String get sotaLosClear => 'Clear line of sight';

  @override
  String get sotaLosObstructed => 'Possible obstruction';

  @override
  String sotaLosObstructionAt(String distance, String height) {
    return 'Obstacle at $distance, +$height';
  }

  @override
  String sotaPointsBadge(int count) {
    return '$count pt';
  }

  @override
  String get sotaFilterAll => 'All';

  @override
  String get spotsFiltersTitle => 'Filters';

  @override
  String get spotsFilterBand => 'Band';

  @override
  String get spotsFilterMode => 'Mode';

  @override
  String get spotsFilterAll => 'All';

  @override
  String get spotsFiltersReset => 'Clear filters';

  @override
  String get sotaSortByTime => 'Time';

  @override
  String get sotaSortByDistance => 'Distance';

  @override
  String get sotaFilterPoints => 'Points';

  @override
  String get sotaFilterAssociation => 'Country';

  @override
  String get sotaSpotQrt => 'QRT';

  @override
  String sotaSummitInvalidFrom(String date) {
    return 'Summit no longer valid since $date';
  }

  @override
  String get sotaSummitRestrictions => 'Restricted access';

  @override
  String get sotaPursuitNoLocation =>
      'Enable location to see the profile toward the summit';

  @override
  String get sotaPursuitTooClose => 'You are practically on the summit';

  @override
  String get sotaPursuitTooFar => 'Summit too far for terrain profile';

  @override
  String get sotaPursuitError => 'Unable to compute profile. Retry.';

  @override
  String get sotaPursuitLoading => 'Computing terrain profile…';

  @override
  String get sotaCopyFrequency => 'Copy frequency';

  @override
  String get sotaOpenOnMap => 'Open on map';

  @override
  String get sotaShare => 'Share';

  @override
  String get sotaViewAll => 'View all';

  @override
  String get sotaTabDashboard => 'SOTA';

  @override
  String get sotaIntroEmpty =>
      'SOTA: Summits On The Air. Chase ham operators activating mountain summits.';

  @override
  String sotaSpotCount(int count) {
    return '$count spots';
  }

  @override
  String get sotaActivator => 'Activator';

  @override
  String get sotaSummit => 'Summit';

  @override
  String get sotaAssociation => 'Association';

  @override
  String get sotaRegion => 'Region';

  @override
  String get sotaLocator => 'Locator';

  @override
  String get sotaDistance => 'Distance';

  @override
  String get sotaBearing => 'Bearing';

  @override
  String get sotaElevationDelta => 'Elevation delta';

  @override
  String get sotaRemoveFilters => 'Remove filters';

  @override
  String get sotaPointsTitle => 'Points';

  @override
  String get sotaSpotInfo => 'Spot info';

  @override
  String get sotaTime => 'Time';

  @override
  String get sotaCopiedToClipboard => 'Frequency copied';

  @override
  String sotaPointsAbove(int count) {
    return '$count+ pt';
  }

  @override
  String get sotaFilterPointsAll => 'All points';

  @override
  String get reachSheetError => 'Couldn\'t compute reachable repeaters.';

  @override
  String reachSheetCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'You reach $count repeaters',
      one: 'You reach 1 repeater',
    );
    return '$_temp0';
  }

  @override
  String get reachSheetSubtitle => 'From your location, sorted by signal';

  @override
  String get reachSheetEmpty => 'No reachable repeaters nearby.';

  @override
  String get reachBadgeTitle => 'Can you reach it from here?';

  @override
  String get reachBadgeSubtitle =>
      'Find out if this repeater covers you and with what signal';

  @override
  String get reachDiscoverCta => 'Discover it with PRO';

  @override
  String get reachReachable => 'You reach it';

  @override
  String get reachOutOfCoverage => 'Out of coverage';

  @override
  String reachReachableDetail(String signal, String distance) {
    return '$signal · $distance · tap for the profile';
  }

  @override
  String reachDistanceFromHere(String distance) {
    return '$distance from here';
  }

  @override
  String get reachComputing => 'Computing coverage…';

  @override
  String get reachRepeaterFallback => 'Repeater';

  @override
  String get reachMapButton => 'What do you reach?';

  @override
  String get reachUpsellTitle => 'What do you reach from here? 📡';

  @override
  String get reachUpsellBody =>
      'See in real time ALL the repeaters you pick up from your location — with predicted signal and terrain profile. How many can you really reach from where you are now?';

  @override
  String get reachUpsellLater => 'Later';

  @override
  String get linkProfileObstructed =>
      'Obstacle on the path (signal via diffraction)';

  @override
  String get linkProfileClear => 'Clear line of sight';

  @override
  String linkProfileCaption(String tx, String rx) {
    return 'Terrain profile and line of sight · TX $tx · RX $rx';
  }

  @override
  String get proUnlockCta => 'Unlock with PRO';

  @override
  String get proWelcomeTitle => 'Welcome to PRO! 🎉';

  @override
  String get proWelcomeBody =>
      'You\'ve unlocked the coverage map, the repeaters you reach from your location and all PRO features. 📡';

  @override
  String get proWelcomeCta => 'Start exploring';

  @override
  String get commonCancel => 'Cancel';

  @override
  String get commonDelete => 'Delete';

  @override
  String get commonEdit => 'Edit';

  @override
  String get commonOpenSettings => 'Open settings';

  @override
  String get commonFieldRequired => 'Required field';

  @override
  String get fieldName => 'Name';

  @override
  String get fieldAddress => 'Address';

  @override
  String get fieldCity => 'City';

  @override
  String get fieldDescription => 'Description';

  @override
  String get fieldYear => 'Year';

  @override
  String get fieldSelectDateHint => 'Select a date';

  @override
  String get validationInvalidYear => 'Select a valid year';

  @override
  String get validationPasswordMinLength =>
      'Password must be at least 6 characters long';

  @override
  String get permissionsMissingTitle => 'Missing permissions!';

  @override
  String get imageUploadError => 'Error while uploading the image';

  @override
  String get uploadImageLabel => 'Upload image';

  @override
  String get sourceGallery => 'Gallery';

  @override
  String get sourceCamera => 'Camera';

  @override
  String get changePasswordTitle => 'Change password';

  @override
  String get fieldNewPassword => 'New password';

  @override
  String get fieldConfirmNewPassword => 'Confirm new password';

  @override
  String get validationPasswordsNoMatch => 'Passwords don\'t match';

  @override
  String get passwordChangedSuccess => 'Password changed successfully';

  @override
  String errorWithMessage(String message) {
    return 'Error: $message';
  }

  @override
  String get updateRequiredTitle => 'Update required';

  @override
  String get updateRequiredAction => 'Update now';

  @override
  String get yearPickerTitle => 'Select the year';

  @override
  String get repeaterTabInfo => 'Info';

  @override
  String get repeaterTabCluster => 'Cluster';

  @override
  String get repeaterTabCommunity => 'Community';

  @override
  String get updateRequiredBody =>
      'A new version of the app is available. Update to keep using the app.';

  @override
  String get errorOpeningStore => 'Error while opening the store';

  @override
  String get deleteConfirmTitle => 'Confirm deletion';

  @override
  String get deleteConfirmContent => 'Are you sure you want to delete?';

  @override
  String get cameraPermissionRationale =>
      'To take a photo, allow camera access in settings.';

  @override
  String get coverageSearchHint => 'Search a place or paste coordinates';

  @override
  String get coverageSearchRecentTitle => 'Recent searches';

  @override
  String get coverageSearchNoResults => 'No place found';

  @override
  String get coverageSearchTip =>
      'You can paste coordinates (46.4879, 11.8123) or long-press on the map';

  @override
  String get coverageSearchErrorOutOfRange =>
      'Coordinates out of range: latitude ±90, longitude ±180';

  @override
  String get coverageSearchErrorOffline =>
      'No connection: place search needs the network';

  @override
  String get coverageSearchErrorFailed => 'Search failed. Try again.';

  @override
  String get coverageSearchClearPoint => 'Remove point';

  @override
  String get coverageSearchPointSemantics => 'Selected search point';

  @override
  String get coverageBreadthTitle => 'Search breadth';

  @override
  String get coverageBreadthQuick => 'Quick';

  @override
  String get coverageBreadthMedium => 'Medium';

  @override
  String get coverageBreadthExtended => 'Extended';

  @override
  String coverageBreadthQuickHint(String radius) {
    return '$radius · fastest answer';
  }

  @override
  String coverageBreadthMediumHint(String radius) {
    return '$radius · balanced';
  }

  @override
  String coverageBreadthExtendedHint(String radius) {
    return '$radius · farther, longer wait';
  }

  @override
  String get coverageResultSubtitle => 'From the selected point';

  @override
  String get coverageResultEmptyNoReachable =>
      'No repeater is reachable from this point';

  @override
  String get coverageResultEmptyNoRepeaters =>
      'No repeater is listed in this area';

  @override
  String get coverageResultClearFilters => 'Clear filters';

  @override
  String get coverageResultError => 'Calculation failed';

  @override
  String get coverageResultComputing => 'Calculating reception…';

  @override
  String get coverageResultCancel => 'Cancel';

  @override
  String coverageResultCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count reachable repeaters',
      one: '1 reachable repeater',
    );
    return '$_temp0';
  }

  @override
  String coverageResultCountFiltered(int shown, int total) {
    return '$shown of $total reachable';
  }

  @override
  String coverageResultHiddenByFilters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count reachable hidden by filters',
      one: '1 reachable hidden by filters',
    );
    return '$_temp0';
  }

  @override
  String coverageTeaserTitle(String place) {
    return 'What do you reach from $place? 📡';
  }

  @override
  String get coverageTeaserBody =>
      'Every repeater you reach from that spot, with predicted signal and distance — before you even set off.';

  @override
  String get coverageTeaserBenefitAnywhere => 'Any point on the planet';

  @override
  String get coverageTeaserBenefitOffline =>
      'Readable offline, out in the field';

  @override
  String get coverageTeaserBenefitSave => 'Save the spot and find it again';

  @override
  String get stationSaveCta => 'Save station';

  @override
  String get stationSaveTitle => 'Station name';

  @override
  String get stationRename => 'Rename';

  @override
  String get stationDelete => 'Delete';

  @override
  String get stationRefresh => 'Refresh';

  @override
  String get stationRefreshAll => 'Refresh all';

  @override
  String get stationOfflineNotice => 'Data stored on this device';

  @override
  String get stationStaleNotice => 'This data may be out of date';

  @override
  String get stationMissingEntry => 'Data not available offline';

  @override
  String get stationDuplicateTitle => 'Point already saved';

  @override
  String stationDuplicateBody(String distance) {
    return 'There is already a station within $distance of here. Update it, or create a separate one?';
  }

  @override
  String get stationDuplicateUpdate => 'Update it';

  @override
  String get stationDuplicateCreate => 'Create separate';

  @override
  String get stationSaveFailed => 'Save failed: not enough space';

  @override
  String get stationSavedCta => 'Location saved';

  @override
  String get stationRemoveCta => 'Remove';

  @override
  String get stationRemoveTitle => 'Remove this location?';

  @override
  String stationRemoveBody(String name) {
    return '“$name” and its offline data will be deleted from this device.';
  }

  @override
  String get stationRemovedSnack => 'Location removed';

  @override
  String get stationSaveError => 'Couldn’t save. Please try again.';

  @override
  String get stationsTitle => 'My stations';

  @override
  String get stationsProfileSubtitle =>
      'The points you\'ve evaluated, available offline';

  @override
  String get stationsEmptyTitle => 'No saved stations yet';

  @override
  String get stationsEmptyBody =>
      'A station is a map point whose coverage you already worked out, saved so you can find it again without a network.';

  @override
  String get stationsEmptyStep1 =>
      'Pick a point on the map: long-press it, search it by name or paste its coordinates.';

  @override
  String stationsEmptyStep2(String action) {
    return 'Tap “$action” to see which repeaters you can work from there.';
  }

  @override
  String get stationsEmptyStep3 =>
      'Save the point: you\'ll find it here, even in the field with no network.';

  @override
  String get stationsGoToMap => 'Go to the map';

  @override
  String get stationsRefreshDone => 'Refresh complete';

  @override
  String spotsUpdatedAgo(String time) {
    return 'Updated $time';
  }

  @override
  String spotsNextUpdateSeconds(int seconds) {
    return 'Update in ${seconds}s';
  }

  @override
  String spotsNextUpdateMinutes(int minutes) {
    return 'Update in $minutes min';
  }

  @override
  String get spotsUpdating => 'Updating…';

  @override
  String spotsAutoRefreshHint(int seconds) {
    return 'Automatic refresh every $seconds seconds';
  }

  @override
  String get spotsManualRefreshHint => 'Tap to refresh';

  @override
  String coverageResultScope(String km, int count) {
    return 'within $km · $count evaluated';
  }

  @override
  String get coverageResultRecalculating => 'Recalculating';

  @override
  String get offlineBannerMessage =>
      'You\'re offline: viewing previously saved data';

  @override
  String get offlineMapsTitle => 'Offline maps';

  @override
  String get offlineMapsEntrySubtitle =>
      'Download maps for use without a connection';

  @override
  String get offlineMapsEmpty =>
      'No regions downloaded. Download an area to see the map even without a connection.';

  @override
  String get offlineMapsAddRegion => 'Download region';

  @override
  String get offlineMapsRegionNameLabel => 'Region name';

  @override
  String get offlineMapsRegionNameHint =>
      'E.g. Home, Mountain hut, SOTA activation';

  @override
  String get offlineMapsRadiusLabel => 'Radius';

  @override
  String get offlineMapsDownload => 'Download';

  @override
  String get offlineMapsDownloadingStyle => 'Downloading map style…';

  @override
  String offlineMapsDownloadingTiles(String percent) {
    return 'Downloading map tiles… $percent%';
  }

  @override
  String offlineMapsEstimatedSize(String size) {
    return 'Estimated size: $size';
  }

  @override
  String get offlineMapsDownloadError => 'Download failed. Try again.';

  @override
  String get offlineMapsDeleteError => 'Deletion failed. Try again.';

  @override
  String get offlineMapsDeleteConfirmTitle => 'Delete region?';

  @override
  String offlineMapsDeleteConfirmMessage(String name) {
    return '“$name” will no longer be available offline.';
  }

  @override
  String get offlineMapsDeleteConfirm => 'Delete';

  @override
  String offlineMapsRegionSubtitle(String radius, String size) {
    return 'Radius $radius · $size';
  }

  @override
  String get offlineMapsIncomplete => 'Incomplete download';

  @override
  String get offlineMapsResume => 'Resume';

  @override
  String get offlineMapsCenterInfo =>
      'The region will be centered on your current location.';

  @override
  String get dashboardOfflineTitle => 'You\'re offline';

  @override
  String get dashboardOfflineMessage =>
      'No saved data for this area. Your saved stations and downloaded maps are still available.';

  @override
  String get offlineMapsCenterMine => 'My location';

  @override
  String get offlineMapsCenterSearch => 'Search a place';

  @override
  String get offlineMapsCenterSearchInfo =>
      'Search a city or place: the region will be centered there.';

  @override
  String offlineMapsCenterSelected(String label) {
    return 'Center: $label';
  }

  @override
  String get changelog120OfflineMode =>
      'Offline mode: repeaters, favorites, profile, coverage and reachability available without a network (PRO)';

  @override
  String get changelog120OfflineMaps =>
      'Offline maps: download the area around you or any place you choose and use it with no connection (PRO)';

  @override
  String get changelog120CoverageSearch =>
      'Coverage search from any point: search a place, paste coordinates or long-press the map to discover what you reach from there';

  @override
  String get changelog120SavedStations =>
      'My stations: save the spots you care about and consult them offline too (PRO)';

  @override
  String get changelog120SpotsRefresh =>
      'SOTA and POTA spots refresh automatically every minute, with mode-colored badges (CW, SSB, FT8…)';

  @override
  String get changelog120NoNetwork =>
      'Without a connection the app starts instantly, shows what\'s available and disables actions that need the network';

  @override
  String get changelog130ImperialUnits =>
      'Miles and feet: the app now follows your device units, and you can pick the system yourself in Settings';

  @override
  String get profileUnitSystemAutoShort => 'Auto';

  @override
  String updateAvailableBannerMessage(String version) {
    return 'Version $version is available, we recommend updating';
  }

  @override
  String get updateAvailableAction => 'Update';

  @override
  String get updateAvailableDismiss => 'Not now';

  @override
  String get dashboardLoadError => 'Couldn\'t load the latest data';

  @override
  String get dashboardLoadErrorMessage =>
      'The server didn\'t respond. Try again in a moment.';
}
