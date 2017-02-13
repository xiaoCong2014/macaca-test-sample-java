git_version = $$(git branch 2>/dev/null | sed -e '/^[^*]/d'-e's/* \(.*\)/\1/')
npm_bin= $$(npm bin)

all: test
install:
	@npm install
	npm i macaca-cli --save-dev
travis-desktop: install
	server
	mvn -s settings.xml clean install
	mvn test -Dtest=DesktopSampleTest
travis-android:install 
	echo "travis-android running"
	server
	mvn -s settings.xml clean install
	mvn test -Dtest=AndroidSampleTest
travis-ios: install
	npm install macaca-cli --save-dev
	npm install macaca-ios --save-dev
	macaca doctor
	macaca server --verbose
	sleep 10s
	mvn -s settings.xml clean install
	mvn test -Dtest=IosSampleTest
travis-h5: server
	mvn -s settings.xml clean install
	mvn test -Dtest=H5SampleTest
server:
	@${npm_bin}/macaca server --verbose &
.PHONY: test
