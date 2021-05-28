# MARV

Marv is an E-commerce app created in Flutter using KeystoneJS GraphQL Api as  backend to authenticate users and fetch products and handels payment.

## Features

* Authentication & Authorization.
* Fetch products from GraphQL API.
* Server-side search based on name and description. 
* Web Admin dashboard to manage products and orders.
* Server-side payment using Stripe.

## Preview


<img src="./readme/GIF-210526_144702.gif" data-canonical-src="./readme/GIF-210526_144702.gif" width="200" height="400" />

## Dependencies

* [Flutter](https://flutter.io/)
* [KeystoneJS](https://www.keystonejs.com/)
* [Stripe](https://stripe.com/en-gb-us)


## Getting Started

#### 1. [Setup Flutter](https://flutter.io/setup/)

#### 2. Clone the repo

```sh
$ git clone https://github.com/zakariaBoukernafa/Marv
$ cd Marv/
```

#### 3. Setup Keystone API

- follow the setup instructions in [keystone API repo](https://github.com/zakariaBoukernafa/GraphQL-keystone-API)


#### 4. Setup Enviroment variables

1. Open [.env.example](./enp.example) and save the file as .env in the root repo.
2. copy your stripe public key into "NEXT_PUBLIC_STRIP_KEY" variable and save the file.

#### 5. Setup Configuration 

1. Open [config.dart](./lib/config.dart) and set your [Graphql API](https://github.com/zakariaBoukernafa/GraphQL-keystone-API)  endpoint.


#### 6. Run the app

```sh
$ flutter pub get
$ flutter run
```

## License
Licensed under the [MIT license](https://opensource.org/licenses/MIT).
