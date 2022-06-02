/*
children: [
InkWell(
onTap: () {
//Login with facebook


signInWithFacebook().then((value) {
print(value);

print(value.credential?.token);

});

},
child: Image.asset(
"assets/images/facebook.png",
fit: BoxFit.fill,
width: size.height*0.030,
height: size.height*0.030,
),
),
const SizedBox(
width: 30,
),
InkWell(
onTap: () {
//Login with google

//signInWithGoogle();
print(signInWithGoogle());

},
child: Image.asset(
"assets/images/google.png",
fit: BoxFit.fill,
width: size.height*0.030,
height: size.height*0.030,
),
)
]




///////////////////////////////////////////////////
  Future<UserCredential> signInWithGoogle() async {
    // Create a new provider
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    googleProvider.addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({
      'login_hint': 'user@example.com'
    });

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithPopup(googleProvider);

    // Or use signInWithRedirect
    // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
  }

  Future<UserCredential> signInWithFacebook() async {
    // Create a new provider
    FacebookAuthProvider facebookProvider = FacebookAuthProvider();

    facebookProvider.addScope('email');
    facebookProvider.setCustomParameters({
      'display': 'popup',
    });

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithPopup(facebookProvider);

    // Or use signInWithRedirect
    // return await FirebaseAuth.instance.signInWithRedirect(facebookProvider);
  }



  void signInWithGoogle() async {
    // Create a new provider

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Container(child: Center(child: CircularProgressIndicator()));
        });

    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    /* googleProvider.addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({
      'login_hint': 'user@example.com'
    });*/

    // Once signed in, return the UserCredential
     await FirebaseAuth.instance.signInWithPopup(googleProvider).then((value) {
       value.
       checkIfFirstTime(value.user?.displayName ?? "error", value.user?.email ?? "error", value.user?.photoURL ?? "error", "google");
    });

    // Or use signInWithRedirect
    // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
  }





*/
