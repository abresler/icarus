Accounts.ui.config
  passwordSignupFields: "USERNAME_AND_OPTIONAL_EMAIL"

Template.registerHelper "isAdmin", ->
    if Meteor.user()?.profile.roles.indexOf("admin") > -1 then true else false

Template.registerHelper "isInvestor", ->
  if Meteor.user()?.profile.roles.indexOf('client') > -1 then true else false

Template.registerHelper "formatMoney", (x) -> # takes in a number, converts it into money format
  x = +x #handles for numbers that are strings
  x.formatMoney(0)

Template.registerHelper "formatMoney2", (x) -> # takes in number, returns with two decimal places
  x = +x #handles for numbers that are strings
  x.formatMoney(2)

Template.registerHelper "divideByEquity", (x,y) ->
  divideByEquity(x,y).formatMoney(0)

Template.registerHelper "divideByEquity2", (x,y) ->
  divideByEquity(x,y).formatMoney(2)

Template.registerHelper "totalInvestment", (x,y,z) -> # takes in purchase price and closing repair, and adds them together
  totalInvestment(x,y,z).formatMoney(0)

Template.registerHelper "downPaymentAmount", (x,y,z,a) ->
  downPaymentAmount(x,y,z,a).formatMoney(0)

Template.registerHelper "monthlyTaxAverage", (x,y) ->
  monthlyTaxAverage(x,y).formatMoney(0)

Template.registerHelper "reserve", (x,y) ->
  reserve(x,y).formatMoney(0)

Template.registerHelper "monthlyOperatingExpenses", (x,y,z,a,b) ->
  monthlyOperatingExpenses(x,y,z,a,b).formatMoney(0)

Template.registerHelper "cashflowRented", (x,y,z,a,b) ->
  cashflowRented(x,y,z,a,b).formatMoney(0)

Template.registerHelper "cashflowUnoccupied", (x,y,z,a,b) ->
  cashflowUnoccupied(x,y,z,a,b).formatMoney(0)

Template.registerHelper "afterTaxWithRenters", (a,b,c,d,e,f) ->
  afterTaxWithRenters(a,b,c,d,e,f).formatMoney(0)

Template.registerHelper "afterTaxUnoccupied", (a,b,c,d,e,f) ->
  afterTaxUnoccupied(a,b,c,d,e,f).formatMoney(0)

Template.registerHelper "freeCashflow", (a,b,c,d,e) ->
  freeCashflow(a,b,c,d,e).formatMoney(0)

Template.registerHelper "annualRevenue", (a,b) ->
  annualRevenue(a,b).formatMoney(0)

Template.registerHelper "annualCost", (a,b,c,d,e) ->
  annualCost(a,b,c,d,e).formatMoney(0)

Template.registerHelper "annualProfit", (a,b,c,d,e) ->
  annualProfit(a,b,c,d,e).formatMoney(0)

Template.registerHelper "annualProfitAfterTax", (a,b,c,d,e,f) ->
  annualProfitAfterTax(a,b,c,d,e,f).formatMoney(0)

Template.registerHelper "annualROIBeforeTax", (a,b,c,d,e,f) ->
  annualROIBeforeTax(a,b,c,d,e,f).formatMoney(2)

Template.registerHelper "annualROI", (a,b,c,d,e,f) ->
  annualROI(a,b,c,d,e,f).formatMoney(2)

Template.registerHelper "annualOperatingExpense", (a,b,c,d,e) ->
  annualOperatingExpense(a,b,c,d,e).formatMoney(0)

Template.registerHelper "netOperatingIncome", (a,b,c,d,e) ->
  netOperatingIncome(a,b,c,d,e).formatMoney(0)

Template.registerHelper "filterPhone", (x) ->
  if x?
    temp = x.split("")
    areaCode = temp.slice(0, 3).join("")
    firstNum = temp.slice(3, 6).join("")
    secondNum = temp.slice(6, 10).join("")
    phoneNumber = "(#{areaCode}) #{firstNum}-#{secondNum}"

Template.registerHelper "money", (x) ->
  money = d3.format(',.0f')
  return money x

Template.registerHelper "transactionConvert", (x) ->
  x = x * -1
  money = d3.format(',.0f')
  return money x

Template.registerHelper "_", ->
  _

Template.registerHelper "shortDate", (date) ->
  temp = new Date(date)
  short = d3.time.format("%b %_d")
  shortDate = short(temp)
  return shortDate

Template.registerHelper "monthlyDate", (date) ->
  temp = new Date(date)
  month = d3.time.format("%B %Y")
  monthlyDate = month(temp)
  return monthlyDate

Template.registerHelper "capitalize", (string) ->
  lower = string.slice(1, string.length)
  upper = string[0].toUpperCase()
  capital = upper + lower
  return capital
