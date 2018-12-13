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
echo "cleaned up mess created in the submissions folder on remote host"
