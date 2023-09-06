# MyGPO: Dockerized
This is a dockerized version of MyGPO, which powere GPodder.net.  It is very incomplete and not currently suitable for production deploys but may be useful for development and some self-hosting scenarios.

If you find this useful, please give it a star.  If you find issues, please open an issue.

# Usage

* Clone mygpo Git repository in local host directory by running `git clone https://github.com/gpodder/mygpo.git /app/mygpo-git`
* Start the app with `docker-compose up`.  The app will be available at http://localhost:8000
* Note that no periodic tasks are currently run, so you will need to set them up manually via the admin dashboard (http://localhost:8000/admin/)
* In order to register a new user, use the registration form in the app.  Then attempt to log in.  A confirmation link will be printed to the console.  Copy the link and paste it into your browser to confirm the account.  NOTE: You may need to attempt to login a few times to get this to work.  I'm not sure why.


## TODO
* [ ] Add common Period Tasks (e.g. update feeds, update stats, etc.) during initialization
* [ ] Fix issue where database initialization takes too long on initial run, causing the app to fail to start
* [ ] Set up email server for sending confirmation emails (or use something like `mail-slurper` for development)
