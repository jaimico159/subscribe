### Code Challenge

##### Author: Jaime Huarsaya Rivera
##### Assumptions for the script:
- It will accept a set of lines that will constitute an order.
- it will assume that you will be running the script every time you want to process an order


##### Assumptions for the problem:
- The line inputs will always have the form: `<quantity> <product_name> at <base_price>`
- quantity is always an integer
- product name is a string
- base_price is a float
- The script will treat the data as such.

- To process an order run: 
```ruby
ruby app.rb
```
It will require you to copy paste the input to the standard input thorugh the console.
For example:

```
1 imported bottle of perfume at 27.99
1 bottle of perfume at 18.99
1 packet of headache pills at 9.75
3 imported boxes of chocolates at 11.25
```


After pasting the input, press Enter to process the order.
The application will detect the empty line and will start to process the order.
The script will make the tax calculations and will print the result.

```
"1 imported bottle of perfume: 32.19"
"1 bottle of perfume: 20.89"
"1 packet of headache pills: 9.75"
"3 imported boxes of chocolates: 35.55"
"Sales Taxes: 7.90"
"Total: 98.38"
```

To run the tests run:
```ruby
rake
```