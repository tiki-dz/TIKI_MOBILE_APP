import 'package:get/get.dart';

class LocalString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_EN': {
          'name': 'Name',
          'lastname': 'Lastname',
          'birthDate': 'Birth date',
          'email': 'Email',
          'password': 'Password',
          'confirmPassword': 'Confirm password',
          'signup': 'Sign up',
          'validation': "Validation",
          "resend": "Resend",
          "you_already_have_account": "you already have account ? ",
          'login': "Login",
          "confirm": "confirm",
          "verificationCode": "Verification code",
          "resendAfter": "Resend after",
          "verification": "Verification",
          "confirmDesc": "Please type the verification code send to",
        },
        'fr_FR': {
          'name': 'Nom',
          'lastname': 'Prénom',
          'birthDate': 'Date de naissance',
          'email': 'Email',
          'password': 'Mot de passe',
          'confirmPassword': 'Confirmer votre mot de passe',
          'signup': 'Créer votre compte',
          "resend": "Renvoyer",
          "you_already_have_account": "Vous avez déja un compte ? ",
          'login': "Se connecter",
          "confirm": "Confirmer",
          "verificationCode": "Code de vérification",
          "resendAfter": "Renvoyer aprés",
          "verification": "Vérification",
          "confirmDesc": "Svp enter le code de vérification envoyer à",
        }
      };
}
