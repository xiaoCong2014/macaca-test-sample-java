git_version = $$(git branch 2>/dev/null | sed -e '/^[^*]/d'-e's/* \(.*\)/\1/')
npm_bin= $$(npm bin)

all: test
travis-desktop: server
	mvn -s settings.xml clean install
	mvn test -Dtest=DesktopSampleTest
travis-android: server
	mvn -s settings.xml clean install
	mvn test -Dtest=AndroidSampleTest
travis-ios: server
	mvn -s settings.xml clean install
	mvn test -Dtest=IOSSampleTest
travis-h5: server
	mvn -s settings.xml clean install
	mvn test -Dtest=H5SampleTest
server:
	@${npm_bin}/macaca server --verbose &
.PHONY: test
