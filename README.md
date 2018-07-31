# Xml-product-upload-coding-exercise
All script withing xml-product-upload.rb file also credentials and authorization info stored in .env file.

At the beginning of the script I'm explaining all authorization parameters and requiring packages that I'm going to use.

First of all I'm making a FTP request, using authentication with provided credentials and receiving XML file (products.xml). Afterwards XML being converted into hash using Nori library and converted into proper data structure with .tr method. Accessing product array with .each method and making a POST request for each element in array(as product) with Uri, header that contains token bearer and body that contains modified to json data of each product.


## What documentation, websites, etc did you consult in doing this assignment?
I've used stackoverflow.com and ruby-doc.org. Also documentation on Nori github page.
## What third-party libraries or other tools does the script use? How did you choose each library you used?
I am requiring a lot of packages at the beginning of the file mostly because I found suggestions on stackoverflow and ruby-doc to use them. Usually I read what'ss included, how often it's being update and how many people downloaded and used it.
## How long did you spend on this exercise? If you had unlimited additional time to spend on this, how would you spend it and how would you prioritize each item?
I spent around 8-10 hours. I had some issue with converting json, but then I was able to get it done with Nori. If I had more time I would add logic on how to behave on Success and Failure responses.
## If you were to critique your code, what would you have to say about it?
I think it needs to be improved and organized in methods and classes more.
