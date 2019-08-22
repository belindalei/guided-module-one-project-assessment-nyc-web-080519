Funemployed: A Job-Seeking CLI App
=====================================================================================================

Funemployed is an app designed to help job seekers find open government jobs in New York City that
meet their requirements. The application is built in the Ruby programming language, leveraging,
ActiveRecord, a SQLite3 database and New York City's public API data at:

"https://data.cityofnewyork.us/resource/kpav-sd4t.json?"

Funemployed contains three data models:

1. JobSeekers
2. OpenJobs
3. LikedJobs

USAGE
=====================================================================================================


INITIAL SCREEN

On the initial screen, the application's logo is displayed and the user is prompted for their name.
If the name is recognized, the returning user is logged in and greeted with a 'welcome back' message.
If this is a new user. The new user is asked to provide some information about their job requirements
and is then logged in and greeted with a 'welcome' message.

MAIN MENU SCREEN

The user is presented with a menu that includes five options. The user must choose one of the options
to continue.

1. JOB MATCHES SCREEN

The user is presented with 15 jobs that match their requirements, sorted by salary. The user is
prompted to 'like' a job. Once the user has selected a job to 'like' they will be asked if they
would like to 'like' another. This will continue until the user responds in the negative. The user
is then returned to the main menu. Note that the application will not allow a user to 'like' the same
job twice.

2. LIKED JOB LIST SCREEN

The user is presented with a table that includes the details of all of the jobs they have 'liked.'
The user is then returned to the main menu.

3. DELETE LIKED JOB SCREEN

The user is presented with their table of liked jobs and asked which job they would like to remove.
Once the user selects a job, the job is deleted and the user is returned to the main menu.

4. ADD NOTES SCREEN

The user is presented with their table of liked jobs and asked which job they would like to add a
note to. They are then prompted for the text of their note. Once this is input, the note is added
and the user is returned to the main menu.

5. EXIT

This exits the program.


CRUD EXAMPLES
=====================================================================================================

CREATE:

- A user creates a new JobSeeker when they log in for the first time. (On subsequent logins, this
object is found and returned).

- When a user 'likes' a job, a new OpenJob is created, as well as a LikedJob object that joins the
JobSeeker and OpenJob objects.

READ:

- A user is able to return a list of LikedJobs, formatted in a table.

UPDATE:

- A user is able to add notes to any of their LikedJobs.

DELETE:

- A user is able to 'unlike' a previously 'liked' job.
