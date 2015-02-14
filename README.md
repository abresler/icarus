Icarus
================

Demo: [icarus.meteor.com](http://icarus.meteor.com)

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

###Guest

The website for a guest user consists of:

1. Homepage
2. Contact
3. About
4. Calculator

The homepage contains a number of SVGs that were created using `Adobe Illustrator` and `Sketch`. These include the logo in the top left of the navbar, the three promo images, and the logo at the bottom of the page. The map is rendered using `D3.js` and real data reflecting the locations in which Icarus owns property. 

image goes here

The calculator allows anyone to calculate the Capitalization Rate (CAP Rate) of a property in which they are considering an investment. The calculation for CAP rate is not complicated: `Net Annual Operating Income / Purchase Price = CAP Rate`

image goes here

###Admin

When a user signs in as an admin, he gains access to the admin panel. The top of the admin panel contains a number of button shortcuts that link to specific sections of the admin panel. This is accomplished using a `jQuery` plugin called `scrollspy`, which comes with the `Materialize` library. The icons are all from `Fontawesome`. 

image goes here

The navigation that stays fixed to the left of the page is called a `pushpin` and also comes with the Materialize library. 

image goes here

An admin can add a client by clicking on the button next to the "Client List". We utilized `Session` variables to show a new row that allows the admin to add a new user. 

image goes here

The admin can also add properties through the "Manage Properties" section in much the same way he adds new clients. This utilizes the `Zillow` API, so the admin only needs to know the "zpid" (Zillow Property ID) of the property and Zillow does all the heavy lifting of finding the latitude and longitude, address, state, etc. 

The "Potential Projects" section is one of the primary value-adds for Icarus. This section allows the company to add properties to a list of new projects that investors can see and potentially invest in if they are interested. This process used to be accomplished through extensive email and phone conversations. More information about how this is useful will be provided in the client section below.

The admin page also allows the admin to send "Notifications", both directly to a specific investor and to all investors in a property (or multiple properties). This is another time-saver for the company which would ordinarily send an individual email or phone call to the investor if new information became known. 

###Client

The client page is the primary value-add for the company. Previously, clients could only receive data in quartly reports that are so dry as to make them practically unreadable. We have attempted to solve that problem by creating a client analytics dashboard that provides the investor with visualizations for relevant data.

When a user signs in as a client, he gains access to a "Properties" list, which contains all the properties that this particular client is involved with, and an "Analytics" dashboard that provides detailed information on investor returns and other relevant information. 

picture of properties list

The analytics page is divided into "widgets" that contain modular data. For example, one of the most useful widgets is the "New Projects" widget, which displays all properties that Icarus is considering, as well as price and expected return data for the investor. 

image here

The next widget is the "Asset Allocation" widget, which shows the investor how much money he has invested in projects with Icarus and what type of assets she has invested in. 

image of asset allocation widget

The client can also receive notifications in the "Notifications" widget, giving the investor notice when a property is bought or sold, when renters have moved in, or any other relevant event. 

The "Debt & Equity" chart is a stacked bar chart that represents investor returns over time. This is split between debt and equity, which both return different amounts and have different risk profiles. 

image here

The last widget is the "Assets" widget, which shows historic pricing data of the properties that the investor is involved with. This chart also shows events, such as the date of purchase, sale, or refinance of the property.

image of asset goes here

##Contributors

Christian Bulacan - [github](https://github.com/cbulacan9)|[linkedin](https://www.linkedin.com/in/christianbulacan)
Sam Corcos - [github](https://github.com/samcorcos)

##Roadmap

1. Building an abstracted version of the software that can be migrated into the software of established competitors
2. Build more widgets for the client dashboard
3. Add client email feature
4. Add monthly/quarterly reporting feature
