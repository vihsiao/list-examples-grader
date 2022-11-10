# Create your grading script here

set -e
rm -rf student-submission
git clone $1 student-submission

CP=".:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar"
passing=0

if [[ ! -e student-submission/ListExamples.java ]]
then
    echo "ListExamples.java does not exist in the directory"
    exit

cp student-submission/ListExamples.java ListExamples.java
fi

javac -cp $CP TestListExamples.java 2> err.txt

if [[ ! $? -eq 0 ]]
then
    echo "Cannot compile tests!"
    cat err.txt
    exit
fi

javac -cp $CP ListExamples.java > err.txt

if [[ ! $? -eq 0 ]]
then
    echo "Cannot compile ListExamples!"
    cat err.txt
    exit
fi

exit 0