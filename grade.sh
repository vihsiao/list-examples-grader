# Create your grading script here

rm -rf student-submission
git clone $1 student-submission

CP=".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar"
CP2=".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar"

cp student-submission/ListExamples.java ListExamples.java

if [[ ! -e ListExamples.java ]]
then
    echo "ListExamples.java does not exist in the directory"
    exit 1
fi

#javac -cp $CP *.java 2> err.txt

#if [[ $? -eq 0 ]]
#then
#    echo "Cannot compile ListExamples and/or TestListExamples!"
#    cat err.txt
#    exit 1
#fi

#cp TestListExamples.java student-submission

#cd student-submission

#if [[ -e ./ListExamples.java ]]
#then 
#echo "file found"
#fi

javac -cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar *.java
java -cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples > output.txt

java -cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples > output.txt
cat output.txt

exit 0