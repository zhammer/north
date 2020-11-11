// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:meta/meta.dart';
import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'generated.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class CreateAccount$MutationRoot$AuthOutput with EquatableMixin {
  CreateAccount$MutationRoot$AuthOutput();

  factory CreateAccount$MutationRoot$AuthOutput.fromJson(
          Map<String, dynamic> json) =>
      _$CreateAccount$MutationRoot$AuthOutputFromJson(json);

  @JsonKey(name: 'AccessToken')
  String accessToken;

  @override
  List<Object> get props => [accessToken];
  Map<String, dynamic> toJson() =>
      _$CreateAccount$MutationRoot$AuthOutputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateAccount$MutationRoot with EquatableMixin {
  CreateAccount$MutationRoot();

  factory CreateAccount$MutationRoot.fromJson(Map<String, dynamic> json) =>
      _$CreateAccount$MutationRootFromJson(json);

  @JsonKey(name: 'CreateAccount')
  CreateAccount$MutationRoot$AuthOutput createAccount;

  @override
  List<Object> get props => [createAccount];
  Map<String, dynamic> toJson() => _$CreateAccount$MutationRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SignIn$MutationRoot$AuthOutput with EquatableMixin {
  SignIn$MutationRoot$AuthOutput();

  factory SignIn$MutationRoot$AuthOutput.fromJson(Map<String, dynamic> json) =>
      _$SignIn$MutationRoot$AuthOutputFromJson(json);

  @JsonKey(name: 'AccessToken')
  String accessToken;

  @override
  List<Object> get props => [accessToken];
  Map<String, dynamic> toJson() => _$SignIn$MutationRoot$AuthOutputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SignIn$MutationRoot with EquatableMixin {
  SignIn$MutationRoot();

  factory SignIn$MutationRoot.fromJson(Map<String, dynamic> json) =>
      _$SignIn$MutationRootFromJson(json);

  @JsonKey(name: 'SignIn')
  SignIn$MutationRoot$AuthOutput signIn;

  @override
  List<Object> get props => [signIn];
  Map<String, dynamic> toJson() => _$SignIn$MutationRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateAccountArguments extends JsonSerializable with EquatableMixin {
  CreateAccountArguments({@required this.password, @required this.username});

  @override
  factory CreateAccountArguments.fromJson(Map<String, dynamic> json) =>
      _$CreateAccountArgumentsFromJson(json);

  final String password;

  final String username;

  @override
  List<Object> get props => [password, username];
  @override
  Map<String, dynamic> toJson() => _$CreateAccountArgumentsToJson(this);
}

class CreateAccountMutation
    extends GraphQLQuery<CreateAccount$MutationRoot, CreateAccountArguments> {
  CreateAccountMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'CreateAccount'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'password')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'username')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'CreateAccount'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'inp'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                          name: NameNode(value: 'password'),
                          value:
                              VariableNode(name: NameNode(value: 'password'))),
                      ObjectFieldNode(
                          name: NameNode(value: 'username'),
                          value:
                              VariableNode(name: NameNode(value: 'username')))
                    ]))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'AccessToken'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'CreateAccount';

  @override
  final CreateAccountArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  CreateAccount$MutationRoot parse(Map<String, dynamic> json) =>
      CreateAccount$MutationRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class SignInArguments extends JsonSerializable with EquatableMixin {
  SignInArguments({@required this.password, @required this.username});

  @override
  factory SignInArguments.fromJson(Map<String, dynamic> json) =>
      _$SignInArgumentsFromJson(json);

  final String password;

  final String username;

  @override
  List<Object> get props => [password, username];
  @override
  Map<String, dynamic> toJson() => _$SignInArgumentsToJson(this);
}

class SignInMutation
    extends GraphQLQuery<SignIn$MutationRoot, SignInArguments> {
  SignInMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'SignIn'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'password')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'username')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'SignIn'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'inp'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                          name: NameNode(value: 'password'),
                          value:
                              VariableNode(name: NameNode(value: 'password'))),
                      ObjectFieldNode(
                          name: NameNode(value: 'username'),
                          value:
                              VariableNode(name: NameNode(value: 'username')))
                    ]))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'AccessToken'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'SignIn';

  @override
  final SignInArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  SignIn$MutationRoot parse(Map<String, dynamic> json) =>
      SignIn$MutationRoot.fromJson(json);
}
