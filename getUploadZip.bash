#Author: Suhas Dara

source ./config.cfg

read -sp "$username@$machine.cs.utexas.edu's password: " password
echo

remoteHost="$username@$machine.cs.utexas.edu"
path="/u/$username/$remoteRelativePath"

cd "a$1"

sshpass -p $password ssh -tt $remoteHost << EOF
cd "$path/a$1"
rm -rf submissions
exit
EOF
echo "deleted style ungraded submissions folder on remote host"

sshpass -p $password scp -r submissions "$remoteHost:$path/a$1"
echo "copied style graded submissions folder to remote host"

sshpass -p $password ssh -tt $remoteHost << EOF
cd "$path"
bash ./zipsubs.bash $1
exit
EOF
echo "zipping completed on remote host"

sshpass -p $password scp "$remoteHost:$path/a$1/submissions/submissions_upload.zip" .
echo "copied zipped submissions_upload from remote host"