![Splitflap](http://yannickloriot.com/resources/splitflap-logo.gif)

[![Supported Platforms](https://cocoapod-badges.herokuapp.com/p/Splitflap/badge.svg)](http://cocoadocs.org/docsets/Splitflap/) [![Version](https://cocoapod-badges.herokuapp.com/v/Splitflap/badge.svg)](http://cocoadocs.org/docsets/Splitflap/) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![Build Status](https://travis-ci.org/yannickl/Splitflap.svg?branch=master)](https://travis-ci.org/yannickl/Splitflap) [![codecov.io](http://codecov.io/github/yannickl/Splitflap/coverage.svg?branch=master)](http://codecov.io/github/yannickl/Splitflap?branch=master)

Splitflap is a simple to use component to present changeable alphanumeric text like often used as a public transport timetable in airports or railway stations or with some flip clocks.

## Usage

### Hello World

The first example is the simplest way to use the `Splitflap` component. Here how to display this "Hello" text:

![Hello](http://yannickloriot.com/resources/splitflap-hello.gif)

```swift
import Splitflap

let splitflapView        = Splitflap(frame: CGRectMake(0, 0, 370, 53))
splitflapView.datasource = self

// Set the text to display by animating the flaps
splitflapView.setText("Hello", animated: true)

// MARK: - Splitflap DataSource Methods

// Defines the number of flaps that will be used to display the text
func numberOfFlapsInSplitflap(splitflap: Splitflap) -> Int {
  return 5
}

```

### Theming

`Splitflap` allows you to customize each flap individually by providing a `splitflap:builderForFlapAtIndex:` delegate method:

![Theming](http://yannickloriot.com/resources/splitflap-theming.gif)

```swift
let splitflapView        = Splitflap(frame: CGRectMake(0, 0, 370, 53))
splitflapView.delegate   = self
splitflapView.datasource = self

// Set the text with an emoji
splitflap.text = "Cat \u{1F63B}"

// MARK: - Splitflap Delegate Methods

// Configure the appearance for each flaps
func splitflap(splitflap: Splitflap, builderForFlapAtIndex index: Int) -> FlapViewBuilder {
  return FlapViewBuilder { builder in
    builder.backgroundColor = UIColor(red: 251/255, green: 249/255, blue: 243/255, alpha: 1)
    builder.cornerRadius    = 5
    builder.font            = UIFont(name: "Avenir-Black", size:45)
    builder.textAlignment   = .Center
    builder.textColor       = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    builder.lineColor       = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
  }
}

// MARK: - Splitflap DataSource Methods

func tokensInSplitflap(splitflap: Splitflap) -> [String] {
  return [" ", "C", "a", "t", "\u{1F63B}"]
}
```
### And many more...

To go further, take a look at the example project.

*Note: All contributions are welcome*

## Installation

#### CocoaPods

Install CocoaPods if not already available:

``` bash
$ [sudo] gem install cocoapods
$ pod setup
```
Go to the directory of your Xcode project, and Create and Edit your Podfile and add _Splitflap_:

``` bash
$ cd /path/to/MyProject
$ touch Podfile
$ edit Podfile
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'

use_frameworks!
pod 'Splitflap', '~> 1.0.1'
```

Install into your project:

``` bash
$ pod install
```

Open your project in Xcode from the .xcworkspace file (not the usual project file):

``` bash
$ open MyProject.xcworkspace
```

You can now `import Splitflap` framework into your files.

#### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that automates the process of adding frameworks to your Cocoa application.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate `Splitflap` into your Xcode project using Carthage, specify it in your `Cartfile` file:

```ogdl
github "yannickl/Splitflap" >= 1.0.1
```

#### Manually

[Download](https://github.com/YannickL/Splitflap/archive/master.zip) the project and copy the `Splitflap` folder into your project to use it in.

## Contact

Yannick Loriot
 - [https://twitter.com/yannickloriot](https://twitter.com/yannickloriot)
 - [contact@yannickloriot.com](mailto:contact@yannickloriot.com)


## License (MIT)

Copyright (c) 2015-present - Yannick Loriot

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
