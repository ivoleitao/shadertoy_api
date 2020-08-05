import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'account.g.dart';

/// The type of the account used to access Shadertoy
enum AccountType {
  /// Fetching Shadertoy data through authenticated calls (with a previous call to login)
  /// much like a regular user of the website
  site,

  /// Fetching Shadertoy data through REST calls to the official API
  api
}

@JsonSerializable()

/// The account used to access the Shadertoy data.
///
/// An account represents the set of credentials used to access Shadertoy website
/// either through the usage of the site API or the REST API. IT should be used in any client
/// application to register the accounts that can be used to access the API.
class Account extends Equatable {
  @JsonKey(name: 'name')

  /// The name of the user
  final String name;

  @JsonKey(name: 'type')

  /// The type of the user
  final AccountType type;

  @JsonKey(name: 'system')

  /// If this account represents a system account i.e. an account that is preconfigured and cannot
  /// be deleted
  final bool system;

  @JsonKey(name: 'password')

  /// The credentials
  final String credentials;

  @JsonKey(name: 'displayName')

  /// The display name
  final String displayName;

  @JsonKey(name: 'picture')

  /// A picture url
  final String picture;

  /// Builds an account
  ///
  /// * [name]: The name of the user
  /// * [type]: The type of the user
  /// * [system]: If the user is preconfigured
  /// * [credentials]: The user credentials
  /// * [displayName]: The display name of the user
  /// * [picture]: The picture URL
  const Account(
      {@required this.name,
      @required this.type,
      this.system = false,
      this.credentials,
      this.displayName,
      this.picture})
      : assert(name != null),
        assert(type != null),
        assert(system != null);

  /// Creates a anonymous site account
  ///
  /// * [system]: If the user is preconfigured
  /// * [displayName]: The display name of the user
  /// * [picture]: The picture URL
  Account.anonymous({bool system = true, String displayName, String picture})
      : this(
            name: 'anonymous',
            type: AccountType.site,
            system: system,
            displayName: displayName,
            picture: picture);

  /// Builds a registered site account
  ///
  /// * [user]: The name of the user
  /// * [system]: If the user is preconfigured
  /// * [password]: The user password
  /// * [displayName]: The display name of the user
  /// * [picture]: The picture URL
  Account.registered(
      {@required String user,
      bool system = false,
      @required String password,
      String displayName,
      String picture})
      : this(
            name: user,
            type: AccountType.site,
            system: system,
            credentials: password,
            displayName: displayName,
            picture: picture);

  /// Builds a site account
  ///
  /// * [user]: The name of the user
  /// * [apiKey]: The api key
  /// * [system]: If the user is preconfigured
  /// * [displayName]: The display name of the user
  /// * [picture]: The picture URL
  Account.api(
      {@required String user,
      @required String apiKey,
      bool system = false,
      String displayName,
      String picture})
      : this(
            name: user,
            type: AccountType.api,
            system: system,
            credentials: apiKey,
            displayName: displayName,
            picture: picture);

  @override

  /// The [List] of `props` (properties) which will be used to determine whether
  /// two [Equatables] are equal.
  List<Object> get props =>
      [name, type, system, credentials, displayName, picture];

  /// Creates a [Account] from json map
  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  /// Creates a json map from a [Account]
  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
