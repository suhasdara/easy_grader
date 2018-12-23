<h2>Simple to use remote grading system</h2>

**Only works on Linux, Mac, or Windows with linux environment enabled**


<h4>IMPORTANT</h4>

The script handles pulling github repo and slightly edits the grading repo's meta.sh script. Whenever using any of the scripts, please do a "git pull" to make sure that scripts are up to date and lead to grading the students' submissions correctly.

<h4>Prior requirements</h4>

1. Install 'sshpass' on your laptop (could be quite daunting to install on Mac/Windows)
2. Clone the CS314_grade repository at some location on a remote lab machine
3. Edit config.cfg file according to your needs:
   1. username is your CS username
   2. machine is the CS machine of your preference (e.g. aquarius)
   3. gusername is your Github username
   4. remoteRelativePath is the path to the grading directory on the CS machine relative to home directory

<h4>How to use</h4>

1. Put all the scripts in the same directory (grade.bash, getUploadZip.bash, cleanup.bash, cleanMess.bash, config.cfg)
2. Download the submissions.zip from canvas and put it in the same directory where the scripts are
3. Run the following command to grade the submissions in the remote directory and retrieve all the correctness-graded submissions:
`bash ./grade.bash <AssignmentNumber>`
   1. *OPTIONAL*: If you suspect that running the above command created a mess (either because of a mistake/typo on your part, or a faulty submission by a student, run the following command:
   `bash ./cleanMess.bash <AssignmentNumber>`
   2. *OPTIONAL*: Then perform step 3 again (possibly step 2 as well), after fixing whatever caused the "mess"
4. The retrieved tested submissions can be found in the respective assignment directory. Grade them for style.
5. Run the following command to copy the graded submissions back to the remote computer and zip it and retrieve it:
`bash ./getUploadZip.bash <AssignmentNumber>`
6. The retrieved zip file can be found in the respective assignment directory. Upload it back to canvas
7. *OPTIONAL*: Run the following command to only keep the feedback files on local computer and delete every other student file (like code):
`bash ./cleanup.bash <AssignmentNumber>`

<h4>Issues</h4>

1. Do not know how the scripts will behave if you run them on an assignment that has already been graded
2. Do not know how the grade.bash script will behave if wrong github password is entered (Script will exit if wrong CS password is entered)
