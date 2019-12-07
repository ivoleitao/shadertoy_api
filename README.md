# shadertoy_api
A Shadertoy client API definition for Dart compatible with all platforms

[![](https://github.com/ivoleitao/shadertoy_api/workflows/build/badge.svg)](https://github.com/ivoleitao/shadertoy_api/actions)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Introduction

Provides a basic definition of the contracts and the entities needed to create a dart client to the Shadertoy API.

The contracts defined in this library allow the creation of clients for:
* Shadertoy REST API (as presented in the [howto](https://www.shadertoy.com/howto#q2)) which provides a number of operations that allow the user to browse the shaders currently available with public+api privacy settings. The number of operations available on this client, are limited but enough for simple browsing usage. To start use this type of client a API key should be obtained for a properly registered user on the [apps](https://www.shadertoy.com/myapps) page of the user and the client implementation should support providing it at the time of the construction
* Shadertoy Site API which allow access to more data (not constrained by the public+api privacy settings) but needs a client implementation leveraging web scrapping techniques to obtain the data. The client implementation should support the usage of a suitable user and password thus supporting logging in and out of the site or in alternative allows complete anonymous access, naturally not implying user and pass.

Additionally this library defines contracts supporting the creation of data stores for the Shadertoy data thus providing a way to work offline with the donwloaded shaders instead of hitting the REST or Site APIs

## Getting Started

Instantiate a `ShadertoyWS` client to access the REST API:

```
ShadertoyWS ws = ...
```
and execute one of the methods provided, for example to obtain the shader execute `findShaderById` providing the id of the shader as parameter:
```
FindShaderResponse response = await ws.findShaderById('...');
if (!response.hasError) {
    print(response.shader);
} else {
    print('Error: ${response.error.message}')
}
```
In alternative instantiate a `ShadertoySite` client to access the Site API:
```
ShadertoySite site = ...
```
and execute one of the methods provided, for example to obtain the shader comments execute `findCommentsByShaderId` providing the id of the shader as parameter:
```
FindCommentsResponse response = await site.findCommentsByShaderId('...');
if (!response.hasError) {
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
## Class Model

![diagram](http://www.plantuml.com/plantuml/proxy?cache=no&src=https://raw.githubusercontent.com/ivoleitao/shadertoy_api/develop/model.puml)

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: http://github.com/ivoleitao/shadertoy_api/issues/new
