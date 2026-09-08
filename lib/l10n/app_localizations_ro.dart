// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get proSectionTitle => 'Abonament';

  @override
  String get proCardUpgradeTitle => 'Descoperă ce prinzi';

  @override
  String get proCardUpgradeSubtitle => 'Acoperire, relee și hărți offline';

  @override
  String get proCardActiveTitle => 'HamQRG Pro activ';

  @override
  String get proCardActiveSubtitle => 'Mulțumim pentru sprijin!';

  @override
  String proPriceFromMonth(String price) {
    return 'De la $price pe lună · Anulezi oricând';
  }

  @override
  String proPriceTrialThenMonth(String price) {
    return 'Probă gratuită, apoi $price pe lună · Anulezi oricând';
  }

  @override
  String proPriceLifetime(String price) {
    return '$price o singură dată · Pentru totdeauna';
  }

  @override
  String proPriceFromMonthUpfront(String price, String total) {
    return 'De la $price pe lună · $total în avans · Anulezi oricând';
  }

  @override
  String proPriceTrialThenMonthUpfront(String price, String total) {
    return 'Probă gratuită, apoi $price pe lună · $total în avans · Anulezi oricând';
  }

  @override
  String get proRestoreSuccess => 'Achiziții restaurate: HamQRG Pro este activ';

  @override
  String get proRestoreNone => 'Nicio achiziție de restaurat';

  @override
  String get proManageSubscription => 'Gestionează abonamentul';

  @override
  String get proLinkAccountTitle => 'Conectează-ți contul';

  @override
  String get proLinkAccountBody =>
      'Conectează HamQRG Pro la un cont ca să îl păstrezi pe orice dispozitiv, chiar și după o reinstalare.';

  @override
  String get stationsShowcaseTitle => 'Locațiile tale, chiar și fără rețea';

  @override
  String get stationsShowcaseBody =>
      'Salvează casa, refugiul, locul de activare: ce prinzi rămâne acolo și fără rețea.';

  @override
  String get offlineMapsUpsellTitle => 'Harta rămâne în telefon 🗺️';

  @override
  String get offlineMapsUpsellBody =>
      'Descarcă zonele de care ai nevoie și deschide-le unde nu e semnal: pe creastă, în tunel, în străinătate fără date.';

  @override
  String get offlineMapsBenefitRegions => 'Tu alegi ce zone descarci';

  @override
  String get reachUpsellBenefitSignal => 'Semnal estimat pentru fiecare releu';

  @override
  String get reachUpsellBenefitTerrain =>
      'Profilul terenului dintre tine și releu';

  @override
  String get proRestoreCta => 'Restaurează achizițiile';

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
  String repeaterDetailDistanceWarning(String distance) {
    return 'Trebuie să fii la maximum $distance de repetor pentru a trimite feedback.';
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
    return 'Locația selectată este la $distance de repetor. Confirmi că vrei să trimiți acest feedback pe propria răspundere?';
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
  String get repeaterCoverageTitle => 'Acoperire';

  @override
  String get repeaterCoverageCardTitle => 'Hartă de acoperire';

  @override
  String get repeaterCoverageCardSubtitle =>
      'Estimează semnalul releului pe teritoriu';

  @override
  String get repeaterCoverageLoading => 'Se calculează acoperirea…';

  @override
  String get repeaterCoverageError => 'Acoperirea nu a putut fi calculată';

  @override
  String get repeaterCoverageRetry => 'Reîncearcă';

  @override
  String get repeaterCoverageLegendTitle => 'Semnal estimat (dBm)';

  @override
  String get repeaterCoverageCta => 'Vezi acoperirea';

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
  String get userReportsTitle => 'Activitățile mele';

  @override
  String get userReportsTabReports => 'Raportări';

  @override
  String get userReportsTabSubmissions => 'Repetoare noi';

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
  String get userSubmissionsEmpty => 'Niciun repetor propus';

  @override
  String get userSubmissionsEmptyDescription =>
      'Repetoarele propuse vor apărea aici';

  @override
  String get userSubmissionsEmptyFiltered => 'Niciun repetor cu acest filtru';

  @override
  String get userSubmissionsStatusPending => 'În așteptare';

  @override
  String get userSubmissionsStatusApproved => 'Aprobat';

  @override
  String get userSubmissionsStatusRejected => 'Respins';

  @override
  String get userSubmissionsCoordinatorResponse => 'Răspuns coordonator';

  @override
  String get userSubmissionsFrequency => 'Frecvență';

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
  String get profileUnitSystem => 'Unități de măsură';

  @override
  String get profileUnitSystemAuto => 'Automat';

  @override
  String get profileUnitSystemMetric => 'Metric';

  @override
  String get profileUnitSystemImperial => 'Imperial';

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
  String get changelog1020ClusterSpots =>
      'Cluster spot în timp real: vezi cine ascultă pe repetoare, cu notificări și preferințe';

  @override
  String get changelog1020DetailTabs =>
      'Pagina repetorului cu filele Info, Cluster și Comunitate';

  @override
  String get changelog1020TabletLayout => 'Aspect optimizat pentru tablete';

  @override
  String get changelog110Coverage =>
      'Hartă de acoperire a releelor: vezi semnalul estimat direct pe hartă (PRO)';

  @override
  String get changelog110Reachable =>
      'Ce prinzi de aici: descoperă releele pe care le atingi din poziția ta, cu semnal și profilul terenului (PRO)';

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
  String get spotCreateTitle => 'Spottează-te';

  @override
  String get spotCreateOtherTitle => 'Spottează un OM';

  @override
  String get spotCreateDuration => 'Durată';

  @override
  String get spotCreateAccess => 'Mod (opțional)';

  @override
  String get spotCreateCallsign => 'Indicativul OM-ului auzit';

  @override
  String get spotCreateCallsignHint => 'Ex. YO1ABC';

  @override
  String get spotCreateConfirm => 'Confirmă';

  @override
  String get spotCreateSuccessSelf => 'Spot creat!';

  @override
  String get spotCreateSuccessOther => 'OM spottat!';

  @override
  String get spotActiveYou => 'Ești spottat';

  @override
  String get spotActiveClose => 'Închide spot';

  @override
  String spotActiveOn(String repeaterName) {
    return 'pe $repeaterName';
  }

  @override
  String get spotActiveNone => 'Nimeni spottat momentan';

  @override
  String get spotActiveCta => 'Fii primul!';

  @override
  String get spotActiveSection => 'Spoturi active';

  @override
  String get spotHistorySection => 'Istoric spoturi';

  @override
  String get spotListTitle => 'Ultimele spoturi';

  @override
  String get spotListViewAll => 'Vezi toate';

  @override
  String get spotListBadgeActive => 'Ascultă';

  @override
  String get spotListBadgeClosed => 'Încheiat';

  @override
  String get spotListBadgeReport => 'Raportează';

  @override
  String get spotListEmpty => 'Niciun spot în ultimele 24 de ore';

  @override
  String spotListSpottedBy(String callsign) {
    return 'Raportat de $callsign';
  }

  @override
  String get spotNotificationToggle => 'Notificări cluster';

  @override
  String get spotNotificationDisabled =>
      'Notificările cluster sunt dezactivate în setările profilului';

  @override
  String get spotNotificationPerFavorite => 'Notificări de spoturi';

  @override
  String get spotPreviousClosed => 'Spotul tău anterior nu mai este activ';

  @override
  String get spotErrorAuthRequired => 'Trebuie să fii autentificat.';

  @override
  String get spotErrorCallsignRequired =>
      'Setează indicativul în profil pentru a folosi clusterul.';

  @override
  String get spotErrorInvalidDuration =>
      'Durata trebuie să fie între 5 și 60 de minute.';

  @override
  String get spotErrorRepeaterNotFound => 'Repetor negăsit.';

  @override
  String get spotErrorInvalidAccess =>
      'Mod de acces invalid pentru acest repetor.';

  @override
  String get spotErrorSpotNotFound => 'Spot negăsit.';

  @override
  String get spotErrorForbidden =>
      'Nu poți închide un spot care nu este al tău.';

  @override
  String get spotErrorAlreadyClosed => 'Spotul este deja închis.';

  @override
  String get spotErrorGeneric =>
      'Eroare la crearea spotului. Încearcă din nou.';

  @override
  String get spotAccessUnavailable => '(mod nu mai este disponibil)';

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
  String get spotsFiltersTitle => 'Filtre';

  @override
  String get spotsFilterBand => 'Bandă';

  @override
  String get spotsFilterMode => 'Mod';

  @override
  String get spotsFilterAll => 'Toate';

  @override
  String get spotsFiltersReset => 'Șterge filtrele';

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
  String get reachSheetError => 'Nu s-au putut calcula releele accesibile.';

  @override
  String reachSheetCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Atingi $count de relee',
      few: 'Atingi $count relee',
      one: 'Atingi 1 releu',
    );
    return '$_temp0';
  }

  @override
  String get reachSheetSubtitle => 'Din locația ta, sortate după semnal';

  @override
  String get reachSheetEmpty => 'Niciun releu accesibil în apropiere.';

  @override
  String get reachBadgeTitle => 'Îl atingi de aici?';

  @override
  String get reachBadgeSubtitle =>
      'Află dacă acest releu te acoperă și cu ce semnal';

  @override
  String get reachDiscoverCta => 'Descoperă cu PRO';

  @override
  String get reachReachable => 'Îl atingi';

  @override
  String get reachOutOfCoverage => 'În afara acoperirii';

  @override
  String reachReachableDetail(String signal, String distance) {
    return '$signal · $distance · atinge pentru profil';
  }

  @override
  String reachDistanceFromHere(String distance) {
    return '$distance de aici';
  }

  @override
  String get reachComputing => 'Se calculează acoperirea…';

  @override
  String get reachRepeaterFallback => 'Releu';

  @override
  String get reachMapButton => 'Ce atingi?';

  @override
  String get reachUpsellTitle => 'Ce atingi de aici? 📡';

  @override
  String get reachUpsellBody =>
      'Vezi în timp real TOATE releele pe care le prinzi din locația ta, cu semnal estimat și profil al terenului. Câte atingi cu adevărat de unde ești acum?';

  @override
  String get reachUpsellLater => 'Mai târziu';

  @override
  String get linkProfileObstructed =>
      'Obstacol pe traseu (semnal prin difracție)';

  @override
  String get linkProfileClear => 'Linie de vedere liberă';

  @override
  String linkProfileCaption(String tx, String rx) {
    return 'Profilul terenului și linia de vedere · TX $tx · RX $rx';
  }

  @override
  String get proUnlockCta => 'Deblochează cu PRO';

  @override
  String get proWelcomeTitle => 'Bine ai venit în PRO! 🎉';

  @override
  String get proWelcomeBody =>
      'Ai deblocat harta de acoperire, releele pe care le atingi din locația ta și toate funcțiile PRO. 📡';

  @override
  String get proWelcomeCta => 'Începe să explorezi';

  @override
  String get commonCancel => 'Anulează';

  @override
  String get commonDelete => 'Șterge';

  @override
  String get commonEdit => 'Editează';

  @override
  String get commonOpenSettings => 'Deschide setările';

  @override
  String get commonFieldRequired => 'Câmp obligatoriu';

  @override
  String get fieldName => 'Nume';

  @override
  String get fieldAddress => 'Adresă';

  @override
  String get fieldCity => 'Oraș';

  @override
  String get fieldDescription => 'Descriere';

  @override
  String get fieldYear => 'An';

  @override
  String get fieldSelectDateHint => 'Selectează o dată';

  @override
  String get validationInvalidYear => 'Selectează un an valid';

  @override
  String get validationPasswordMinLength =>
      'Parola trebuie să aibă cel puțin 6 caractere';

  @override
  String get permissionsMissingTitle => 'Lipsesc permisiunile!';

  @override
  String get imageUploadError => 'Eroare la încărcarea imaginii';

  @override
  String get uploadImageLabel => 'Încarcă imagine';

  @override
  String get sourceGallery => 'Galerie';

  @override
  String get sourceCamera => 'Cameră';

  @override
  String get changePasswordTitle => 'Schimbă parola';

  @override
  String get fieldNewPassword => 'Parolă nouă';

  @override
  String get fieldConfirmNewPassword => 'Confirmă parola nouă';

  @override
  String get validationPasswordsNoMatch => 'Parolele nu coincid';

  @override
  String get passwordChangedSuccess => 'Parolă schimbată cu succes';

  @override
  String errorWithMessage(String message) {
    return 'Eroare: $message';
  }

  @override
  String get updateRequiredTitle => 'Actualizare necesară';

  @override
  String get updateRequiredAction => 'Actualizează acum';

  @override
  String get yearPickerTitle => 'Selectează anul';

  @override
  String get repeaterTabInfo => 'Info';

  @override
  String get repeaterTabCluster => 'Cluster';

  @override
  String get repeaterTabCommunity => 'Comunitate';

  @override
  String get updateRequiredBody =>
      'Este disponibilă o nouă versiune a aplicației. Actualizează pentru a o folosi în continuare.';

  @override
  String get errorOpeningStore => 'Eroare la deschiderea magazinului';

  @override
  String get deleteConfirmTitle => 'Confirmă ștergerea';

  @override
  String get deleteConfirmContent => 'Sigur vrei să ștergi?';

  @override
  String get cameraPermissionRationale =>
      'Pentru a face o fotografie, permite accesul la cameră în setări.';

  @override
  String get coverageSearchHint => 'Caută o localitate sau lipește coordonate';

  @override
  String get coverageSearchRecentTitle => 'Căutări recente';

  @override
  String get coverageSearchNoResults => 'Niciun loc găsit';

  @override
  String get coverageSearchTip =>
      'Poți lipi coordonate (46.4879, 11.8123) sau apăsa lung pe hartă';

  @override
  String get coverageSearchErrorOutOfRange =>
      'Coordonate în afara intervalului: latitudine ±90, longitudine ±180';

  @override
  String get coverageSearchErrorOffline =>
      'Fără conexiune: căutarea locurilor necesită rețea';

  @override
  String get coverageSearchErrorFailed => 'Căutarea a eșuat. Încearcă din nou.';

  @override
  String get coverageSearchClearPoint => 'Elimină punctul';

  @override
  String get coverageSearchPointSemantics => 'Punct de căutare selectat';

  @override
  String get coverageBreadthTitle => 'Amploarea căutării';

  @override
  String get coverageBreadthQuick => 'Rapidă';

  @override
  String get coverageBreadthMedium => 'Medie';

  @override
  String get coverageBreadthExtended => 'Extinsă';

  @override
  String coverageBreadthQuickHint(String radius) {
    return '$radius · cel mai rapid răspuns';
  }

  @override
  String coverageBreadthMediumHint(String radius) {
    return '$radius · echilibrată';
  }

  @override
  String coverageBreadthExtendedHint(String radius) {
    return '$radius · mai departe, așteptare mai lungă';
  }

  @override
  String get coverageResultSubtitle => 'Din punctul selectat';

  @override
  String get coverageResultEmptyNoReachable =>
      'Niciun releu nu este accesibil din acest punct';

  @override
  String get coverageResultEmptyNoRepeaters =>
      'Niciun releu înregistrat în această zonă';

  @override
  String get coverageResultClearFilters => 'Elimină filtrele';

  @override
  String get coverageResultError => 'Calculul a eșuat';

  @override
  String get coverageResultComputing => 'Se calculează recepția…';

  @override
  String get coverageResultCancel => 'Anulează';

  @override
  String coverageResultCount(int count) {
    return 'Relee accesibile: $count';
  }

  @override
  String coverageResultCountFiltered(int shown, int total) {
    return '$shown din $total accesibile';
  }

  @override
  String coverageResultHiddenByFilters(int count) {
    return 'Ascunse de filtre: $count';
  }

  @override
  String coverageTeaserTitle(String place) {
    return 'Ce prinzi din $place? 📡';
  }

  @override
  String get coverageTeaserBody =>
      'Fiecare releu pe care îl prinzi din acel punct, cu semnal estimat și distanță — încă înainte să pleci.';

  @override
  String get coverageTeaserBenefitAnywhere => 'Orice punct de pe planetă';

  @override
  String get coverageTeaserBenefitOffline => 'Consultabil fără rețea, pe teren';

  @override
  String get coverageTeaserBenefitSave => 'Salvezi postul și îl regăsești';

  @override
  String get stationSaveCta => 'Salvează postul';

  @override
  String get stationSaveTitle => 'Numele postului';

  @override
  String get stationRename => 'Redenumește';

  @override
  String get stationDelete => 'Șterge';

  @override
  String get stationRefresh => 'Actualizează';

  @override
  String get stationRefreshAll => 'Actualizează tot';

  @override
  String get stationOfflineNotice => 'Date stocate pe dispozitiv';

  @override
  String get stationStaleNotice => 'Datele ar putea fi neactualizate';

  @override
  String get stationMissingEntry => 'Date indisponibile offline';

  @override
  String get stationDuplicateTitle => 'Punct deja salvat';

  @override
  String stationDuplicateBody(String distance) {
    return 'Există deja un post la mai puțin de $distance. Îl actualizezi sau creezi unul separat?';
  }

  @override
  String get stationDuplicateUpdate => 'Actualizează';

  @override
  String get stationDuplicateCreate => 'Creează separat';

  @override
  String get stationSaveFailed => 'Salvarea a eșuat: spațiu insuficient';

  @override
  String get stationSavedCta => 'Locație salvată';

  @override
  String get stationRemoveCta => 'Elimină';

  @override
  String get stationRemoveTitle => 'Eliminați locația?';

  @override
  String stationRemoveBody(String name) {
    return '„$name” și datele sale offline vor fi șterse de pe acest dispozitiv.';
  }

  @override
  String get stationRemovedSnack => 'Locație eliminată';

  @override
  String get stationSaveError => 'Salvarea nu a reușit. Încercați din nou.';

  @override
  String get stationsTitle => 'Posturile mele';

  @override
  String get stationsProfileSubtitle =>
      'Punctele pe care le-ai evaluat, disponibile și fără rețea';

  @override
  String get stationsEmptyTitle => 'Niciun post salvat';

  @override
  String get stationsEmptyBody =>
      'O locație este un punct de pe hartă pentru care ai calculat deja acoperirea, salvat ca să îl regăsești și fără rețea.';

  @override
  String get stationsEmptyStep1 =>
      'Alege un punct pe hartă: ține apăsat, caută-l după nume sau lipește coordonatele.';

  @override
  String stationsEmptyStep2(String action) {
    return 'Atinge «$action» ca să vezi ce relee prinzi de acolo.';
  }

  @override
  String get stationsEmptyStep3 =>
      'Salvează punctul: îl regăsești aici, chiar și pe teren fără rețea.';

  @override
  String get stationsGoToMap => 'Mergi la hartă';

  @override
  String get stationsRefreshDone => 'Actualizare finalizată';

  @override
  String spotsUpdatedAgo(String time) {
    return 'Actualizat $time';
  }

  @override
  String spotsNextUpdateSeconds(int seconds) {
    return 'Actualizare în $seconds s';
  }

  @override
  String spotsNextUpdateMinutes(int minutes) {
    return 'Actualizare în $minutes min';
  }

  @override
  String get spotsUpdating => 'Se actualizează…';

  @override
  String spotsAutoRefreshHint(int seconds) {
    return 'Actualizare automată la fiecare $seconds secunde';
  }

  @override
  String get spotsManualRefreshHint => 'Atinge pentru actualizare';

  @override
  String coverageResultScope(String km, int count) {
    return 'pe o rază de $km · $count evaluate';
  }

  @override
  String get coverageResultRecalculating => 'Se recalculează';

  @override
  String get offlineBannerMessage => 'Ești offline: vezi datele salvate';

  @override
  String get offlineMapsTitle => 'Hărți offline';

  @override
  String get offlineMapsEntrySubtitle =>
      'Descarcă hărți pentru utilizare fără conexiune';

  @override
  String get offlineMapsEmpty =>
      'Nicio regiune descărcată. Descarcă o zonă pentru a vedea harta chiar și fără conexiune.';

  @override
  String get offlineMapsAddRegion => 'Descarcă regiune';

  @override
  String get offlineMapsRegionNameLabel => 'Numele regiunii';

  @override
  String get offlineMapsRegionNameHint => 'Ex. Acasă, Cabană, Activare SOTA';

  @override
  String get offlineMapsRadiusLabel => 'Rază';

  @override
  String get offlineMapsDownload => 'Descarcă';

  @override
  String get offlineMapsDownloadingStyle => 'Se descarcă stilul hărții…';

  @override
  String offlineMapsDownloadingTiles(String percent) {
    return 'Se descarcă hărțile… $percent%';
  }

  @override
  String offlineMapsEstimatedSize(String size) {
    return 'Dimensiune estimată: $size';
  }

  @override
  String get offlineMapsDownloadError =>
      'Descărcarea a eșuat. Încearcă din nou.';

  @override
  String get offlineMapsDeleteError => 'Ștergerea a eșuat. Încearcă din nou.';

  @override
  String get offlineMapsDeleteConfirmTitle => 'Ștergi regiunea?';

  @override
  String offlineMapsDeleteConfirmMessage(String name) {
    return '„$name” nu va mai fi disponibilă offline.';
  }

  @override
  String get offlineMapsDeleteConfirm => 'Șterge';

  @override
  String offlineMapsRegionSubtitle(String radius, String size) {
    return 'Rază $radius · $size';
  }

  @override
  String get offlineMapsIncomplete => 'Descărcare incompletă';

  @override
  String get offlineMapsResume => 'Reia';

  @override
  String get offlineMapsCenterInfo =>
      'Regiunea va fi centrată pe poziția ta actuală.';

  @override
  String get dashboardOfflineTitle => 'Ești offline';

  @override
  String get dashboardOfflineMessage =>
      'Nu există date salvate pentru această zonă. Locațiile salvate și hărțile descărcate rămân disponibile.';

  @override
  String get offlineMapsCenterMine => 'Poziția mea';

  @override
  String get offlineMapsCenterSearch => 'Caută un loc';

  @override
  String get offlineMapsCenterSearchInfo =>
      'Caută un oraș sau un loc: regiunea va fi centrată acolo.';

  @override
  String offlineMapsCenterSelected(String label) {
    return 'Centru: $label';
  }

  @override
  String get changelog120OfflineMode =>
      'Mod offline: repetoare, favorite, profil, acoperire și accesibilitate disponibile și fără rețea (PRO)';

  @override
  String get changelog120OfflineMaps =>
      'Hărți offline: descarcă zona în care te afli sau un loc la alegere și folosește-o fără conexiune (PRO)';

  @override
  String get changelog120CoverageSearch =>
      'Căutare acoperire din orice punct: caută o localitate, lipește coordonate sau apasă lung pe hartă pentru a descoperi ce atingi de acolo';

  @override
  String get changelog120SavedStations =>
      'Stațiile mele: salvează punctele care te interesează și consultă-le și offline (PRO)';

  @override
  String get changelog120SpotsRefresh =>
      'Spoturile SOTA și POTA se actualizează singure în fiecare minut, cu insigne colorate pe mod (CW, SSB, FT8…)';

  @override
  String get changelog120NoNetwork =>
      'Fără conexiune aplicația pornește imediat, arată ce este disponibil și dezactivează acțiunile care necesită rețea';

  @override
  String get changelog130ImperialUnits =>
      'Mile și picioare: aplicația urmează acum unitățile dispozitivului, iar sistemul poate fi ales din Setări';
}
