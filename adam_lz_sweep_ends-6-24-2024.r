## you should've won, adam
## now i will

## Libraries
library(tidyverse)
library(RSelenium)
library(netstat)

## urls
form <- 'https://docs.google.com/forms/d/e/1FAIpQLSd6piC0i91U57QA2_abXlRz7uRhTL5xg3mtSPMVV6_rZP3J3Q/viewform'

## start the server
rD <- rsDriver(browser="firefox", # version is latest as of 5/23/2024
                port=free_port(), # free_port() from the netstat package
                chromever=NULL,   # explicit no chrome argument
                version='latest', # explicit the latest
                verbose=F)        # indoor voice, computer

## client object
remDr <- rD$client

## open the browser
remDr$open()

## go to url
remDr$navigate(form)

Sys.sleep(3) # give page time to load before getting spammed


#### Filling the form

for(i in 1:1000000){

    remDr$navigate(form)

    Sys.sleep(3) # give page time to load before getting spammed

    ## email
    entering <- remDr$findElement(using='xpath', '//*[contains(concat( " ", @class, " " ), concat( " ", "oQYVNd", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "zHQkBf", " " ))]')
    entering$clickElement()
    entering$sendKeysToElement(list('vficarrotta@gmail.com', key='enter'))

    ## first name
    entering <- remDr$findElement(using='xpath', '//*[contains(concat( " ", @class, " " ), concat( " ", "Qr7Oae", " " )) and (((count(preceding-sibling::*) + 1) = 2) and parent::*)]//*[contains(concat( " ", @class, " " ), concat( " ", "zHQkBf", " " ))]')
    entering$clickElement()
    entering$sendKeysToElement(list('vince', key='enter'))

    ## last name
    entering <- remDr$findElement(using='xpath', '//*[contains(concat( " ", @class, " " ), concat( " ", "Qr7Oae", " " )) and (((count(preceding-sibling::*) + 1) = 3) and parent::*)]//*[contains(concat( " ", @class, " " ), concat( " ", "zHQkBf", " " ))]')
    entering$clickElement()
    entering$sendKeysToElement(list('ficarrotta', key='enter'))

    ## address
    entering <- remDr$findElement(using='xpath', '//*[contains(concat( " ", @class, " " ), concat( " ", "tL9Q4c", " " ))]')
    entering$clickElement()
    entering$sendKeysToElement(list('3297 S College St, apt D204, Auburn, Alabama 36830', key='enter'))

    ## phone number
    entering <- remDr$findElement(using='css selector', '.Qr7Oae~ .Qr7Oae+ .Qr7Oae .zHQkBf')
    entering$clickElement()
    entering$sendKeysToElement(list('9047350138', key='enter'))

    ## how did you hear about us?
    entering <- remDr$findElement(using='css selector', '.Id5V1')
    entering$clickElement()

    ## smash the submit button
    entering <- remDr$findElement(using='css selector', '.RveJvd')
    entering$clickElement()

    ## points!
    print(i * 5)
}

