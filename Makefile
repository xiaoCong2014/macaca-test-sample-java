git_version = $$(git branch 2>/dev/null | sed -e '/^[^*]/d'-e's/* \(.*\)/\1/')
npm_bin= $$(npm bin)

all: test
install:
	@npm install
	@npm i macaca-cli --save-dev --unsafe-perm=true
travis-desktop: install
	server
	mvn -s settings.xml clean install
	mvn test -Dtest=DesktopSampleTest
travis-android:install 
	@npm install macaca-android --save-dev --unsafe-perm=true
	${npm_bin}/macaca doctor
	@${npm_bin}/macaca server --verbose &
	sleep 10s
	mvn -s settings.xml clean install -Dmaven.test.skip=true
	mvn test -Dtest=AndroidSampleTest
travis-ios:install
	@npm install macaca-ios --save-dev --unsafe-perm=true
	${npm_bin}/macaca doctor
	@${npm_bin}/macaca server --verbose &
	sleep 10s
	mvn -s settings.xml clean install -Dmaven.test.skip=true
	mvn test -Dtest=IosSampleTest
travis-h5: server
	mvn -s settings.xml clean install -Dmaven.test.skip=true
	mvn test -Dtest=H5SampleTest
server:
	@${npm_bin}/macaca server --verbose &
.PHONY: test
