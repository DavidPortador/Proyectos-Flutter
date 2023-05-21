import 'package:firebase_auth/firebase_auth.dart';
import 'package:github_sign_in/github_sign_in.dart';

User? userGithub;

Future<UserCredential> signInWithGitHub(context) async {
  // Create a GitHubSignIn instance
  final GitHubSignIn githubSignIn = GitHubSignIn(
      clientId: 'cff231e5bf34d6f8256a',
      clientSecret: '90fbda73afab321f2feaa4312d8fb209dda1705b',
      redirectUrl: 'https://socialtec-f33c3.firebaseapp.com/__/auth/handler');
  // Trigger the sign-in flow
  final result = await githubSignIn.signIn(context);
  // Create a credential from the access token
  final githubAuthCredential = GithubAuthProvider.credential(result.token!);
  userGithub = FirebaseAuth.instance.currentUser;
  print('USR GITHUB -> $userGithub');
  print('email GITHUB -> ${userGithub!.providerData[0].email}');
  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(githubAuthCredential);
}

void signOutGithub() async {
  userGithub!.delete();
}
