
if !(typeof MochaWeb == 'undefined')
  MochaWeb.testOnly ->

    describe 'Termsheet logic', ->

      describe 'Divide by Equity', ->
        it 'should return the amount divided by equity', ->
          x = 1000
          equityPerc = 60
          result = divideByEquity x, equityPerc
          chai.expect(result).to.equal(600)
          return
        return

      describe 'Total Investment', ->
        it 'should return the total investment', ->
          purchasePrice = 100
          closingRepair = 120
          result = totalInvestment purchasePrice, closingRepair
          chai.expect(result).to.equal(220)
          return
        return

      describe 'Down Payment Amount', ->
        it 'should return the down payment amount', ->
          purchasePrice = 100
          closingRepair = 120
          downPaymentPerc = 100
          equityPerc = 50
          result = downPaymentAmount purchasePrice, closingRepair, downPaymentPerc, equityPerc
          chai.expect(result).to.equal(110)
          return
        return

      describe 'Monthly Tax Average', ->
        it 'should return the monthly tax average', ->
          taxes = 1200
          result = monthlyTaxAverage taxes
          chai.expect(result).to.equal(100)
          return
        return

      describe 'Reserve', ->
        it 'should return a reserve amount of 5%', ->
          rentPrice = 100
          result = reserve rentPrice
          chai.expect(result).to.equal(5)
          return
        return

      describe 'Monthly Operating Expenses', ->
        it 'should return the monthly operating expenses', ->
          taxes = 120
          hoa = 100
          insurance = 200
          rentPrice = 500
          result = monthlyOperatingExpenses taxes, hoa, insurance, rentPrice
          chai.expect(result).to.equal(335)
          return
        return

      describe 'Cashflow Rented', ->
        it 'should return the cashflow if rented', ->
          taxes = 120
          hoa = 100
          insurance = 200
          rentPrice = 500
          result = cashflowRented(taxes, hoa, insurance, rentPrice)
          chai.expect(result).to.equal(165)
          return
        return

      describe 'Cashflow Unoccupied', ->
        it 'should return the cashflow if unoccupied', ->
          taxes = 120
          hoa = 100
          insurance = 200
          rentPrice = 500
          result = cashflowUnoccupied(taxes, hoa, insurance, rentPrice)
          chai.expect(result).to.equal(-335)
          return
        return

      describe 'After Tax with Renters', ->
        it 'should return the after tax amount if renters are present', ->

          return
        return

      describe 'After Tax Unoccupied', ->
        it 'should return the after tax amount if no renters are present', ->

          return
        return

      describe 'Free Cashflow', ->
        it 'should return the free cashflow', ->

          return
        return

      describe 'Annual Revenue', ->
        it 'should return the annual revenue', ->

          return
        return

      describe 'Annual Cost', ->
        it 'should return the annual cost', ->

          return
        return

      describe 'Annual Profit', ->
        it 'should return the annual profit', ->

          return
        return

      describe 'Annual Profit After Tax', ->
        it 'should return the annual profit after tax', ->

          return
        return

      describe 'Annual ROI Before Tax', ->
        it 'should return the annual ROI before tax', ->

          return
        return

      describe 'Annual ROI After Tax', ->
        it 'should return the annual ROI after tax', ->

          return
        return

      describe 'Annual Operating Expense', ->
        it 'should return the annual operating expense', ->

          return
        return

      describe 'Net Operating Income', ->
        it 'should return the net operating income', ->

          return
        return

      return # return for Termsheet logic
    return # return for MochaWeb
