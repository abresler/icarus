Icarus
================

Property management app with client-facing analytics dashboard built for Icarus Investment Group, based in Chicago, IL. This app was commissioned due to frustration with existing property management software, such as Buildium®, propertybase®, and appfolio™. 

These companies provide what is essentially accounting software. The reports and analytics provided to investors resemble a multi-page spreadsheet—because they are, in fact, nothing more than a multi-page spreadsheet. In most circumstances, if a client wants to see how his investment is doing, he either calls the company or waits for the quarterly report to come in the mail.

Our goal with this project was to create a client-facing analytics dashboard with real-time data so a client can see all his investments, receive status notifications, see how his investments are doing, and view a list of potential investment opportunities. 

##Frameworks, Libraries, APIs

We built this app using `Meteor`, an isomorphic javascript framework that is reactive by default. We chose Meteor because of its easy implementation, ease of integration with D3.js, and the helpful way in which the framework utilizes Mongo databases. 

For our frontend, we used primarily [`Materialize`](materializecss.com), a library based on concepts from Google's material design. Any additional customization was done using `Sass`.

We wrote most of our backend logic using the Javascript preprocessor `coffeescript`.

Account management is handled by Meteor's built in `accounts-base` and `accounts-password` packages.

For our charts, analytics, and data-responsive maps, we used `D3.js`, a popular data visualization library.

We also utilized the `Zillow` API to streamline data collection for each property, and to collect historic data. 

For our routes, we used `iron:router`, which is a popular router designed specifically for `Meteor`.

We are also using `Google Analytics` to collect visitor data and `Kadira` for error and performance data.

For testing, we are using `Velocity`, which runs on `Mocha` and `Chai`. 

##Features


##Contributors


##Roadmap

1. Building an abstracted version of the software that can be migrated into the software of established competitors
2. Build more widgets for the client dashboard
3. Add client email feature
4. Add monthly/quarterly reporting feature
