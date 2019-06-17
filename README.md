# PunkAPI

[![Version](https://img.shields.io/cocoapods/v/PunkAPI.svg?style=flat)](https://cocoapods.org/pods/PunkAPI)
[![Build Status](https://travis-ci.com/Oni-zerone/PunkAPI.svg?branch=develop)](https://travis-ci.com/Oni-zerone/PunkAPI)
[![codebeat badge](https://codebeat.co/badges/bfe75f4d-ac1f-4e09-8a25-4f836bb93428)](https://codebeat.co/projects/github-com-oni-zerone-punkapi-develop)
[![Coverage Status](https://coveralls.io/repos/github/Oni-zerone/PunkAPI/badge.svg?branch=develop)](https://coveralls.io/github/Oni-zerone/PunkAPI?branch=develop)
[![Language](https://img.shields.io/badge/language-swift-orange.svg)](https://cocoapods.org/pods/PunkAPI)
[![Platform](https://img.shields.io/cocoapods/p/PunkAPI.svg?style=flat)](https://cocoapods.org/pods/PunkAPI)
[![License](https://img.shields.io/cocoapods/l/PunkAPI.svg?style=flat)](https://cocoapods.org/pods/PunkAPI)

**This is a wrapper around PunkAPI v2 by [@samjbmason](https://twitter.com/samjbmason) you can find more informations about those APIs at https://punkapi.com/**

_Have you ever wanted to search through Brewdog's expansive back catalogue of beer in a programmatic way? Maybe build a tool that pairs beer with food, or search beers with an abv of more than 4%? Well now your prayers have been answered!_

_The Punk API takes Brewdog's DIY Dog and turns it into a searchable, filterable API that's completely free and open source._

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Usage
```swift
let punkApi = PunkApi(configuration: .default)

punkApi.get(RandomBeerRequest(), queue: .main) { beersResult in  }
punkApi.get(BeerRequest(id: 1), queue: .main) { beersResult in  }
punkApi.get(RandomBeerRequest(), queue: .main) { beersResult in  }
punkApi.get(BeersRequest(filter: [.abv(condition: .more, value: 3),
                                  .beerName(value: "Punk")]), 
                         queue: .main) { beersResult in  }
```

## API
####    `RandomBeerRequest()`
Get a random beer request
```swift
punkApi.get(RandomBeerRequest(), queue: .main) { beersResult in  }
```

####    `BeerRequest(id: 1)`
Get a beer from given id
```swift
punkApi.get(BeerRequest(id: 1), queue: .main) { beersResult in  }
```

####    `BeersRequest(filter: [BeersRequest.Parameter.beerName(value: "Punk IPA")])`
Get beers that match the passed in options, if no options are passed in it will return all beers in ascending order of `id`.
```swift
punkApi.get(RandomBeerRequest(), queue: .main) { beersResult in  }
```
**Options**

##### `BeersRequest.Parameter.abv(condition: .more, value: 3)`
Condition: `Condition`
Value: `Float`
Will return beers with an abv greater or lower than the passed in value.

##### `BeersRequest.Parameter.ibu(condition: .more, value: 3)`
Condition: `Condition`
Value: `Float`
Will return beers with an ibu greater or lower than the passed in value.

##### `BeersRequest.Parameter.ebc(condition: .more, value: 3)`
Condition: `Condition`
Value: `Float`
Will return beers with an ebc greater or lower than the passed in value.

##### `BeersRequest.Parameter.beerName(value: "Punk")`
Value: `String`
Will return beers matching the string passed in (we use fuzzy matching to find the names).

##### `BeersRequest.Parameter.yeast(value: "American Ale")`
Value: `String`
Will return beers which match the name of the yeast of the string passed in (we use fuzzy matching to find the yeast names).

##### `BeersRequest.Parameter.brewed(condition: .more, value: 3)`
Condition: `Condition`
Value: `Date`
Will return beers brewed before or after the passed in date.

##### `BeersRequest.Parameter.hops(value: "Ahtanum")`
Value: `String`
Will return beers which match the name of the hops of the string passed in (we use fuzzy matching to find the hop names).

##### `BeersRequest.Parameter.malt(value: "Extra Pale")`
Value: `String`
Will return beers which match the name of the malt of the string passed in (we use fuzzy matching to find the hop names).

##### `BeersRequest.Parameter.food(value: "Cheesecake")`
Value: `String`
Will return beers which match food pairings of the string passed in (we use fuzzy matching to find the foods).

##### `BeersRequest.Parameter.ids(value: [1, 2, 4, 6])`
Value: `Array<Int>`
Will return beers which match the given ids.

## Installation

PunkAPI is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'PunkAPI'
```

## Author

[@Oni_zerone](https://twitter.com/Oni_zerone), oni.zerone@gmail.com

## License

PunkAPI is available under the MIT license. See the LICENSE file for more info.
