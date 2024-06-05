// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> de = {
  "app_title": "SebekVPN",
  "connect_page": {
    "title": "SebekVPN",
    "menu": {
      "title": "Menü",
      "account": "Mein Konto",
      "premium": "Premium",
      "settings": "Einstellungen",
      "faq": "FAQ",
      "rate": "Bewerten Sie uns"
    },
    "offer": {
      "title": "Upgrade auf Pro",
      "desc": "Entsperren Sie eine Hochgeschwindigkeitsverbindung und greifen Sie auf jedes Land zu"
    },
    "connection": {
      "connected": "Verbunden",
      "connecting": "Verbindung wird hergestellt...",
      "not_connected": "Nicht verbunden"
    },
    "stats": {
      "download": "Herunterladen",
      "upload": "Hochladen",
      "ping": "Ping",
      "ip": "IP"
    },
    "change": "Ändern"
  },
  "notifications_page": {
    "title": "Benachrichtigung",
    "more": "Mehr"
  },
  "faq_page": {
    "title": "FAQ",
    "questions": {
      "secure": {
        "title": "Ist meine Verbindung sicher?",
        "description": "Ja!"
      },
      "sebek": {
        "title": "Wer ist ein braver Junge?!",
        "description": "Sebek!"
      }
    }
  },
  "account_page": {
    "title": "Mein Konto",
    "email": "E-Mail",
    "password": "Passwort",
    "change": "Ändern"
  },
  "offer_page": {
    "skip": "Überspringen",
    "title": "Premium-Funktionen",
    "offers": {
      "premium": {
        "title": "Premium",
        "description": "Unbegrenzte VPN-Server",
        "per": "pro Monat"
      },
      "personal": {
        "title": "Persönlich",
        "description": "Verwenden Sie Ihren perfekten VPN-Server",
        "from": "Ab",
        "per": "pro Monat"
      },
      "trial": "Starte meinen 7-tägigen kostenlosen Testzeitraum"
    },
    "footer": "Das Abonnement verlängert sich automatisch. Sie können Ihr Abonnement jederzeit kündigen."
  },
  "select_server_page": {
    "title": "Server auswählen",
    "search_placeholder": "Land oder Stadt hier suchen...",
    "section_selector": {
      "free": "Kostenlos",
      "premium": "Premium",
      "personal": "Persönlich"
    },
    "sections": {
      "recommended": "Empfohlene Server",
      "all": "Alle Server"
    },
    "location": "Standort",
    "locations": "Standorte",
    "personal": {
      "blank": {
        "title": "Sie haben keinen persönlichen Server",
        "description": "Sie können einen Server auf der Premium-Seite kaufen",
        "action": "Mehr kaufen"
      }
    }
  },
  "buy_personal_server_page": {
    "title": "Persönlicher Server",
    "search": "Land durchsuchen...",
    "per_month": "pro Monat",
    "sold": "Verkauft",
    "buy": "Kaufen"
  },
  "sign_in": {
    "title": "Anmelden",
    "with": {
      "apple": "Mit Apple anmelden",
      "google": "Mit Google anmelden",
      "email": "Mit E-Mail anmelden"
    },
    "email": {
      "label": "E-Mail",
      "hint": "Deine E-Mail",
      "button": "Anmelden",
      "error": "Bitte gib eine gültige E-Mail-Adresse ein"
    },
    "password": {
      "label": "Passwort",
      "hint": "Dein Passwort",
      "error": {
        "small": "Das Passwort muss mindestens 8 Zeichen enthalten",
        "big": "Das Passwort muss weniger als 32 Zeichen haben"
      },
      "forgot": {
        "link": "Passwort vergessen?",
        "title": "Passwort vergessen"
      },
      "change": "Passwort ändern",
      "new": {
        "label": "Neues Passwort",
        "hint": "Dein neues Passwort"
      },
      "confirm": {
        "label": "Passwort bestätigen",
        "hint": "Neues Passwort wiederholen",
        "error": "Die Passwörter müssen identisch sein"
      }
    },
    "save": "Speichern",
    "send": "Senden",
    "terms": {
      "text": "Es wird automatisch ein neues Konto erstellt. \nDurch die Autorisierung stimmen Sie den",
      "link": "Allgemeinen Geschäftsbedingungen"
    },
    "confirmation_code": {
      "title": "Bestätigungscode",
      "description1": "Der Autorisierungscode wurde an folgende Adresse gesendet:",
      "description2": "Bitte geben Sie ihn unten ein"
    }
  },
  "settings_page": {
    "title": "Einstellungen",
    "language_label": "App-Sprache",
    "notification": "Benachrichtigung",
    "connect_when_starts": "Verbindung herstellen, wenn VPN startet",
    "protocols": {
      "title": "VPN-Protokoll",
      "description": "Legen Sie das für die Verbindung verwendete Protokoll fest",
      "adaptive": "Adaptiv",
      "tcp": "TCP",
      "udp": "UDP"
    },
    "connection_timeout": {
      "title": "Verbindungszeitlimit",
      "description": "Wie lange sollte SebekVPN versuchen, eine Verbindung herzustellen, bevor es aufgibt?",
      "s10": "10 Sek",
      "s30": "30 Sek",
      "m1": "1 Min",
      "m2": "2 Min",
      "continuously": "Fortlaufend erneut versuchen"
    },
    "batter_saver": {
      "title": "Batteriesparmodus",
      "description": "Keine erneute Verbindung, wenn das Gerät gesperrt ist und der Bildschirm nicht aktiv ist. Diese Einstellung ist nur wirksam, wenn das Gerät durch ein Passwort, Touch ID oder Face ID geschützt ist. Um ein Datenleck zu vermeiden, muss die Option Nahtloser Tunnel aktiviert sein."
    },
    "seamless_tunnel": {
      "title": "Nahtloser Tunnel",
      "description": "Blockiere das Internet, wenn der VPN pausiert oder sich erneut verbindet"
    },
    "ping_connection": {
      "title": "Ping-Verbindung",
      "description": "Überprüfen Sie die aktuelle Internetgeschwindigkeit"
    }
  },
  "language": {
    "en": {
      "label": "English",
      "country": "england",
      "_comment": "не изменяйте country, это нужно для загрузки изображения флага"
    },
    "pl": {
      "label": "Polski",
      "country": "poland",
      "_comment": "не изменяйте country, это нужно для загрузки изображения флага"
    },
    "de": {
      "label": "Deutsch",
      "country": "germany",
      "_comment": "не изменяйте country, это нужно для загрузки изображения флага"
    },
    "fr": {
      "label": "Français",
      "country": "france",
      "_comment": "не изменяйте country, это нужно для загрузки изображения флага"
    },
    "uk": {
      "label": "Українська",
      "country": "ukraine",
      "_comment": "don't change country, it needed to load flag image"
    },
    "ru": {
      "label": "Русский",
      "country": "russian",
      "_comment": "don't change country, it needed to load flag image"
    }
  },
  "error": {
    "user_not_found": "Es wurde kein Konto mit dieser E-Mail-Adresse gefunden",
    "invalid_code": "Ungültiger Bestätigungscode. Überprüfen Sie ihn erneut und versuchen Sie es erneut",
    "no_permission": "Sie haben keine Erlaubnis"
  },
  "try_again_reconnect": "Versuchen Sie es in ein paar Sekunden noch einmal",
  "incorrect_username_or_password": "Falscher Benutzername oder Passwort"
};
static const Map<String,dynamic> en = {
  "app_title": "SebekVPN",
  "connect_page": {
    "title": "SebekVPN",
    "menu": {
      "title": "Menu",
      "account": "My Account",
      "premium": "Premium",
      "settings": "Settings",
      "faq": "FAQ",
      "rate": "Rate us"
    },
    "offer": {
      "title": "Update to Pro",
      "desc": "Unlock high speed connection and access to every country"
    },
    "connection": {
      "connected": "Connected",
      "connecting": "Connecting...",
      "not_connected": "Not connected"
    },
    "stats": {
      "download": "Download",
      "upload": "Upload",
      "ping": "Ping",
      "ip": "IP"
    },
    "change": "Change"
  },
  "notifications_page": {
    "title": "Notification",
    "more": "More"
  },
  "faq_page": {
    "title": "FAQ",
    "questions": {
      "secure": {
        "title": "Is may connection secure?",
        "description": "Yes!"
      },
      "sebek": {
        "title": "Who's a good boy?!",
        "description": "Sebek!"
      }
    }
  },
  "account_page": {
    "title": "My account",
    "email": "Email",
    "password": "Password",
    "change": "Change"
  },
  "offer_page": {
    "skip": "skip",
    "title": "Premium features",
    "offers": {
      "premium": {
        "title": "Premium",
        "description": "Unlimited VPN servers",
        "per": "per month"
      },
      "personal": {
        "title": "Personal",
        "description": "Use your perfect VPN server",
        "from": "From",
        "per": "per month"
      },
      "trial": "Start my 7-day Free Trial"
    },
    "footer": "Subscription is auto-renewable. You can cancel your subscription at any time."
  },
  "select_server_page": {
    "title": "Select Server",
    "search_placeholder": "Search country or city here...",
    "section_selector": {
      "free": "Free",
      "premium": "Premium",
      "personal": "Personal"
    },
    "sections": {
      "recommended": "Recommended Servers",
      "all": "All Servers"
    },
    "location": "location",
    "locations": "locations",
    "personal": {
      "blank": {
        "title": "You don't have a personal server",
        "description": "You can buy a server on \"Premium\" page",
        "action": "Buy more"
      }
    }
  },
  "buy_personal_server_page": {
    "title": "Personal Server",
    "search": "Search country or city here...",
    "per_month": "per month",
    "sold": "Sold",
    "buy": "Buy"
  },
  "sign_in": {
    "title": "Sign in",
    "with": {
      "apple": "Sign in with Apple",
      "google": "Sign in with Google",
      "email": "Sign in with Email"
    },
    "email": {
      "label": "Email",
      "hint": "Your Email",
      "button": "Sign in",
      "error": "Please enter a valid email address"
    },
    "password": {
      "label": "Password",
      "hint": "Your password",
      "error": {
        "small": "Password must have at least 8 characters",
        "big": "Password must have less than 32 characters"
      },
      "forgot": {
        "link": "Forgot password?",
        "title": "Forgot password"
      },
      "change": "Change password",
      "new": {
        "label": "New Password",
        "hint": "Your New Password"
      },
      "confirm": {
        "label": "Confirm Password",
        "hint": "Repeat New Password",
        "error": "Passwords must be identical"
      }
    },
    "save": "Save",
    "send": "Send",
    "terms": {
      "text": "New account will be automatically created. \nBy authorizing, you agree with the",
      "link": "terms and conditions"
    },
    "confirmation_code": {
      "title": "Confirmation code",
      "description1": "The authorization code has been sent to",
      "description2": "Please, enter it in the below"
    }
  },
  "settings_page": {
    "title": "Settings",
    "language_label": "App Language",
    "notification": "Notification",
    "connect_when_starts": "Connect when VPN starts",
    "protocols": {
      "title": "VPN Protocol",
      "description": "Set the protocol used for connection",
      "adaptive": "Adaptive",
      "tcp": "TCP",
      "udp": "UDP"
    },
    "connection_timeout": {
      "title": "Connection Timeout",
      "description": "How long should SebekVPN try to connect before giving up?",
      "s10": "10 sec",
      "s30": "30 sec",
      "m1": "1 min",
      "m2": "2 min",
      "continuously": "Continuously Retry"
    },
    "batter_saver": {
      "title": "Battery Saver",
      "description": "Do not reconnect when the device is locked and the screen in not active. The setting is only effective if the device is secured with a password, Touch ID, or Face ID. To avoid date leakage, the Seamless Tunnel setting has to be enabled."
    },
    "seamless_tunnel": {
      "title": "Seamless Tunnel",
      "description": "Block internet while VPN is paused or reconnecting"
    },
    "ping_connection": {
      "title": "Ping connection",
      "description": "Check current internet speed"
    }
  },
  "language": {
    "en": {
      "label": "English",
      "country": "england",
      "_comment": "don't change country, it needed to load flag image"
    },
    "pl": {
      "label": "Polski",
      "country": "poland",
      "_comment": "don't change country, it needed to load flag image"
    },
    "de": {
      "label": "Deutsche",
      "country": "germany",
      "_comment": "don't change country, it needed to load flag image"
    },
    "fr": {
      "label": "Française",
      "country": "france",
      "_comment": "don't change country, it needed to load flag image"
    },
    "uk": {
      "label": "Українська",
      "country": "ukraine",
      "_comment": "don't change country, it needed to load flag image"
    },
    "ru": {
      "label": "Русский",
      "country": "russian",
      "_comment": "don't change country, it needed to load flag image"
    }
  },
  "error": {
    "user_not_found": "An account with this email has not been found",
    "invalid_code": "Invalid confirmation code, re-check it and try again",
    "no_permission": "You have no permission"
  },
  "try_again_reconnect": "Try again in a few seconds",
  "incorrect_username_or_password": "Incorrect username or password"
};
static const Map<String,dynamic> fr = {
  "app_title": "SebekVPN",
  "connect_page": {
    "title": "SebekVPN",
    "menu": {
      "title": "Menu",
      "account": "Mon compte",
      "premium": "Premium",
      "settings": "Paramètres",
      "faq": "FAQ",
      "rate": "Évaluez-nous"
    },
    "offer": {
      "title": "Mise à jour vers Pro",
      "desc": "Débloquez une connexion haute vitesse et accédez à tous les pays"
    },
    "connection": {
      "connected": "Connecté",
      "connecting": "Connexion en cours...",
      "not_connected": "Non connecté"
    },
    "stats": {
      "download": "Téléchargement",
      "upload": "Envoi",
      "ping": "Ping",
      "ip": "IP"
    },
    "change": "Changer"
  },
  "notifications_page": {
    "title": "Notification",
    "more": "Plus"
  },
  "faq_page": {
    "title": "FAQ",
    "questions": {
      "secure": {
        "title": "Ma connexion est-elle sécurisée ?",
        "description": "Oui !"
      },
      "sebek": {
        "title": "Qui est un bon garçon ?!",
        "description": "Sebek !"
      }
    }
  },
  "account_page": {
    "title": "Mon compte",
    "email": "Email",
    "password": "Mot de passe",
    "change": "Changer"
  },
  "offer_page": {
    "skip": "passer",
    "title": "Fonctionnalités Premium",
    "offers": {
      "premium": {
        "title": "Premium",
        "description": "Serveurs VPN illimités",
        "per": "par mois"
      },
      "personal": {
        "title": "Personnel",
        "description": "Utilisez votre serveur VPN parfait",
        "from": "À partir de",
        "per": "par mois"
      },
      "trial": "Commencer mon essai gratuit de 7 jours"
    },
    "footer": "L'abonnement se renouvelle automatiquement. Vous pouvez annuler votre abonnement à tout moment."
  },
  "select_server_page": {
    "title": "Sélectionner un serveur",
    "search_placeholder": "Rechercher un pays ou une ville...",
    "section_selector": {
      "free": "Gratuit",
      "premium": "Premium",
      "personal": "Personnel"
    },
    "sections": {
      "recommended": "Serveurs recommandés",
      "all": "Tous les serveurs"
    },
    "location": "emplacement",
    "locations": "emplacements",
    "personal": {
      "blank": {
        "title": "Vous n'avez pas de serveur personnel",
        "description": "Vous pouvez acheter un serveur sur la page Premium",
        "action": "Acheter plus"
      }
    }
  },
  "buy_personal_server_page": {
    "title": "Serveur personnel",
    "search": "Rechercher un pays...",
    "per_month": "par mois",
    "sold": "Vendu",
    "buy": "Acheter"
  },
  "sign_in": {
    "title": "Se connecter",
    "with": {
      "apple": "Se connecter avec Apple",
      "google": "Se connecter avec Google",
      "email": "Se connecter avec Email"
    },
    "email": {
      "label": "Email",
      "hint": "Votre email",
      "button": "Se connecter",
      "error": "Veuillez saisir une adresse email valide"
    },
    "password": {
      "label": "Mot de passe",
      "hint": "Votre mot de passe",
      "error": {
        "small": "Le mot de passe doit contenir au moins 8 caractères",
        "big": "Le mot de passe doit comporter moins de 32 caractères"
      },
      "forgot": {
        "link": "Mot de passe oublié ?",
        "title": "Mot de passe oublié"
      },
      "change": "Changer le mot de passe",
      "new": {
        "label": "Nouveau mot de passe",
        "hint": "Votre nouveau mot de passe"
      },
      "confirm": {
        "label": "Confirmer le mot de passe",
        "hint": "Répétez le nouveau mot de passe",
        "error": "Les mots de passe doivent être identiques"
      }
    },
    "save": "Enregistrer",
    "send": "Envoyer",
    "terms": {
      "text": "Un nouveau compte sera créé automatiquement. \nEn vous connectant, vous acceptez les",
      "link": "conditions générales"
    },
    "confirmation_code": {
      "title": "Code de confirmation",
      "description1": "Le code d'autorisation a été envoyé à",
      "description2": "Veuillez le saisir ci-dessous"
    }
  },
  "settings_page": {
    "title": "Paramètres",
    "language_label": "Langue de l'application",
    "notification": "Notification",
    "connect_when_starts": "Se connecter lorsque le VPN démarre",
    "protocols": {
      "title": "Protocole VPN",
      "description": "Définir le protocole utilisé pour la connexion",
      "adaptive": "Adaptatif",
      "tcp": "TCP",
      "udp": "UDP"
    },
    "connection_timeout": {
      "title": "Délai de connexion",
      "description": "Combien de temps SebekVPN doit-il essayer de se connecter avant d'abandonner ?",
      "s10": "10 sec",
      "s30": "30 sec",
      "m1": "1 min",
      "m2": "2 min",
      "continuously": "Réessayer en continu"
    },
    "batter_saver": {
      "title": "Économiseur de batterie",
      "description": "Ne pas se reconnecter lorsque l'appareil est verrouillé et l'écran n'est pas actif. Ce paramètre est efficace uniquement si l'appareil est sécurisé par un mot de passe, Touch ID ou Face ID. Pour éviter toute fuite de données, l'option Seamless Tunnel doit être activée."
    },
    "seamless_tunnel": {
      "title": "Tunnel transparent",
      "description": "Bloquer Internet lorsque le VPN est en pause ou en cours de reconnexion"
    },
    "ping_connection": {
      "title": "Connexion ping",
      "description": "Vérifier la vitesse Internet actuelle"
    }
  },
  "language": {
    "en": {
      "label": "English",
      "country": "england",
      "_comment": "не изменяйте country, это нужно для загрузки изображения флага"
    },
    "pl": {
      "label": "Polski",
      "country": "poland",
      "_comment": "не изменяйте country, это нужно для загрузки изображения флага"
    },
    "de": {
      "label": "Deutsch",
      "country": "germany",
      "_comment": "не изменяйте country, это нужно для загрузки изображения флага"
    },
    "fr": {
      "label": "Français",
      "country": "france",
      "_comment": "не изменяйте country, это нужно для загрузки изображения флага"
    },
    "uk": {
      "label": "Українська",
      "country": "ukraine",
      "_comment": "don't change country, it needed to load flag image"
    },
    "ru": {
      "label": "Русский",
      "country": "russian",
      "_comment": "don't change country, it needed to load flag image"
    }
  },
  "error": {
    "user_not_found": "Un compte avec cet email n'a pas été trouvé",
    "invalid_code": "Code de confirmation invalide, revérifiez-le et réessayez",
    "no_permission": "Vous n'avez aucune autorisation"
  },
  "try_again_reconnect": "Réessayez dans quelques secondes",
  "incorrect_username_or_password": "Nom d'utilisateur ou mot de passe incorrect"
};
static const Map<String,dynamic> pl = {
  "app_title": "SebekVPN",
  "connect_page": {
    "title": "SebekVPN",
    "menu": {
      "title": "Menu",
      "account": "Moje konto",
      "premium": "Premium",
      "settings": "Ustawienia",
      "faq": "FAQ",
      "rate": "Oceń nas"
    },
    "offer": {
      "title": "Aktualizuj do Pro",
      "desc": "Odblokuj szybkie połączenie i dostęp do każdego kraju"
    },
    "connection": {
      "connected": "Podłączono",
      "connecting": "Łączenie...",
      "not_connected": "Nie podłączono"
    },
    "stats": {
      "download": "Pobierz",
      "upload": "Wyślij",
      "ping": "Ping",
      "ip": "IP"
    },
    "change": "Zmień"
  },
  "notifications_page": {
    "title": "Powiadomienia",
    "more": "Więcej"
  },
  "faq_page": {
    "title": "FAQ",
    "questions": {
      "secure": {
        "title": "Czy moje połączenie jest bezpieczne?",
        "description": "Tak!"
      },
      "sebek": {
        "title": "Kto to jest dobry piesek?!",
        "description": "Sebek!"
      }
    }
  },
  "account_page": {
    "title": "Moje konto",
    "email": "Email",
    "password": "Hasło",
    "change": "Zmień"
  },
  "offer_page": {
    "skip": "pomiń",
    "title": "Funkcje premium",
    "offers": {
      "premium": {
        "title": "Premium",
        "description": "Nieograniczone serwery VPN",
        "per": "na miesiąc"
      },
      "personal": {
        "title": "Osobiste",
        "description": "Używaj swojego idealnego serwera VPN",
        "from": "Od",
        "per": "na miesiąc"
      },
      "trial": "Rozpocznij 7-dniowy darmowy okres próbny"
    },
    "footer": "Subskrypcja jest automatycznie odnawiana. Możesz anulować subskrypcję w dowolnym momencie."
  },
  "select_server_page": {
    "title": "Wybierz serwer",
    "search_placeholder": "Wyszukaj kraj lub miasto...",
    "section_selector": {
      "free": "Darmowe",
      "premium": "Premium",
      "personal": "Osobiste"
    },
    "sections": {
      "recommended": "Polecane serwery",
      "all": "Wszystkie serwery"
    },
    "location": "lokalizacja",
    "locations": "lokalizacje",
    "personal": {
      "blank": {
        "title": "Nie masz osobistego serwera",
        "description": "Możesz kupić VPN serwer na stronie \"Premium\"",
        "action": "Kup więcej"
      }
    }
  },
  "buy_personal_server_page": {
    "title": "Osobisty serwer",
    "search": "Wyszukaj kraj...",
    "per_month": "na miesiąc",
    "sold": "Sprzedano",
    "buy": "Kup"
  },
  "sign_in": {
    "title": "Zaloguj się",
    "with": {
      "apple": "Zaloguj się przez Apple",
      "google": "Zaloguj się przez Google",
      "email": "Zaloguj się przez Email"
    },
    "email": {
      "label": "Email",
      "hint": "Twój Email",
      "button": "Zaloguj się",
      "error": "Wprowadź poprawny adres email"
    },
    "password": {
      "label": "Hasło",
      "hint": "Twoje hasło",
      "error": {
        "small": "Hasło musi mieć co najmniej 8 znaków",
        "big": "Hasło musi mieć mniej niż 32 znaki"
      },
      "forgot": {
        "link": "Zapomniałeś hasła?",
        "title": "Zapomniałeś hasła"
      },
      "change": "Zmień hasło",
      "new": {
        "label": "Nowe hasło",
        "hint": "Twoje nowe hasło"
      },
      "confirm": {
        "label": "Potwierdź hasło",
        "hint": "Powtórz nowe hasło",
        "error": "Hasła muszą być identyczne"
      }
    },
    "save": "Zapisz",
    "send": "Wyślij",
    "terms": {
      "text": "Nowe konto zostanie automatycznie utworzone. \nAutoryzując się, akceptujesz",
      "link": "warunki i zasady"
    },
    "confirmation_code": {
      "title": "Kod potwierdzenia",
      "description1": "Kod autoryzacji został wysłany na",
      "description2": "Proszę wprowadź go poniżej"
    }
  },
  "settings_page": {
    "title": "Ustawienia",
    "language_label": "Język aplikacji",
    "notification": "Powiadomienie",
    "connect_when_starts": "Podłącz przy uruchamianiu VPN",
    "protocols": {
      "title": "Protokół VPN",
      "description": "Ustaw protokół używany do połączenia",
      "adaptive": "Adaptacyjny",
      "tcp": "TCP",
      "udp": "UDP"
    },
    "connection_timeout": {
      "title": "Limit czasu połączenia",
      "description": "Jak długo SebekVPN powinien próbować połączyć się?",
      "s10": "10 sek",
      "s30": "30 sek",
      "m1": "1 min",
      "m2": "2 min",
      "continuously": "Nieustanne ponawianie"
    },
    "batter_saver": {
      "title": "Oszczędzanie baterii",
      "description": "Nie ponawiaj połączenia, gdy urządzenie jest zablokowane i ekran jest nieaktywny. Ustawienie to jest skuteczne tylko wtedy, gdy urządzenie jest zabezpieczone hasłem, Touch ID lub Face ID. Aby uniknąć wycieku danych, należy włączyć opcję \"Seamless Tunnel\"."
    },
    "seamless_tunnel": {
      "title": "Seamless Tunnel",
      "description": "Zablokuj internet podczas wstrzymywania lub ponownego łączenia VPN"
    },
    "ping_connection": {
      "title": "Połączenie pingowane",
      "description": "Sprawdź aktualną prędkość internetu"
    }
  },
  "language": {
    "en": {
      "label": "English",
      "country": "england",
      "_comment": "не изменяйте country, это нужно для загрузки изображения флага"
    },
    "pl": {
      "label": "Polski",
      "country": "poland",
      "_comment": "не изменяйте country, это нужно для загрузки изображения флага"
    },
    "de": {
      "label": "Deutsch",
      "country": "germany",
      "_comment": "не изменяйте country, это нужно для загрузки изображения флага"
    },
    "fr": {
      "label": "Français",
      "country": "france",
      "_comment": "не изменяйте country, это нужно для загрузки изображения флага"
    },
    "uk": {
      "label": "Українська",
      "country": "ukraine",
      "_comment": "don't change country, it needed to load flag image"
    },
    "ru": {
      "label": "Русский",
      "country": "russian",
      "_comment": "don't change country, it needed to load flag image"
    }
  },
  "error": {
    "user_not_found": "Nie znaleziono konta z tym adresem e-mail",
    "invalid_code": "Nieprawidłowy kod potwierdzający, sprawdź go ponownie i spróbuj ponownie",
    "no_permission": "Nie masz pozwolenia"
  },
  "try_again_reconnect": "Spróbuj ponownie za kilka sekund",
  "incorrect_username_or_password": "Nieprawidłowa nazwa użytkownika lub hasło"
};
static const Map<String,dynamic> ru = {
  "app_title": "SebekVPN",
  "connect_page": {
    "title": "SebekVPN",
    "menu": {
      "title": "Меню",
      "account": "Мой аккаунт",
      "premium": "Премиум",
      "settings": "Настройки",
      "faq": "Часто задаваемые вопросы",
      "rate": "Оцените нас"
    },
    "offer": {
      "title": "Обновление до Pro",
      "desc": "Разблокируйте высокоскоростное соединение и доступ к каждой стране"
    },
    "connection": {
      "connected": "Подключено",
      "connecting": "Подключение...",
      "not_connected": "Не подключено"
    },
    "stats": {
      "download": "Загрузка",
      "upload": "Отправка",
      "ping": "Пинг",
      "ip": "IP"
    },
    "change": "Изменить"
  },
  "notifications_page": {
    "title": "Уведомления",
    "more": "Подробнее"
  },
  "faq_page": {
    "title": "Часто задаваемые вопросы",
    "questions": {
      "secure": {
        "title": "Безопасно ли мое соединение?",
        "description": "Да!"
      },
      "sebek": {
        "title": "Кто хороший мальчик?!",
        "description": "Себек!"
      }
    }
  },
  "account_page": {
    "title": "Мой аккаунт",
    "email": "Email",
    "password": "Пароль",
    "change": "Изменить"
  },
  "offer_page": {
    "skip": "пропустить",
    "title": "Премиум-возможности",
    "offers": {
      "premium": {
        "title": "Премиум",
        "description": "Неограниченные VPN-серверы",
        "per": "в месяц"
      },
      "personal": {
        "title": "Персональный",
        "description": "Используйте свой идеальный VPN-сервер",
        "from": "От",
        "per": "в месяц"
      },
      "trial": "Начать 7-дневный бесплатный пробный период"
    },
    "footer": "Подписка автоматически продлевается. Вы можете отменить подписку в любое время."
  },
  "select_server_page": {
    "title": "Выбор сервера",
    "search_placeholder": "Поиск страны или города...",
    "section_selector": {
      "free": "Бесплатные",
      "premium": "Премиум",
      "personal": "Персональные"
    },
    "sections": {
      "recommended": "Рекомендуемые серверы",
      "all": "Все серверы"
    },
    "location": "местоположение",
    "locations": "местоположений",
    "personal": {
      "blank": {
        "title": "У вас нет персонального сервера",
        "description": "Вы можете купить сервер на странице \"Премиум\" ",
        "action": "Купить еще"
      }
    }
  },
  "buy_personal_server_page": {
    "title": "Персональный сервер",
    "search": "Поиск страны...",
    "per_month": "в месяц",
    "sold": "Продано",
    "buy": "Купить"
  },
  "sign_in": {
    "title": "Вход",
    "with": {
      "apple": "Войти с помощью Apple",
      "google": "Войти с помощью Google",
      "email": "Войти с помощью Email"
    },
    "email": {
      "label": "Email",
      "hint": "Ваш Email",
      "button": "Войти",
      "error": "Пожалуйста, введите действительный адрес электронной почты"
    },
    "password": {
      "label": "Пароль",
      "hint": "Ваш пароль",
      "error": {
        "small": "Пароль должен содержать не менее 8 символов",
        "big": "Пароль должен содержать менее 32 символов"
      },
      "forgot": {
        "link": "Забыли пароль?",
        "title": "Забыли пароль"
      },
      "change": "Изменить пароль",
      "new": {
        "label": "Новый пароль",
        "hint": "Ваш новый пароль"
      },
      "confirm": {
        "label": "Подтвердите пароль",
        "hint": "Повторите новый пароль",
        "error": "Пароли должны совпадать"
      }
    },
    "save": "Сохранить",
    "send": "Отправить",
    "terms": {
      "text": "Новая учетная запись будет создана автоматически. \nАвторизуясь, вы соглашаетесь с",
      "link": "условиями использования"
    },
    "confirmation_code": {
      "title": "Код подтверждения",
      "description1": "Код авторизации был отправлен на",
      "description2": "Пожалуйста, введите его ниже"
    }
  },
  "settings_page": {
    "title": "Настройки",
    "language_label": "Язык приложения",
    "notification": "Уведомления",
    "connect_when_starts": "Подключаться при запуске VPN",
    "protocols": {
      "title": "Протокол VPN",
      "description": "Установите используемый протокол для подключения",
      "adaptive": "Адаптивный",
      "tcp": "TCP",
      "udp": "UDP"
    },
    "connection_timeout": {
      "title": "Таймаут подключения",
      "description": "Как долго SebekVPN должен пытаться подключиться в случае недоступности VPN сервера?",
      "s10": "10 сек",
      "s30": "30 сек",
      "m1": "1 мин",
      "m2": "2 мин",
      "continuously": "Непрерывно повторять попытки"
    },
    "batter_saver": {
      "title": "Экономия заряда батареи",
      "description": "Не переподключаться, когда устройство заблокировано и экран неактивен. Настройка эффективна только при наличии пароля, Touch ID или Face ID. Чтобы избежать утечки данных, необходимо включить настройку \"Seamless Tunnel\"."
    },
    "seamless_tunnel": {
      "title": "Seamless Tunnel",
      "description": "Блокировать интернет, когда VPN на паузе или в процессе повторного подключения"
    },
    "ping_connection": {
      "title": "Пинг-соединение",
      "description": "Проверять текущую скорость интернета"
    }
  },
  "language": {
    "en": {
      "label": "English",
      "country": "england",
      "_comment": "не изменяйте country, это нужно для загрузки изображения флага"
    },
    "pl": {
      "label": "Polski",
      "country": "poland",
      "_comment": "не изменяйте country, это нужно для загрузки изображения флага"
    },
    "de": {
      "label": "Deutsch",
      "country": "germany",
      "_comment": "не изменяйте country, это нужно для загрузки изображения флага"
    },
    "fr": {
      "label": "Français",
      "country": "france",
      "_comment": "не изменяйте country, это нужно для загрузки изображения флага"
    },
    "uk": {
      "label": "Українська",
      "country": "ukraine",
      "_comment": "don't change country, it needed to load flag image"
    },
    "ru": {
      "label": "Русский",
      "country": "russian",
      "_comment": "don't change country, it needed to load flag image"
    }
  },
  "error": {
    "user_not_found": "Аккаунт с этим адресом электронной почты не найден",
    "invalid_code": "Неверный код подтверждения, проверьте его еще раз и повторите попытку.",
    "no_permission": "У вас нет разрешения"
  },
  "try_again_reconnect": "Повторите попытку через несколько секунд",
  "incorrect_username_or_password": "Неверное имя пользователя или пароль"
};
static const Map<String,dynamic> uk = {
  "app_title": "SebekVPN",
  "connect_page": {
    "title": "SebekVPN",
    "menu": {
      "title": "Меню",
      "account": "Мiй аккаунт",
      "premium": "Премiум",
      "settings": "Налаштування",
      "faq": "Частi запитання",
      "rate": "Оцiнiть нас"
    },
    "offer": {
      "title": "Оновлення до Pro",
      "desc": "Розблокуйте високошвидкiсне з'эднання та доступ до кожноi краiни"
    },
    "connection": {
      "connected": "Пiдключено",
      "connecting": "Пiдключення...",
      "not_connected": "Не пiдключено"
    },
    "stats": {
      "download": "Завантаження",
      "upload": "Вiдвантаження",
      "ping": "Пiнг",
      "ip": "iP"
    },
    "change": "Змiнити"
  },
  "notifications_page": {
    "title": "Сповiщення",
    "more": "Детальнiше"
  },
  "faq_page": {
    "title": "Частi запитання",
    "questions": {
      "secure": {
        "title": "Чи безпечне моэ з'эднання?",
        "description": "Так!"
      },
      "sebek": {
        "title": "Хто хороший хлопчик?!",
        "description": "Себек!"
      }
    }
  },
  "account_page": {
    "title": "Мiй аккаунт",
    "email": "Email",
    "password": "Пароль",
    "change": "Змiнити"
  },
  "offer_page": {
    "skip": "пропустити",
    "title": "Премiум-можливостi",
    "offers": {
      "premium": {
        "title": "Премiум",
        "description": "Необмеженi VPN-сервери",
        "per": "в мiсяць"
      },
      "personal": {
        "title": "Персональний",
        "description": "Використовуйте свiй iдеальний VPN-сервер",
        "from": "Вiд",
        "per": "в мiсяць"
      },
      "trial": "Розпочати 7-денний безкоштовний пробний перiод"
    },
    "footer": "Пiдписка автоматично продовжуэться. Ви можете скасувати пiдписку в будь-який час."
  },
  "select_server_page": {
    "title": "Вибiр сервера",
    "search_placeholder": "Пошук краiни або мiста...",
    "section_selector": {
      "free": "Безкоштовнi",
      "premium": "Премiум",
      "personal": "Персональнi"
    },
    "sections": {
      "recommended": "Рекомендованi сервери",
      "all": "Усi сервери"
    },
    "location": "розташування",
    "locations": "розташувань",
    "personal": {
      "blank": {
        "title": "У вас немаэ персонального сервера",
        "description": "Ви можете придбати сервер на сторiнцi \"Премiум\"",
        "action": "Придбати ще"
      }
    }
  },
  "buy_personal_server_page": {
    "title": "Персональний сервер",
    "search": "Пошук краiни...",
    "per_month": "в мiсяць",
    "sold": "Продано",
    "buy": "Придбати"
  },
  "sign_in": {
    "title": "Вхiд",
    "with": {
      "apple": "Увiйти за допомогою Apple",
      "google": "Увiйти за допомогою Google",
      "email": "Увiйти за допомогою Email"
    },
    "email": {
      "label": "Email",
      "hint": "Ваш Email",
      "button": "Увiйти",
      "error": "Будь ласка, введiть дiйсну адресу електронноi пошти"
    },
    "password": {
      "label": "Пароль",
      "hint": "Ваш пароль",
      "error": {
        "small": "Пароль повинен мiстити принаймнi 8 символiв",
        "big": "Пароль маэ мiстити менше 32 символiв"
      },
      "forgot": {
        "link": "Забули пароль?",
        "title": "Забули пароль"
      },
      "change": "Змiнити пароль",
      "new": {
        "label": "Новий пароль",
        "hint": "Ваш новий пароль"
      },
      "confirm": {
        "label": "Пiдтвердити пароль",
        "hint": "Повторiть новий пароль",
        "error": "Паролi повиннi спiвпадати"
      }
    },
    "save": "Зберегти",
    "send": "Вiдправити",
    "terms": {
      "text": "Новий облiковий запис буде створено автоматично. \nАвторизуючись, ви погоджуэтеся з",
      "link": "умовами використання"
    },
    "confirmation_code": {
      "title": "Код пiдтвердження",
      "description1": "Код авторизацii був вiдправлений на",
      "description2": "Будь ласка, введiть його нижче"
    }
  },
  "settings_page": {
    "title": "Налаштування",
    "language_label": "Мова додатка",
    "notification": "Сповiщення",
    "connect_when_starts": "Пiдключатися при запуску VPN",
    "protocols": {
      "title": "Протокол VPN",
      "description": "Встановiть використовуваний протокол для пiдключення",
      "adaptive": "Адаптивний",
      "tcp": "TCP",
      "udp": "UDP"
    },
    "connection_timeout": {
      "title": "Тайм-аут пiдключення",
      "description": "Як довго SebekVPN повинен намагатися перепiдключитися?",
      "s10": "10 сек",
      "s30": "30 сек",
      "m1": "1 хв",
      "m2": "2 хв",
      "continuously": "Неперервнi спроби"
    },
    "batter_saver": {
      "title": "Економiя заряду батареi",
      "description": "Не перепiдключатися, коли пристрiй заблокований i екран неактивний. Налаштування працюэ тiльки в разi використання пароля, Touch iD або Face iD. Щоб уникнути витоку даних, необхiдно ввiмкнути налаштування \"Seamless Tunnel\"."
    },
    "seamless_tunnel": {
      "title": "Seamless Tunnel",
      "description": "Блокувати iнтернет, коли VPN знаходиться на паузi або в процесi повторного пiдключення"
    },
    "ping_connection": {
      "title": "Пiнг-з'эднання",
      "description": "Перевiряти поточну швидкiсть iнтернету"
    }
  },
  "language": {
    "en": {
      "label": "English",
      "country": "england",
      "_comment": "не изменяйте country, это нужно для загрузки изображения флага"
    },
    "pl": {
      "label": "Polski",
      "country": "poland",
      "_comment": "не изменяйте country, это нужно для загрузки изображения флага"
    },
    "de": {
      "label": "Deutsch",
      "country": "germany",
      "_comment": "не изменяйте country, это нужно для загрузки изображения флага"
    },
    "fr": {
      "label": "Français",
      "country": "france",
      "_comment": "не изменяйте country, это нужно для загрузки изображения флага"
    },
    "uk": {
      "label": "Украiнська",
      "country": "ukraine",
      "_comment": "don't change country, it needed to load flag image"
    },
    "ru": {
      "label": "Русский",
      "country": "russian",
      "_comment": "don't change country, it needed to load flag image"
    }
  },
  "error": {
    "user_not_found": "Облiковий запис iз цiэю електронною адресою не знайдено",
    "invalid_code": "Недiйсний код пiдтвердження, перевiрте його ще раз i повторiть спробу",
    "no_permission": "У вас немає дозволу"
  },
  "try_again_reconnect": "Повторiть спробу через кiлька секунд",
  "incorrect_username_or_password": "Неправильне ім'я користувача або пароль"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"de": de, "en": en, "fr": fr, "pl": pl, "ru": ru, "uk": uk};
}
