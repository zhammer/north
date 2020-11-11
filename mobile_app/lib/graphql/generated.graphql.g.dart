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

AuthedPages$QueryRoot$Feed$Haikus _$AuthedPages$QueryRoot$Feed$HaikusFromJson(
    Map<String, dynamic> json) {
  return AuthedPages$QueryRoot$Feed$Haikus()
    ..line1 = json['line1'] as String
    ..line2 = json['line2'] as String
    ..line3 = json['line3'] as String
    ..id = json['id'] as int;
}

Map<String, dynamic> _$AuthedPages$QueryRoot$Feed$HaikusToJson(
        AuthedPages$QueryRoot$Feed$Haikus instance) =>
    <String, dynamic>{
      'line1': instance.line1,
      'line2': instance.line2,
      'line3': instance.line3,
      'id': instance.id,
    };

AuthedPages$QueryRoot$Feed$Users _$AuthedPages$QueryRoot$Feed$UsersFromJson(
    Map<String, dynamic> json) {
  return AuthedPages$QueryRoot$Feed$Users()
    ..username = json['username'] as String
    ..id = json['id'] as int;
}

Map<String, dynamic> _$AuthedPages$QueryRoot$Feed$UsersToJson(
        AuthedPages$QueryRoot$Feed$Users instance) =>
    <String, dynamic>{
      'username': instance.username,
      'id': instance.id,
    };

AuthedPages$QueryRoot$Feed _$AuthedPages$QueryRoot$FeedFromJson(
    Map<String, dynamic> json) {
  return AuthedPages$QueryRoot$Feed()
    ..haikus = (json['haikus'] as List)
        ?.map((e) => e == null
            ? null
            : AuthedPages$QueryRoot$Feed$Haikus.fromJson(
                e as Map<String, dynamic>))
        ?.toList()
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..createdBy = json['created_by'] == null
        ? null
        : AuthedPages$QueryRoot$Feed$Users.fromJson(
            json['created_by'] as Map<String, dynamic>);
}

Map<String, dynamic> _$AuthedPages$QueryRoot$FeedToJson(
        AuthedPages$QueryRoot$Feed instance) =>
    <String, dynamic>{
      'haikus': instance.haikus?.map((e) => e?.toJson())?.toList(),
      'created_at': instance.createdAt?.toIso8601String(),
      'created_by': instance.createdBy?.toJson(),
    };

AuthedPages$QueryRoot$Users _$AuthedPages$QueryRoot$UsersFromJson(
    Map<String, dynamic> json) {
  return AuthedPages$QueryRoot$Users()..username = json['username'] as String;
}

Map<String, dynamic> _$AuthedPages$QueryRoot$UsersToJson(
        AuthedPages$QueryRoot$Users instance) =>
    <String, dynamic>{
      'username': instance.username,
    };

AuthedPages$QueryRoot _$AuthedPages$QueryRootFromJson(
    Map<String, dynamic> json) {
  return AuthedPages$QueryRoot()
    ..feed = (json['feed'] as List)
        ?.map((e) => e == null
            ? null
            : AuthedPages$QueryRoot$Feed.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..me = (json['me'] as List)
        ?.map((e) => e == null
            ? null
            : AuthedPages$QueryRoot$Users.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$AuthedPages$QueryRootToJson(
        AuthedPages$QueryRoot instance) =>
    <String, dynamic>{
      'feed': instance.feed?.map((e) => e?.toJson())?.toList(),
      'me': instance.me?.map((e) => e?.toJson())?.toList(),
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
