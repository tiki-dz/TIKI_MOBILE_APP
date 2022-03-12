import 'package:get/get.dart';

class LocalString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_EN': {
          'name': 'name',
          'lastname': 'lastname',
          'birthDate': 'birth date',
          'email': 'email',
          'password': 'password',
          'confirmPassword': 'confirm password',
          'signup': 'Sign up',
          'validation': "validation",
          "resend": "resend",
          "you_already_have_account": "you already have account ? ",
          'login': "Login",
          "confirm": "confirm",
          "verificationCode": "Verification code",
          "resendAfter": "Resend after",
          "verification": "Verification",
          "confirmDesc": "Please type the verification code send to",
        },
        'fr_FR': {
          'name': 'nom',
          'lastname': 'prénom',
          'birthDate': 'Date de naissance',
          'email': 'email',
          'password': 'mot de passe',
          'confirmPassword': 'cconfirmer votre mot de passe',
          'signup': 'Créer votre compte',
          "resend": "renvoyer",
          "you_already_have_account": "Vous avez déja un compte ? ",
          'login': "Se connecter",
          "confirm": "confirmer",
          "verificationCode": "Code de vérification",
          "resendAfter": "Renvoyer aprés",
          "verification": "Vérification",
          "confirmDesc": "Svp enter le code de vérification envoyer à",
        }
      };
}
