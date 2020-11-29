// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:meta/meta.dart';
import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'generated.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class HomePage$QueryRoot$Posts$Haikus with EquatableMixin {
  HomePage$QueryRoot$Posts$Haikus();

  factory HomePage$QueryRoot$Posts$Haikus.fromJson(Map<String, dynamic> json) =>
      _$HomePage$QueryRoot$Posts$HaikusFromJson(json);

  String line1;

  String line2;

  String line3;

  int id;

  @override
  List<Object> get props => [line1, line2, line3, id];
  Map<String, dynamic> toJson() =>
      _$HomePage$QueryRoot$Posts$HaikusToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HomePage$QueryRoot$Posts$Users with EquatableMixin {
  HomePage$QueryRoot$Posts$Users();

  factory HomePage$QueryRoot$Posts$Users.fromJson(Map<String, dynamic> json) =>
      _$HomePage$QueryRoot$Posts$UsersFromJson(json);

  String username;

  int id;

  @override
  List<Object> get props => [username, id];
  Map<String, dynamic> toJson() => _$HomePage$QueryRoot$Posts$UsersToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HomePage$QueryRoot$Posts with EquatableMixin {
  HomePage$QueryRoot$Posts();

  factory HomePage$QueryRoot$Posts.fromJson(Map<String, dynamic> json) =>
      _$HomePage$QueryRoot$PostsFromJson(json);

  List<HomePage$QueryRoot$Posts$Haikus> haikus;

  @JsonKey(name: 'created_at')
  DateTime createdAt;

  @JsonKey(name: 'created_by')
  HomePage$QueryRoot$Posts$Users createdBy;

  @override
  List<Object> get props => [haikus, createdAt, createdBy];
  Map<String, dynamic> toJson() => _$HomePage$QueryRoot$PostsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HomePage$QueryRoot with EquatableMixin {
  HomePage$QueryRoot();

  factory HomePage$QueryRoot.fromJson(Map<String, dynamic> json) =>
      _$HomePage$QueryRootFromJson(json);

  List<HomePage$QueryRoot$Posts> posts;

  @override
  List<Object> get props => [posts];
  Map<String, dynamic> toJson() => _$HomePage$QueryRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MePage$QueryRoot$Users with EquatableMixin {
  MePage$QueryRoot$Users();

  factory MePage$QueryRoot$Users.fromJson(Map<String, dynamic> json) =>
      _$MePage$QueryRoot$UsersFromJson(json);

  String username;

  @override
  List<Object> get props => [username];
  Map<String, dynamic> toJson() => _$MePage$QueryRoot$UsersToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MePage$QueryRoot with EquatableMixin {
  MePage$QueryRoot();

  factory MePage$QueryRoot.fromJson(Map<String, dynamic> json) =>
      _$MePage$QueryRootFromJson(json);

  List<MePage$QueryRoot$Users> me;

  @override
  List<Object> get props => [me];
  Map<String, dynamic> toJson() => _$MePage$QueryRootToJson(this);
}

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

class HomePageQuery extends GraphQLQuery<HomePage$QueryRoot, JsonSerializable> {
  HomePageQuery();

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'HomePage'),
        variableDefinitions: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'posts'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'limit'),
                    value: IntValueNode(value: '10'))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'haikus'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'line1'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'line2'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'line3'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'id'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null)
                    ])),
                FieldNode(
                    name: NameNode(value: 'created_at'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'created_by'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'username'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'id'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null)
                    ]))
              ]))
        ]))
  ]);

  @override
  final String operationName = 'HomePage';

  @override
  List<Object> get props => [document, operationName];
  @override
  HomePage$QueryRoot parse(Map<String, dynamic> json) =>
      HomePage$QueryRoot.fromJson(json);
}

class MePageQuery extends GraphQLQuery<MePage$QueryRoot, JsonSerializable> {
  MePageQuery();

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'MePage'),
        variableDefinitions: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'me'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'username'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'MePage';

  @override
  List<Object> get props => [document, operationName];
  @override
  MePage$QueryRoot parse(Map<String, dynamic> json) =>
      MePage$QueryRoot.fromJson(json);
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
