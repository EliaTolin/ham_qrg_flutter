// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get error => 'Eroare';

  @override
  String get error_message => 'A apărut o eroare la încărcare';

  @override
  String get error_message_retry =>
      'A apărut o eroare la încărcare. Vă rugăm să încercați din nou mai târziu';

  @override
  String get retry => 'Reîncearcă';

  @override
  String get back => 'Înapoi';

  @override
  String get loading => 'Se încarcă';

  @override
  String get details => 'Detalii';

  @override
  String pages_number(Object number) {
    return '$number pagini de explorat';
  }

  @override
  String get january => 'Ianuarie';

  @override
  String get february => 'Februarie';

  @override
  String get march => 'Martie';

  @override
  String get april => 'Aprilie';

  @override
  String get may => 'Mai';

  @override
  String get june => 'Iunie';

  @override
  String get july => 'Iulie';

  @override
  String get august => 'August';

  @override
  String get september => 'Septembrie';

  @override
  String get october => 'Octombrie';

  @override
  String get november => 'Noiembrie';

  @override
  String get december => 'Decembrie';

  @override
  String get logout => 'Deconectare';

  @override
  String get profile => 'Profil';

  @override
  String get settings => 'Setări';

  @override
  String get contact_us => 'Contactează-ne';

  @override
  String get error_opening_email =>
      'A apărut o eroare la deschiderea emailului';

  @override
  String get register_now => 'Înregistrează-te acum';

  @override
  String get tracking_permission_title => 'Susține aplicația';

  @override
  String get tracking_permission_message =>
      'Pentru a îmbunătăți experiența ta și a-ți arăta conținut mai relevant, ajută-ne să menținem aplicația gratuită.\n\nApasă Permite pentru a ne susține.';

  @override
  String get tracking_permission_next => 'Următorul';

  @override
  String get skip => 'Omite';

  @override
  String get done => 'Gata';

  @override
  String get next => 'Următorul';

  @override
  String get joinCommunityTitle => 'Alătură-te comunității noastre!';

  @override
  String get joinCommunityDescription =>
      'Descoperă beneficiile comunității Telegram:';

  @override
  String get benefitSupportMembers => 'Suport din partea membrilor';

  @override
  String get benefitSuggestFeatures => 'Sugerează funcționalități noi';

  @override
  String get benefitContactDevelopers => 'Contact cu dezvoltatorii';

  @override
  String get benefitExclusivePreviews =>
      'Previzualizări și versiuni beta exclusive';

  @override
  String get benefitActiveCommunity => 'Comunitate activă';

  @override
  String get joinNowButton => 'Alătură-te acum!';

  @override
  String get alreadyMemberButton => 'Sunt deja membru';

  @override
  String get laterButton => 'Mai târziu';

  @override
  String get errorOpenTelegram => 'Eroare la deschiderea Telegram';

  @override
  String get disclaimerTitle => 'Sursa datelor';

  @override
  String get disclaimerDescription =>
      'Datele despre repetoare din această aplicație provin de la IZ8WNH.\n\nPentru informații suplimentare, pentru a descărca fișiere CSV pentru programarea radiourilor sau pentru a consulta date care nu sunt disponibile în aplicație, vizitați site-ul oficial.';

  @override
  String get disclaimerVisitSite => 'Vizitează iz8wnh.it';

  @override
  String get disclaimerUnderstood => 'Am înțeles';

  @override
  String get errorOpenDisclaimerSite => 'Eroare la deschiderea site-ului';

  @override
  String get repeatersMapTitle => 'Harta repetoarelor';

  @override
  String get repeatersListTitle => 'Lista repetoarelor';

  @override
  String get repeatersMapLoading => 'Se încarcă harta repetoarelor…';

  @override
  String get repeatersMapGenericError => 'Nu s-au putut încărca repetoarele.';

  @override
  String get repeatersMapEmpty => 'Nu s-au găsit repetoare în apropierea ta.';

  @override
  String get repeatersSearchHint =>
      'Caută după nume, indicativ sau frecvență MHz…';

  @override
  String get repeatersSearchEmpty => 'Nu s-au găsit repetoare.';

  @override
  String get repeatersSortDistance => 'Distanță';

  @override
  String get repeatersSortLikes => 'Aprecieri';

  @override
  String get repeatersSortFrequency => 'Frecvență';

  @override
  String repeatersNearbyCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de repetoare în apropiere',
      few: '$count repetoare în apropiere',
      one: '$count repetor în apropiere',
    );
    return '$_temp0';
  }

  @override
  String repeatersResultsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de rezultate',
      few: '$count rezultate',
      one: '$count rezultat',
    );
    return '$_temp0';
  }

  @override
  String get repeatersMapRetry => 'Reîncearcă';

  @override
  String get repeatersMapOpenSettings => 'Deschide setările';

  @override
  String get repeatersMapPermissionMessage =>
      'Permite accesul la locație pentru a afișa repetoarele din apropierea ta.';

  @override
  String get repeatersMapPermissionPermanentlyDenied =>
      'Permisiunea pentru locație a fost refuzată permanent. Activează-o din setările sistemului.';

  @override
  String get repeatersMapLocationServicesDisabled =>
      'Activează serviciile de localizare pentru a găsi repetoarele din apropiere.';

  @override
  String repeatersMapFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de repetoare găsite',
      few: '$count repetoare găsite',
      one: '$count repetor găsit',
    );
    return '$_temp0';
  }

  @override
  String get repeaterMode => 'Mod';

  @override
  String get repeaterModeAnalog => 'Analog';

  @override
  String get repeaterModeC4fm => 'C4FM';

  @override
  String get repeaterModeDstar => 'D-STAR';

  @override
  String get repeaterModeDmr => 'DMR';

  @override
  String get repeaterModeAllmode => 'Toate modurile';

  @override
  String get repeaterModeEcholink => 'Echolink';

  @override
  String get repeaterModeAllstar => 'AllStar';

  @override
  String get repeaterModeWinlink => 'Winlink';

  @override
  String get repeaterFrequency => 'Frecvență';

  @override
  String get repeaterShift => 'Deplasare';

  @override
  String get repeaterCtcss => 'CTCSS';

  @override
  String get repeaterLocation => 'Locație';

  @override
  String get repeaterDistance => 'Distanță';

  @override
  String get repeaterViewFullDetails => 'Vezi toate detaliile';

  @override
  String get repeatersMapReturnToLocation => 'Revino la locația mea';

  @override
  String clusterRepeatersTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de repetoare în această locație',
      few: '$count repetoare în această locație',
      one: '$count repetor în această locație',
    );
    return '$_temp0';
  }

  @override
  String get profileUnlockFeatures => 'Deblochează toate funcționalitățile';

  @override
  String get profileUnlockFeaturesDescription =>
      'Înregistrează-te pentru a folosi recenziile, salvarea favoritelor și accesul la statistici detaliate.';

  @override
  String get profileSignUpOrLogin => 'Înregistrare sau Autentificare';

  @override
  String get profileErrorOpeningEmail => 'Eroare la deschiderea emailului';

  @override
  String get profileJoinTelegramCommunity => 'Alătură-te comunității Telegram';

  @override
  String get profileWelcomeTitle => 'Bine ai venit pe HamQRG';

  @override
  String get profileWelcomeDescription =>
      'Alătură-te comunității noastre de radioamatori din Italia.';

  @override
  String get profileEditProfile => 'Editează profilul';

  @override
  String get profileChangePhoto => 'Schimbă fotografia';

  @override
  String get profileFirstName => 'Prenume';

  @override
  String get profileLastName => 'Nume';

  @override
  String get profileCallsign => 'Indicativ';

  @override
  String get profileRestartIdentificationTitle =>
      'Trebuie să îți schimbi statutul? Poți reporni procesul de identificare pentru a trece de la Operator Licențiat la Ascultător SWL.';

  @override
  String get profileRestartIdentificationButton =>
      'Repornește procesul de identificare';

  @override
  String get profileSaveChanges => 'Salvează modificările';

  @override
  String get profileDangerZone => 'Zonă periculoasă';

  @override
  String get profileDeleteAccount => 'Șterge contul';

  @override
  String get profileDeleteAccountConfirmTitle => 'Șterge contul';

  @override
  String get profileDeleteAccountConfirmMessage =>
      'Ești sigur că vrei să ștergi contul? Această acțiune este ireversibilă.';

  @override
  String get profileDeleteAccountCancel => 'Anulează';

  @override
  String get profileDeleteAccountConfirm => 'Șterge';

  @override
  String profileAppVersion(String version, String buildNumber) {
    return 'Versiunea aplicației $version (Build $buildNumber)';
  }

  @override
  String get profileSectionCommunity => 'Comunitate și Suport';

  @override
  String get profileSectionSupport => 'Suport';

  @override
  String profileVersion(String version, String buildNumber) {
    return 'Versiune: $version+$buildNumber';
  }

  @override
  String profileVersionFormat(String version, String buildNumber) {
    return 'Versiunea $version (Build $buildNumber)';
  }

  @override
  String profileError(String error) {
    return 'Eroare: $error';
  }

  @override
  String get authJoinTitle => 'Alătură-te HamQRG';

  @override
  String get authUnlockFeatures =>
      'Autentifică-te pentru a debloca toate funcționalitățile!';

  @override
  String get authWhatYouGet => 'Ce vei primi:';

  @override
  String get authBenefitStatsTitle => 'Statistici detaliate';

  @override
  String get authBenefitStatsDescription =>
      'Monitorizează-ți progresul și îmbunătățește-te';

  @override
  String get authBenefitQuizTitle => 'Moduri variate de quiz';

  @override
  String get authBenefitQuizDescription =>
      'Exersează în modurile maraton, pe teme și altele.';

  @override
  String get authBenefitSyncTitle => 'Sincronizare';

  @override
  String get authBenefitSyncDescription => 'Accesează de pe orice dispozitiv';

  @override
  String get authOrSignInWithEmail => 'Sau autentifică-te cu email';

  @override
  String get authEnterEmail => 'Introdu emailul';

  @override
  String get authEnterPassword => 'Introdu parola';

  @override
  String get authForgotPassword => 'Ai uitat parola?';

  @override
  String get authSignIn => 'Autentificare';

  @override
  String get authSignUp => 'Înregistrare';

  @override
  String get authPasswordLengthError => 'Parola trebuie să fie mai lungă';

  @override
  String get authDontHaveAccount => 'Nu ai cont? Înregistrează-te';

  @override
  String get authHaveAccount => 'Ai deja cont? Autentifică-te';

  @override
  String get authBackToSignIn => 'Înapoi la autentificare';

  @override
  String get authUnexpectedError => 'Eroare de autentificare: ';

  @override
  String get authValidEmailError => 'Introdu un email valid';

  @override
  String get authSendPasswordReset => 'Trimite resetarea parolei';

  @override
  String get authPasswordResetSent => 'Resetarea parolei a fost trimisă';

  @override
  String get authVerifyEmailMessage =>
      'Verifică-ți emailul pentru a finaliza înregistrarea, verifică inbox-ul.';

  @override
  String get authInvalidCredentials => 'Email sau parolă incorectă';

  @override
  String get authEmailNotConfirmed =>
      'Verifică-ți emailul pentru a te autentifica';

  @override
  String get authFirstName => 'Prenume';

  @override
  String get authFirstNameRequired => 'Prenumele este obligatoriu';

  @override
  String get authLastName => 'Nume';

  @override
  String get authLastNameRequired => 'Numele este obligatoriu';

  @override
  String get authContinueAsGuest => 'Continuă ca vizitator';

  @override
  String get commonAppNamePart1 => 'Ham';

  @override
  String get commonAppNamePart2 => 'QRG';

  @override
  String get commonAppTagline => 'Descoperă repetoarele din jurul tău';

  @override
  String get commonPoweredBy => 'POWERED BY IU4VRB';

  @override
  String get homeQuickAccess => 'Acces rapid';

  @override
  String get homeRepeaterList => 'Lista repetoarelor';

  @override
  String get homeMyFavorites => 'Favoritele mele';

  @override
  String get homeNearby => 'În apropierea ta';

  @override
  String get homeViewAll => 'Vezi tot';

  @override
  String get dashboardTabRepeaters => 'Repetoare';

  @override
  String get dashboardTabPota => 'POTA';

  @override
  String get dashboardNearbyEmpty => 'Niciun repetor în apropiere';

  @override
  String get dashboardViewAllRepeaters => 'Vezi toate repetoarele';

  @override
  String get dashboardViewAllPotaSpots => 'Vezi toate spoturile POTA';

  @override
  String homeStations(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de stații',
      few: '$count stații',
      one: '$count stație',
    );
    return '$_temp0';
  }

  @override
  String homeSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count salvate',
      few: '$count salvate',
      one: '$count salvat',
    );
    return '$_temp0';
  }

  @override
  String get homeActive => 'Activ';

  @override
  String get homeIdle => 'Inactiv';

  @override
  String get homeNavHome => 'Acasă';

  @override
  String get homeNavList => 'Listă';

  @override
  String get homeNavFavorites => 'Favorite';

  @override
  String get homeNavMap => 'Hartă';

  @override
  String get homeNavProfile => 'Profil';

  @override
  String get favoritesTitle => 'Favoritele mele';

  @override
  String get favoritesSearchHint => 'Caută repetoare salvate...';

  @override
  String get favoritesFilterAllSaved => 'Toate salvate';

  @override
  String get favoritesEmpty => 'Niciun repetor salvat';

  @override
  String get favoritesEmptyDescription =>
      'Adaugă repetoare la favorite pentru a le vedea aici';

  @override
  String favoritesShowing(int showing, int total) {
    return 'Se afișează $showing din $total stații favorite';
  }

  @override
  String get favoritesRemove => 'Elimină din favorite';

  @override
  String get favoritesAdd => 'Adaugă la favorite';

  @override
  String get repeaterDetailSave => 'Salvează';

  @override
  String get repeaterDetailShare => 'Distribuie';

  @override
  String get repeaterDetailReport => 'Raportează';

  @override
  String get repeaterDetailTotalLikes => 'Total aprecieri';

  @override
  String get repeaterDetailReports1Yr => 'Rapoarte (1 an)';

  @override
  String get repeaterDetailHealthScore => 'Scor de sănătate';

  @override
  String get repeaterDetailExcellent => 'Excelent';

  @override
  String get repeaterDetailGood => 'Bun';

  @override
  String get repeaterDetailFair => 'Acceptabil';

  @override
  String get repeaterDetailToVerify => 'De verificat';

  @override
  String repeaterDetailScoreCalculated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de rapoarte negative',
      few: '$count rapoarte negative',
      one: '$count raport negativ',
    );
    return 'Scor calculat din $_temp0 în ultimul an';
  }

  @override
  String get repeaterDetailLastLike => 'Ultima apreciere';

  @override
  String get repeaterDetailLastDownReport => 'Ultimul raport negativ';

  @override
  String get repeaterDetailTechnicalData => 'Date tehnice';

  @override
  String get repeaterDetailFrequency => 'Frecvență';

  @override
  String get repeaterDetailShift => 'Deplasare';

  @override
  String get repeaterDetailSubtone => 'Subton (SQL)';

  @override
  String get repeaterDetailMode => 'Mod';

  @override
  String get repeaterDetailLocation => 'Locație';

  @override
  String repeaterDetailAway(String distance) {
    return 'la $distance distanță';
  }

  @override
  String get repeaterDetailCommunityReports => 'Rapoartele comunității';

  @override
  String get repeaterDetailUpdateStatusFeedback =>
      'Actualizează starea și feedback-ul';

  @override
  String get repeaterDetailEquipment => 'Echipament';

  @override
  String get repeaterDetailEquipmentRequired => 'Echipament *';

  @override
  String get repeaterDetailAccessModes => 'Moduri de acces';

  @override
  String get repeaterDetailNetwork => 'Rețea';

  @override
  String get repeaterDetailLocationField => 'Locație';

  @override
  String get repeaterDetailLocationRequired => 'Locație *';

  @override
  String get repeaterDetailComment => 'Comentariu';

  @override
  String get repeaterDetailCommentOptional => 'Comentariu (Opțional)';

  @override
  String get repeaterDetailCommentPlaceholder =>
      'Calitatea semnalului, raport audio sau comentarii generale...';

  @override
  String get repeaterDetailReportDown => 'Raportează o problemă';

  @override
  String get repeaterDetailCheckinLike => 'Check-in și apreciere';

  @override
  String get repeaterDetailYourFeedback => 'Feedback-ul tău';

  @override
  String get repeaterDetailPostedJustNow => 'Publicat chiar acum';

  @override
  String get repeaterDetailDeleteEntry => 'Șterge intrarea';

  @override
  String repeaterDetailViewAllReports(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de rapoarte',
      few: '$count rapoarte',
      one: '$count raport',
    );
    return 'Vezi toate cele $_temp0';
  }

  @override
  String get repeaterDetailStationPortable => 'Portabil';

  @override
  String get repeaterDetailStationMobile => 'Mobil';

  @override
  String get repeaterDetailStationFixed => 'Fix';

  @override
  String get repeaterDetailLike => 'Apreciere';

  @override
  String get repeaterDetailReportLabel => 'Raport';

  @override
  String get repeaterDetailSaved => 'Salvat';

  @override
  String get repeaterDetailShareMessage => 'Descoperă acest repetor pe HamQRG!';

  @override
  String get repeaterDetailReportDescription =>
      'Funcția de raportare va fi disponibilă în curând. Vei putea raporta informații incorecte sau probleme cu acest repetor.';

  @override
  String get commonClose => 'Închide';

  @override
  String get favorite => 'Favorit';

  @override
  String get accessConfiguration => 'Configurare acces';

  @override
  String get noAccessConfiguration => 'Nicio configurare disponibilă';

  @override
  String get repeaterDetailAddFeedback => 'Adaugă feedback';

  @override
  String get repeaterDetailOthersReports => 'Rapoartele altor utilizatori';

  @override
  String get repeaterDetailRemove => 'Elimină';

  @override
  String get repeaterDetailSelectAccess => 'Selectează accesul';

  @override
  String repeaterDetailDistanceWarning(int distance) {
    return 'Trebuie să fii la maximum $distance km de repetor pentru a trimite feedback.';
  }

  @override
  String get repeaterDetailInteractive => 'Interactiv';

  @override
  String get repeaterDetailLogYourSignal => 'Înregistrează-ți semnalul';

  @override
  String get repeaterDetailUsedEquipment => 'Echipament utilizat';

  @override
  String get repeaterDetailYourLocation => 'Locația ta';

  @override
  String get repeaterDetailLocationPlaceholder =>
      'Unde te aflai? (ex. București)';

  @override
  String get repeaterDetailLocationSelectHint =>
      'Selectează un loc din sugestii';

  @override
  String get feedbackDistanceConfirmTitle => 'Confirmă trimiterea';

  @override
  String feedbackDistanceConfirmMessage(String distance) {
    return 'Locația selectată este la $distance km de repetor. Confirmi că vrei să trimiți acest feedback pe propria răspundere?';
  }

  @override
  String get feedbackDistanceConfirmButton => 'Confirmă';

  @override
  String get feedbackDistanceConfirmCancel => 'Anulează';

  @override
  String get repeaterDetailSelectAccessInstance =>
      'Selectează instanța de acces';

  @override
  String get repeaterDetailSignalObservations => 'Observații despre semnal';

  @override
  String get repeaterDetailSignalObservationsPlaceholder =>
      'Cum a fost calitatea audio?';

  @override
  String get repeaterDetailSendLike => 'Trimite apreciere';

  @override
  String get repeaterDetailReportIssue => 'Raportează o problemă';

  @override
  String get repeaterDetailRecentActivity => 'Activitate recentă';

  @override
  String get reportIssueTitle => 'Raport';

  @override
  String get reportIssueHeadline => 'Ajută-ne să menținem datele corecte';

  @override
  String get reportIssueDescription =>
      'Ai găsit ceva greșit sau lipsă la acest repetor? Spune-ne ce trebuie schimbat și vom verifica.';

  @override
  String get reportIssueWhatToCorrect =>
      'Ce ai dori să corectezi sau să adaugi?';

  @override
  String get reportIssuePlaceholder =>
      'Ex. Tonul CTCSS s-a schimbat la 88.5Hz, sau locația este puțin mai la nord, managerul este...';

  @override
  String get reportIssueVerifiedTitle => 'Trimiteri verificate';

  @override
  String get reportIssueVerifiedDescription =>
      'Raportul tău va fi analizat de coordonatorul regional înainte de actualizarea bazei de date publice. Îți mulțumim pentru contribuția la comunitate.';

  @override
  String get reportIssueConfirmCheckbox =>
      'Confirm că aceste informații sunt corecte conform observației mele.';

  @override
  String get reportIssueSubmit => 'Trimite';

  @override
  String get reportIssueMinChars => 'Minimum 10 caractere necesare';

  @override
  String get reportIssueMaxChars => 'Maximum 2000 de caractere';

  @override
  String get reportIssueSuccess => 'Raportul a fost trimis cu succes';

  @override
  String get reportIssueError => 'Eroare la trimiterea raportului';

  @override
  String get registrationPromptTitle => 'Deblochează potențialul complet';

  @override
  String get registrationPromptDescription =>
      'Alătură-te comunității de radioamatori italieni și ridică-ți experiența la un nivel superior.';

  @override
  String get registrationBenefitInteractTitle => 'Interacționează';

  @override
  String get registrationBenefitInteractDescription =>
      'Evaluează repetoarele și lasă comentarii pentru ceilalți.';

  @override
  String get registrationBenefitFavoritesTitle => 'Favorite';

  @override
  String get registrationBenefitFavoritesDescription =>
      'Salvează frecvențele și repetoarele pe care le folosești cel mai des.';

  @override
  String get registrationBenefitLogbookTitle => 'Jurnal de bord';

  @override
  String get registrationBenefitLogbookDescription =>
      'Ține evidența QSO-urilor tale și menține un istoric personal.';

  @override
  String get registrationSignInApple => 'Autentificare cu Apple';

  @override
  String get registrationSignInGoogle => 'Autentificare cu Google';

  @override
  String get registrationPromptFooter =>
      'Înregistrare gratuită. Nu este necesară licența pentru a naviga datele publice.';

  @override
  String get postLoginOnboardingWelcome => 'Bine ai venit pe';

  @override
  String get postLoginOnboardingQuestion => 'Ești un radioamator licențiat?';

  @override
  String get postLoginOnboardingHelpText =>
      'Acest lucru ne ajută să personalizăm experiența ta și să îți arătăm frecvențele potrivite.';

  @override
  String get postLoginOnboardingYesLicensed => 'Da, sunt';

  @override
  String get postLoginOnboardingNoListener => 'Nu, sunt doar ascultător';

  @override
  String get postLoginOnboardingCallsignTitle => 'Identifică-te';

  @override
  String get postLoginOnboardingCallsignSubtitle =>
      'Introdu indicativul tău oficial pentru a accesa funcțiile de rețea.';

  @override
  String get postLoginOnboardingCallsignLabel => 'Indicativ';

  @override
  String get postLoginOnboardingCallsignHint => 'Ex. YO3XYZ';

  @override
  String get postLoginOnboardingComplete => 'Finalizează profilul';

  @override
  String get postLoginOnboardingBack => 'Înapoi';

  @override
  String get postLoginOnboardingChangeInSettings =>
      'Poți schimba acest lucru mai târziu din setări.';

  @override
  String get postLoginOnboardingSwlTitle => 'Indicativ SWL';

  @override
  String get postLoginOnboardingSwlQuestion => 'Ai un indicativ oficial SWL?';

  @override
  String get postLoginOnboardingSwlHelpText =>
      'Indicativele de ascultător unde scurte ajută la identificarea ta în comunitatea globală de monitorizare.';

  @override
  String get postLoginOnboardingSwlYes => 'Da, am unul';

  @override
  String get postLoginOnboardingSwlNo => 'Nu, nu am';

  @override
  String get postLoginOnboardingSwlEnterCallsign => 'Introdu indicativul';

  @override
  String get postLoginOnboardingSwlCallsignHint => 'Ex. YO-12345-SWL';

  @override
  String get timeAgoJustNow => 'chiar acum';

  @override
  String timeAgoMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'acum $count de minute',
      few: 'acum $count minute',
      one: 'acum 1 minut',
    );
    return '$_temp0';
  }

  @override
  String timeAgoHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'acum $count de ore',
      few: 'acum $count ore',
      one: 'acum 1 oră',
    );
    return '$_temp0';
  }

  @override
  String timeAgoDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'acum $count de zile',
      few: 'acum $count zile',
      one: 'acum 1 zi',
    );
    return '$_temp0';
  }

  @override
  String timeAgoWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'acum $count de săptămâni',
      few: 'acum $count săptămâni',
      one: 'acum 1 săptămână',
    );
    return '$_temp0';
  }

  @override
  String timeAgoMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'acum $count de luni',
      few: 'acum $count luni',
      one: 'acum 1 lună',
    );
    return '$_temp0';
  }

  @override
  String timeAgoYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'acum $count de ani',
      few: 'acum $count ani',
      one: 'acum 1 an',
    );
    return '$_temp0';
  }

  @override
  String get profileThemeMode => 'Temă';

  @override
  String get profileThemeModeSystem => 'Sistem';

  @override
  String get profileThemeModeLight => 'Deschisă';

  @override
  String get profileThemeModeDark => 'Întunecată';

  @override
  String get repeaterDetailBeFirstFeedback =>
      'Fii primul care lasă un feedback pe acest repetor!';

  @override
  String get repeaterDetailDistanceFromYou => 'Distanța față de tine';

  @override
  String get repeaterDistanceMapNoLocation => 'Locație indisponibilă';

  @override
  String get repeaterDetailNever => 'Niciodată';

  @override
  String get repeaterDetailInfo => 'Informații';

  @override
  String get repeaterDetailSource => 'Sursă';

  @override
  String get repeaterDetailManager => 'Manager';

  @override
  String get repeaterDetailSuggestManager =>
      'Cunoști managerul repetorului? Raportează-l!';

  @override
  String get repeaterDetailViewFeedbackMap => 'Harta feedback-urilor';

  @override
  String get repeaterDetailViewFeedbackMapSubtitle =>
      'Vezi unde au fost înregistrate aprecierile și rapoartele';

  @override
  String get repeaterDetailAltimetricProfile => 'Profil altimetric';

  @override
  String get repeaterDetailAltimetricProfileSubtitle =>
      'Vezi profilul terenului între tine și repetor';

  @override
  String get repeaterDetailLosClear =>
      'Linie de vizibilitate liberă între tine și repetor';

  @override
  String get repeaterDetailLosObstructed =>
      'Linie de vizibilitate obstrucționată de teren';

  @override
  String get repeaterDetailTerrainProfile => 'Profilul terenului';

  @override
  String get repeaterDetailLineOfSight => 'Linie de vizibilitate';

  @override
  String get repeaterDetailTotalDistance => 'Distanță';

  @override
  String get repeaterDetailRepeaterElevation => 'Altitudinea repetorului';

  @override
  String get repeaterDetailYourElevation => 'Altitudinea ta';

  @override
  String get repeaterDetailYou => 'Tu';

  @override
  String get repeaterDetailRepeaterLabel => 'Repetor';

  @override
  String get repeaterDetailFunFacts => 'Știai că?';

  @override
  String get repeaterDetailWavelength => 'Lungimea de undă';

  @override
  String repeaterDetailWavelengthValue(String value) {
    return 'Lungimea de undă a acestui repetor este $value';
  }

  @override
  String get repeaterDetailOscillations => 'Oscilații pe secundă';

  @override
  String repeaterDetailOscillationsValue(String value) {
    return 'Semnalul oscilează de $value ori pe secundă';
  }

  @override
  String get repeaterDetailPropagationTime => 'Timpul de propagare';

  @override
  String repeaterDetailPropagationTimeValue(String value) {
    return 'Semnalul tău are nevoie de $value pentru a ajunge la repetor';
  }

  @override
  String get repeaterDetailWaveCycles => 'Cicluri de undă în tranzit';

  @override
  String repeaterDetailWaveCyclesValue(String value) {
    return 'Unda completează $value cicluri complete în tranzit';
  }

  @override
  String get userReportsTitle => 'Rapoartele mele';

  @override
  String get userReportsFilterAll => 'Toate';

  @override
  String get userReportsFilterOpen => 'Deschise';

  @override
  String get userReportsFilterClosed => 'Închise';

  @override
  String get userReportsEmpty => 'Niciun raport trimis';

  @override
  String get userReportsEmptyDescription =>
      'Rapoartele tale despre repetoare vor apărea aici';

  @override
  String get userReportsEmptyFiltered => 'Niciun raport cu acest filtru';

  @override
  String get userReportsStatusPending => 'În așteptare';

  @override
  String get userReportsStatusReviewed => 'În curs de analiză';

  @override
  String get userReportsStatusResolved => 'Rezolvat';

  @override
  String get userReportsStatusRejected => 'Respins';

  @override
  String get userReportsRetryBanner => 'Nu s-a putut actualiza lista';

  @override
  String get userReportsProfileTile => 'Rapoartele mele';

  @override
  String get userReportsProfileTileSubtitle => 'Vezi starea rapoartelor tale';

  @override
  String get userReportsError => 'Eroare la încărcarea rapoartelor';

  @override
  String get userReportsCoordinatorResponse => 'Răspunsul coordonatorului';

  @override
  String get potaTitle => 'Spoturi POTA';

  @override
  String get potaSearchHint => 'Caută după activator, parc sau mod…';

  @override
  String get potaNoSpots => 'Niciun spot POTA activ în acest moment.';

  @override
  String get potaLoadError => 'Nu s-au putut încărca spoturile POTA';

  @override
  String get potaRetry => 'Reîncearcă';

  @override
  String get potaViewAll => 'Vezi tot';

  @override
  String get potaActivator => 'Activator';

  @override
  String get potaFrequency => 'Frecvență';

  @override
  String get potaMode => 'Mod';

  @override
  String get potaPark => 'Parc';

  @override
  String get potaReference => 'Referință';

  @override
  String get potaSpotter => 'Spotat de';

  @override
  String get potaComments => 'Comentarii';

  @override
  String get potaLastSpotted => 'Ultima spotare';

  @override
  String get potaOpenQrz => 'QRZ.com';

  @override
  String get potaQrzError => 'Nu s-a putut deschide QRZ.com';

  @override
  String get potaParkWebsite => 'Site-ul parcului';

  @override
  String get potaParkType => 'Tipul parcului';

  @override
  String get potaLocation => 'Locație';

  @override
  String get potaCountry => 'Țară';

  @override
  String get potaFirstActivation => 'Prima activare';

  @override
  String get potaBand => 'Bandă';

  @override
  String potaDistanceAway(String distance) {
    return 'la $distance distanță';
  }

  @override
  String potaSpotsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de spoturi active',
      few: '$count spoturi active',
      one: '$count spot activ',
    );
    return '$_temp0';
  }

  @override
  String get potaFilterAll => 'Toate';

  @override
  String get potaFilterBand => 'Bandă';

  @override
  String get potaFilterMode => 'Mod';

  @override
  String get potaSortByTime => 'Cele mai recente';

  @override
  String get potaSortByDistance => 'Cele mai apropiate';

  @override
  String get profileLanguage => 'Limbă';

  @override
  String get profileLanguageSystem => 'Sistem';

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
  String get onboardingSkip => 'Omite';

  @override
  String get onboardingGetStarted => 'Începe';

  @override
  String get onboardingNext => 'Următorul';

  @override
  String get onboardingWelcomeTitle1 => 'Găsește repetoare în apropierea ta';

  @override
  String get onboardingWelcomeSubtitle1 =>
      'Descoperă repetoarele active din zona ta, cu frecvențe, tonuri și detalii tehnice.';

  @override
  String get onboardingWelcomeCredits =>
      'Date despre repetoare furnizate de IZ8WNH';

  @override
  String get onboardingWelcomeTitle2 => 'Filtrează după mod';

  @override
  String get onboardingWelcomeSubtitle2 =>
      'Analog, DMR, C4FM, D-STAR — găsește imediat repetorul potrivit pentru tine.';

  @override
  String get onboardingWelcomeTitle3 => 'Spoturi POTA în timp real';

  @override
  String get onboardingWelcomeSubtitle3 =>
      'Urmărește activările Parks on the Air cu actualizări live, filtre pe bandă și distanță.';

  @override
  String get onboardingWelcomeTitle4 => 'Salvează-ți favoritele';

  @override
  String get onboardingWelcomeSubtitle4 =>
      'Păstrează repetoarele cele mai utilizate la îndemână pentru acces rapid.';

  @override
  String get onboardingLocationTitle => 'Locație';

  @override
  String get onboardingLocationSubtitle =>
      'Folosim locația ta pentru a-ți arăta repetoarele și activările POTA din apropiere.';

  @override
  String get onboardingLocationEnable => 'Activează locația';

  @override
  String get onboardingLocationSkip => 'Nu acum';

  @override
  String get onboardingDiscoveryTitle => 'Primul tău repetor';

  @override
  String get onboardingDiscoverySubtitle => 'Iată ce este în apropierea ta!';

  @override
  String get onboardingDiscoveryViewDetails => 'Vezi detaliile';

  @override
  String get onboardingDiscoveryViewSpot => 'Vezi spotul';

  @override
  String get onboardingDiscoveryExploreMap => 'Explorează harta';

  @override
  String get onboardingDiscoveryNoLocation =>
      'Explorează harta pentru a găsi repetoare și activări POTA';

  @override
  String get onboardingDiscoveryNearbyRepeater => 'Repetor în apropiere';

  @override
  String get onboardingDiscoveryLivePota => 'Spot POTA live';

  @override
  String get onboardingDiscoveryNoRepeaters =>
      'Niciun repetor găsit în apropiere';

  @override
  String get onboardingTelegramTitle => 'Alătură-te comunității';

  @override
  String get onboardingTelegramSubtitle =>
      'Alătură-te grupului Telegram HamQRG pentru a primi actualizări, a raporta repetoare și a cunoaște alți radioamatori.';

  @override
  String get onboardingTelegramJoin => 'Alătură-te grupului Telegram';

  @override
  String get onboardingTelegramLater => 'Poate mai târziu';

  @override
  String get onboardingTelegramAlreadyMember => 'Sunt deja membru';

  @override
  String get addRepeaterProfileTile => 'Sugerează un repetor nou';

  @override
  String get addRepeaterProfileTileSubtitle =>
      'Raportează un repetor care nu este încă listat';

  @override
  String get addRepeaterTitle => 'Repetor nou';

  @override
  String get addRepeaterHeadline => 'Raportează un repetor lipsă';

  @override
  String get addRepeaterDescription =>
      'Completează detaliile repetorului pe care dorești să-l adaugi. Propunerea va fi analizată înainte de publicare.';

  @override
  String get addRepeaterSectionRepeater => 'Datele repetorului';

  @override
  String get addRepeaterSectionAccesses => 'Accese';

  @override
  String get addRepeaterSectionLocation => 'Locație';

  @override
  String get addRepeaterSectionNotes => 'Note';

  @override
  String get addRepeaterName => 'Nume';

  @override
  String get addRepeaterNameHint => 'Ex. Muntele Penteleu';

  @override
  String get addRepeaterCallsign => 'Indicativ';

  @override
  String get addRepeaterCallsignHint => 'Ex. YO3AB';

  @override
  String get addRepeaterNameOrCallsignRequired =>
      'Introdu cel puțin un nume sau indicativ';

  @override
  String get addRepeaterFrequency => 'Frecvență (MHz)';

  @override
  String get addRepeaterFrequencyHint => 'Ex. 145.000 sau 145,000';

  @override
  String get addRepeaterFrequencyRequired => 'Frecvența este obligatorie';

  @override
  String get addRepeaterFrequencyInvalid => 'Frecvență invalidă';

  @override
  String get addRepeaterShift => 'Deplasare (MHz)';

  @override
  String get addRepeaterShiftHint => 'Ex. -0.600 sau -0,600';

  @override
  String get addRepeaterRegion => 'Regiune';

  @override
  String get addRepeaterRegionHint => 'Ex. Muntenia';

  @override
  String get addRepeaterProvinceCode => 'Județ';

  @override
  String get addRepeaterProvinceCodeHint => 'Ex. BV';

  @override
  String get addRepeaterLocality => 'Localitate';

  @override
  String get addRepeaterLocalityHint => 'Ex. Brașov';

  @override
  String get addRepeaterLatitude => 'Latitudine';

  @override
  String get addRepeaterLatitudeHint => 'Ex. 44.2100';

  @override
  String get addRepeaterLongitude => 'Longitudine';

  @override
  String get addRepeaterLongitudeHint => 'Ex. 10.7900';

  @override
  String get addRepeaterLocator => 'Locator';

  @override
  String get addRepeaterLocatorHint => 'Ex. KN25QF';

  @override
  String get addRepeaterNotes => 'Note suplimentare';

  @override
  String get addRepeaterNotesHint =>
      'Informații suplimentare despre repetor...';

  @override
  String get addRepeaterAddAccess => 'Adaugă acces';

  @override
  String get addRepeaterRemoveAccess => 'Elimină';

  @override
  String get addRepeaterAccessMode => 'Mod';

  @override
  String get addRepeaterAccessCtcssTx => 'CTCSS TX (Hz)';

  @override
  String get addRepeaterAccessCtcssTxHint => 'Ex. 88.5';

  @override
  String get addRepeaterAccessCtcssRx => 'CTCSS RX (Hz)';

  @override
  String get addRepeaterAccessCtcssRxHint => 'Ex. 88.5';

  @override
  String get addRepeaterAccessDcsCode => 'Cod DCS';

  @override
  String get addRepeaterAccessDcsCodeHint => 'Ex. 23';

  @override
  String get addRepeaterAccessColorCode => 'Color Code';

  @override
  String get addRepeaterAccessColorCodeHint => 'Ex. 1';

  @override
  String get addRepeaterAccessTalkgroup => 'Talkgroup';

  @override
  String get addRepeaterAccessTalkgroupHint => 'Ex. 222801';

  @override
  String get addRepeaterAccessDgId => 'DG-ID';

  @override
  String get addRepeaterAccessDgIdHint => 'Ex. 0';

  @override
  String get addRepeaterAccessNodeId => 'ID nod';

  @override
  String get addRepeaterAccessNodeIdHint => 'Ex. 1234';

  @override
  String get addRepeaterAccessNetworkName => 'Numele rețelei';

  @override
  String get addRepeaterAccessNetworkNameHint => 'Ex. BM Italia';

  @override
  String get addRepeaterAccessNotes => 'Note acces';

  @override
  String get addRepeaterAccessNotesHint => 'Note specifice acestui acces...';

  @override
  String get addRepeaterConfirmCheckbox =>
      'Confirm că aceste informații sunt corecte conform cunoștințelor mele.';

  @override
  String get addRepeaterVerifiedTitle => 'Propunere verificată';

  @override
  String get addRepeaterVerifiedDescription =>
      'Propunerea ta va fi analizată de echipă înainte de publicarea în baza de date.';

  @override
  String get addRepeaterSubmit => 'Trimite';

  @override
  String get addRepeaterSuccess => 'Propunerea a fost trimisă cu succes!';

  @override
  String get addRepeaterError => 'Eroare la trimiterea propunerii';

  @override
  String get addRepeaterAtLeastOneAccess => 'Adaugă cel puțin un acces';

  @override
  String addRepeaterAccessNumber(int number) {
    return 'Acces $number';
  }

  @override
  String get changelog1017PotaSpots =>
      'Spoturi POTA în timp real cu hartă și detalii despre parcuri';

  @override
  String get changelog1017SubmitRepeater =>
      'Sugerează un repetor nou direct din aplicație';

  @override
  String get changelog1017MultiLanguage =>
      'Aplicație disponibilă în engleză, spaniolă și franceză';

  @override
  String get changelog1017Onboarding => 'Experiență nouă la prima lansare';

  @override
  String get changelog1017ReportAnonymous =>
      'Rapoarte disponibile fără înregistrare';

  @override
  String get changelogTitle => 'Ce este nou';

  @override
  String get changelogSubtitle => 'Iată ce este nou în această versiune';

  @override
  String get changelogCategoryAdded => 'Nou';

  @override
  String get changelogCategoryImproved => 'Îmbunătățit';

  @override
  String get changelogCategoryFixed => 'Corectat';

  @override
  String get changelogDismiss => 'Am înțeles!';

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
}
