// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get proSectionTitle => 'Subskrypcja';

  @override
  String get proCardUpgradeTitle => 'Sprawdź, co osiągasz';

  @override
  String get proCardUpgradeSubtitle => 'Zasięg, przemienniki i mapy offline';

  @override
  String get proCardActiveTitle => 'HamQRG Pro aktywny';

  @override
  String get proCardActiveSubtitle => 'Dziękujemy za wsparcie!';

  @override
  String proPriceFromMonth(String price) {
    return 'Od $price miesięcznie · Anuluj w każdej chwili';
  }

  @override
  String proPriceTrialThenMonth(String price) {
    return 'Darmowy okres próbny, potem $price miesięcznie · Anuluj w każdej chwili';
  }

  @override
  String proPriceLifetime(String price) {
    return '$price jednorazowo · Na zawsze';
  }

  @override
  String proPriceFromMonthUpfront(String price, String total) {
    return 'Od $price miesięcznie · $total z góry · Anuluj w każdej chwili';
  }

  @override
  String proPriceTrialThenMonthUpfront(String price, String total) {
    return 'Darmowy okres próbny, potem $price miesięcznie · $total z góry · Anuluj w każdej chwili';
  }

  @override
  String get proRestoreSuccess => 'Zakupy przywrócone: HamQRG Pro jest aktywne';

  @override
  String get proRestoreNone => 'Brak zakupów do przywrócenia';

  @override
  String get proManageSubscription => 'Zarządzaj subskrypcją';

  @override
  String get proLinkAccountTitle => 'Połącz swoje konto';

  @override
  String get proLinkAccountBody =>
      'Połącz HamQRG Pro z kontem, aby zachować je na każdym urządzeniu, także po ponownej instalacji.';

  @override
  String get stationsShowcaseTitle => 'Twoje stanowiska, także bez sieci';

  @override
  String get stationsShowcaseBody =>
      'Zapisz dom, schronisko, miejsce aktywacji: to, co osiągasz, zostaje z tobą także bez sieci.';

  @override
  String get offlineMapsUpsellTitle => 'Mapa zostaje w telefonie 🗺️';

  @override
  String get offlineMapsUpsellBody =>
      'Pobierz potrzebne obszary i otwieraj je tam, gdzie nie ma zasięgu: na grani, w tunelu, za granicą bez transmisji danych.';

  @override
  String get offlineMapsBenefitRegions => 'Sam wybierasz obszary do pobrania';

  @override
  String get reachUpsellBenefitSignal =>
      'Przewidywany sygnał dla każdego przemiennika';

  @override
  String get reachUpsellBenefitTerrain =>
      'Profil terenu między tobą a przemiennikiem';

  @override
  String get proRestoreCta => 'Przywróć zakupy';

  @override
  String get error => 'Błąd';

  @override
  String get error_message => 'Wystąpił błąd podczas ładowania';

  @override
  String get error_message_retry =>
      'Wystąpił błąd podczas ładowania. Spróbuj ponownie później';

  @override
  String get retry => 'Ponów';

  @override
  String get back => 'Wstecz';

  @override
  String get loading => 'Ładowanie';

  @override
  String get details => 'Szczegóły';

  @override
  String pages_number(Object number) {
    return '$number stron do odkrycia';
  }

  @override
  String get january => 'Styczeń';

  @override
  String get february => 'Luty';

  @override
  String get march => 'Marzec';

  @override
  String get april => 'Kwiecień';

  @override
  String get may => 'Maj';

  @override
  String get june => 'Czerwiec';

  @override
  String get july => 'Lipiec';

  @override
  String get august => 'Sierpień';

  @override
  String get september => 'Wrzesień';

  @override
  String get october => 'Październik';

  @override
  String get november => 'Listopad';

  @override
  String get december => 'Grudzień';

  @override
  String get logout => 'Wyloguj się';

  @override
  String get profile => 'Profil';

  @override
  String get settings => 'Ustawienia';

  @override
  String get contact_us => 'Skontaktuj się z nami';

  @override
  String get error_opening_email => 'Wystąpił błąd podczas otwierania e-maila';

  @override
  String get register_now => 'Zarejestruj się teraz';

  @override
  String get tracking_permission_title => 'Wesprzyj aplikację';

  @override
  String get tracking_permission_message =>
      'Aby poprawić Twoje wrażenia i wyświetlać bardziej trafne treści, pomóż nam utrzymać aplikację za darmo.\n\nKliknij Zezwól, aby nas wesprzeć.';

  @override
  String get tracking_permission_next => 'Dalej';

  @override
  String get skip => 'Pomiń';

  @override
  String get done => 'Gotowe';

  @override
  String get next => 'Dalej';

  @override
  String get joinCommunityTitle => 'Dołącz do naszej społeczności!';

  @override
  String get joinCommunityDescription =>
      'Poznaj korzyści z dołączenia do społeczności na Telegram:';

  @override
  String get benefitSupportMembers => 'Wsparcie od członków';

  @override
  String get benefitSuggestFeatures => 'Proponowanie nowych funkcji';

  @override
  String get benefitContactDevelopers => 'Kontakt z twórcami';

  @override
  String get benefitExclusivePreviews => 'Ekskluzywne zapowiedzi i wersje beta';

  @override
  String get benefitActiveCommunity => 'Aktywna społeczność';

  @override
  String get joinNowButton => 'Dołącz teraz!';

  @override
  String get alreadyMemberButton => 'Już jestem członkiem';

  @override
  String get laterButton => 'Później';

  @override
  String get errorOpenTelegram => 'Błąd otwierania Telegram';

  @override
  String get disclaimerTitle => 'Źródło danych';

  @override
  String get disclaimerDescription =>
      'Dane o przemiennikach w tej aplikacji pochodzą od IZ8WNH.\n\nAby uzyskać dodatkowe informacje, pobrać pliki CSV do programowania radiotelefonów lub sprawdzić dane niedostępne w aplikacji, odwiedź oficjalną stronę.';

  @override
  String get disclaimerVisitSite => 'Odwiedź iz8wnh.it';

  @override
  String get disclaimerUnderstood => 'Rozumiem';

  @override
  String get errorOpenDisclaimerSite => 'Błąd otwierania strony';

  @override
  String get repeatersMapTitle => 'Mapa przemienników';

  @override
  String get repeatersListTitle => 'Lista przemienników';

  @override
  String get repeatersMapLoading => 'Ładowanie mapy przemienników…';

  @override
  String get repeatersMapGenericError =>
      'Nie udało się załadować przemienników.';

  @override
  String get repeatersMapEmpty => 'Nie znaleziono przemienników w pobliżu.';

  @override
  String get repeatersSearchHint =>
      'Szukaj po nazwie, znaku wywoławczym lub częstotliwości MHz…';

  @override
  String get repeatersSearchEmpty => 'Nie znaleziono przemienników.';

  @override
  String get repeatersSortDistance => 'Odległość';

  @override
  String get repeatersSortLikes => 'Polubienia';

  @override
  String get repeatersSortFrequency => 'Częstotliwość';

  @override
  String repeatersNearbyCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pobliskich przemienników',
      many: '$count pobliskich przemienników',
      few: '$count pobliskie przemienniki',
      one: '$count pobliski przemiennik',
    );
    return '$_temp0';
  }

  @override
  String repeatersResultsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count wyników',
      many: '$count wyników',
      few: '$count wyniki',
      one: '$count wynik',
    );
    return '$_temp0';
  }

  @override
  String get repeatersMapRetry => 'Ponów';

  @override
  String get repeatersMapOpenSettings => 'Otwórz ustawienia';

  @override
  String get repeatersMapPermissionMessage =>
      'Zezwól na dostęp do lokalizacji, aby wyświetlić pobliskie przemienniki.';

  @override
  String get repeatersMapPermissionPermanentlyDenied =>
      'Uprawnienie do lokalizacji zostało trwale odrzucone. Włącz je w ustawieniach systemu.';

  @override
  String get repeatersMapLocationServicesDisabled =>
      'Włącz usługi lokalizacji, aby znaleźć pobliskie przemienniki.';

  @override
  String repeatersMapFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count przemienników znalezionych',
      many: '$count przemienników znalezionych',
      few: '$count przemienniki znalezione',
      one: '$count przemiennik znaleziony',
    );
    return '$_temp0';
  }

  @override
  String get repeaterMode => 'Tryb';

  @override
  String get repeaterModeAnalog => 'Analogowy';

  @override
  String get repeaterModeC4fm => 'C4FM';

  @override
  String get repeaterModeDstar => 'D-STAR';

  @override
  String get repeaterModeDmr => 'DMR';

  @override
  String get repeaterModeAllmode => 'Wszystkie tryby';

  @override
  String get repeaterModeEcholink => 'Echolink';

  @override
  String get repeaterModeAllstar => 'AllStar';

  @override
  String get repeaterModeWinlink => 'Winlink';

  @override
  String get repeaterFrequency => 'Częstotliwość';

  @override
  String get repeaterShift => 'Przesunięcie';

  @override
  String get repeaterCtcss => 'CTCSS';

  @override
  String get repeaterLocation => 'Lokalizacja';

  @override
  String get repeaterDistance => 'Odległość';

  @override
  String get repeaterViewFullDetails => 'Zobacz pełne szczegóły';

  @override
  String get repeatersMapReturnToLocation => 'Wróć do mojej lokalizacji';

  @override
  String clusterRepeatersTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count przemienników w tej lokalizacji',
      many: '$count przemienników w tej lokalizacji',
      few: '$count przemienniki w tej lokalizacji',
      one: '$count przemiennik w tej lokalizacji',
    );
    return '$_temp0';
  }

  @override
  String get profileUnlockFeatures => 'Odblokuj wszystkie funkcje';

  @override
  String get profileUnlockFeaturesDescription =>
      'Zarejestruj się, aby korzystać z opinii, zapisywania ulubionych i szczegółowych statystyk.';

  @override
  String get profileSignUpOrLogin => 'Zarejestruj się lub zaloguj';

  @override
  String get profileErrorOpeningEmail => 'Błąd otwierania e-maila';

  @override
  String get profileJoinTelegramCommunity =>
      'Dołącz do społeczności na Telegram';

  @override
  String get profileWelcomeTitle => 'Witamy w HamQRG';

  @override
  String get profileWelcomeDescription =>
      'Dołącz do naszej społeczności krótkofalowców we Włoszech.';

  @override
  String get profileEditProfile => 'Edytuj profil';

  @override
  String get profileChangePhoto => 'Zmień zdjęcie';

  @override
  String get profileFirstName => 'Imię';

  @override
  String get profileLastName => 'Nazwisko';

  @override
  String get profileCallsign => 'Znak wywoławczy';

  @override
  String get profileRestartIdentificationTitle =>
      'Chcesz zmienić swój status? Możesz ponownie przejść proces identyfikacji, aby zmienić się z licencjonowanego operatora na nasłuchowca SWL.';

  @override
  String get profileRestartIdentificationButton => 'Ponów proces identyfikacji';

  @override
  String get profileSaveChanges => 'Zapisz zmiany';

  @override
  String get profileDangerZone => 'Strefa zagrożenia';

  @override
  String get profileDeleteAccount => 'Usuń konto';

  @override
  String get profileDeleteAccountConfirmTitle => 'Usuń konto';

  @override
  String get profileDeleteAccountConfirmMessage =>
      'Czy na pewno chcesz usunąć swoje konto? Ta czynność jest nieodwracalna.';

  @override
  String get profileDeleteAccountCancel => 'Anuluj';

  @override
  String get profileDeleteAccountConfirm => 'Usuń';

  @override
  String profileAppVersion(String version, String buildNumber) {
    return 'Wersja aplikacji $version (Build $buildNumber)';
  }

  @override
  String get profileSectionCommunity => 'Społeczność i wsparcie';

  @override
  String get profileSectionSupport => 'Wsparcie';

  @override
  String profileVersion(String version, String buildNumber) {
    return 'Wersja: $version+$buildNumber';
  }

  @override
  String profileVersionFormat(String version, String buildNumber) {
    return 'Wersja $version (Build $buildNumber)';
  }

  @override
  String profileError(String error) {
    return 'Błąd: $error';
  }

  @override
  String get authJoinTitle => 'Dołącz do HamQRG';

  @override
  String get authUnlockFeatures =>
      'Zaloguj się, aby odblokować wszystkie funkcje!';

  @override
  String get authWhatYouGet => 'Co zyskasz:';

  @override
  String get authBenefitStatsTitle => 'Szczegółowe statystyki';

  @override
  String get authBenefitStatsDescription =>
      'Monitoruj swoje postępy i się rozwijaj';

  @override
  String get authBenefitQuizTitle => 'Różne tryby quizu';

  @override
  String get authBenefitQuizDescription =>
      'Ćwicz w trybach: maraton, tematycznym i innych.';

  @override
  String get authBenefitSyncTitle => 'Synchronizacja';

  @override
  String get authBenefitSyncDescription => 'Dostęp z dowolnego urządzenia';

  @override
  String get authOrSignInWithEmail => 'Lub zaloguj się przez e-mail';

  @override
  String get authEnterEmail => 'Wpisz e-mail';

  @override
  String get authEnterPassword => 'Wpisz hasło';

  @override
  String get authForgotPassword => 'Nie pamiętasz hasła?';

  @override
  String get authSignIn => 'Zaloguj się';

  @override
  String get authSignUp => 'Zarejestruj się';

  @override
  String get authPasswordLengthError => 'Hasło musi być dłuższe';

  @override
  String get authDontHaveAccount => 'Nie masz konta? Zarejestruj się';

  @override
  String get authHaveAccount => 'Masz już konto? Zaloguj się';

  @override
  String get authBackToSignIn => 'Wróć do logowania';

  @override
  String get authUnexpectedError => 'Błąd uwierzytelniania: ';

  @override
  String get authValidEmailError => 'Wpisz prawidłowy adres e-mail';

  @override
  String get authSendPasswordReset => 'Wyślij reset hasła';

  @override
  String get authPasswordResetSent => 'Link do resetowania hasła wysłany';

  @override
  String get authVerifyEmailMessage =>
      'Zweryfikuj swój e-mail, aby dokończyć rejestrację — sprawdź swoją skrzynkę.';

  @override
  String get authInvalidCredentials => 'Nieprawidłowy e-mail lub hasło';

  @override
  String get authEmailNotConfirmed =>
      'Zweryfikuj swój e-mail, aby się zalogować';

  @override
  String get authFirstName => 'Imię';

  @override
  String get authFirstNameRequired => 'Imię jest wymagane';

  @override
  String get authLastName => 'Nazwisko';

  @override
  String get authLastNameRequired => 'Nazwisko jest wymagane';

  @override
  String get authContinueAsGuest => 'Kontynuuj jako gość';

  @override
  String get commonAppNamePart1 => 'Ham';

  @override
  String get commonAppNamePart2 => 'QRG';

  @override
  String get commonAppTagline => 'Odkrywaj przemienniki wokół siebie';

  @override
  String get commonPoweredBy => 'POWERED BY IU4VRB';

  @override
  String get homeQuickAccess => 'Szybki dostęp';

  @override
  String get homeRepeaterList => 'Lista przemienników';

  @override
  String get homeMyFavorites => 'Moje ulubione';

  @override
  String get homeNearby => 'W pobliżu';

  @override
  String get homeViewAll => 'Zobacz wszystko';

  @override
  String get dashboardTabRepeaters => 'Przemienniki';

  @override
  String get dashboardTabPota => 'POTA';

  @override
  String get dashboardNearbyEmpty => 'Brak przemienników w pobliżu';

  @override
  String get dashboardViewAllRepeaters => 'Zobacz wszystkie przemienniki';

  @override
  String get dashboardViewAllPotaSpots => 'Zobacz wszystkie spoty POTA';

  @override
  String homeStations(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stacji',
      many: '$count stacji',
      few: '$count stacje',
      one: '$count stacja',
    );
    return '$_temp0';
  }

  @override
  String homeSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count zapisanych',
      many: '$count zapisanych',
      few: '$count zapisane',
      one: '$count zapisany',
    );
    return '$_temp0';
  }

  @override
  String get homeActive => 'Aktywne';

  @override
  String get homeIdle => 'Nieaktywne';

  @override
  String get homeNavHome => 'Główna';

  @override
  String get homeNavList => 'Lista';

  @override
  String get homeNavFavorites => 'Ulubione';

  @override
  String get homeNavMap => 'Mapa';

  @override
  String get homeNavProfile => 'Profil';

  @override
  String get favoritesTitle => 'Moje ulubione';

  @override
  String get favoritesSearchHint => 'Szukaj zapisanych przemienników...';

  @override
  String get favoritesFilterAllSaved => 'Wszystkie zapisane';

  @override
  String get favoritesEmpty => 'Brak zapisanych przemienników';

  @override
  String get favoritesEmptyDescription =>
      'Dodaj przemienniki do ulubionych, aby je tu zobaczyć';

  @override
  String favoritesShowing(int showing, int total) {
    return 'Wyświetlanie $showing z $total ulubionych stacji';
  }

  @override
  String get favoritesRemove => 'Usuń z ulubionych';

  @override
  String get favoritesAdd => 'Dodaj do ulubionych';

  @override
  String get repeaterDetailSave => 'Zapisz';

  @override
  String get repeaterDetailShare => 'Udostępnij';

  @override
  String get repeaterDetailReport => 'Zgłoś';

  @override
  String get repeaterDetailTotalLikes => 'Łączna liczba polubień';

  @override
  String get repeaterDetailReports1Yr => 'Zgłoszenia (1 rok)';

  @override
  String get repeaterDetailHealthScore => 'Ocena stanu';

  @override
  String get repeaterDetailExcellent => 'Doskonały';

  @override
  String get repeaterDetailGood => 'Dobry';

  @override
  String get repeaterDetailFair => 'Średni';

  @override
  String get repeaterDetailToVerify => 'Do weryfikacji';

  @override
  String repeaterDetailScoreCalculated(int count) {
    return 'Ocena obliczona na podstawie $count negatywnych zgłoszeń w ostatnim roku';
  }

  @override
  String get repeaterDetailLastLike => 'Ostatnie polubienie';

  @override
  String get repeaterDetailLastDownReport => 'Ostatnie negatywne zgłoszenie';

  @override
  String get repeaterDetailTechnicalData => 'Dane techniczne';

  @override
  String get repeaterDetailFrequency => 'Częstotliwość';

  @override
  String get repeaterDetailShift => 'Przesunięcie';

  @override
  String get repeaterDetailSubtone => 'Subton (SQL)';

  @override
  String get repeaterDetailMode => 'Tryb';

  @override
  String get repeaterDetailLocation => 'Lokalizacja';

  @override
  String repeaterDetailAway(String distance) {
    return '$distance stąd';
  }

  @override
  String get repeaterDetailCommunityReports => 'Zgłoszenia społeczności';

  @override
  String get repeaterDetailUpdateStatusFeedback =>
      'Zaktualizuj status i opinię';

  @override
  String get repeaterDetailEquipment => 'Sprzęt';

  @override
  String get repeaterDetailEquipmentRequired => 'Sprzęt *';

  @override
  String get repeaterDetailAccessModes => 'Tryby dostępu';

  @override
  String get repeaterDetailNetwork => 'Sieć';

  @override
  String get repeaterDetailLocationField => 'Lokalizacja';

  @override
  String get repeaterDetailLocationRequired => 'Lokalizacja *';

  @override
  String get repeaterDetailComment => 'Komentarz';

  @override
  String get repeaterDetailCommentOptional => 'Komentarz (opcjonalny)';

  @override
  String get repeaterDetailCommentPlaceholder =>
      'Jakość sygnału, raport audio lub ogólne uwagi...';

  @override
  String get repeaterDetailReportDown => 'Zgłoś problem';

  @override
  String get repeaterDetailCheckinLike => 'Zamelduj się i polub';

  @override
  String get repeaterDetailYourFeedback => 'Twoja opinia';

  @override
  String get repeaterDetailPostedJustNow => 'Opublikowano przed chwilą';

  @override
  String get repeaterDetailDeleteEntry => 'Usuń wpis';

  @override
  String repeaterDetailViewAllReports(int count) {
    return 'Zobacz wszystkie $count zgłoszenia';
  }

  @override
  String get repeaterDetailStationPortable => 'Przenośna';

  @override
  String get repeaterDetailStationMobile => 'Mobilna';

  @override
  String get repeaterDetailStationFixed => 'Stacjonarna';

  @override
  String get repeaterDetailLike => 'Polub';

  @override
  String get repeaterDetailReportLabel => 'Zgłoś';

  @override
  String get repeaterDetailSaved => 'Zapisano';

  @override
  String get repeaterDetailShareMessage => 'Sprawdź ten przemiennik na HamQRG!';

  @override
  String get repeaterDetailReportDescription =>
      'Funkcja zgłaszania będzie wkrótce dostępna. Będziesz mógł zgłosić nieprawidłowe informacje lub problemy z tym przemiennikiem.';

  @override
  String get commonClose => 'Zamknij';

  @override
  String get favorite => 'Ulubiony';

  @override
  String get accessConfiguration => 'Konfiguracja dostępu';

  @override
  String get noAccessConfiguration => 'Brak dostępnej konfiguracji';

  @override
  String get repeaterDetailAddFeedback => 'Dodaj opinię';

  @override
  String get repeaterDetailOthersReports => 'Zgłoszenia innych użytkowników';

  @override
  String get repeaterDetailRemove => 'Usuń';

  @override
  String get repeaterDetailSelectAccess => 'Wybierz dostęp';

  @override
  String repeaterDetailDistanceWarning(String distance) {
    return 'Musisz znajdować się w odległości $distance od przemiennika, aby wysłać opinię.';
  }

  @override
  String get repeaterDetailInteractive => 'Interaktywny';

  @override
  String get repeaterDetailLogYourSignal => 'Zapisz swój sygnał';

  @override
  String get repeaterDetailUsedEquipment => 'Użyty sprzęt';

  @override
  String get repeaterDetailYourLocation => 'Twoja lokalizacja';

  @override
  String get repeaterDetailLocationPlaceholder => 'Gdzie byłeś? (np. Warszawa)';

  @override
  String get repeaterDetailLocationSelectHint => 'Wybierz miejsce z sugestii';

  @override
  String get feedbackDistanceConfirmTitle => 'Potwierdź wysłanie';

  @override
  String feedbackDistanceConfirmMessage(String distance) {
    return 'Wybrana lokalizacja jest $distance od przemiennika. Czy potwierdzasz, że chcesz wysłać tę opinię na swoją odpowiedzialność?';
  }

  @override
  String get feedbackDistanceConfirmButton => 'Potwierdź';

  @override
  String get feedbackDistanceConfirmCancel => 'Anuluj';

  @override
  String get repeaterDetailSelectAccessInstance => 'Wybierz instancję dostępu';

  @override
  String get repeaterDetailSignalObservations => 'Obserwacje sygnału';

  @override
  String get repeaterDetailSignalObservationsPlaceholder =>
      'Jak była jakość dźwięku?';

  @override
  String get repeaterDetailSendLike => 'Wyślij polubienie';

  @override
  String get repeaterDetailReportIssue => 'Zgłoś problem';

  @override
  String get repeaterDetailRecentActivity => 'Ostatnia aktywność';

  @override
  String get reportIssueTitle => 'Zgłoszenie';

  @override
  String get reportIssueHeadline => 'Pomóż nam utrzymać dane na bieżąco';

  @override
  String get reportIssueDescription =>
      'Znalazłeś coś błędnego lub brakującego w tym przemienniku? Daj nam znać, co należy zmienić, a my to zweryfikujemy.';

  @override
  String get reportIssueWhatToCorrect => 'Co chcesz poprawić lub dodać?';

  @override
  String get reportIssuePlaceholder =>
      'Np. ton CTCSS zmienił się na 88,5 Hz, lokalizacja jest nieco bardziej na północ, opiekun to...';

  @override
  String get reportIssueVerifiedTitle => 'Zweryfikowane zgłoszenia';

  @override
  String get reportIssueVerifiedDescription =>
      'Twoje zgłoszenie zostanie sprawdzone przez koordynatora regionalnego przed aktualizacją publicznej bazy danych. Dziękujemy za Twój wkład w społeczność.';

  @override
  String get reportIssueConfirmCheckbox =>
      'Potwierdzam, że te informacje są prawidłowe na podstawie mojej obserwacji.';

  @override
  String get reportIssueSubmit => 'Wyślij';

  @override
  String get reportIssueMinChars => 'Wymagane minimum 10 znaków';

  @override
  String get reportIssueMaxChars => 'Maksymalnie 2000 znaków';

  @override
  String get reportIssueSuccess => 'Zgłoszenie wysłane pomyślnie';

  @override
  String get reportIssueError => 'Błąd podczas wysyłania zgłoszenia';

  @override
  String get registrationPromptTitle => 'Odblokuj pełny potencjał';

  @override
  String get registrationPromptDescription =>
      'Dołącz do włoskiej społeczności krótkofalowców i przenieś swoje doświadczenie na wyższy poziom.';

  @override
  String get registrationBenefitInteractTitle => 'Interakcja';

  @override
  String get registrationBenefitInteractDescription =>
      'Oceniaj przemienniki i zostawiaj komentarze dla innych.';

  @override
  String get registrationBenefitFavoritesTitle => 'Ulubione';

  @override
  String get registrationBenefitFavoritesDescription =>
      'Zapisuj najczęściej używane częstotliwości i przemienniki.';

  @override
  String get registrationBenefitLogbookTitle => 'Dziennik';

  @override
  String get registrationBenefitLogbookDescription =>
      'Śledź swoje QSO i prowadź osobistą historię.';

  @override
  String get registrationSignInApple => 'Zaloguj się przez Apple';

  @override
  String get registrationSignInGoogle => 'Zaloguj się przez Google';

  @override
  String get registrationPromptFooter =>
      'Darmowa rejestracja. Licencja nie jest wymagana do przeglądania publicznych danych.';

  @override
  String get postLoginOnboardingWelcome => 'Witamy w';

  @override
  String get postLoginOnboardingQuestion =>
      'Czy jesteś licencjonowanym krótkofalowcem?';

  @override
  String get postLoginOnboardingHelpText =>
      'Pomoże nam to dostosować Twoje wrażenia i wyświetlać odpowiednie częstotliwości.';

  @override
  String get postLoginOnboardingYesLicensed => 'Tak, jestem';

  @override
  String get postLoginOnboardingNoListener => 'Nie, jestem tylko nasłuchowcem';

  @override
  String get postLoginOnboardingCallsignTitle => 'Zidentyfikuj się';

  @override
  String get postLoginOnboardingCallsignSubtitle =>
      'Wpisz swój oficjalny znak wywoławczy, aby uzyskać dostęp do funkcji sieciowych.';

  @override
  String get postLoginOnboardingCallsignLabel => 'Znak wywoławczy';

  @override
  String get postLoginOnboardingCallsignHint => 'Np. SP1ABC';

  @override
  String get postLoginOnboardingComplete => 'Uzupełnij profil';

  @override
  String get postLoginOnboardingBack => 'Wstecz';

  @override
  String get postLoginOnboardingChangeInSettings =>
      'Możesz to zmienić później w ustawieniach.';

  @override
  String get postLoginOnboardingSwlTitle => 'Znak SWL';

  @override
  String get postLoginOnboardingSwlQuestion =>
      'Czy masz oficjalny znak nasłuchowy SWL?';

  @override
  String get postLoginOnboardingSwlHelpText =>
      'Znaki nasłuchowe pomagają w identyfikacji w globalnej społeczności monitoringu.';

  @override
  String get postLoginOnboardingSwlYes => 'Tak, mam';

  @override
  String get postLoginOnboardingSwlNo => 'Nie, nie mam';

  @override
  String get postLoginOnboardingSwlEnterCallsign => 'Wpisz znak wywoławczy';

  @override
  String get postLoginOnboardingSwlCallsignHint => 'Np. SP-12345-SWL';

  @override
  String get timeAgoJustNow => 'przed chwilą';

  @override
  String timeAgoMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minut temu',
      many: '$count minut temu',
      few: '$count minuty temu',
      one: '1 minutę temu',
    );
    return '$_temp0';
  }

  @override
  String timeAgoHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count godzin temu',
      many: '$count godzin temu',
      few: '$count godziny temu',
      one: '1 godzinę temu',
    );
    return '$_temp0';
  }

  @override
  String timeAgoDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dni temu',
      many: '$count dni temu',
      few: '$count dni temu',
      one: '1 dzień temu',
    );
    return '$_temp0';
  }

  @override
  String timeAgoWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tygodni temu',
      many: '$count tygodni temu',
      few: '$count tygodnie temu',
      one: '1 tydzień temu',
    );
    return '$_temp0';
  }

  @override
  String timeAgoMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count miesięcy temu',
      many: '$count miesięcy temu',
      few: '$count miesiące temu',
      one: '1 miesiąc temu',
    );
    return '$_temp0';
  }

  @override
  String timeAgoYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lat temu',
      many: '$count lat temu',
      few: '$count lata temu',
      one: '1 rok temu',
    );
    return '$_temp0';
  }

  @override
  String get profileThemeMode => 'Motyw';

  @override
  String get profileThemeModeSystem => 'Systemowy';

  @override
  String get profileThemeModeLight => 'Jasny';

  @override
  String get profileThemeModeDark => 'Ciemny';

  @override
  String get repeaterDetailBeFirstFeedback =>
      'Bądź pierwszym, który zostawi opinię o tym przemienniku!';

  @override
  String get repeaterDetailDistanceFromYou => 'Odległość od Ciebie';

  @override
  String get repeaterDistanceMapNoLocation => 'Lokalizacja niedostępna';

  @override
  String get repeaterDetailNever => 'Nigdy';

  @override
  String get repeaterDetailInfo => 'Informacje';

  @override
  String get repeaterDetailSource => 'Źródło';

  @override
  String get repeaterDetailManager => 'Opiekun';

  @override
  String get repeaterDetailSuggestManager =>
      'Znasz opiekuna przemiennika? Zgłoś go!';

  @override
  String get repeaterDetailViewFeedbackMap => 'Mapa opinii';

  @override
  String get repeaterDetailViewFeedbackMapSubtitle =>
      'Zobacz, gdzie zarejestrowano polubienia i zgłoszenia';

  @override
  String get repeaterDetailAltimetricProfile => 'Profil wysokościowy';

  @override
  String get repeaterDetailAltimetricProfileSubtitle =>
      'Zobacz profil terenu między Tobą a przemiennikiem';

  @override
  String get repeaterCoverageTitle => 'Zasięg';

  @override
  String get repeaterCoverageCardTitle => 'Mapa zasięgu';

  @override
  String get repeaterCoverageCardSubtitle =>
      'Szacuje sygnał przemiennika na obszarze';

  @override
  String get repeaterCoverageLoading => 'Obliczanie zasięgu…';

  @override
  String get repeaterCoverageError => 'Nie można obliczyć zasięgu';

  @override
  String get repeaterCoverageRetry => 'Spróbuj ponownie';

  @override
  String get repeaterCoverageLegendTitle => 'Szacowany sygnał (dBm)';

  @override
  String get repeaterCoverageCta => 'Zobacz zasięg';

  @override
  String get repeaterDetailLosClear =>
      'Czysta linia wzroku między Tobą a przemiennikiem';

  @override
  String get repeaterDetailLosObstructed =>
      'Linia wzroku przesłonięta przez teren';

  @override
  String get repeaterDetailTerrainProfile => 'Profil terenu';

  @override
  String get repeaterDetailLineOfSight => 'Linia wzroku';

  @override
  String get repeaterDetailTotalDistance => 'Odległość';

  @override
  String get repeaterDetailRepeaterElevation => 'Wysokość przemiennika';

  @override
  String get repeaterDetailYourElevation => 'Twoja wysokość';

  @override
  String get repeaterDetailYou => 'Ty';

  @override
  String get repeaterDetailRepeaterLabel => 'Przemiennik';

  @override
  String get repeaterDetailFunFacts => 'Czy wiesz, że?';

  @override
  String get repeaterDetailWavelength => 'Długość fali';

  @override
  String repeaterDetailWavelengthValue(String value) {
    return 'Długość fali tego przemiennika wynosi $value';
  }

  @override
  String get repeaterDetailOscillations => 'Oscylacji na sekundę';

  @override
  String repeaterDetailOscillationsValue(String value) {
    return 'Sygnał oscyluje $value razy na sekundę';
  }

  @override
  String get repeaterDetailPropagationTime => 'Czas propagacji';

  @override
  String repeaterDetailPropagationTimeValue(String value) {
    return 'Twój sygnał potrzebuje $value, aby dotrzeć do przemiennika';
  }

  @override
  String get repeaterDetailWaveCycles => 'Cykle fali w tranzycie';

  @override
  String repeaterDetailWaveCyclesValue(String value) {
    return 'Fala wykonuje $value pełnych cykli w drodze';
  }

  @override
  String get userReportsTitle => 'Moje aktywności';

  @override
  String get userReportsTabReports => 'Zgłoszenia';

  @override
  String get userReportsTabSubmissions => 'Nowe przemienniki';

  @override
  String get userReportsFilterAll => 'Wszystkie';

  @override
  String get userReportsFilterOpen => 'Otwarte';

  @override
  String get userReportsFilterClosed => 'Zamknięte';

  @override
  String get userReportsEmpty => 'Brak wysłanych zgłoszeń';

  @override
  String get userReportsEmptyDescription =>
      'Twoje zgłoszenia przemienników pojawią się tutaj';

  @override
  String get userReportsEmptyFiltered => 'Brak zgłoszeń z tym filtrem';

  @override
  String get userReportsStatusPending => 'Oczekujące';

  @override
  String get userReportsStatusReviewed => 'W trakcie przeglądu';

  @override
  String get userReportsStatusResolved => 'Rozwiązane';

  @override
  String get userReportsStatusRejected => 'Odrzucone';

  @override
  String get userReportsRetryBanner => 'Nie udało się zaktualizować listy';

  @override
  String get userReportsProfileTile => 'Moje zgłoszenia';

  @override
  String get userReportsProfileTileSubtitle => 'Zobacz status swoich zgłoszeń';

  @override
  String get userReportsError => 'Błąd ładowania zgłoszeń';

  @override
  String get userReportsCoordinatorResponse => 'Odpowiedź koordynatora';

  @override
  String get userSubmissionsEmpty => 'Brak zgłoszonych przemienników';

  @override
  String get userSubmissionsEmptyDescription =>
      'Zaproponowane przemienniki pojawią się tutaj';

  @override
  String get userSubmissionsEmptyFiltered => 'Brak przemienników z tym filtrem';

  @override
  String get userSubmissionsStatusPending => 'Oczekujące';

  @override
  String get userSubmissionsStatusApproved => 'Zatwierdzone';

  @override
  String get userSubmissionsStatusRejected => 'Odrzucone';

  @override
  String get userSubmissionsCoordinatorResponse => 'Odpowiedź koordynatora';

  @override
  String get userSubmissionsFrequency => 'Częstotliwość';

  @override
  String get potaTitle => 'Spoty POTA';

  @override
  String get potaSearchHint => 'Szukaj po aktywatorze, parku lub trybie…';

  @override
  String get potaNoSpots => 'Brak aktywnych spotów POTA w tej chwili.';

  @override
  String get potaLoadError => 'Nie udało się załadować spotów POTA';

  @override
  String get potaRetry => 'Ponów';

  @override
  String get potaViewAll => 'Zobacz wszystko';

  @override
  String get potaActivator => 'Aktywator';

  @override
  String get potaFrequency => 'Częstotliwość';

  @override
  String get potaMode => 'Tryb';

  @override
  String get potaPark => 'Park';

  @override
  String get potaReference => 'Referencja';

  @override
  String get potaSpotter => 'Zaobserwował';

  @override
  String get potaComments => 'Komentarze';

  @override
  String get potaLastSpotted => 'Ostatnio zaobserwowany';

  @override
  String get potaOpenQrz => 'QRZ.com';

  @override
  String get potaQrzError => 'Nie udało się otworzyć QRZ.com';

  @override
  String get potaParkWebsite => 'Strona parku';

  @override
  String get potaParkType => 'Typ parku';

  @override
  String get potaLocation => 'Lokalizacja';

  @override
  String get potaCountry => 'Kraj';

  @override
  String get potaFirstActivation => 'Pierwsza aktywacja';

  @override
  String get potaBand => 'Pasmo';

  @override
  String potaDistanceAway(String distance) {
    return '$distance stąd';
  }

  @override
  String potaSpotsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count aktywnych spotów',
      many: '$count aktywnych spotów',
      few: '$count aktywne spoty',
      one: '$count aktywny spot',
    );
    return '$_temp0';
  }

  @override
  String get potaFilterAll => 'Wszystkie';

  @override
  String get potaFilterBand => 'Pasmo';

  @override
  String get potaFilterMode => 'Tryb';

  @override
  String get potaSortByTime => 'Najnowsze';

  @override
  String get potaSortByDistance => 'Najbliższe';

  @override
  String get profileLanguage => 'Język';

  @override
  String get profileUnitSystem => 'Jednostki';

  @override
  String get profileUnitSystemAuto => 'Automatycznie';

  @override
  String get profileUnitSystemMetric => 'Metryczne';

  @override
  String get profileUnitSystemImperial => 'Imperialne';

  @override
  String get profileLanguageSystem => 'Systemowy';

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
  String get onboardingSkip => 'Pomiń';

  @override
  String get onboardingGetStarted => 'Zaczynajmy';

  @override
  String get onboardingNext => 'Dalej';

  @override
  String get onboardingWelcomeTitle1 => 'Znajdź przemienniki w pobliżu';

  @override
  String get onboardingWelcomeSubtitle1 =>
      'Odkrywaj aktywne przemienniki w Twojej okolicy z częstotliwościami, tonami i danymi technicznymi.';

  @override
  String get onboardingWelcomeCredits =>
      'Dane przemienników dostarczone przez IZ8WNH';

  @override
  String get onboardingWelcomeTitle2 => 'Filtruj według trybu';

  @override
  String get onboardingWelcomeSubtitle2 =>
      'Analogowy, DMR, C4FM, D-STAR — znajdź odpowiedni przemiennik natychmiast.';

  @override
  String get onboardingWelcomeTitle3 => 'Spoty POTA w czasie rzeczywistym';

  @override
  String get onboardingWelcomeSubtitle3 =>
      'Śledź aktywacje Parks on the Air z aktualizacjami na żywo, filtrami pasm i odległości.';

  @override
  String get onboardingWelcomeTitle4 => 'Zapisz ulubione';

  @override
  String get onboardingWelcomeSubtitle4 =>
      'Miej najczęściej używane przemienniki pod ręką dla szybkiego dostępu.';

  @override
  String get onboardingLocationTitle => 'Lokalizacja';

  @override
  String get onboardingLocationSubtitle =>
      'Używamy Twojej lokalizacji, aby wyświetlać pobliskie przemienniki i aktywacje POTA.';

  @override
  String get onboardingLocationEnable => 'Włącz lokalizację';

  @override
  String get onboardingLocationSkip => 'Nie teraz';

  @override
  String get onboardingDiscoveryTitle => 'Twój pierwszy przemiennik';

  @override
  String get onboardingDiscoverySubtitle => 'Oto co jest w Twojej okolicy!';

  @override
  String get onboardingDiscoveryViewDetails => 'Zobacz szczegóły';

  @override
  String get onboardingDiscoveryViewSpot => 'Zobacz spot';

  @override
  String get onboardingDiscoveryExploreMap => 'Odkrywaj mapę';

  @override
  String get onboardingDiscoveryNoLocation =>
      'Odkrywaj mapę, aby znaleźć przemienniki i aktywacje POTA';

  @override
  String get onboardingDiscoveryNearbyRepeater => 'Pobliski przemiennik';

  @override
  String get onboardingDiscoveryLivePota => 'Spot POTA na żywo';

  @override
  String get onboardingDiscoveryNoRepeaters =>
      'Nie znaleziono przemienników w pobliżu';

  @override
  String get onboardingTelegramTitle => 'Dołącz do społeczności';

  @override
  String get onboardingTelegramSubtitle =>
      'Dołącz do grupy HamQRG na Telegram, aby otrzymywać aktualizacje, zgłaszać przemienniki i poznawać innych krótkofalowców.';

  @override
  String get onboardingTelegramJoin => 'Dołącz do grupy na Telegram';

  @override
  String get onboardingTelegramLater => 'Może później';

  @override
  String get onboardingTelegramAlreadyMember => 'Już jestem członkiem';

  @override
  String get addRepeaterProfileTile => 'Zaproponuj nowy przemiennik';

  @override
  String get addRepeaterProfileTileSubtitle =>
      'Zgłoś przemiennik, którego jeszcze nie ma na liście';

  @override
  String get addRepeaterTitle => 'Nowy przemiennik';

  @override
  String get addRepeaterHeadline => 'Zgłoś brakujący przemiennik';

  @override
  String get addRepeaterDescription =>
      'Wypełnij dane przemiennika, który chcesz dodać. Zgłoszenie zostanie sprawdzone przed publikacją.';

  @override
  String get addRepeaterSectionRepeater => 'Dane przemiennika';

  @override
  String get addRepeaterSectionAccesses => 'Dostępy';

  @override
  String get addRepeaterSectionLocation => 'Lokalizacja';

  @override
  String get addRepeaterSectionNotes => 'Uwagi';

  @override
  String get addRepeaterName => 'Nazwa';

  @override
  String get addRepeaterNameHint => 'Np. Monte Cimone';

  @override
  String get addRepeaterCallsign => 'Znak wywoławczy';

  @override
  String get addRepeaterCallsignHint => 'Np. IR4AB';

  @override
  String get addRepeaterNameOrCallsignRequired =>
      'Wpisz przynajmniej nazwę lub znak wywoławczy';

  @override
  String get addRepeaterFrequency => 'Częstotliwość (MHz)';

  @override
  String get addRepeaterFrequencyHint => 'Np. 145.000 lub 145,000';

  @override
  String get addRepeaterFrequencyRequired => 'Częstotliwość jest wymagana';

  @override
  String get addRepeaterFrequencyInvalid => 'Nieprawidłowa częstotliwość';

  @override
  String get addRepeaterShift => 'Przesunięcie (MHz)';

  @override
  String get addRepeaterShiftHint => 'Np. -0.600 lub -0,600';

  @override
  String get addRepeaterRegion => 'Region';

  @override
  String get addRepeaterRegionHint => 'Np. Emilia-Romagna';

  @override
  String get addRepeaterProvinceCode => 'Prowincja';

  @override
  String get addRepeaterProvinceCodeHint => 'Np. MO';

  @override
  String get addRepeaterLocality => 'Miejscowość';

  @override
  String get addRepeaterLocalityHint => 'Np. Fanano';

  @override
  String get addRepeaterLatitude => 'Szerokość geograficzna';

  @override
  String get addRepeaterLatitudeHint => 'Np. 44.2100';

  @override
  String get addRepeaterLongitude => 'Długość geograficzna';

  @override
  String get addRepeaterLongitudeHint => 'Np. 10.7900';

  @override
  String get addRepeaterLocator => 'Lokator';

  @override
  String get addRepeaterLocatorHint => 'Np. JN54QF';

  @override
  String get addRepeaterNotes => 'Dodatkowe uwagi';

  @override
  String get addRepeaterNotesHint => 'Dodatkowe informacje o przemienniku...';

  @override
  String get addRepeaterAddAccess => 'Dodaj dostęp';

  @override
  String get addRepeaterRemoveAccess => 'Usuń';

  @override
  String get addRepeaterAccessMode => 'Tryb';

  @override
  String get addRepeaterAccessCtcssTx => 'CTCSS TX (Hz)';

  @override
  String get addRepeaterAccessCtcssTxHint => 'Np. 88.5';

  @override
  String get addRepeaterAccessCtcssRx => 'CTCSS RX (Hz)';

  @override
  String get addRepeaterAccessCtcssRxHint => 'Np. 88.5';

  @override
  String get addRepeaterAccessDcsCode => 'Kod DCS';

  @override
  String get addRepeaterAccessDcsCodeHint => 'Np. 23';

  @override
  String get addRepeaterAccessColorCode => 'Color Code';

  @override
  String get addRepeaterAccessColorCodeHint => 'Np. 1';

  @override
  String get addRepeaterAccessTalkgroup => 'Talkgroup';

  @override
  String get addRepeaterAccessTalkgroupHint => 'Np. 222801';

  @override
  String get addRepeaterAccessDgId => 'DG-ID';

  @override
  String get addRepeaterAccessDgIdHint => 'Np. 0';

  @override
  String get addRepeaterAccessNodeId => 'Node ID';

  @override
  String get addRepeaterAccessNodeIdHint => 'Np. 1234';

  @override
  String get addRepeaterAccessNetworkName => 'Nazwa sieci';

  @override
  String get addRepeaterAccessNetworkNameHint => 'Np. BM Italia';

  @override
  String get addRepeaterAccessNotes => 'Uwagi do dostępu';

  @override
  String get addRepeaterAccessNotesHint => 'Uwagi dotyczące tego dostępu...';

  @override
  String get addRepeaterConfirmCheckbox =>
      'Potwierdzam, że te informacje są prawidłowe według mojej najlepszej wiedzy.';

  @override
  String get addRepeaterVerifiedTitle => 'Zweryfikowane zgłoszenie';

  @override
  String get addRepeaterVerifiedDescription =>
      'Twoje zgłoszenie zostanie sprawdzone przez zespół przed opublikowaniem w bazie danych.';

  @override
  String get addRepeaterSubmit => 'Wyślij';

  @override
  String get addRepeaterSuccess => 'Zgłoszenie wysłane pomyślnie!';

  @override
  String get addRepeaterError => 'Błąd wysyłania zgłoszenia';

  @override
  String get addRepeaterAtLeastOneAccess => 'Dodaj przynajmniej jeden dostęp';

  @override
  String addRepeaterAccessNumber(int number) {
    return 'Dostęp $number';
  }

  @override
  String get changelog1017PotaSpots =>
      'Spoty POTA w czasie rzeczywistym z mapą i szczegółami parków';

  @override
  String get changelog1017SubmitRepeater =>
      'Zaproponuj nowy przemiennik bezpośrednio z aplikacji';

  @override
  String get changelog1017MultiLanguage =>
      'Aplikacja dostępna w języku angielskim, hiszpańskim i francuskim';

  @override
  String get changelog1017Onboarding =>
      'Nowe doświadczenie pierwszego uruchomienia';

  @override
  String get changelog1017ReportAnonymous =>
      'Zgłoszenia dostępne bez rejestracji';

  @override
  String get changelog1020ClusterSpots =>
      'Cluster spoty w czasie rzeczywistym: zobacz, kto słucha na przemiennikach, z powiadomieniami i preferencjami';

  @override
  String get changelog1020DetailTabs =>
      'Strona przemiennika z zakładkami Info, Cluster i Społeczność';

  @override
  String get changelog1020TabletLayout => 'Układ zoptymalizowany dla tabletów';

  @override
  String get changelog110Coverage =>
      'Mapa zasięgu przemienników: zobacz szacowany sygnał bezpośrednio na mapie (PRO)';

  @override
  String get changelog110Reachable =>
      'Co osiągniesz stąd: odkryj przemienniki, które złapiesz ze swojej pozycji, z sygnałem i profilem terenu (PRO)';

  @override
  String get changelogTitle => 'Co nowego';

  @override
  String get changelogSubtitle => 'Oto nowości w tej wersji';

  @override
  String get changelogCategoryAdded => 'Nowe';

  @override
  String get changelogCategoryImproved => 'Ulepszone';

  @override
  String get changelogCategoryFixed => 'Naprawione';

  @override
  String get changelogDismiss => 'Rozumiem!';

  @override
  String get spotCreateTitle => 'Spottuj siebie';

  @override
  String get spotCreateOtherTitle => 'Spottuj OM-a';

  @override
  String get spotCreateDuration => 'Czas trwania';

  @override
  String get spotCreateAccess => 'Tryb (opcjonalnie)';

  @override
  String get spotCreateCallsign => 'Znak wywoławczy usłyszanego OM-a';

  @override
  String get spotCreateCallsignHint => 'Np. SP1ABC';

  @override
  String get spotCreateConfirm => 'Potwierdź';

  @override
  String get spotCreateSuccessSelf => 'Spot utworzony!';

  @override
  String get spotCreateSuccessOther => 'OM spottowany!';

  @override
  String get spotActiveYou => 'Jesteś spottowany';

  @override
  String get spotActiveClose => 'Zamknij spot';

  @override
  String spotActiveOn(String repeaterName) {
    return 'na $repeaterName';
  }

  @override
  String get spotActiveNone => 'Aktualnie nikt nie jest spottowany';

  @override
  String get spotActiveCta => 'Bądź pierwszy!';

  @override
  String get spotActiveSection => 'Aktywne spoty';

  @override
  String get spotHistorySection => 'Historia spotów';

  @override
  String get spotListTitle => 'Najnowsze spoty';

  @override
  String get spotListViewAll => 'Pokaż wszystkie';

  @override
  String get spotListBadgeActive => 'Nasłuchuje';

  @override
  String get spotListBadgeClosed => 'Zakończony';

  @override
  String get spotListBadgeReport => 'Zgłoś';

  @override
  String get spotListEmpty => 'Brak spotów w ostatnich 24 godzinach';

  @override
  String spotListSpottedBy(String callsign) {
    return 'Zgłoszony przez $callsign';
  }

  @override
  String get spotNotificationToggle => 'Powiadomienia klastra';

  @override
  String get spotNotificationDisabled =>
      'Powiadomienia klastra wyłączone w ustawieniach profilu';

  @override
  String get spotNotificationPerFavorite => 'Powiadomienia o spotach';

  @override
  String get spotPreviousClosed => 'Twój poprzedni spot nie jest już aktywny';

  @override
  String get spotErrorAuthRequired => 'Musisz być zalogowany.';

  @override
  String get spotErrorCallsignRequired =>
      'Ustaw swój znak wywoławczy w profilu, aby korzystać z klastra.';

  @override
  String get spotErrorInvalidDuration =>
      'Czas trwania musi wynosić od 5 do 60 minut.';

  @override
  String get spotErrorRepeaterNotFound => 'Przemiennik nie znaleziony.';

  @override
  String get spotErrorInvalidAccess =>
      'Nieprawidłowy tryb dostępu dla tego przemiennika.';

  @override
  String get spotErrorSpotNotFound => 'Spot nie znaleziony.';

  @override
  String get spotErrorForbidden =>
      'Nie możesz zamknąć spota, który nie jest twój.';

  @override
  String get spotErrorAlreadyClosed => 'Spot jest już zamknięty.';

  @override
  String get spotErrorGeneric => 'Błąd tworzenia spota. Spróbuj ponownie.';

  @override
  String get spotAccessUnavailable => '(tryb nie jest już dostępny)';

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
  String get spotsFiltersTitle => 'Filtry';

  @override
  String get spotsFilterBand => 'Pasmo';

  @override
  String get spotsFilterMode => 'Emisja';

  @override
  String get spotsFilterAll => 'Wszystkie';

  @override
  String get spotsFiltersReset => 'Wyczyść filtry';

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
  String get reachSheetError =>
      'Nie udało się obliczyć osiągalnych przemienników.';

  @override
  String reachSheetCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Osiągasz $count przemiennika',
      many: 'Osiągasz $count przemienników',
      few: 'Osiągasz $count przemienniki',
      one: 'Osiągasz 1 przemiennik',
    );
    return '$_temp0';
  }

  @override
  String get reachSheetSubtitle =>
      'Z twojej lokalizacji, posortowane według sygnału';

  @override
  String get reachSheetEmpty => 'Brak osiągalnych przemienników w pobliżu.';

  @override
  String get reachBadgeTitle => 'Osiągasz go stąd?';

  @override
  String get reachBadgeSubtitle =>
      'Sprawdź, czy ten przemiennik cię pokrywa i z jakim sygnałem';

  @override
  String get reachDiscoverCta => 'Odkryj z PRO';

  @override
  String get reachReachable => 'Osiągasz go';

  @override
  String get reachOutOfCoverage => 'Poza zasięgiem';

  @override
  String reachReachableDetail(String signal, String distance) {
    return '$signal · $distance · dotknij, by zobaczyć profil';
  }

  @override
  String reachDistanceFromHere(String distance) {
    return '$distance stąd';
  }

  @override
  String get reachComputing => 'Obliczanie zasięgu…';

  @override
  String get reachRepeaterFallback => 'Przemiennik';

  @override
  String get reachMapButton => 'Co osiągasz?';

  @override
  String get reachUpsellTitle => 'Co osiągasz stąd? 📡';

  @override
  String get reachUpsellBody =>
      'Zobacz w czasie rzeczywistym WSZYSTKIE przemienniki, które odbierasz ze swojej lokalizacji, z przewidywanym sygnałem i profilem terenu. Ile naprawdę osiągasz stamtąd, gdzie teraz jesteś?';

  @override
  String get reachUpsellLater => 'Później';

  @override
  String get linkProfileObstructed =>
      'Przeszkoda na trasie (sygnał przez dyfrakcję)';

  @override
  String get linkProfileClear => 'Wolna linia widzenia';

  @override
  String linkProfileCaption(String tx, String rx) {
    return 'Profil terenu i linia widzenia · TX $tx · RX $rx';
  }

  @override
  String get proUnlockCta => 'Odblokuj z PRO';

  @override
  String get proWelcomeTitle => 'Witaj w PRO! 🎉';

  @override
  String get proWelcomeBody =>
      'Odblokowałeś mapę zasięgu, przemienniki osiągalne z twojej lokalizacji oraz wszystkie funkcje PRO. 📡';

  @override
  String get proWelcomeCta => 'Zacznij odkrywać';

  @override
  String get commonCancel => 'Anuluj';

  @override
  String get commonDelete => 'Usuń';

  @override
  String get commonEdit => 'Edytuj';

  @override
  String get commonOpenSettings => 'Otwórz ustawienia';

  @override
  String get commonFieldRequired => 'Pole wymagane';

  @override
  String get fieldName => 'Imię';

  @override
  String get fieldAddress => 'Adres';

  @override
  String get fieldCity => 'Miasto';

  @override
  String get fieldDescription => 'Opis';

  @override
  String get fieldYear => 'Rok';

  @override
  String get fieldSelectDateHint => 'Wybierz datę';

  @override
  String get validationInvalidYear => 'Wybierz prawidłowy rok';

  @override
  String get validationPasswordMinLength =>
      'Hasło musi mieć co najmniej 6 znaków';

  @override
  String get permissionsMissingTitle => 'Brak uprawnień!';

  @override
  String get imageUploadError => 'Błąd podczas przesyłania obrazu';

  @override
  String get uploadImageLabel => 'Prześlij obraz';

  @override
  String get sourceGallery => 'Galeria';

  @override
  String get sourceCamera => 'Aparat';

  @override
  String get changePasswordTitle => 'Zmień hasło';

  @override
  String get fieldNewPassword => 'Nowe hasło';

  @override
  String get fieldConfirmNewPassword => 'Potwierdź nowe hasło';

  @override
  String get validationPasswordsNoMatch => 'Hasła nie są zgodne';

  @override
  String get passwordChangedSuccess => 'Hasło zmienione pomyślnie';

  @override
  String errorWithMessage(String message) {
    return 'Błąd: $message';
  }

  @override
  String get updateRequiredTitle => 'Wymagana aktualizacja';

  @override
  String get updateRequiredAction => 'Zaktualizuj teraz';

  @override
  String get yearPickerTitle => 'Wybierz rok';

  @override
  String get repeaterTabInfo => 'Info';

  @override
  String get repeaterTabCluster => 'Cluster';

  @override
  String get repeaterTabCommunity => 'Społeczność';

  @override
  String get updateRequiredBody =>
      'Dostępna jest nowa wersja aplikacji. Zaktualizuj, aby dalej z niej korzystać.';

  @override
  String get errorOpeningStore => 'Błąd podczas otwierania sklepu';

  @override
  String get deleteConfirmTitle => 'Potwierdź usunięcie';

  @override
  String get deleteConfirmContent => 'Czy na pewno chcesz usunąć?';

  @override
  String get cameraPermissionRationale =>
      'Aby zrobić zdjęcie, zezwól na dostęp do aparatu w ustawieniach.';

  @override
  String get coverageSearchHint => 'Wyszukaj miejsce lub wklej współrzędne';

  @override
  String get coverageSearchRecentTitle => 'Ostatnie wyszukiwania';

  @override
  String get coverageSearchNoResults => 'Nie znaleziono miejsca';

  @override
  String get coverageSearchTip =>
      'Możesz wkleić współrzędne (46.4879, 11.8123) lub przytrzymać palec na mapie';

  @override
  String get coverageSearchErrorOutOfRange =>
      'Współrzędne poza zakresem: szerokość ±90, długość ±180';

  @override
  String get coverageSearchErrorOffline =>
      'Brak połączenia: wyszukiwanie miejsc wymaga sieci';

  @override
  String get coverageSearchErrorFailed =>
      'Wyszukiwanie nie powiodło się. Spróbuj ponownie.';

  @override
  String get coverageSearchClearPoint => 'Usuń punkt';

  @override
  String get coverageSearchPointSemantics => 'Wybrany punkt wyszukiwania';

  @override
  String get coverageBreadthTitle => 'Zasięg wyszukiwania';

  @override
  String get coverageBreadthQuick => 'Szybka';

  @override
  String get coverageBreadthMedium => 'Średnia';

  @override
  String get coverageBreadthExtended => 'Rozszerzona';

  @override
  String coverageBreadthQuickHint(String radius) {
    return '$radius · najszybsza odpowiedź';
  }

  @override
  String coverageBreadthMediumHint(String radius) {
    return '$radius · zrównoważona';
  }

  @override
  String coverageBreadthExtendedHint(String radius) {
    return '$radius · dalej, dłuższe oczekiwanie';
  }

  @override
  String get coverageResultSubtitle => 'Z wybranego punktu';

  @override
  String get coverageResultEmptyNoReachable =>
      'Z tego punktu nie można osiągnąć żadnego przemiennika';

  @override
  String get coverageResultEmptyNoRepeaters =>
      'W tym obszarze nie ma zarejestrowanych przemienników';

  @override
  String get coverageResultClearFilters => 'Wyczyść filtry';

  @override
  String get coverageResultError => 'Obliczenie nie powiodło się';

  @override
  String get coverageResultComputing => 'Obliczanie odbioru…';

  @override
  String get coverageResultCancel => 'Anuluj';

  @override
  String coverageResultCount(int count) {
    return 'Osiągalne przemienniki: $count';
  }

  @override
  String coverageResultCountFiltered(int shown, int total) {
    return '$shown z $total osiągalnych';
  }

  @override
  String coverageResultHiddenByFilters(int count) {
    return 'Ukryte przez filtry: $count';
  }

  @override
  String coverageTeaserTitle(String place) {
    return 'Co osiągniesz z $place? 📡';
  }

  @override
  String get coverageTeaserBody =>
      'Każdy przemiennik osiągalny z tego punktu, z przewidywanym sygnałem i odległością — jeszcze przed wyjazdem.';

  @override
  String get coverageTeaserBenefitAnywhere => 'Dowolny punkt na świecie';

  @override
  String get coverageTeaserBenefitOffline => 'Dostępne bez sieci, w terenie';

  @override
  String get coverageTeaserBenefitSave =>
      'Zapisujesz stanowisko i wracasz do niego';

  @override
  String get stationSaveCta => 'Zapisz stanowisko';

  @override
  String get stationSaveTitle => 'Nazwa stanowiska';

  @override
  String get stationRename => 'Zmień nazwę';

  @override
  String get stationDelete => 'Usuń';

  @override
  String get stationRefresh => 'Odśwież';

  @override
  String get stationRefreshAll => 'Odśwież wszystkie';

  @override
  String get stationOfflineNotice => 'Dane zapisane na urządzeniu';

  @override
  String get stationStaleNotice => 'Dane mogą być nieaktualne';

  @override
  String get stationMissingEntry => 'Dane niedostępne offline';

  @override
  String get stationDuplicateTitle => 'Punkt już zapisany';

  @override
  String stationDuplicateBody(String distance) {
    return 'W promieniu $distance istnieje już stanowisko. Zaktualizować je czy utworzyć osobne?';
  }

  @override
  String get stationDuplicateUpdate => 'Zaktualizuj';

  @override
  String get stationDuplicateCreate => 'Utwórz osobne';

  @override
  String get stationSaveFailed => 'Zapis nie powiódł się: za mało miejsca';

  @override
  String get stationSavedCta => 'Lokalizacja zapisana';

  @override
  String get stationRemoveCta => 'Usuń';

  @override
  String get stationRemoveTitle => 'Usunąć lokalizację?';

  @override
  String stationRemoveBody(String name) {
    return '„$name” i jej dane offline zostaną usunięte z tego urządzenia.';
  }

  @override
  String get stationRemovedSnack => 'Lokalizacja usunięta';

  @override
  String get stationSaveError => 'Nie udało się zapisać. Spróbuj ponownie.';

  @override
  String get stationsTitle => 'Moje stanowiska';

  @override
  String get stationsProfileSubtitle =>
      'Punkty, które sprawdziłeś, dostępne bez sieci';

  @override
  String get stationsEmptyTitle => 'Brak zapisanych stanowisk';

  @override
  String get stationsEmptyBody =>
      'Stanowisko to punkt na mapie, dla którego masz już wyliczony zasięg, zapisany po to, by odnaleźć go także bez sieci.';

  @override
  String get stationsEmptyStep1 =>
      'Wybierz punkt na mapie: przytrzymaj, wyszukaj po nazwie lub wklej współrzędne.';

  @override
  String stationsEmptyStep2(String action) {
    return 'Dotknij „$action”, aby zobaczyć, które przemienniki osiągasz z tego miejsca.';
  }

  @override
  String get stationsEmptyStep3 =>
      'Zapisz punkt: znajdziesz go tutaj, także w terenie bez sieci.';

  @override
  String get stationsGoToMap => 'Przejdź do mapy';

  @override
  String get stationsRefreshDone => 'Odświeżanie zakończone';

  @override
  String spotsUpdatedAgo(String time) {
    return 'Zaktualizowano $time';
  }

  @override
  String spotsNextUpdateSeconds(int seconds) {
    return 'Aktualizacja za $seconds s';
  }

  @override
  String spotsNextUpdateMinutes(int minutes) {
    return 'Aktualizacja za $minutes min';
  }

  @override
  String get spotsUpdating => 'Aktualizowanie…';

  @override
  String spotsAutoRefreshHint(int seconds) {
    return 'Automatyczne odświeżanie co $seconds sekund';
  }

  @override
  String get spotsManualRefreshHint => 'Dotknij, aby odświeżyć';

  @override
  String coverageResultScope(String km, int count) {
    return 'w promieniu $km · ocenionych: $count';
  }

  @override
  String get coverageResultRecalculating => 'Przeliczanie';

  @override
  String get offlineBannerMessage =>
      'Jesteś offline: przeglądasz zapisane dane';

  @override
  String get offlineMapsTitle => 'Mapy offline';

  @override
  String get offlineMapsEntrySubtitle =>
      'Pobierz mapy do użytku bez połączenia';

  @override
  String get offlineMapsEmpty =>
      'Brak pobranych regionów. Pobierz obszar, aby widzieć mapę nawet bez połączenia.';

  @override
  String get offlineMapsAddRegion => 'Pobierz region';

  @override
  String get offlineMapsRegionNameLabel => 'Nazwa regionu';

  @override
  String get offlineMapsRegionNameHint => 'Np. Dom, Schronisko, Aktywacja SOTA';

  @override
  String get offlineMapsRadiusLabel => 'Promień';

  @override
  String get offlineMapsDownload => 'Pobierz';

  @override
  String get offlineMapsDownloadingStyle => 'Pobieranie stylu mapy…';

  @override
  String offlineMapsDownloadingTiles(String percent) {
    return 'Pobieranie map… $percent%';
  }

  @override
  String offlineMapsEstimatedSize(String size) {
    return 'Szacowany rozmiar: $size';
  }

  @override
  String get offlineMapsDownloadError =>
      'Pobieranie nie powiodło się. Spróbuj ponownie.';

  @override
  String get offlineMapsDeleteError =>
      'Usuwanie nie powiodło się. Spróbuj ponownie.';

  @override
  String get offlineMapsDeleteConfirmTitle => 'Usunąć region?';

  @override
  String offlineMapsDeleteConfirmMessage(String name) {
    return '„$name” nie będzie już dostępny offline.';
  }

  @override
  String get offlineMapsDeleteConfirm => 'Usuń';

  @override
  String offlineMapsRegionSubtitle(String radius, String size) {
    return 'Promień $radius · $size';
  }

  @override
  String get offlineMapsIncomplete => 'Niekompletne pobieranie';

  @override
  String get offlineMapsResume => 'Wznów';

  @override
  String get offlineMapsCenterInfo =>
      'Region zostanie wyśrodkowany na Twojej bieżącej lokalizacji.';

  @override
  String get dashboardOfflineTitle => 'Jesteś offline';

  @override
  String get dashboardOfflineMessage =>
      'Brak zapisanych danych dla tego obszaru. Twoje zapisane lokalizacje i pobrane mapy są nadal dostępne.';

  @override
  String get offlineMapsCenterMine => 'Moja lokalizacja';

  @override
  String get offlineMapsCenterSearch => 'Szukaj miejsca';

  @override
  String get offlineMapsCenterSearchInfo =>
      'Wyszukaj miasto lub miejsce: region zostanie tam wyśrodkowany.';

  @override
  String offlineMapsCenterSelected(String label) {
    return 'Środek: $label';
  }

  @override
  String get changelog120OfflineMode =>
      'Tryb offline: przemienniki, ulubione, profil, zasięg i osiągalność dostępne także bez sieci (PRO)';

  @override
  String get changelog120OfflineMaps =>
      'Mapy offline: pobierz okolicę, w której jesteś, lub dowolne wybrane miejsce i korzystaj z niej bez połączenia (PRO)';

  @override
  String get changelog120CoverageSearch =>
      'Wyszukiwanie zasięgu z dowolnego punktu: wyszukaj miejscowość, wklej współrzędne lub przytrzymaj mapę, aby sprawdzić, co stamtąd osiągasz';

  @override
  String get changelog120SavedStations =>
      'Moje stanowiska: zapisuj interesujące cię punkty i przeglądaj je także offline (PRO)';

  @override
  String get changelog120SpotsRefresh =>
      'Spoty SOTA i POTA odświeżają się same co minutę, z kolorowymi odznakami emisji (CW, SSB, FT8…)';

  @override
  String get changelog120NoNetwork =>
      'Bez połączenia aplikacja uruchamia się od razu, pokazuje, co jest dostępne, i wyłącza akcje wymagające sieci';

  @override
  String get changelog130ImperialUnits =>
      'Mile i stopy: aplikacja korzysta teraz z jednostek Twojego urządzenia, a system możesz wybrać w Ustawieniach';
}
