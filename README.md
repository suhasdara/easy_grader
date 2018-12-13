Simple to use remote grading system
===================================

*Only works on Linux, Mac, or Windows with linux environment enabled*


IMPORTANT
~~~~~~~~~

The script handles pulling github repo so slightly edits the meta.sh actual script. Whenever using any of the scripts, please do a "git pull" to make sure that scripts are up to date and lead to grading the student's submissions correctly.


Prior requirements
~~~~~~~~~~~~~~~~~~

1. Install 'sshpass' on your personal laptop (could be quite daunting to install on Mac/Windows)

2. Clone the CS314_grade repository at some location on a remote lab machine

3. Edit config.cfg file according to your needs:

   a. username is your CS username

   b. machine is the CS machine of your preference (e.g. aquarius)

   c. gusername is your Github username

   d. remoteRelativePath is the path to the grading directory on the CS machine relative to home directory


How to use
~~~~~~~~~~

1. Put all the scripts in the same directory (grade.bash, getUploadZip.bash, cleanup.bash, config.cfg)

2. Download the submissions.zip from canvas and put it in the same directory where the scripts are

3. Run the following command to test the submissions in the remote directory and retrieve all the tested submissions:
	bash ./grade.bash <AssignmentNumber>

4. OPTIONAL: If you suspect that running the above command created a mess (either because of a mistake/typo on your part, or a faulty submission by a students, run the following command:
	bash ./cleanMess.bash <AssignmentNumber>
Then perform step 3 again (possibly step 2 as well), after fixing whatever caused the "mess"

5. The retrieved tested submissions can be found in the respective assignment directory. Grade them for style.

6. Run the following command to copy the graded submissions back to the remote computer and zip it and retrieve it:
	bash ./getUploadZip.bash <AssignmentNumber>

7. The retrieved zip file can be found in the respective assignment directory. Upload it back to canvas

8. OPTIONAL: Run the following command to only keep the feedback files on local computer and delete every other student file (like code):
	bash ./cleanup.bash <AssignmentNumber>


Issues
~~~~~~

1. Do not know how the scripts will behave if you run it on an assignment that has already been graded

2. Do not know how the script will behave if wrong github password is entered (Script will exit if wrong CS password is entered)
