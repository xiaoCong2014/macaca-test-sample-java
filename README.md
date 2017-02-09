# macaca-test-sample-java

[![build status][travis-image]][travis-url]

[travis-image]: https://img.shields.io/travis/macacajs/macaca-test-sample-java.svg?style=flat-square
[travis-url]: https://travis-ci.org/macacajs/macaca-test-sample-java

Macaca test sample

[API Doc](//macacajs.github.io/wd.java/)

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
