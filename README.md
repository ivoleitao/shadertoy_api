# shadertoy_api
A Shadertoy client API definition for Dart compatible with all platforms

[![Pub Package](https://img.shields.io/pub/v/shadertoy_api.svg?style=flat-square)](https://pub.dartlang.org/packages/shadertoy_api)
[![Build Status](https://github.com/ivoleitao/shadertoy_api/workflows/build/badge.svg)](https://github.com/ivoleitao/shadertoy_api/actions)
[![Coverage Status](https://codecov.io/gh/ivoleitao/shadertoy_api/graph/badge.svg)](https://codecov.io/gh/ivoleitao/shadertoy_api)
[![Package Documentation](https://img.shields.io/badge/doc-shadertoy_api-blue.svg)](https://www.dartdocs.org/documentation/shadertoy_api/latest)
[![GitHub License](https://img.shields.io/badge/license-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Introduction

Provides a definition of the contracts and entities needed to create a dart client to the Shadertoy API.

The contracts defined in this library allow the creation of clients to the:
* **Shadertoy REST API**, wich as presented in the [howto](https://www.shadertoy.com/howto#q2), provides a number of operations that allow the user to browse the shaders currently available with `public+api` privacy settings. Note that the number of operations available with this API are limited albeit enough for simple browsing usage. To start using this type of client a API key should be obtained for a properly registered user on the [apps](https://www.shadertoy.com/myapps) page and the client implementation should support providing it at the time of the construction
* **Shadertoy Site API**, provides access to the same methods as the previous API but adds more data namely users, playlists, shader comments and website media. Not that The shaders returned by this API should are not constrained by the `public+api` privacy settings. With that said, the client implementation should support the usage of a suitable user and password providing sign in and out methods or, in alternative, anonymous access.

Finally, this library defines contracts supporting the creation of data stores thus providing a way to work offline with the donwloaded shaders instead of hitting the REST or Site APIs

## Features

**REST API**

* `Find shader` by id
* `Find shaders` from a list of id's
* `Query shaders by term`, tags and sort them by *name*, *likes*, *views*, *neweness* and by *hotness* (proportional to popularity and inversly propostional to lifetime). All the query results are paginated.
* `Find all shader ids`
* `Find shaders ids by term`, tags and sort them by *name*, *likes*, *views*, *neweness* and by *hotness* (proportional to popularity and inversly propostional to lifetime). All the query results are paginated.

**Site API**

All the REST API features plus the following:
* `Login`
* `Logout`
* `Find user` by id
* `Find shaders by user id`
* `Query shaders by user id`, tags and sort them by *name*, *likes*, *views*, *neweness* and by *hotness* (proportional to popularity and inversly propotional to lifetime). All the query results are paginated as well.
* `Find comments` by shader id
* `Find playlist` by id.
* `Query shaders by playlist id`. All the query results are paginated.
* `Query shader ids by playlist id`. All the query results are paginated. 
* `Download preview`, i.e. the the shader thumbnails
* `Download media`, any other media provided by the Shadertoy website

**Store API**

All the REST and Site API features except `login`, `logout`, `download preview` and `download media` plus the following:
* `Save user`
* `Find account by id`
* `Query account` by name, type and system
* `Save account`
* `Save shader`
* `Save shader comments`
* `Save playlist`

## Getting Started

Instantiate a `ShadertoyWS` implementation, for example the one provided by the package [shadertoy_client](https://wwww.github.com/ivoleitao/shadertoy_client), to access the REST API:

```
ShadertoyWS ws = ...
```
and execute one of the methods provided, for example to obtain a shader by id execute `findShaderById` providing the id of the shader as parameter:
```
FindShaderResponse response = await ws.findShaderById('...');
if (response.ok) {
    print(response.shader);
} else {
    print('Error: ${response.error.message}')
}
```
In alternative instantiate a `ShadertoySite` implementation, for example the one provided by the package [shadertoy_client](https://wwww.github.com/ivoleitao/shadertoy_client), to access the Site API:
```
ShadertoySite site = ...
```
and execute one of the methods provided, for example to obtain the shader comments by shader id execute `findCommentsByShaderId` providing the id of the shader as parameter:
```
FindCommentsResponse response = await site.findCommentsByShaderId('...');
if (response.ok) {
    response.comments.forEach((c)=> print(c.text));
} else {
    print('Error: ${response.error.message}')
}
```
To create a database providing the same set of read operations as the previous contracts but also the ability to save shaders as well as other entities a `ShadertoyStore` contract is also provided. The user should instantiate a `ShadertoyStore` providing the apropiate configurations for the implementation:
```
ShadertoyStore store = ...
```
and execute persitent operations, for example storing the definition of a shader in the store with:
```
Shader shader = Shader(...);
SaveShaderResponse response = await store.saveShader(shader);
if (!response.hasError) {
    print('Shader stored');
} else {
    print('Error: ${response.error.message}')
}
```

## Model

![Shadertoy API Model](doc/media/model.png?raw=true)

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: http://github.com/ivoleitao/shadertoy_api/issues/new
