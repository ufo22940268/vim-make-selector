.PHONY : main
main: 
	mvn -Dmaven.test.skip=true install android:redeploy  android:run -q

.PHONY : test
test:
	mvn test -f test_pom.xml -q

.DEFAULT_GOAL := main
#.DEFAULT_GOAL := test
