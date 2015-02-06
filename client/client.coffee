Accounts.ui.config
  passwordSignupFields: "USERNAME_AND_OPTIONAL_EMAIL"


Template.registerHelper "isAdmin", ->
    if Meteor.user()?.profile.roles.indexOf("admin") > -1 then true else false

Template.registerHelper "isInvestor", ->
  if Meteor.user()?.profile.roles.indexOf('client') > -1 then true else false


Template.registerHelper "formatMoney", (x) -> # takes in a number, converts it into money format
  x.formatMoney(0)

Template.registerHelper "formatMoney2", (x) -> # takes in number, returns with two decimal places
  x.formatMoney(2)


Template.registerHelper "totalInvestment", (x,y) -> # takes in purchase price and closing repair, and adds them together
  totalInvestment(x,y).formatMoney(0)

Template.registerHelper "downPaymentAmount", (x,y,z,a) ->
  downPaymentAmount(x,y,z,a).formatMoney(0)

Template.registerHelper "monthlyTaxAverage", (x) ->
  monthlyTaxAverage(x).formatMoney(0)

Template.registerHelper "reserve", (x) ->
  reserve(x).formatMoney(0)

Template.registerHelper "monthlyOperatingExpenses", (x,y,z,a) ->
  monthlyOperatingExpenses(x,y,z,a).formatMoney(0)

Template.registerHelper "cashflowRented", (x,y,z,a) ->
  cashflowRented(x,y,z,a).formatMoney(0)

Template.registerHelper "cashflowUnoccupied", (x,y,z,a) ->
  cashflowUnoccupied(x,y,z,a).formatMoney(0)

Template.registerHelper "afterTaxWithRenters", (a,b,c,d,e) ->
  afterTaxWithRenters(a,b,c,d,e).formatMoney(0)

Template.registerHelper "afterTaxUnoccupied", (a,b,c,d,e) ->
  afterTaxUnoccupied(a,b,c,d,e).formatMoney(0)

Template.registerHelper "freeCashflow", (a,b,c,d) ->
  freeCashflow(a,b,c,d).formatMoney(0)

Template.registerHelper "annualRevenue", (a) ->
  annualRevenue(a).formatMoney(0)

Template.registerHelper "annualCost", (a,b,c,d) ->
  annualCost(a,b,c,d).formatMoney(0)

Template.registerHelper "annualProfit", (a,b,c,d) ->
  annualProfit(a,b,c,d).formatMoney(0)

Template.registerHelper "annualProfitAfterTax", (a,b,c,d,e) ->
  annualProfitAfterTax(a,b,c,d,e).formatMoney(0)

Template.registerHelper "annualROIBeforeTax", (a,b,c,d,e,f) ->
  annualROIBeforeTax(a,b,c,d,e,f).formatMoney(2)

Template.registerHelper "annualROI", (a,b,c,d,e,f) ->
  annualROI(a,b,c,d,e,f).formatMoney(2)

Template.registerHelper "annualOperatingExpense", (a,b,c,d) ->
  annualOperatingExpense(a,b,c,d).formatMoney(0)

Template.registerHelper "netOperatingIncome", (a,b,c,d) ->
  netOperatingIncome(a,b,c,d).formatMoney(0)
