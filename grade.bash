#Author: Suhas Dara

source ./config.cfg

read -sp "$username@$machine.cs.utexas.edu's password: " password
echo
read -sp "Github $gusername's password: " gpassword
gpassword=${gpassword//@/%40}
gpassword=${gpassword//./%2E}
gpassword=${gpassword////%2F}
gpassword=${gpassword//\\/%5C}
echo

remoteHost="$username@$machine.cs.utexas.edu"
path="/u/$username/$remoteRelativePath"
relativePath="a$1"

sshpass -p $password ssh -tt $remoteHost << EOF
cd "$path/$relativePath"
mkdir submissions
exit
EOF
echo "created submissions subdirectory on remote host"

sshpass -p $password scp submissions.zip "$remoteHost:$path/$relativePath/submissions"
echo "copied submissions zip to remote host"

sshpass -p $password ssh -tt $remoteHost << EOF
cd "$path"
echo "pulling github repo"
git stash
git pull https://$gusername:$gpassword@github.com/scott-u-texas/CS314_grade
chmod -R 700 *
sed -i -e 's/git pull/#git pull/g' ./meta.sh
./meta.sh $1
exit
EOF
echo "grading completed on remote host"

mkdir $relativePath
mv submissions.zip "$relativePath/submissions.zip"
sshpass -p $password scp -r "$remoteHost:$path/$relativePath/submissions" "$relativePath"
echo "retrieved all submissions from remote host"
