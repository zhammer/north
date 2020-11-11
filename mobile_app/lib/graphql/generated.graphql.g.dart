// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generated.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAccount$MutationRoot$AuthOutput
    _$CreateAccount$MutationRoot$AuthOutputFromJson(Map<String, dynamic> json) {
  return CreateAccount$MutationRoot$AuthOutput()
    ..accessToken = json['AccessToken'] as String;
}

Map<String, dynamic> _$CreateAccount$MutationRoot$AuthOutputToJson(
        CreateAccount$MutationRoot$AuthOutput instance) =>
    <String, dynamic>{
      'AccessToken': instance.accessToken,
    };

CreateAccount$MutationRoot _$CreateAccount$MutationRootFromJson(
    Map<String, dynamic> json) {
  return CreateAccount$MutationRoot()
    ..createAccount = json['CreateAccount'] == null
        ? null
        : CreateAccount$MutationRoot$AuthOutput.fromJson(
            json['CreateAccount'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CreateAccount$MutationRootToJson(
        CreateAccount$MutationRoot instance) =>
    <String, dynamic>{
      'CreateAccount': instance.createAccount?.toJson(),
    };

SignIn$MutationRoot$AuthOutput _$SignIn$MutationRoot$AuthOutputFromJson(
    Map<String, dynamic> json) {
  return SignIn$MutationRoot$AuthOutput()
    ..accessToken = json['AccessToken'] as String;
}

Map<String, dynamic> _$SignIn$MutationRoot$AuthOutputToJson(
        SignIn$MutationRoot$AuthOutput instance) =>
    <String, dynamic>{
      'AccessToken': instance.accessToken,
    };

SignIn$MutationRoot _$SignIn$MutationRootFromJson(Map<String, dynamic> json) {
  return SignIn$MutationRoot()
    ..signIn = json['SignIn'] == null
        ? null
        : SignIn$MutationRoot$AuthOutput.fromJson(
            json['SignIn'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SignIn$MutationRootToJson(
        SignIn$MutationRoot instance) =>
    <String, dynamic>{
      'SignIn': instance.signIn?.toJson(),
    };

CreateAccountArguments _$CreateAccountArgumentsFromJson(
    Map<String, dynamic> json) {
  return CreateAccountArguments(
    password: json['password'] as String,
    username: json['username'] as String,
  );
}

Map<String, dynamic> _$CreateAccountArgumentsToJson(
        CreateAccountArguments instance) =>
    <String, dynamic>{
      'password': instance.password,
      'username': instance.username,
    };

SignInArguments _$SignInArgumentsFromJson(Map<String, dynamic> json) {
  return SignInArguments(
    password: json['password'] as String,
    username: json['username'] as String,
  );
}

Map<String, dynamic> _$SignInArgumentsToJson(SignInArguments instance) =>
    <String, dynamic>{
      'password': instance.password,
      'username': instance.username,
    };
