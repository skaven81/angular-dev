Angular dev server
==================

This container will set up a simple Angular dev server that
you can connect to from your browser.  Changes you make in
your project will appear "live" in the browser.

Setup Instructions
==================

Step 1: Build Docker container
------------------------------

 $ docker build -t angular-dev .

The resulting container will have a default Angular app
(as created with `ng new`) deployed into the `/my-app`
directory.


Step 2: Launch the dev server
-----------------------------

This will verify that everything is working, before you
switch the container over to your own project data.

 $ docker run -it --rm -p 4200:4200 --name angular-dev angular-dev

This will start up the Angular development server, on
port 4200.  Open your browswer to http://localhost:4200
and you should see the Angular sample project page.


Step 3 (optional): Start your own project
-----------------------------------------

If you don't already have a project, you can copy the one
built into the container, if you don't feel like running
`ng new` (e.g. if you don't have an angular dev environment
on your workstation).

 $ docker cp angular-dev:/my-app .

This will copy the `my-app` dir out of the dev server container,
into your current directory.  You'll want to then rename it
to something else:

 $ mv my-app my-snazzy-project

You can now Ctrl+C out of the dev server started in step #2.


Step 4: Restart dev server, mounting your own project data
----------------------------------------------------------

Use the `-v` option to `docker run` to replace the `/my-app`
directory in the container, with your own project data:

 $ docker run -it --rm -p 4200:4200 -v /path/to/my-snazzy-project:/my-app --name angular-dev angular-dev

Leave this window open, and open a new terminal. Now, changes
you make to your project will be detected by the dev server, and
will be automatically recompiled.  The browser window will even
automatically refresh!

