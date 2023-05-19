import 'package:firebase_auth/firebase_auth.dart';
import 'package:github_sign_in/github_sign_in.dart';

User? user;

Future<UserCredential> signInWithGitHub(context) async {
  // Create a GitHubSignIn instance
  final GitHubSignIn gitHubSignIn = GitHubSignIn(
      clientId: 'cff231e5bf34d6f8256a',
      clientSecret: '90fbda73afab321f2feaa4312d8fb209dda1705b',
      redirectUrl: 'https://socialtec-f33c3.firebaseapp.com/__/auth/handler');

  // Trigger the sign-in flow
  final result = await gitHubSignIn.signIn(context);

  // Create a credential from the access token
  final githubAuthCredential = GithubAuthProvider.credential(result.token!);

  user = FirebaseAuth.instance.currentUser;
  print('USR GITHUB -> $user');

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(githubAuthCredential);
}
