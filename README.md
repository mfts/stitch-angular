# StitchIt

StitchIt is an application our team decided to develop after observing that, during the opening exercises, powerpoints were not projected seamlessly, but were instead all separate files. We decided to use several Dropbox APIs to create a Web platform for creating an integrated powerpoint. Event organizers can login with Dropbox, and create a new event, for which they will be returned a URL, which they can then share with speakers.

On visiting the given URL, speakers can upload their powerpoint presentation (.pdf is the recommended format), without requiring dropbox login, or even a dropbox account, and those files will automatically be uploaded to a folder in the organizer's Dropbox. The event organizer is then able to monitor the files in the relevant Dropbox folder through our platform. Once all powerpoints have been submitted, the event organizer is able to drag and drop powerpoint titles, specifying the appropriate order of the powerpoints. Once this has been finalized, the event organizer hits our StichIt button, which will combine the powerpoint files together in the specified order, and save that stitched file in the same folder on Dropbox, maintaining all of the original files.

Our platform extends Dropbox's standard storage functionality, by turing it into a portal for file submission, where those who submit powerpoints at no stage have direct access to the Dropbox folder in which their submissions are being stored. Our titular function, the stitching of seperate files into one, employs Dropbox as an essential backend for a storage-based web-app. The StitchIt team is looking forward to developing mobile platforms for the application, and exploring the ways in which we can ensure all of your event's powerpoints are seamless and integrated. We love it when presentations are in sync, especially in the event you decide to underscore your words with rocking, upbeat music to get a young crowd going. Let us be your music. Let us stitch your dreams together. If kittens are what you want, at StitchIt we have them.  WE ARE THE FUTURE. !!!! Dare to dream.

## Second Repo
We have two repos. StitchIt is a seamless operation. Difference is a virtue.
https://github.com/MarcoBau/stitcher.git

## Running in Development
Because of Dropbox's OAuth protocols, we can't host this hacky code online. Here's how you can run a development server:
```
git clone
npm install
bower install
```
Bower components should already be in your cloned repo, as we pushed them to Git for the reason that we dragged and dropped our Dropbox module in -- it's missing from bower.json and the main production scripts. Once everything is downloaded:

`npm run-script watch`

Run using 'localhost' rather than the IP address.


## Our Team
Lachie Kermode (Frontend)
Marco Baumeler (Backend)
Youseff (Designer, writer of Python code. We decided not to use Django.)
Matt (CEO, spent 7 hours trying to install Python. Then we changed our minds.)

## Technologies
 -Dropbox API
 -AngularJS
 -Spring Boot
 -Swisscom Application Cloud (shoutout to their great pillows)
 -Jade
 -CoffeeScript
 -Parse.com
 -Bower
 -GulpJS
 -Django (A false start we threw away 10 hours in. Just to re-emphasize, we didn't use any of the Python code Youseff wrote.)