# Create your grading script here

rm -rf student-submission
git clone $1 student-submission

CP=.:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar
CP2=.:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar

cp TestListExamples.java student-submission

cd student-submission

if [[ ! -e ListExamples.java ]]
then
    echo "ListExamples.java does not exist in the directory"
    exit 1
fi

javac -cp $CP *.java 2> err.txt

if [[ ! $? -eq 0 ]]
then
    echo "Cannot compile ListExamples and/or TestListExamples!"
    cat err.txt
    exit 1
fi

javac -cp $CP *.java
java -cp $CP2 org.junit.runner.JUnitCore TestListExamples > output.txt

cat output.txt


#echo "Your total score is" $((${OUTPUT:25:1}-${OUTPUT:11:1}))" "out of ${OUTPUT:11:1}"
#fi

exit 0