# macaca-test-sample-java

[![build status][travis-image]][travis-url]

[travis-image]: https://img.shields.io/travis/macacajs/macaca-test-sample-java.svg?style=flat-square
[travis-url]: https://travis-ci.org/macacajs/macaca-test-sample-java

Macaca test sample

[API Doc](//macacajs.github.io/wd.java/)

[gitter-url]: https://gitter.im/alibaba/macaca

## CI Sample

| Platform   | Status                                          |  Repo                                                                                                         |
| ---------- | ----------------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| PC         | [![build status][travis-image-0]][travis-url-0] | [macaca-test-sample-java](https://github.com/macaca-sample/macaca-test-sample-java)                           |
| iOS        | [![build status][travis-image-1]][travis-url-1] | [macaca-ci-sample-java-ios-travis](https://github.com/macaca-sample/macaca-ci-sample-java-ios-travis)         |
| Android    | [![build status][travis-image-2]][travis-url-2] | [macaca-ci-sample-java-android-travis](https://github.com/macaca-sample/macaca-ci-sample-java-android-travis) |

[travis-image-0]: https://img.shields.io/travis/macaca-sample/macaca-test-sample-java.svg?style=flat-square
[travis-url-0]: https://travis-ci.org/macaca-sample/macaca-test-sample-java
[travis-image-1]: https://img.shields.io/travis/macaca-sample/macaca-ci-sample-java-ios-travis.svg?style=flat-square
[travis-url-1]: https://travis-ci.org/macaca-sample/macaca-ci-sample-java-ios-travis
[travis-image-2]: https://img.shields.io/travis/macaca-sample/macaca-ci-sample-java-android-travis.svg?style=flat-square
[travis-url-2]: https://travis-ci.org/macaca-sample/macaca-ci-sample-java-android-travis

## Test

Start macaca server

```shell
$ macaca server --verbose
```

exec test

```shell
$ mvn -s settings.xml clean install
$ mvn test
```

## App Source Code

- [ios-app-bootstrap](//github.com/xudafeng/ios-app-bootstrap)
- [android-app-bootstrap](//github.com/xudafeng/android-app-bootstrap)

## License

The MIT License (MIT)

## Problems
1. when you run iosSampleTest.java,you may meet this problem:

```

ios_webkit_debug_proxy path: /usr/local/bin/ios_webkit_debug_proxy
Could not connect to lockdownd. Exiting.: Permission denied
Unable to attach f27bc6f301486418d3c81c04165cbd93143ec972 inspector
Invalid message _rpc_reportConnectedDriverList: <dict>
	<key>WIRDriverDictionaryKey</key>
	<dict>
	</dict>
</dict>

```

that's because you do not have permission for ios_webkit_debug_proxy, you can solve this problem by this:

1. refer to: [http://stackoverflow.com/questions/39035415/ideviceinstaller-fails-with-could-not-connect-to-lockdownd-exiting](http://stackoverflow.com/questions/39035415/ideviceinstaller-fails-with-could-not-connect-to-lockdownd-exiting)

2. if the problem still exists ,upgrade ios-ios-webkit-debug-proxy(my version is ios-webkit-debug-proxy-1.7.1)


```
$ brew upgrade ios-webkit-debug-proxy

```
