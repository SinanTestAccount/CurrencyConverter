Feature: Currency Converter

  Background: Pre-condition
    Given User should open "https://www.xe.com/currencyconverter/." website

  Scenario: 1- User should be able to specify numeric amount, source and target currency, and obtain conversion amount.
    Given Click on "Amount" box
    When User should be enter specific numeric amount (110)
    And Click on "From" currency box
    And User should be select source currency
    And Click on "To" currency box
    And User should be select target currency
    And Click blue ">" button
    Then User should be able to see correct conversion amount

  Scenario: 2- Users should be able to specify whole integers and decimal numeric amounts.
    Given Click on "Amount" box
    When User should be enter decimal numeric amount (99.85)
    And Click on "From" currency box
    And User should be select source currency
    And Click on "To" currency box
    And User should be select target currency
    And Click blue ">" button
    Then User should be able to see correct conversion amount

  Scenario: 3- Whenever system provides conversion results,
                it should display the full conversion amount for the value specified
                as well as the conversion rate of a single unit for both currencies.
    Given Click on "Amount" box
    When User should be enter specific numeric amount (215)
    And Click on "From" currency box
    And User should be select source currency
    And Click on "To" currency box
    And User should be select target currency
    And Click blue ">" button
    And User should be able to see correct conversion amount
    Then User should be able to see rate of a single unit for both currencies on the left bottom of the convert box

  Scenario: 4- The conversion values presented for the amount specified
            (e.g. 10 USD = 8.90909 EUR) and the 1 unit values should be mathematically correct.
            i.e. if 1 USD = 0.890909 EUR, then 10 USD should equate to 8.90909 EUR.

    Given Click on "Amount" box
    When User should be enter specific numeric amount (10)
    And Click on "From" currency box and select "EURO"
    And Click on "To" currency box and select "USD"
    And Click blue ">" button
    And User should be able to see correct conversion amount
        # 1 EUR = 1.21539 USD
        # 10 EUR = 12.15391 USD
        # System conversion amount = 12.153919463166 USD

  Scenario: 5.1- The source currency dropdowns should list
              the most popular currencies at the top of the dropdown,
              and then list all other currencies in alphabetical order.
    Given Click on "From" currency dropdown
    Then User should be able to see the most popular currencies at the top of the dropdown
    Then User should be able to see all other currencies in alphabetical order (A to Z)

  Scenario: 5.2- The target currency dropdowns should list
            the most popular currencies at the top of the dropdown,
            and then list all other currencies in alphabetical order.
    Given Click on "To" currency dropdown
    Then User should be able to see the most popular currencies at the top of the dropdown
    Then User should be able to see all other currencies in alphabetical order (A to Z)


  Scenario: 6- If users specify negative numeric values,
            they should be converted to positive numeric values before performing conversion.
    Given Click on "Amount" box
    When User should be enter negative numeric amount (-10)
    Then User should be able to see warning message "Please enter an amount greater than 0"

  Scenario: 7.1- If users specify non numeric values, the system should assume that 1 was the value specified,
            and should calculate the conversion accordingly.
    Given Click on "Amount" box
    When User should be enter non numeric amount (abc)
    Then User should be able to see warning message "Please enter a valid amount"

  Scenario: 7.1- If users specify non numeric values, the system should assume that 1 was the value specified,
            and should calculate the conversion accordingly.

    Given Click on "Amount" box
    When User should be enter non numeric amount (100abc)
    Then User should be able to see only numeric of the value (100.00)

  Scenario: 8.1- User should be able to swap source and target currencies by clicking the ‘Invert Currencies’ button.
            If user clicks the submit (blue arrow) button afterwards the conversion should be reversed accordingly.

    Given Click on "Amount" box
    When User should be enter specific numeric amount (10)
    And Click on "From" currency box and select "EURO"
    And Click on "To" currency box and select "USD"
    And User should click the ‘Invert Currencies’ button (between the From and To boxes)
    Then User should see the changing of currency sign inside the Amount box ($)
    Then The user should see that the currency boxes have swapped

  Scenario: 8.2- User should be able to swap source and target currencies by clicking the ‘Invert Currencies’ button.
            If user clicks the submit (blue arrow) button afterwards the conversion should be reversed accordingly.

    Given Click on "Amount" box
    When User should be enter specific numeric amount (10)
    And Click on "From" currency box and select "EURO"
    And Click on "To" currency box and select "USD"
    And User should click the ‘Invert Currencies’ button (between the From and To boxes)
    And User should see the changing of currency sign inside the Amount box ($)
    And The user should see that the currency boxes have swapped
    And User clicks the submit (blue arrow) button
    Then User should be able to see reversed conversion amount

  Scenario: 9- Whenever user performs a conversion (or reverses it),
            the page URI should be updated to reflect the amount,
            source and target currency for the conversion.

    Given Click on "Amount" box
    When User should be enter specific numeric amount (10)
    And Click on "From" currency box and select "EURO"
    And Click on "To" currency box and select "USD"
    And User clicks the submit (blue arrow) button
    Then User should see "https://www.xe.com/currencyconverter/convert/?Amount=10&From=EUR&To=USD" as URI
    And User should click the ‘Invert Currencies’ button (between the From and To boxes)
    And User clicks the submit (blue arrow) button
    Then User should see "https://www.xe.com/currencyconverter/convert/?Amount=10&From=USD&To=EUR" as URI

  Scenario: 10.1- Users should be able to access a conversion page directly
            by specifying the right query string parameters.

    Given Click on "Amount" box
    When User should be enter specific numeric amount (10)
    And Click on "From" currency box and select "EURO"
    And Click on "To" currency box and select "USD"
    And User clicks the submit (blue arrow) button
    Then User should see "https://www.xe.com/currencyconverter/convert/?Amount=10&From=EUR&To=USD" as URI
    And User should change amount on URI (?Amount=25&From=EUR&To=USD)
    And User should click Enter on keyboard
    Then User should be able to see changing of numeric in "Amount" box

  Scenario: 10.2- Users should be able to access a conversion page directly
  by specifying the right query string parameters.

    Given Click on "Amount" box
    When User should be enter specific numeric amount (10)
    And Click on "From" currency box and select "EURO"
    And Click on "To" currency box and select "USD"
    And User clicks the submit (blue arrow) button
    Then User should see "https://www.xe.com/currencyconverter/convert/?Amount=10&From=EUR&To=USD" as URI
    And User should change source on URI (?Amount=25&From=TRY&To=USD)
    And User should click Enter on keyboard
    Then User should be able to see changing of currency inside the "From" box

  Scenario: 10.3- Users should be able to access a conversion page directly
  by specifying the right query string parameters.

    Given Click on "Amount" box
    When User should be enter specific numeric amount (10)
    And Click on "From" currency box and select "EURO"
    And Click on "To" currency box and select "USD"
    And User clicks the submit (blue arrow) button
    Then User should see "https://www.xe.com/currencyconverter/convert/?Amount=10&From=EUR&To=USD" as URI
    And User should change target on URI (?Amount=25&From=EUR&To=GBP)
    And User should click Enter on keyboard
    Then User should be able to see changing of currency inside the "To" box



    # AC-8; the arrow seems yellow on given image, but it is blue on the given website.