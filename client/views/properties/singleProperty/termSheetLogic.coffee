@totalInvestment = (purchasePrice, closingRepair) ->
  (purchasePrice + closingRepair).formatMoney(0)
