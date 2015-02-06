@divideByEquity = (x, equityPerc) ->
  (x * equityPerc / 100)

@totalInvestment = (purchasePrice, closingRepair, equityPerc=100) ->
  (purchasePrice + closingRepair) * (equityPerc / 100)

@downPaymentAmount = (purchasePrice, closingRepair, downPaymentPerc, equityPerc=100) ->
  totalInvestment(purchasePrice, closingRepair) * (downPaymentPerc / 100) * (equityPerc / 100)

@monthlyTaxAverage = (taxes, equityPerc=100) ->
  taxes / 12 * (equityPerc / 100)

@reserve = (rentPrice, equityPerc=100) ->
  rentPrice * 0.05 * (equityPerc / 100)

@additionalFinancing = () ->
  # TODO this is not currently being calculated

@monthlyMortgageExpense = () ->
  # TODO this is not currently being calculated

@monthlyOperatingExpenses = (taxes, hoa, insurance, rentPrice, equityPerc=100) ->
  (monthlyTaxAverage(taxes) + hoa + insurance + reserve(rentPrice)) * (equityPerc / 100)

@monthlyCostOfOwnership = () ->
  # TODO this does not include cost of additional financing or monthly mortgage expense
  # TODO many forumlas should be this value instead of monthly operating expenses

@cashflowRented = (taxes, hoa, insurance, rentPrice, equityPerc=100) ->
  # TODO this should be (rentPrice - monthlyCostOfOwnership), but because we don't have a formula for the second variable, we will use operating expenses (which is the same thing in most cases)
  (rentPrice - monthlyOperatingExpenses(taxes, hoa, insurance, rentPrice)) * (equityPerc / 100)

@cashflowUnoccupied = (taxes, hoa, insurance, rentPrice, equityPerc=100) ->
  # TODO this should be monthlyCostOfOwnership
  (-1 * monthlyOperatingExpenses(taxes, hoa, insurance, rentPrice)) * (equityPerc / 100)

@depreciation = (purchasePrice) ->
  # TODO Ask david about this formula... It says "monthly" but we're dividing by 360
  purchasePrice * 0.8 / 360

@writeOff = (purchasePrice, taxes, hoa, insurance, rentPrice) ->
  # TODO does not contain cost of additional financing
  (depreciation(purchasePrice) + monthlyOperatingExpenses(taxes, hoa, insurance, rentPrice) + monthlyTaxAverage(taxes)) * 0.35

@additionalTaxes = (purchasePrice, taxes, hoa, insurance, rentPrice) ->
  # TODO does not contain cost of additional financing
  (writeOff(purchasePrice, taxes, hoa, insurance, rentPrice) - rentPrice) * 0.35

@afterTaxWithRenters = (purchasePrice, taxes, hoa, insurance, rentPrice, equityPerc=100) ->
  (cashflowRented(taxes, hoa, insurance, rentPrice) + additionalTaxes(purchasePrice, taxes, hoa, insurance, rentPrice)) * (equityPerc / 100)

@afterTaxUnoccupied = (purchasePrice, taxes, hoa, insurance, rentPrice, equityPerc=100) ->
  (writeOff(purchasePrice, taxes, hoa, insurance, rentPrice) + cashflowUnoccupied(taxes, hoa, insurance, rentPrice)) * (equityPerc / 100)

@freeCashflow = (taxes, hoa, insurance, rentPrice, equityPerc=100) ->
  # TODO check with David... shouldn't this subtract the taxes?
  (cashflowRented(taxes, hoa, insurance, rentPrice) + monthlyTaxAverage(taxes)) * (equityPerc / 100)

@annualRevenue = (rentPrice, equityPerc=100) ->
  rentPrice * 12 * (equityPerc / 100)

@annualCost = (taxes, hoa, insurance, rentPrice, equityPerc=100) ->
  monthlyOperatingExpenses(taxes, hoa, insurance, rentPrice) * 12 * (equityPerc / 100)

@annualProfit = (taxes, hoa, insurance, rentPrice, equityPerc=100) ->
  (annualRevenue(rentPrice) - annualCost(taxes, hoa, insurance, rentPrice)) * (equityPerc / 100)

@annualProfitAfterTax = (purchasePrice, taxes, hoa, insurance, rentPrice, equityPerc=100) ->
  afterTaxWithRenters(purchasePrice, taxes, hoa, insurance, rentPrice) * 12 * (equityPerc / 100)

@annualROIBeforeTax = (taxes, hoa, insurance, rentPrice, purchasePrice, closingRepair, equityPerc=100) ->
  annualProfit(taxes, hoa, insurance, rentPrice) / totalInvestment(purchasePrice, closingRepair) * 100 * (equityPerc / 100)

@annualROI = (purchasePrice, taxes, hoa, insurance, rentPrice, closingRepair, equityPerc=100) ->
  annualProfitAfterTax(purchasePrice, taxes, hoa, insurance, rentPrice) / totalInvestment(purchasePrice, closingRepair) * 100 * (equityPerc / 100)

@annualOperatingExpense = (taxes, hoa, insurance, rentPrice, equityPerc=100) ->
  monthlyOperatingExpenses(taxes, hoa, insurance, rentPrice) * 12 * (equityPerc / 100)

@netOperatingIncome = (taxes, hoa, insurance, rentPrice, equityPerc=100) ->
  (annualRevenue(rentPrice) - annualOperatingExpense(taxes, hoa, insurance, rentPrice)) * (equityPerc / 100)

###
ALL NEEDS TO TAKE EQUITY INTO CONSIDERATION!!!!!!!
###
