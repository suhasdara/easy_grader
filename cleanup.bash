#Author: Suhas Dara

cd "a$1/submissions"
for filename in *; do
	arr=(${filename//_/ })
	name="a$1_feedback_${arr[0]}.txt"
	echo "moving feedback $name"
	mv "$filename/a$1_feedback.txt" "../$name"
	echo "deleting $filename"
	rm -rf $filename
done

cd ..
echo "deleting submissions"
rm -rf submissions