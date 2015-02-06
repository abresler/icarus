@totalInvestment = (purchasePrice, closingRepair) ->
  purchasePrice + closingRepair

@downPaymentAmount = (purchasePrice, closingRepair, downPaymentPerc, equityPerc) ->
  totalInvestment(purchasePrice, closingRepair) * (downPaymentPerc / 100) * (equityPerc / 100)

@monthlyTaxAverage = (taxes) ->
  taxes / 12

@reserve = (rentPrice) ->
  rentPrice * 0.05

@additionalFinancing = () ->
  # TODO this is not currently being calculated

@monthlyMortgageExpense = () ->
  # TODO this is not currently being calculated

@monthlyOperatingExpenses = (taxes, hoa, insurance, rentPrice) ->
  monthlyTaxAverage(taxes) + hoa + insurance + reserve(rentPrice)

@monthlyCostOfOwnership = () ->
  # TODO this does not include cost of additional financing or monthly mortgage expense
  # TODO many forumlas should be this value instead of monthly operating expenses

@cashflowRented = (taxes, hoa, insurance, rentPrice) ->
  # TODO this should be (rentPrice - monthlyCostOfOwnership), but because we don't have a formula for the second variable, we will use operating expenses (which is the same thing in most cases)
  rentPrice - monthlyOperatingExpenses(taxes, hoa, insurance, rentPrice)

@cashflowUnoccupied = (taxes, hoa, insurance, rentPrice) ->
  # TODO this should be monthlyCostOfOwnership
  - monthlyOperatingExpenses(taxes, hoa, insurance, rentPrice)

@depreciation = (purchasePrice) ->
  # TODO Ask david about this formula... It says "monthly" but we're dividing by 360
  purchasePrice * 0.8 / 360

@writeOff = (purchasePrice, taxes, hoa, insurance, rentPrice) ->
  # TODO does not contain cost of additional financing
  (depreciation(purchasePrice) + monthlyOperatingExpenses(taxes, hoa, insurance, rentPrice) + monthlyTaxAverage(taxes)) * 0.35

@additionalTaxes = (purchasePrice, taxes, hoa, insurance, rentPrice) ->
  # TODO does not contain cost of additional financing
  (writeOff(purchasePrice, taxes, hoa, insurance, rentPrice) - rentPrice) * 0.35

@afterTaxWithRenters = (purchasePrice, taxes, hoa, insurance, rentPrice) ->
  cashflowRented(taxes, hoa, insurance, rentPrice) + additionalTaxes(purchasePrice, taxes, hoa, insurance, rentPrice)

@afterTaxUnoccupied = (purchasePrice, taxes, hoa, insurance, rentPrice) ->
  writeOff(purchasePrice, taxes, hoa, insurance, rentPrice) + cashflowUnoccupied(taxes, hoa, insurance, rentPrice)

@freeCashflow = (taxes, hoa, insurance, rentPrice) ->
  # TODO check with David... shouldn't this subtract the taxes?
  cashflowRented(taxes, hoa, insurance, rentPrice) + monthlyTaxAverage(taxes)

@annualRevenue = (rentPrice) ->
  rentPrice * 12

@annualCost = (taxes, hoa, insurance, rentPrice) ->
  monthlyOperatingExpenses(taxes, hoa, insurance, rentPrice) * 12

@annualProfit = (taxes, hoa, insurance, rentPrice) ->
  annualRevenue(rentPrice) - annualCost(taxes, hoa, insurance, rentPrice)

@annualProfitAfterTax = (purchasePrice, taxes, hoa, insurance, rentPrice) ->
  afterTaxWithRenters(purchasePrice, taxes, hoa, insurance, rentPrice) * 12

@annualROIBeforeTax = (taxes, hoa, insurance, rentPrice, purchasePrice, closingRepair) ->
  annualProfit(taxes, hoa, insurance, rentPrice) / totalInvestment(purchasePrice, closingRepair) * 100

@annualROI = (purchasePrice, taxes, hoa, insurance, rentPrice, closingRepair) ->
  annualProfitAfterTax(purchasePrice, taxes, hoa, insurance, rentPrice) / totalInvestment(purchasePrice, closingRepair) * 100

@annualOperatingExpense = (taxes, hoa, insurance, rentPrice) ->
  monthlyOperatingExpenses(taxes, hoa, insurance, rentPrice) * 12

@netOperatingIncome = (taxes, hoa, insurance, rentPrice) ->
  annualRevenue(rentPrice) - annualOperatingExpense(taxes, hoa, insurance, rentPrice)
