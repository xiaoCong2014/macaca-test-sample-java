git_version = $$(git branch 2>/dev/null | sed -e '/^[^*]/d'-e's/* \(.*\)/\1/')
npm_bin= $$(npm bin)

all: test
install:
	@npm install
	npm i macaca-cli --save-dev
travis-desktop: 
	install
	server
	mvn -s settings.xml clean install
	mvn test -Dtest=DesktopSampleTest
travis-android: 
	echo "travis-android running"
	install
	server
	mvn -s settings.xml clean install
	mvn test -Dtest=AndroidSampleTest
travis-ios: 
	echo "travis-ios running---"
	echo "install"
	install
	echo "@npm install macaca-ios --save-dev"
	@npm install macaca-ios --save-dev
	echo "@${npm_bin}/macaca doctor"
	@${npm_bin}/macaca doctor
	echo "server"
	server
	echo "mvn -s settings.xml clean install"
	mvn -s settings.xml clean install
	echo "mvn test -Dtest=IosSampleTest"
	mvn test -Dtest=IosSampleTest
travis-h5: server
	mvn -s settings.xml clean install
	mvn test -Dtest=H5SampleTest
server:
	@${npm_bin}/macaca server --verbose &
.PHONY: test
