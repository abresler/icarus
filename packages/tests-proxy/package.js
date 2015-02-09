Package.describe({
	name: "velocity:test-proxy",
	summary: "Dynamically created package to expose test files to mirrors",
	version: "0.0.4",
	debugOnly: true
});

Package.on_use(function (api) {
	api.use("coffeescript", ["client", "server"]);
	api.add_files("tests/mocha/client/admin-client-test.coffee",["client"]);
	api.add_files("tests/mocha/client/calculator-test.coffee",["client"]);
	api.add_files("tests/mocha/client/termsheet-test.coffee",["client"]);
	api.add_files("tests/mocha/server/sampleServerTest.js",["server"]);
});