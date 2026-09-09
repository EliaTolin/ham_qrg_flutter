// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovak (`sk`).
class AppLocalizationsSk extends AppLocalizations {
  AppLocalizationsSk([String locale = 'sk']) : super(locale);

  @override
  String get proSectionTitle => 'Predplatné';

  @override
  String get proCardUpgradeTitle => 'Zisti, čo dosiahneš';

  @override
  String get proCardUpgradeSubtitle => 'Pokrytie, prevádzače a offline mapy';

  @override
  String get proCardActiveTitle => 'HamQRG Pro aktívny';

  @override
  String get proCardActiveSubtitle => 'Ďakujeme za podporu!';

  @override
  String proPriceFromMonth(String price) {
    return 'Od $price mesačne · Kedykoľvek zrušíš';
  }

  @override
  String proPriceTrialThenMonth(String price) {
    return 'Skúšobná verzia zdarma, potom $price mesačne · Kedykoľvek zrušíš';
  }

  @override
  String proPriceLifetime(String price) {
    return '$price jednorazovo · Navždy';
  }

  @override
  String proPriceFromMonthUpfront(String price, String total) {
    return 'Od $price mesačne · $total vopred · Kedykoľvek zrušíš';
  }

  @override
  String proPriceTrialThenMonthUpfront(String price, String total) {
    return 'Skúšobná verzia zdarma, potom $price mesačne · $total vopred · Kedykoľvek zrušíš';
  }

  @override
  String get proRestoreSuccess => 'Nákupy obnovené: HamQRG Pro je aktívny';

  @override
  String get proRestoreNone => 'Žiadne nákupy na obnovenie';

  @override
  String get proManageSubscription => 'Spravovať predplatné';

  @override
  String get proLinkAccountTitle => 'Prepoj svoj účet';

  @override
  String get proLinkAccountBody =>
      'Prepoj HamQRG Pro s účtom, aby ti zostalo na všetkých zariadeniach aj po preinštalovaní.';

  @override
  String get stationsShowcaseTitle => 'Tvoje stanovištia aj bez siete';

  @override
  String get stationsShowcaseBody =>
      'Ulož domov, chatu, aktivačné miesto: čo dosiahneš, zostane aj bez siete.';

  @override
  String get offlineMapsUpsellTitle => 'Mapa zostane v telefóne 🗺️';

  @override
  String get offlineMapsUpsellBody =>
      'Stiahni si oblasti, ktoré potrebuješ, a otvor ich tam, kde nie je signál: na hrebeni, v tuneli, v zahraničí bez dát.';

  @override
  String get offlineMapsBenefitRegions =>
      'Sám si vyberieš oblasti na stiahnutie';

  @override
  String get reachUpsellBenefitSignal =>
      'Predpokladaný signál pre každý prevádzač';

  @override
  String get reachUpsellBenefitTerrain =>
      'Profil terénu medzi tebou a prevádzačom';

  @override
  String get proRestoreCta => 'Obnoviť nákupy';

  @override
  String get error => 'Chyba';

  @override
  String get error_message => 'Pri načítavaní sa vyskytla chyba';

  @override
  String get error_message_retry =>
      'Pri načítavaní sa vyskytla chyba. Skúste to prosím neskôr';

  @override
  String get retry => 'Skúsiť znova';

  @override
  String get back => 'Späť';

  @override
  String get loading => 'Načítavanie';

  @override
  String get details => 'Podrobnosti';

  @override
  String pages_number(Object number) {
    return '$number stránok na preskúmanie';
  }

  @override
  String get january => 'Január';

  @override
  String get february => 'Február';

  @override
  String get march => 'Marec';

  @override
  String get april => 'Apríl';

  @override
  String get may => 'Máj';

  @override
  String get june => 'Jún';

  @override
  String get july => 'Júl';

  @override
  String get august => 'August';

  @override
  String get september => 'September';

  @override
  String get october => 'Október';

  @override
  String get november => 'November';

  @override
  String get december => 'December';

  @override
  String get logout => 'Odhlásiť sa';

  @override
  String get profile => 'Profil';

  @override
  String get settings => 'Nastavenia';

  @override
  String get contact_us => 'Kontaktujte nás';

  @override
  String get error_opening_email => 'Pri otváraní e-mailu sa vyskytla chyba';

  @override
  String get register_now => 'Zaregistrujte sa';

  @override
  String get tracking_permission_title => 'Podporte aplikáciu';

  @override
  String get tracking_permission_message =>
      'Na zlepšenie vášho zážitku a zobrazenie relevantnejšieho obsahu nám pomôžte udržať aplikáciu zadarmo.\n\nKlepnite na Povoliť a podporte nás.';

  @override
  String get tracking_permission_next => 'Ďalej';

  @override
  String get skip => 'Preskočiť';

  @override
  String get done => 'Hotovo';

  @override
  String get next => 'Ďalej';

  @override
  String get joinCommunityTitle => 'Pridajte sa k našej komunite!';

  @override
  String get joinCommunityDescription =>
      'Objavte výhody členstva v komunite na Telegrame:';

  @override
  String get benefitSupportMembers => 'Podpora od členov';

  @override
  String get benefitSuggestFeatures => 'Navrhovanie nových funkcií';

  @override
  String get benefitContactDevelopers => 'Kontakt s vývojármi';

  @override
  String get benefitExclusivePreviews => 'Exkluzívne ukážky a beta verzie';

  @override
  String get benefitActiveCommunity => 'Aktívna komunita';

  @override
  String get joinNowButton => 'Pridať sa teraz!';

  @override
  String get alreadyMemberButton => 'Už som členom';

  @override
  String get laterButton => 'Neskôr';

  @override
  String get errorOpenTelegram => 'Chyba pri otváraní Telegramu';

  @override
  String get disclaimerTitle => 'Zdroj údajov';

  @override
  String get disclaimerDescription =>
      'Údaje o prevádzačoch v tejto aplikácii pochádzajú od IZ8WNH.\n\nĎalšie informácie, stiahnutie CSV súborov na programovanie rádií alebo konzultáciu údajov, ktoré nie sú v tejto aplikácii k dispozícii, nájdete na oficiálnej webovej stránke.';

  @override
  String get disclaimerVisitSite => 'Navštíviť iz8wnh.it';

  @override
  String get disclaimerUnderstood => 'Rozumiem';

  @override
  String get errorOpenDisclaimerSite => 'Chyba pri otváraní webovej stránky';

  @override
  String get repeatersMapTitle => 'Mapa prevádzačov';

  @override
  String get repeatersListTitle => 'Zoznam prevádzačov';

  @override
  String get repeatersMapLoading => 'Načítavanie mapy prevádzačov…';

  @override
  String get repeatersMapGenericError => 'Nepodarilo sa načítať prevádzače.';

  @override
  String get repeatersMapEmpty => 'V okolí neboli nájdené žiadne prevádzače.';

  @override
  String get repeatersSearchHint =>
      'Hľadať podľa názvu, volacieho znaku alebo frekvencie MHz…';

  @override
  String get repeatersSearchEmpty => 'Žiadne prevádzače neboli nájdené.';

  @override
  String get repeatersSortDistance => 'Vzdialenosť';

  @override
  String get repeatersSortLikes => 'Hodnotenia';

  @override
  String get repeatersSortFrequency => 'Frekvencia';

  @override
  String repeatersNearbyCount(int count) {
    return '$count prevádzačov v okolí';
  }

  @override
  String repeatersResultsCount(int count) {
    return '$count výsledkov';
  }

  @override
  String get repeatersMapRetry => 'Skúsiť znova';

  @override
  String get repeatersMapOpenSettings => 'Otvoriť nastavenia';

  @override
  String get repeatersMapPermissionMessage =>
      'Povoľte prístup k polohe na zobrazenie prevádzačov v okolí.';

  @override
  String get repeatersMapPermissionPermanentlyDenied =>
      'Oprávnenie na polohu bolo trvalo zamietnuté. Povoľte ho v nastaveniach systému.';

  @override
  String get repeatersMapLocationServicesDisabled =>
      'Povoľte lokalizačné služby na nájdenie prevádzačov v okolí.';

  @override
  String repeatersMapFound(int count) {
    return '$count nájdených prevádzačov';
  }

  @override
  String get repeaterMode => 'Režim';

  @override
  String get repeaterModeAnalog => 'Analógový';

  @override
  String get repeaterModeC4fm => 'C4FM';

  @override
  String get repeaterModeDstar => 'D-STAR';

  @override
  String get repeaterModeDmr => 'DMR';

  @override
  String get repeaterModeAllmode => 'Všetky režimy';

  @override
  String get repeaterModeEcholink => 'Echolink';

  @override
  String get repeaterModeAllstar => 'AllStar';

  @override
  String get repeaterModeWinlink => 'Winlink';

  @override
  String get repeaterFrequency => 'Frekvencia';

  @override
  String get repeaterShift => 'Posun';

  @override
  String get repeaterCtcss => 'CTCSS';

  @override
  String get repeaterLocation => 'Poloha';

  @override
  String get repeaterDistance => 'Vzdialenosť';

  @override
  String get repeaterViewFullDetails => 'Zobraziť všetky podrobnosti';

  @override
  String get repeatersMapReturnToLocation => 'Vrátiť sa na moju polohu';

  @override
  String clusterRepeatersTitle(int count) {
    return '$count prevádzačov na tejto polohe';
  }

  @override
  String get profileUnlockFeatures => 'Odomknite všetky funkcie';

  @override
  String get profileUnlockFeaturesDescription =>
      'Zaregistrujte sa na používanie hodnotení, ukladanie obľúbených a prístup k podrobným štatistikám.';

  @override
  String get profileSignUpOrLogin => 'Registrácia alebo prihlásenie';

  @override
  String get profileErrorOpeningEmail => 'Chyba pri otváraní e-mailu';

  @override
  String get profileJoinTelegramCommunity =>
      'Pridajte sa ku komunite na Telegrame';

  @override
  String get profileWelcomeTitle => 'Vitajte v HamQRG';

  @override
  String get profileWelcomeDescription =>
      'Pridajte sa k našej komunite rádioamatérov v Taliansku.';

  @override
  String get profileEditProfile => 'Upraviť profil';

  @override
  String get profileChangePhoto => 'Zmeniť fotku';

  @override
  String get profileFirstName => 'Meno';

  @override
  String get profileLastName => 'Priezvisko';

  @override
  String get profileCallsign => 'Volací znak';

  @override
  String get profileRestartIdentificationTitle =>
      'Potrebujete zmeniť svoj stav? Môžete reštartovať proces identifikácie a prepnúť z licencovaného operátora na SWL poslucháča.';

  @override
  String get profileRestartIdentificationButton =>
      'Reštartovať proces identifikácie';

  @override
  String get profileSaveChanges => 'Uložiť zmeny';

  @override
  String get profileDangerZone => 'Nebezpečná zóna';

  @override
  String get profileDeleteAccount => 'Zmazať účet';

  @override
  String get profileDeleteAccountConfirmTitle => 'Zmazať účet';

  @override
  String get profileDeleteAccountConfirmMessage =>
      'Ste si istý, že chcete zmazať svoj účet? Táto akcia je nezvratná.';

  @override
  String get profileDeleteAccountCancel => 'Zrušiť';

  @override
  String get profileDeleteAccountConfirm => 'Zmazať';

  @override
  String profileAppVersion(String version, String buildNumber) {
    return 'Verzia aplikácie $version (Zostava $buildNumber)';
  }

  @override
  String get profileSectionCommunity => 'Komunita a podpora';

  @override
  String get profileSectionSupport => 'Podpora';

  @override
  String profileVersion(String version, String buildNumber) {
    return 'Verzia: $version+$buildNumber';
  }

  @override
  String profileVersionFormat(String version, String buildNumber) {
    return 'Verzia $version (Zostava $buildNumber)';
  }

  @override
  String profileError(String error) {
    return 'Chyba: $error';
  }

  @override
  String get authJoinTitle => 'Pridajte sa k HamQRG';

  @override
  String get authUnlockFeatures => 'Prihláste sa a odomknite všetky funkcie!';

  @override
  String get authWhatYouGet => 'Čo získate:';

  @override
  String get authBenefitStatsTitle => 'Podrobné štatistiky';

  @override
  String get authBenefitStatsDescription =>
      'Sledujte svoj pokrok a zlepšujte sa';

  @override
  String get authBenefitQuizTitle => 'Rôzne režimy kvízov';

  @override
  String get authBenefitQuizDescription =>
      'Precvičujte si maratón, tematické a ďalšie režimy.';

  @override
  String get authBenefitSyncTitle => 'Synchronizácia';

  @override
  String get authBenefitSyncDescription => 'Prístup z akéhokoľvek zariadenia';

  @override
  String get authOrSignInWithEmail => 'Alebo sa prihláste e-mailom';

  @override
  String get authEnterEmail => 'Zadajte e-mail';

  @override
  String get authEnterPassword => 'Zadajte heslo';

  @override
  String get authForgotPassword => 'Zabudli ste heslo?';

  @override
  String get authSignIn => 'Prihlásiť sa';

  @override
  String get authSignUp => 'Zaregistrovať sa';

  @override
  String get authPasswordLengthError => 'Heslo musí byť dlhšie';

  @override
  String get authDontHaveAccount => 'Nemáte účet? Zaregistrujte sa';

  @override
  String get authHaveAccount => 'Už máte účet? Prihláste sa';

  @override
  String get authBackToSignIn => 'Späť na prihlásenie';

  @override
  String get authUnexpectedError => 'Chyba autentifikácie: ';

  @override
  String get authValidEmailError => 'Zadajte platný e-mail';

  @override
  String get authSendPasswordReset => 'Odoslať obnovu hesla';

  @override
  String get authPasswordResetSent => 'Obnova hesla odoslaná';

  @override
  String get authVerifyEmailMessage =>
      'Overte svoj e-mail na dokončenie registrácie, skontrolujte si doručenú poštu.';

  @override
  String get authInvalidCredentials => 'Neplatný e-mail alebo heslo';

  @override
  String get authEmailNotConfirmed => 'Overte svoj e-mail na prihlásenie';

  @override
  String get authFirstName => 'Meno';

  @override
  String get authFirstNameRequired => 'Meno je povinné';

  @override
  String get authLastName => 'Priezvisko';

  @override
  String get authLastNameRequired => 'Priezvisko je povinné';

  @override
  String get authContinueAsGuest => 'Pokračovať ako hosť';

  @override
  String get commonAppNamePart1 => 'Ham';

  @override
  String get commonAppNamePart2 => 'QRG';

  @override
  String get commonAppTagline => 'Objavte prevádzače vo vašom okolí';

  @override
  String get commonPoweredBy => 'POWERED BY IU4VRB';

  @override
  String get homeQuickAccess => 'Rýchly prístup';

  @override
  String get homeRepeaterList => 'Zoznam prevádzačov';

  @override
  String get homeMyFavorites => 'Moje obľúbené';

  @override
  String get homeNearby => 'V okolí';

  @override
  String get homeViewAll => 'Zobraziť všetko';

  @override
  String get dashboardTabRepeaters => 'Prevádzače';

  @override
  String get dashboardTabPota => 'POTA';

  @override
  String get dashboardNearbyEmpty => 'Žiadne prevádzače v okolí';

  @override
  String get dashboardViewAllRepeaters => 'Zobraziť všetky prevádzače';

  @override
  String get dashboardViewAllPotaSpots => 'Zobraziť všetky POTA spoty';

  @override
  String homeStations(int count) {
    return '$count staníc';
  }

  @override
  String homeSaved(int count) {
    return '$count uložených';
  }

  @override
  String homeStationsLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'staníc',
      few: 'stanice',
      one: 'stanica',
    );
    return '$_temp0';
  }

  @override
  String homeSavedLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'uložených',
      few: 'uložené',
      one: 'uložený',
    );
    return '$_temp0';
  }

  @override
  String get homeActive => 'Aktívny';

  @override
  String get homeIdle => 'Neaktívny';

  @override
  String get homeNavHome => 'Domov';

  @override
  String get homeNavList => 'Zoznam';

  @override
  String get homeNavFavorites => 'Obľúbené';

  @override
  String get homeNavMap => 'Mapa';

  @override
  String get homeNavProfile => 'Profil';

  @override
  String get favoritesTitle => 'Moje obľúbené';

  @override
  String get favoritesSearchHint => 'Hľadať uložené prevádzače...';

  @override
  String get favoritesFilterAllSaved => 'Všetky uložené';

  @override
  String get favoritesEmpty => 'Žiadne uložené prevádzače';

  @override
  String get favoritesEmptyDescription =>
      'Pridajte prevádzače do obľúbených a uvidíte ich tu';

  @override
  String favoritesShowing(int showing, int total) {
    return 'Zobrazuje sa $showing z $total obľúbených staníc';
  }

  @override
  String get favoritesRemove => 'Odstrániť z obľúbených';

  @override
  String get favoritesAdd => 'Pridať do obľúbených';

  @override
  String get repeaterDetailSave => 'Uložiť';

  @override
  String get repeaterDetailShare => 'Zdieľať';

  @override
  String get repeaterDetailReport => 'Nahlásiť';

  @override
  String get repeaterDetailTotalLikes => 'Celkový počet hodnotení';

  @override
  String get repeaterDetailReports1Yr => 'Hlásenia (1 rok)';

  @override
  String get repeaterDetailHealthScore => 'Skóre stavu';

  @override
  String get repeaterDetailExcellent => 'Vynikajúci';

  @override
  String get repeaterDetailGood => 'Dobrý';

  @override
  String get repeaterDetailFair => 'Uspokojivý';

  @override
  String get repeaterDetailToVerify => 'Na overenie';

  @override
  String repeaterDetailScoreCalculated(int count) {
    return 'Skóre vypočítané z $count negatívnych hlásení za posledný rok';
  }

  @override
  String get repeaterDetailLastLike => 'Posledné hodnotenie';

  @override
  String get repeaterDetailLastDownReport => 'Posledné negatívne hlásenie';

  @override
  String get repeaterDetailTechnicalData => 'Technické údaje';

  @override
  String get repeaterDetailFrequency => 'Frekvencia';

  @override
  String get repeaterDetailShift => 'Posun';

  @override
  String get repeaterDetailSubtone => 'Subtón (SQL)';

  @override
  String get repeaterDetailMode => 'Režim';

  @override
  String get repeaterDetailLocation => 'Poloha';

  @override
  String repeaterDetailAway(String distance) {
    return '$distance ďaleko';
  }

  @override
  String get repeaterDetailCommunityReports => 'Hlásenia komunity';

  @override
  String get repeaterDetailUpdateStatusFeedback =>
      'Aktualizovať stav a spätnú väzbu';

  @override
  String get repeaterDetailEquipment => 'Zariadenie';

  @override
  String get repeaterDetailEquipmentRequired => 'Zariadenie *';

  @override
  String get repeaterDetailAccessModes => 'Prístupové režimy';

  @override
  String get repeaterDetailNetwork => 'Sieť';

  @override
  String get repeaterDetailLocationField => 'Poloha';

  @override
  String get repeaterDetailLocationRequired => 'Poloha *';

  @override
  String get repeaterDetailComment => 'Komentár';

  @override
  String get repeaterDetailCommentOptional => 'Komentár (Voliteľné)';

  @override
  String get repeaterDetailCommentPlaceholder =>
      'Kvalita signálu, správa o zvuku alebo všeobecné komentáre...';

  @override
  String get repeaterDetailReportDown => 'Nahlásiť problém';

  @override
  String get repeaterDetailCheckinLike => 'Check-in a hodnotenie';

  @override
  String get repeaterDetailYourFeedback => 'Vaša spätná väzba';

  @override
  String get repeaterDetailPostedJustNow => 'Práve zverejnené';

  @override
  String get repeaterDetailDeleteEntry => 'Zmazať záznam';

  @override
  String repeaterDetailViewAllReports(int count) {
    return 'Zobraziť všetkých $count hlásení';
  }

  @override
  String get repeaterDetailStationPortable => 'Prenosná';

  @override
  String get repeaterDetailStationMobile => 'Mobilná';

  @override
  String get repeaterDetailStationFixed => 'Pevná';

  @override
  String get repeaterDetailLike => 'Hodnotenie';

  @override
  String get repeaterDetailReportLabel => 'Hlásenie';

  @override
  String get repeaterDetailSaved => 'Uložené';

  @override
  String get repeaterDetailShareMessage =>
      'Pozrite si tento prevádzač na HamQRG!';

  @override
  String get repeaterDetailReportDescription =>
      'Funkcia hlásení bude čoskoro k dispozícii. Budete môcť nahlásiť nesprávne informácie alebo problémy s týmto prevádzačom.';

  @override
  String get commonClose => 'Zatvoriť';

  @override
  String get favorite => 'Obľúbené';

  @override
  String get accessConfiguration => 'Konfigurácia prístupu';

  @override
  String get noAccessConfiguration => 'Žiadna konfigurácia nie je k dispozícii';

  @override
  String get repeaterDetailAddFeedback => 'Pridať spätnú väzbu';

  @override
  String get repeaterDetailOthersReports => 'Hlásenia ostatných používateľov';

  @override
  String get repeaterDetailRemove => 'Odstrániť';

  @override
  String get repeaterDetailSelectAccess => 'Vybrať prístup';

  @override
  String repeaterDetailDistanceWarning(String distance) {
    return 'Na odoslanie spätnej väzby musíte byť do $distance od prevádzača.';
  }

  @override
  String get repeaterDetailInteractive => 'Interaktívne';

  @override
  String get repeaterDetailLogYourSignal => 'Zaznamenajte svoj signál';

  @override
  String get repeaterDetailUsedEquipment => 'Použité zariadenie';

  @override
  String get repeaterDetailYourLocation => 'Vaša poloha';

  @override
  String get repeaterDetailLocationPlaceholder =>
      'Kde ste boli? (napr. Bratislava)';

  @override
  String get repeaterDetailLocationSelectHint => 'Vyberte miesto z návrhov';

  @override
  String get feedbackDistanceConfirmTitle => 'Potvrdenie odoslania';

  @override
  String feedbackDistanceConfirmMessage(String distance) {
    return 'Vybrané miesto je $distance od prevádzača. Potvrdzujete, že chcete odoslať túto spätnú väzbu na vlastnú zodpovednosť?';
  }

  @override
  String get feedbackDistanceConfirmButton => 'Potvrdiť';

  @override
  String get feedbackDistanceConfirmCancel => 'Zrušiť';

  @override
  String get repeaterDetailSelectAccessInstance => 'Vybrať inštanciu prístupu';

  @override
  String get repeaterDetailSignalObservations => 'Pozorovania signálu';

  @override
  String get repeaterDetailSignalObservationsPlaceholder =>
      'Aká bola kvalita zvuku?';

  @override
  String get repeaterDetailSendLike => 'Odoslať hodnotenie';

  @override
  String get repeaterDetailReportIssue => 'Nahlásiť problém';

  @override
  String get repeaterDetailRecentActivity => 'Nedávna aktivita';

  @override
  String get reportIssueTitle => 'Hlásenie';

  @override
  String get reportIssueHeadline => 'Pomôžte nám udržiavať údaje presné';

  @override
  String get reportIssueDescription =>
      'Našli ste niečo nesprávne alebo chýbajúce pri tomto prevádzači? Dajte nám vedieť, čo treba zmeniť, a my to overíme.';

  @override
  String get reportIssueWhatToCorrect =>
      'Čo by ste chceli opraviť alebo doplniť?';

  @override
  String get reportIssuePlaceholder =>
      'Napr. CTCSS tón sa zmenil na 88,5 Hz, alebo poloha je o niečo severnejšie, správca je...';

  @override
  String get reportIssueVerifiedTitle => 'Overené podania';

  @override
  String get reportIssueVerifiedDescription =>
      'Vaše hlásenie bude preskúmané regionálnym koordinátorom pred aktualizáciou verejnej databázy. Ďakujeme za váš príspevok komunite.';

  @override
  String get reportIssueConfirmCheckbox =>
      'Potvrdzujem, že tieto informácie sú správne na základe môjho pozorovania.';

  @override
  String get reportIssueSubmit => 'Odoslať';

  @override
  String get reportIssueMinChars => 'Vyžaduje sa minimálne 10 znakov';

  @override
  String get reportIssueMaxChars => 'Maximálne 2000 znakov';

  @override
  String get reportIssueSuccess => 'Hlásenie bolo úspešne odoslané';

  @override
  String get reportIssueError => 'Chyba pri odosielaní hlásenia';

  @override
  String get registrationPromptTitle => 'Odomknite plný potenciál';

  @override
  String get registrationPromptDescription =>
      'Pridajte sa ku komunite rádioamatérov a posuňte svoj zážitok na ďalšiu úroveň.';

  @override
  String get registrationBenefitInteractTitle => 'Interakcia';

  @override
  String get registrationBenefitInteractDescription =>
      'Hodnoťte prevádzače a zanechávajte komentáre pre ostatných.';

  @override
  String get registrationBenefitFavoritesTitle => 'Obľúbené';

  @override
  String get registrationBenefitFavoritesDescription =>
      'Uložte si najpoužívanejšie frekvencie a prevádzače.';

  @override
  String get registrationBenefitLogbookTitle => 'Denník';

  @override
  String get registrationBenefitLogbookDescription =>
      'Sledujte svoje QSO a udržiavajte si osobnú históriu.';

  @override
  String get registrationSignInApple => 'Prihlásiť sa cez Apple';

  @override
  String get registrationSignInGoogle => 'Prihlásiť sa cez Google';

  @override
  String get registrationPromptFooter =>
      'Bezplatná registrácia. Na prehliadanie verejných údajov nie je potrebná licencia.';

  @override
  String get postLoginOnboardingWelcome => 'Vitajte v';

  @override
  String get postLoginOnboardingQuestion => 'Ste licencovaný rádioamatér?';

  @override
  String get postLoginOnboardingHelpText =>
      'Toto nám pomôže prispôsobiť váš zážitok a zobraziť správne frekvencie.';

  @override
  String get postLoginOnboardingYesLicensed => 'Áno, som';

  @override
  String get postLoginOnboardingNoListener => 'Nie, som len poslucháč';

  @override
  String get postLoginOnboardingCallsignTitle => 'Identifikujte sa';

  @override
  String get postLoginOnboardingCallsignSubtitle =>
      'Zadajte svoj oficiálny volací znak na prístup k sieťovým funkciám.';

  @override
  String get postLoginOnboardingCallsignLabel => 'Volací znak';

  @override
  String get postLoginOnboardingCallsignHint => 'Napr. OM3XYZ';

  @override
  String get postLoginOnboardingComplete => 'Dokončiť profil';

  @override
  String get postLoginOnboardingBack => 'Späť';

  @override
  String get postLoginOnboardingChangeInSettings =>
      'Toto môžete neskôr zmeniť v nastaveniach.';

  @override
  String get postLoginOnboardingSwlTitle => 'SWL volací znak';

  @override
  String get postLoginOnboardingSwlQuestion =>
      'Máte oficiálny SWL volací znak?';

  @override
  String get postLoginOnboardingSwlHelpText =>
      'Volací znaky poslucháčov krátkych vĺn pomáhajú identifikovať vás v globálnej monitorovacej komunite.';

  @override
  String get postLoginOnboardingSwlYes => 'Áno, mám';

  @override
  String get postLoginOnboardingSwlNo => 'Nie, nemám';

  @override
  String get postLoginOnboardingSwlEnterCallsign => 'Zadajte volací znak';

  @override
  String get postLoginOnboardingSwlCallsignHint => 'Napr. OK1-12345-SWL';

  @override
  String get timeAgoJustNow => 'práve teraz';

  @override
  String timeAgoMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'pred $count minútami',
      many: 'pred $count minútami',
      few: 'pred $count minútami',
      one: 'pred 1 minútou',
    );
    return '$_temp0';
  }

  @override
  String timeAgoHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'pred $count hodinami',
      many: 'pred $count hodinami',
      few: 'pred $count hodinami',
      one: 'pred 1 hodinou',
    );
    return '$_temp0';
  }

  @override
  String timeAgoDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'pred $count dňami',
      many: 'pred $count dňami',
      few: 'pred $count dňami',
      one: 'pred 1 dňom',
    );
    return '$_temp0';
  }

  @override
  String timeAgoWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'pred $count týždňami',
      many: 'pred $count týždňami',
      few: 'pred $count týždňami',
      one: 'pred 1 týždňom',
    );
    return '$_temp0';
  }

  @override
  String timeAgoMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'pred $count mesiacmi',
      many: 'pred $count mesiacmi',
      few: 'pred $count mesiacmi',
      one: 'pred 1 mesiacom',
    );
    return '$_temp0';
  }

  @override
  String timeAgoYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'pred $count rokmi',
      many: 'pred $count rokmi',
      few: 'pred $count rokmi',
      one: 'pred 1 rokom',
    );
    return '$_temp0';
  }

  @override
  String get profileThemeMode => 'Téma';

  @override
  String get profileThemeModeSystem => 'Systémová';

  @override
  String get profileThemeModeLight => 'Svetlá';

  @override
  String get profileThemeModeDark => 'Tmavá';

  @override
  String get repeaterDetailBeFirstFeedback =>
      'Buďte prvý, kto zanechá spätnú väzbu na tento prevádzač!';

  @override
  String get repeaterDetailDistanceFromYou => 'Vzdialenosť od vás';

  @override
  String get repeaterDistanceMapNoLocation => 'Poloha nie je k dispozícii';

  @override
  String get repeaterDetailNever => 'Nikdy';

  @override
  String get repeaterDetailInfo => 'Informácie';

  @override
  String get repeaterDetailSource => 'Zdroj';

  @override
  String get repeaterDetailManager => 'Správca';

  @override
  String get repeaterDetailSuggestManager =>
      'Poznáte správcu prevádzača? Nahláste to!';

  @override
  String get repeaterDetailViewFeedbackMap => 'Mapa spätnej väzby';

  @override
  String get repeaterDetailViewFeedbackMapSubtitle =>
      'Zobrazte, kde boli zaznamenané hodnotenia a hlásenia';

  @override
  String get repeaterDetailAltimetricProfile => 'Výškový profil';

  @override
  String get repeaterDetailAltimetricProfileSubtitle =>
      'Zobrazte profil terénu medzi vami a prevádzačom';

  @override
  String get repeaterCoverageTitle => 'Pokrytie';

  @override
  String get repeaterCoverageCardTitle => 'Mapa pokrytia';

  @override
  String get repeaterCoverageCardSubtitle =>
      'Odhadne signál prevádzača v oblasti';

  @override
  String get repeaterCoverageLoading => 'Výpočet pokrytia…';

  @override
  String get repeaterCoverageError => 'Pokrytie sa nepodarilo vypočítať';

  @override
  String get repeaterCoverageRetry => 'Skúsiť znova';

  @override
  String get repeaterCoverageLegendTitle => 'Odhadovaný signál (dBm)';

  @override
  String get repeaterCoverageCta => 'Zobraziť pokrytie';

  @override
  String get repeaterDetailLosClear =>
      'Priama viditeľnosť medzi vami a prevádzačom';

  @override
  String get repeaterDetailLosObstructed =>
      'Priama viditeľnosť je blokovaná terénom';

  @override
  String get repeaterDetailTerrainProfile => 'Profil terénu';

  @override
  String get repeaterDetailLineOfSight => 'Priama viditeľnosť';

  @override
  String get repeaterDetailTotalDistance => 'Vzdialenosť';

  @override
  String get repeaterDetailRepeaterElevation => 'Nadmorská výška prevádzača';

  @override
  String get repeaterDetailYourElevation => 'Vaša nadmorská výška';

  @override
  String get repeaterDetailYou => 'Vy';

  @override
  String get repeaterDetailRepeaterLabel => 'Prevádzač';

  @override
  String get repeaterDetailFunFacts => 'Vedeli ste?';

  @override
  String get repeaterDetailWavelength => 'Vlnová dĺžka';

  @override
  String repeaterDetailWavelengthValue(String value) {
    return 'Vlnová dĺžka tohto prevádzača je $value';
  }

  @override
  String get repeaterDetailOscillations => 'Oscilácie za sekundu';

  @override
  String repeaterDetailOscillationsValue(String value) {
    return 'Signál osciluje $value-krát za sekundu';
  }

  @override
  String get repeaterDetailPropagationTime => 'Čas šírenia';

  @override
  String repeaterDetailPropagationTimeValue(String value) {
    return 'Váš signál dorazí k prevádzaču za $value';
  }

  @override
  String get repeaterDetailWaveCycles => 'Vlnové cykly pri prenose';

  @override
  String repeaterDetailWaveCyclesValue(String value) {
    return 'Vlna dokončí $value úplných cyklov pri prenose';
  }

  @override
  String get userReportsTitle => 'Moje aktivity';

  @override
  String get userReportsTabReports => 'Hlásenia';

  @override
  String get userReportsTabSubmissions => 'Nové prevádzače';

  @override
  String get userReportsFilterAll => 'Všetky';

  @override
  String get userReportsFilterOpen => 'Otvorené';

  @override
  String get userReportsFilterClosed => 'Uzavreté';

  @override
  String get userReportsEmpty => 'Žiadne odoslané hlásenia';

  @override
  String get userReportsEmptyDescription =>
      'Tu sa zobrazia vaše hlásenia o prevádzačoch';

  @override
  String get userReportsEmptyFiltered => 'Žiadne hlásenia s týmto filtrom';

  @override
  String get userReportsStatusPending => 'Čakajúce';

  @override
  String get userReportsStatusReviewed => 'V preskúmaní';

  @override
  String get userReportsStatusResolved => 'Vyriešené';

  @override
  String get userReportsStatusRejected => 'Zamietnuté';

  @override
  String get userReportsRetryBanner => 'Nepodarilo sa aktualizovať zoznam';

  @override
  String get userReportsProfileTile => 'Moje hlásenia';

  @override
  String get userReportsProfileTileSubtitle => 'Zobraziť stav vašich hlásení';

  @override
  String get userReportsError => 'Chyba pri načítavaní hlásení';

  @override
  String get userReportsCoordinatorResponse => 'Odpoveď koordinátora';

  @override
  String get userSubmissionsEmpty => 'Žiadne navrhnuté prevádzače';

  @override
  String get userSubmissionsEmptyDescription =>
      'Navrhnuté prevádzače sa zobrazia tu';

  @override
  String get userSubmissionsEmptyFiltered =>
      'Žiadne prevádzače s týmto filtrom';

  @override
  String get userSubmissionsStatusPending => 'Čakajúce';

  @override
  String get userSubmissionsStatusApproved => 'Schválené';

  @override
  String get userSubmissionsStatusRejected => 'Zamietnuté';

  @override
  String get userSubmissionsCoordinatorResponse => 'Odpoveď koordinátora';

  @override
  String get userSubmissionsFrequency => 'Frekvencia';

  @override
  String get potaTitle => 'POTA Spoty';

  @override
  String get potaSearchHint => 'Hľadať podľa aktivátora, parku alebo režimu…';

  @override
  String get potaNoSpots => 'Momentálne žiadne aktívne POTA spoty.';

  @override
  String get potaLoadError => 'Nepodarilo sa načítať POTA spoty';

  @override
  String get potaRetry => 'Skúsiť znova';

  @override
  String get potaViewAll => 'Zobraziť všetko';

  @override
  String get potaActivator => 'Aktivátor';

  @override
  String get potaFrequency => 'Frekvencia';

  @override
  String get potaMode => 'Režim';

  @override
  String get potaPark => 'Park';

  @override
  String get potaReference => 'Referencia';

  @override
  String get potaSpotter => 'Spozoroval';

  @override
  String get potaComments => 'Komentáre';

  @override
  String get potaLastSpotted => 'Naposledy spozorovaný';

  @override
  String get potaOpenQrz => 'QRZ.com';

  @override
  String get potaQrzError => 'Nepodarilo sa otvoriť QRZ.com';

  @override
  String get potaParkWebsite => 'Webová stránka parku';

  @override
  String get potaParkType => 'Typ parku';

  @override
  String get potaLocation => 'Poloha';

  @override
  String get potaCountry => 'Krajina';

  @override
  String get potaFirstActivation => 'Prvá aktivácia';

  @override
  String get potaBand => 'Pásmo';

  @override
  String potaDistanceAway(String distance) {
    return '$distance ďaleko';
  }

  @override
  String potaSpotsCount(int count) {
    return '$count aktívnych spotov';
  }

  @override
  String get potaFilterAll => 'Všetky';

  @override
  String get potaFilterBand => 'Pásmo';

  @override
  String get potaFilterMode => 'Režim';

  @override
  String get potaSortByTime => 'Najnovšie';

  @override
  String get potaSortByDistance => 'Najbližšie';

  @override
  String get profileLanguage => 'Jazyk';

  @override
  String get profileUnitSystem => 'Jednotky';

  @override
  String get profileUnitSystemAuto => 'Automaticky';

  @override
  String get profileUnitSystemMetric => 'Metrické';

  @override
  String get profileUnitSystemImperial => 'Imperiálne';

  @override
  String get profileLanguageSystem => 'Systémový';

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
  String get onboardingSkip => 'Preskočiť';

  @override
  String get onboardingGetStarted => 'Začať';

  @override
  String get onboardingNext => 'Ďalej';

  @override
  String get onboardingWelcomeTitle1 => 'Nájdite prevádzače v okolí';

  @override
  String get onboardingWelcomeSubtitle1 =>
      'Objavte aktívne prevádzače vo vašom okolí s frekvenciami, tónmi a technickými podrobnosťami.';

  @override
  String get onboardingWelcomeCredits =>
      'Údaje o prevádzačoch poskytuje IZ8WNH';

  @override
  String get onboardingWelcomeTitle2 => 'Filtrujte podľa režimu';

  @override
  String get onboardingWelcomeSubtitle2 =>
      'Analógové, DMR, C4FM, D-STAR — nájdite ten správny prevádzač okamžite.';

  @override
  String get onboardingWelcomeTitle3 => 'POTA spoty v reálnom čase';

  @override
  String get onboardingWelcomeSubtitle3 =>
      'Sledujte Parks on the Air aktivácie so živými aktualizáciami, filtrami pásiem a vzdialenosťou.';

  @override
  String get onboardingWelcomeTitle4 => 'Uložte si obľúbené';

  @override
  String get onboardingWelcomeSubtitle4 =>
      'Majte svoje najpoužívanejšie prevádzače po ruke pre rýchly prístup.';

  @override
  String get onboardingLocationTitle => 'Poloha';

  @override
  String get onboardingLocationSubtitle =>
      'Vašu polohu používame na zobrazenie prevádzačov a POTA aktivácií v okolí.';

  @override
  String get onboardingLocationEnable => 'Povoliť polohu';

  @override
  String get onboardingLocationSkip => 'Teraz nie';

  @override
  String get onboardingDiscoveryTitle => 'Váš prvý prevádzač';

  @override
  String get onboardingDiscoverySubtitle => 'Tu je to, čo je vo vašom okolí!';

  @override
  String get onboardingDiscoveryViewDetails => 'Zobraziť podrobnosti';

  @override
  String get onboardingDiscoveryViewSpot => 'Zobraziť spot';

  @override
  String get onboardingDiscoveryExploreMap => 'Preskúmať mapu';

  @override
  String get onboardingDiscoveryNoLocation =>
      'Preskúmajte mapu a nájdite prevádzače a POTA aktivácie';

  @override
  String get onboardingDiscoveryNearbyRepeater => 'Prevádzač v okolí';

  @override
  String get onboardingDiscoveryLivePota => 'Živý POTA spot';

  @override
  String get onboardingDiscoveryNoRepeaters =>
      'V okolí neboli nájdené žiadne prevádzače';

  @override
  String get onboardingTelegramTitle => 'Pridajte sa ku komunite';

  @override
  String get onboardingTelegramSubtitle =>
      'Pridajte sa do skupiny HamQRG na Telegrame a získajte aktualizácie, nahlasujte prevádzače a spoznajte ďalších rádioamatérov.';

  @override
  String get onboardingTelegramJoin => 'Pridať sa do skupiny na Telegrame';

  @override
  String get onboardingTelegramLater => 'Možno neskôr';

  @override
  String get onboardingTelegramAlreadyMember => 'Už som členom';

  @override
  String get addRepeaterProfileTile => 'Navrhnúť nový prevádzač';

  @override
  String get addRepeaterProfileTileSubtitle =>
      'Nahláste prevádzač, ktorý ešte nie je v zozname';

  @override
  String get addRepeaterTitle => 'Nový prevádzač';

  @override
  String get addRepeaterHeadline => 'Nahláste chýbajúci prevádzač';

  @override
  String get addRepeaterDescription =>
      'Vyplňte údaje o prevádzači, ktorý chcete pridať. Podanie bude pred zverejnením preskúmané.';

  @override
  String get addRepeaterSectionRepeater => 'Údaje o prevádzači';

  @override
  String get addRepeaterSectionAccesses => 'Prístupy';

  @override
  String get addRepeaterSectionLocation => 'Poloha';

  @override
  String get addRepeaterSectionNotes => 'Poznámky';

  @override
  String get addRepeaterName => 'Názov';

  @override
  String get addRepeaterNameHint => 'Napr. Vysoké Tatry';

  @override
  String get addRepeaterCallsign => 'Volací znak';

  @override
  String get addRepeaterCallsignHint => 'Napr. OM0AB';

  @override
  String get addRepeaterNameOrCallsignRequired =>
      'Zadajte aspoň názov alebo volací znak';

  @override
  String get addRepeaterFrequency => 'Frekvencia (MHz)';

  @override
  String get addRepeaterFrequencyHint => 'Napr. 145,000 alebo 145.000';

  @override
  String get addRepeaterFrequencyRequired => 'Frekvencia je povinná';

  @override
  String get addRepeaterFrequencyInvalid => 'Neplatná frekvencia';

  @override
  String get addRepeaterShift => 'Posun (MHz)';

  @override
  String get addRepeaterShiftHint => 'Napr. -0,600 alebo -0.600';

  @override
  String get addRepeaterRegion => 'Kraj';

  @override
  String get addRepeaterRegionHint => 'Napr. Bratislavský kraj';

  @override
  String get addRepeaterProvinceCode => 'Okres';

  @override
  String get addRepeaterProvinceCodeHint => 'Napr. BA';

  @override
  String get addRepeaterLocality => 'Obec';

  @override
  String get addRepeaterLocalityHint => 'Napr. Bratislava';

  @override
  String get addRepeaterLatitude => 'Zemepisná šírka';

  @override
  String get addRepeaterLatitudeHint => 'Napr. 48.1486';

  @override
  String get addRepeaterLongitude => 'Zemepisná dĺžka';

  @override
  String get addRepeaterLongitudeHint => 'Napr. 17.1077';

  @override
  String get addRepeaterLocator => 'Lokátor';

  @override
  String get addRepeaterLocatorHint => 'Napr. JN88NC';

  @override
  String get addRepeaterNotes => 'Ďalšie poznámky';

  @override
  String get addRepeaterNotesHint => 'Ďalšie informácie o prevádzači...';

  @override
  String get addRepeaterAddAccess => 'Pridať prístup';

  @override
  String get addRepeaterRemoveAccess => 'Odstrániť';

  @override
  String get addRepeaterAccessMode => 'Režim';

  @override
  String get addRepeaterAccessCtcssTx => 'CTCSS TX (Hz)';

  @override
  String get addRepeaterAccessCtcssTxHint => 'Napr. 88,5';

  @override
  String get addRepeaterAccessCtcssRx => 'CTCSS RX (Hz)';

  @override
  String get addRepeaterAccessCtcssRxHint => 'Napr. 88,5';

  @override
  String get addRepeaterAccessDcsCode => 'DCS kód';

  @override
  String get addRepeaterAccessDcsCodeHint => 'Napr. 23';

  @override
  String get addRepeaterAccessColorCode => 'Color Code';

  @override
  String get addRepeaterAccessColorCodeHint => 'Napr. 1';

  @override
  String get addRepeaterAccessTalkgroup => 'Talkgroup';

  @override
  String get addRepeaterAccessTalkgroupHint => 'Napr. 231001';

  @override
  String get addRepeaterAccessDgId => 'DG-ID';

  @override
  String get addRepeaterAccessDgIdHint => 'Napr. 0';

  @override
  String get addRepeaterAccessNodeId => 'Node ID';

  @override
  String get addRepeaterAccessNodeIdHint => 'Napr. 1234';

  @override
  String get addRepeaterAccessNac => 'NAC';

  @override
  String get addRepeaterAccessNacHint => 'Napr. 659';

  @override
  String get addRepeaterAccessNetworkName => 'Názov siete';

  @override
  String get addRepeaterAccessNetworkNameHint => 'Napr. BM Italia';

  @override
  String get addRepeaterAccessNotes => 'Poznámky k prístupu';

  @override
  String get addRepeaterAccessNotesHint =>
      'Poznámky špecifické pre tento prístup...';

  @override
  String get addRepeaterConfirmCheckbox =>
      'Potvrdzujem, že tieto informácie sú podľa môjho najlepšieho vedomia správne.';

  @override
  String get addRepeaterVerifiedTitle => 'Overené podanie';

  @override
  String get addRepeaterVerifiedDescription =>
      'Vaše podanie bude preskúmané tímom pred zverejnením v databáze.';

  @override
  String get addRepeaterSubmit => 'Odoslať';

  @override
  String get addRepeaterSuccess => 'Podanie bolo úspešne odoslané!';

  @override
  String get addRepeaterError => 'Chyba pri odosielaní podania';

  @override
  String get addRepeaterAtLeastOneAccess => 'Pridajte aspoň jeden prístup';

  @override
  String addRepeaterAccessNumber(int number) {
    return 'Prístup $number';
  }

  @override
  String get changelog1017PotaSpots =>
      'POTA spoty v reálnom čase s mapou a podrobnosťami o parkoch';

  @override
  String get changelog1017SubmitRepeater =>
      'Navrhnite nový prevádzač priamo z aplikácie';

  @override
  String get changelog1017MultiLanguage =>
      'Aplikácia dostupná v angličtine, španielčine a francúzštine';

  @override
  String get changelog1017Onboarding => 'Nový zážitok pri prvom spustení';

  @override
  String get changelog1017ReportAnonymous =>
      'Hlásenia dostupné bez registrácie';

  @override
  String get changelog1020ClusterSpots =>
      'Cluster spoty v reálnom čase: uvidíte, kto počúva na prevádzačoch, s oznámeniami a preferenciami';

  @override
  String get changelog1020DetailTabs =>
      'Stránka prevádzača s kartami Info, Cluster a Komunita';

  @override
  String get changelog1020TabletLayout =>
      'Rozloženie optimalizované pre tablety';

  @override
  String get changelog110Coverage =>
      'Mapa pokrytia prevádzačov: pozri si odhadovaný signál priamo na mape (PRO)';

  @override
  String get changelog110Reachable =>
      'Čo odtiaľto dosiahneš: objav prevádzače, ktoré zo svojej polohy zachytíš, so signálom a profilom terénu (PRO)';

  @override
  String get changelogTitle => 'Čo je nové';

  @override
  String get changelogSubtitle => 'Tu je prehľad noviniek v tejto verzii';

  @override
  String get changelogCategoryAdded => 'Nové';

  @override
  String get changelogCategoryImproved => 'Vylepšené';

  @override
  String get changelogCategoryFixed => 'Opravené';

  @override
  String get changelogDismiss => 'Rozumiem!';

  @override
  String get spotCreateTitle => 'Spottovať seba';

  @override
  String get spotCreateOtherTitle => 'Spottovať OM';

  @override
  String get spotCreateDuration => 'Trvanie';

  @override
  String get spotCreateAccess => 'Režim (voliteľný)';

  @override
  String get spotCreateCallsign => 'Značka počutého OM';

  @override
  String get spotCreateCallsignHint => 'Napr. OM1ABC';

  @override
  String get spotCreateConfirm => 'Potvrdiť';

  @override
  String get spotCreateSuccessSelf => 'Spot vytvorený!';

  @override
  String get spotCreateSuccessOther => 'OM spottovaný!';

  @override
  String get spotActiveYou => 'Ste spottovaný';

  @override
  String get spotActiveClose => 'Zatvoriť spot';

  @override
  String spotActiveOn(String repeaterName) {
    return 'na $repeaterName';
  }

  @override
  String get spotActiveNone => 'Momentálne nikto spottovaný';

  @override
  String get spotActiveCta => 'Buďte prvý!';

  @override
  String get spotActiveSection => 'Aktívne spoty';

  @override
  String get spotHistorySection => 'História spotov';

  @override
  String get spotListTitle => 'Najnovšie spoty';

  @override
  String get spotListViewAll => 'Zobraziť všetko';

  @override
  String get spotListBadgeActive => 'Počúva';

  @override
  String get spotListBadgeClosed => 'Ukončené';

  @override
  String get spotListBadgeReport => 'Nahlásiť';

  @override
  String get spotListEmpty => 'Žiadne spoty za posledných 24 hodín';

  @override
  String spotListSpottedBy(String callsign) {
    return 'Nahlásil $callsign';
  }

  @override
  String get spotNotificationToggle => 'Oznámenia klastra';

  @override
  String get spotNotificationDisabled =>
      'Oznámenia klastra vypnuté v nastaveniach profilu';

  @override
  String get spotNotificationPerFavorite => 'Oznámenia o spotoch';

  @override
  String get spotPreviousClosed => 'Váš predchádzajúci spot už nie je aktívny';

  @override
  String get spotErrorAuthRequired => 'Musíte byť prihlásený.';

  @override
  String get spotErrorCallsignRequired =>
      'Nastavte svoju značku v profile na používanie klastra.';

  @override
  String get spotErrorInvalidDuration =>
      'Trvanie musí byť medzi 5 a 60 minútami.';

  @override
  String get spotErrorRepeaterNotFound => 'Prevádzač nenájdený.';

  @override
  String get spotErrorInvalidAccess =>
      'Neplatný prístupový režim pre tento prevádzač.';

  @override
  String get spotErrorSpotNotFound => 'Spot nenájdený.';

  @override
  String get spotErrorForbidden => 'Nemôžete zatvoriť spot, ktorý nie je váš.';

  @override
  String get spotErrorAlreadyClosed => 'Spot je už zatvorený.';

  @override
  String get spotErrorGeneric =>
      'Chyba pri vytváraní spotu. Skúste to prosím znova.';

  @override
  String get spotAccessUnavailable => '(režim už nie je dostupný)';

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
  String get spotsFilterBand => 'Pásmo';

  @override
  String get spotsFilterMode => 'Mód';

  @override
  String get spotsFilterAll => 'Všetky';

  @override
  String get spotsFiltersReset => 'Zrušiť filtre';

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
  String get reachSheetError => 'Dostupné prevádzače sa nepodarilo vypočítať.';

  @override
  String reachSheetCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Dosiahneš $count prevádzačov',
      few: 'Dosiahneš $count prevádzače',
      one: 'Dosiahneš 1 prevádzač',
    );
    return '$_temp0';
  }

  @override
  String get reachSheetSubtitle => 'Z tvojej polohy, zoradené podľa signálu';

  @override
  String get reachSheetEmpty => 'V okolí nie sú žiadne dostupné prevádzače.';

  @override
  String get reachBadgeTitle => 'Dosiahneš ho odtiaľto?';

  @override
  String get reachBadgeSubtitle =>
      'Zisti, či ťa tento prevádzač pokrýva a s akým signálom';

  @override
  String get reachDiscoverCta => 'Objav to s PRO';

  @override
  String get reachReachable => 'Dosiahneš ho';

  @override
  String get reachOutOfCoverage => 'Mimo pokrytia';

  @override
  String reachReachableDetail(String signal, String distance) {
    return '$signal · $distance · ťukni pre profil';
  }

  @override
  String reachDistanceFromHere(String distance) {
    return '$distance odtiaľto';
  }

  @override
  String get reachComputing => 'Výpočet pokrytia…';

  @override
  String get reachRepeaterFallback => 'Prevádzač';

  @override
  String get reachMapButton => 'Čo dosiahneš?';

  @override
  String get reachUpsellTitle => 'Čo dosiahneš odtiaľto? 📡';

  @override
  String get reachUpsellBody =>
      'Sleduj v reálnom čase VŠETKY prevádzače, ktoré zo svojej polohy zachytíš, s predpokladaným signálom a profilom terénu. Na koľko z nich naozaj dosiahneš odtiaľ, kde práve si?';

  @override
  String get reachUpsellLater => 'Neskôr';

  @override
  String get linkProfileObstructed => 'Prekážka na trase (signál difrakciou)';

  @override
  String get linkProfileClear => 'Priama viditeľnosť';

  @override
  String linkProfileCaption(String tx, String rx) {
    return 'Profil terénu a priama viditeľnosť · TX $tx · RX $rx';
  }

  @override
  String get proUnlockCta => 'Odomknúť s PRO';

  @override
  String get proWelcomeTitle => 'Vitaj v PRO! 🎉';

  @override
  String get proWelcomeBody =>
      'Odomkol si mapu pokrytia, prevádzače, na ktoré dosiahneš zo svojej polohy, a všetky funkcie PRO. 📡';

  @override
  String get proWelcomeCta => 'Začať objavovať';

  @override
  String get commonCancel => 'Zrušiť';

  @override
  String get commonDelete => 'Odstrániť';

  @override
  String get commonEdit => 'Upraviť';

  @override
  String get commonOpenSettings => 'Otvoriť nastavenia';

  @override
  String get commonFieldRequired => 'Povinné pole';

  @override
  String get fieldName => 'Meno';

  @override
  String get fieldAddress => 'Adresa';

  @override
  String get fieldCity => 'Mesto';

  @override
  String get fieldDescription => 'Popis';

  @override
  String get fieldYear => 'Rok';

  @override
  String get fieldSelectDateHint => 'Vyberte dátum';

  @override
  String get validationInvalidYear => 'Vyberte platný rok';

  @override
  String get validationPasswordMinLength => 'Heslo musí mať aspoň 6 znakov';

  @override
  String get permissionsMissingTitle => 'Chýbajú oprávnenia!';

  @override
  String get imageUploadError => 'Chyba pri nahrávaní obrázka';

  @override
  String get uploadImageLabel => 'Nahrať obrázok';

  @override
  String get sourceGallery => 'Galéria';

  @override
  String get sourceCamera => 'Fotoaparát';

  @override
  String get changePasswordTitle => 'Zmeniť heslo';

  @override
  String get fieldNewPassword => 'Nové heslo';

  @override
  String get fieldConfirmNewPassword => 'Potvrďte nové heslo';

  @override
  String get validationPasswordsNoMatch => 'Heslá sa nezhodujú';

  @override
  String get passwordChangedSuccess => 'Heslo úspešne zmenené';

  @override
  String errorWithMessage(String message) {
    return 'Chyba: $message';
  }

  @override
  String get updateRequiredTitle => 'Vyžaduje sa aktualizácia';

  @override
  String get updateRequiredAction => 'Aktualizovať teraz';

  @override
  String get yearPickerTitle => 'Vyberte rok';

  @override
  String get repeaterTabInfo => 'Info';

  @override
  String get repeaterTabCluster => 'Cluster';

  @override
  String get repeaterTabCommunity => 'Komunita';

  @override
  String get updateRequiredBody =>
      'Je k dispozícii nová verzia aplikácie. Aktualizujte ju, aby ste ju mohli ďalej používať.';

  @override
  String get errorOpeningStore => 'Chyba pri otváraní obchodu';

  @override
  String get deleteConfirmTitle => 'Potvrdiť odstránenie';

  @override
  String get deleteConfirmContent => 'Naozaj chcete odstrániť?';

  @override
  String get cameraPermissionRationale =>
      'Ak chcete urobiť fotku, povoľte prístup k fotoaparátu v nastaveniach.';

  @override
  String get coverageSearchHint => 'Vyhľadajte miesto alebo vložte súradnice';

  @override
  String get coverageSearchRecentTitle => 'Nedávne hľadania';

  @override
  String get coverageSearchNoResults => 'Nenašlo sa žiadne miesto';

  @override
  String get coverageSearchTip =>
      'Môžete vložiť súradnice (46.4879, 11.8123) alebo dlho podržať na mape';

  @override
  String get coverageSearchErrorOutOfRange =>
      'Súradnice mimo rozsahu: šírka ±90, dĺžka ±180';

  @override
  String get coverageSearchErrorOffline =>
      'Bez pripojenia: hľadanie miest vyžaduje sieť';

  @override
  String get coverageSearchErrorFailed => 'Hľadanie zlyhalo. Skúste to znova.';

  @override
  String get coverageSearchClearPoint => 'Odstrániť bod';

  @override
  String get coverageSearchPointSemantics => 'Vybraný bod hľadania';

  @override
  String get coverageBreadthTitle => 'Rozsah hľadania';

  @override
  String get coverageBreadthQuick => 'Rýchle';

  @override
  String get coverageBreadthMedium => 'Stredné';

  @override
  String get coverageBreadthExtended => 'Rozšírené';

  @override
  String coverageBreadthQuickHint(String radius) {
    return '$radius · najrýchlejšia odpoveď';
  }

  @override
  String coverageBreadthMediumHint(String radius) {
    return '$radius · vyvážené';
  }

  @override
  String coverageBreadthExtendedHint(String radius) {
    return '$radius · ďalej, dlhšie čakanie';
  }

  @override
  String get coverageResultSubtitle => 'Z vybraného bodu';

  @override
  String get coverageResultEmptyNoReachable =>
      'Z tohto bodu nie je dosiahnuteľný žiadny prevádzač';

  @override
  String get coverageResultEmptyNoRepeaters =>
      'V tejto oblasti nie je evidovaný žiadny prevádzač';

  @override
  String get coverageResultClearFilters => 'Zrušiť filtre';

  @override
  String get coverageResultError => 'Výpočet zlyhal';

  @override
  String get coverageResultComputing => 'Výpočet príjmu…';

  @override
  String get coverageResultCancel => 'Zrušiť';

  @override
  String coverageResultCount(int count) {
    return 'Dosiahnuteľné prevádzače: $count';
  }

  @override
  String coverageResultCountFiltered(int shown, int total) {
    return '$shown z $total dosiahnuteľných';
  }

  @override
  String coverageResultHiddenByFilters(int count) {
    return 'Skryté filtrami: $count';
  }

  @override
  String coverageTeaserTitle(String place) {
    return 'Čo dosiahnete z $place? 📡';
  }

  @override
  String get coverageTeaserBody =>
      'Každý prevádzač dosiahnuteľný z toho miesta, s predpovedaným signálom a vzdialenosťou — ešte pred odchodom.';

  @override
  String get coverageTeaserBenefitAnywhere => 'Akýkoľvek bod na planéte';

  @override
  String get coverageTeaserBenefitOffline => 'Dostupné bez siete, v teréne';

  @override
  String get coverageTeaserBenefitSave =>
      'Uložíte stanovište a nájdete ho znova';

  @override
  String get stationSaveCta => 'Uložiť stanovište';

  @override
  String get stationSaveTitle => 'Názov stanovišťa';

  @override
  String get stationRename => 'Premenovať';

  @override
  String get stationDelete => 'Odstrániť';

  @override
  String get stationRefresh => 'Aktualizovať';

  @override
  String get stationRefreshAll => 'Aktualizovať všetky';

  @override
  String get stationOfflineNotice => 'Údaje uložené v zariadení';

  @override
  String get stationStaleNotice => 'Údaje nemusia byť aktuálne';

  @override
  String get stationMissingEntry => 'Údaje nie sú offline k dispozícii';

  @override
  String get stationDuplicateTitle => 'Bod je už uložený';

  @override
  String stationDuplicateBody(String distance) {
    return 'Do $distance už existuje stanovište. Aktualizovať, alebo vytvoriť samostatné?';
  }

  @override
  String get stationDuplicateUpdate => 'Aktualizovať';

  @override
  String get stationDuplicateCreate => 'Vytvoriť samostatné';

  @override
  String get stationSaveFailed => 'Uloženie zlyhalo: nedostatok miesta';

  @override
  String get stationSavedCta => 'Stanovisko uložené';

  @override
  String get stationRemoveCta => 'Odstrániť';

  @override
  String get stationRemoveTitle => 'Odstrániť stanovisko?';

  @override
  String stationRemoveBody(String name) {
    return '„$name“ a jeho offline údaje budú z tohto zariadenia vymazané.';
  }

  @override
  String get stationRemovedSnack => 'Stanovisko odstránené';

  @override
  String get stationSaveError => 'Uloženie zlyhalo. Skúste to znova.';

  @override
  String get stationsTitle => 'Moje stanovištia';

  @override
  String get stationsProfileSubtitle =>
      'Body, ktoré si vyhodnotil, dostupné aj bez siete';

  @override
  String get stationsEmptyTitle => 'Zatiaľ žiadne uložené stanovištia';

  @override
  String get stationsEmptyBody =>
      'Stanovište je bod na mape, pri ktorom už máš vypočítané pokrytie, uložený tak, aby si ho našiel aj bez siete.';

  @override
  String get stationsEmptyStep1 =>
      'Vyber bod na mape: podrž ho, nájdi ho podľa názvu alebo vlož súradnice.';

  @override
  String stationsEmptyStep2(String action) {
    return 'Ťukni na „$action“ a uvidíš, na ktoré prevádzače odtiaľ dosiahneš.';
  }

  @override
  String get stationsEmptyStep3 =>
      'Ulož bod: nájdeš ho tu, aj v teréne bez siete.';

  @override
  String get stationsGoToMap => 'Prejsť na mapu';

  @override
  String get stationsRefreshDone => 'Aktualizácia dokončená';

  @override
  String spotsUpdatedAgo(String time) {
    return 'Aktualizované $time';
  }

  @override
  String spotsNextUpdateSeconds(int seconds) {
    return 'Aktualizácia o $seconds s';
  }

  @override
  String spotsNextUpdateMinutes(int minutes) {
    return 'Aktualizácia o $minutes min';
  }

  @override
  String get spotsUpdating => 'Aktualizuje sa…';

  @override
  String spotsAutoRefreshHint(int seconds) {
    return 'Automatická aktualizácia každých $seconds sekúnd';
  }

  @override
  String get spotsManualRefreshHint => 'Klepnutím obnovíte';

  @override
  String coverageResultScope(String km, int count) {
    return 'do $km · vyhodnotených: $count';
  }

  @override
  String get coverageResultRecalculating => 'Prepočítava sa';

  @override
  String get offlineBannerMessage => 'Ste offline: prezeráte uložené údaje';

  @override
  String get offlineMapsTitle => 'Offline mapy';

  @override
  String get offlineMapsEntrySubtitle =>
      'Stiahnite si mapy na použitie bez pripojenia';

  @override
  String get offlineMapsEmpty =>
      'Žiadne stiahnuté oblasti. Stiahnite si oblasť, aby ste mapu videli aj bez pripojenia.';

  @override
  String get offlineMapsAddRegion => 'Stiahnuť oblasť';

  @override
  String get offlineMapsRegionNameLabel => 'Názov oblasti';

  @override
  String get offlineMapsRegionNameHint => 'Napr. Domov, Chata, Aktivácia SOTA';

  @override
  String get offlineMapsRadiusLabel => 'Polomer';

  @override
  String get offlineMapsDownload => 'Stiahnuť';

  @override
  String get offlineMapsDownloadingStyle => 'Sťahovanie štýlu mapy…';

  @override
  String offlineMapsDownloadingTiles(String percent) {
    return 'Sťahovanie máp… $percent%';
  }

  @override
  String offlineMapsEstimatedSize(String size) {
    return 'Odhadovaná veľkosť: $size';
  }

  @override
  String get offlineMapsDownloadError => 'Sťahovanie zlyhalo. Skúste to znova.';

  @override
  String get offlineMapsDeleteError => 'Odstránenie zlyhalo. Skúste to znova.';

  @override
  String get offlineMapsDeleteConfirmTitle => 'Odstrániť oblasť?';

  @override
  String offlineMapsDeleteConfirmMessage(String name) {
    return '„$name“ už nebude offline k dispozícii.';
  }

  @override
  String get offlineMapsDeleteConfirm => 'Odstrániť';

  @override
  String offlineMapsRegionSubtitle(String radius, String size) {
    return 'Polomer $radius · $size';
  }

  @override
  String get offlineMapsIncomplete => 'Nedokončené sťahovanie';

  @override
  String get offlineMapsResume => 'Pokračovať';

  @override
  String get offlineMapsCenterInfo =>
      'Oblasť bude vycentrovaná na vašu aktuálnu polohu.';

  @override
  String get dashboardOfflineTitle => 'Ste offline';

  @override
  String get dashboardOfflineMessage =>
      'Pre túto oblasť nie sú uložené žiadne dáta. Vaše uložené stanovištia a stiahnuté mapy zostávajú k dispozícii.';

  @override
  String get offlineMapsCenterMine => 'Moja poloha';

  @override
  String get offlineMapsCenterSearch => 'Hľadať miesto';

  @override
  String get offlineMapsCenterSearchInfo =>
      'Vyhľadajte mesto alebo miesto: oblasť bude vycentrovaná tam.';

  @override
  String offlineMapsCenterSelected(String label) {
    return 'Stred: $label';
  }

  @override
  String get changelog120OfflineMode =>
      'Offline režim: prevádzače, obľúbené, profil, pokrytie a dosiahnuteľnosť dostupné aj bez siete (PRO)';

  @override
  String get changelog120OfflineMaps =>
      'Offline mapy: stiahnite si oblasť, kde ste, alebo ľubovoľné miesto a používajte ju bez pripojenia (PRO)';

  @override
  String get changelog120CoverageSearch =>
      'Hľadanie pokrytia z ľubovoľného bodu: vyhľadajte miesto, vložte súradnice alebo podržte prst na mape a zistite, čo odtiaľ dosiahnete';

  @override
  String get changelog120SavedStations =>
      'Moje stanovištia: uložte si body, ktoré vás zaujímajú, a prezerajte si ich aj offline (PRO)';

  @override
  String get changelog120SpotsRefresh =>
      'Spoty SOTA a POTA sa obnovujú samy každú minútu, s farebnými odznakmi podľa módu (CW, SSB, FT8…)';

  @override
  String get changelog120NoNetwork =>
      'Bez pripojenia sa aplikácia spustí okamžite, ukáže, čo je k dispozícii, a vypne akcie vyžadujúce sieť';

  @override
  String get changelog130ImperialUnits =>
      'Míle a stopy: aplikácia teraz rešpektuje jednotky vášho zariadenia a systém si môžete zvoliť v Nastaveniach';

  @override
  String get profileUnitSystemAutoShort => 'Auto';

  @override
  String updateAvailableBannerMessage(String version) {
    return 'Je dostupná verzia $version, odporúčame aktualizovať';
  }

  @override
  String get updateAvailableAction => 'Aktualizovať';

  @override
  String get updateAvailableDismiss => 'Teraz nie';

  @override
  String get dashboardLoadError => 'Aktuálne údaje sa nepodarilo načítať';

  @override
  String get dashboardLoadErrorMessage =>
      'Server neodpovedal. Skús to o chvíľu znova.';
}
