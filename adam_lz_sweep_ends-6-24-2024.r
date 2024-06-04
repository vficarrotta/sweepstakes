## you should've won, adam

## Libraries
library(tidyverse)
library(RSelenium)
library(netstat)

## urls
form <- 'https://docs.google.com/forms/d/e/1FAIpQLSd6piC0i91U57QA2_abXlRz7uRhTL5xg3mtSPMVV6_rZP3J3Q/viewform'

## start the server
rD <- rsDriver(browser="firefox", # version is latest as of 5/23/2024
                port=free_port(), # free_port() from the netstat package
                chromever=NULL,   # explicate no chrome 
                version='latest', # explicate the latest
                verbose=F)        # indoor voice

## client object
remDr <- rD$client

## open the browser
remDr$open()

## go to url
remDr$navigate(form)

## variables
email <- ''
fn <- ''
ln <- ''
pn <- ''
address <- ''

#### Filling the form

for(i in 1:1000000){

    remDr$navigate(form)

    Sys.sleep(1.5) # give page time to load before getting spammed

    ## email
    entering <- remDr$findElement(using='xpath', '//*[contains(concat( " ", @class, " " ), concat( " ", "oQYVNd", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "zHQkBf", " " ))]')
    entering$clickElement()
    entering$sendKeysToElement(list(email, key='enter'))

    ## first name
    entering <- remDr$findElement(using='xpath', '//*[contains(concat( " ", @class, " " ), concat( " ", "Qr7Oae", " " )) and (((count(preceding-sibling::*) + 1) = 2) and parent::*)]//*[contains(concat( " ", @class, " " ), concat( " ", "zHQkBf", " " ))]')
    entering$clickElement()
    entering$sendKeysToElement(list(fn, key='enter'))

    ## last name
    entering <- remDr$findElement(using='xpath', '//*[contains(concat( " ", @class, " " ), concat( " ", "Qr7Oae", " " )) and (((count(preceding-sibling::*) + 1) = 3) and parent::*)]//*[contains(concat( " ", @class, " " ), concat( " ", "zHQkBf", " " ))]')
    entering$clickElement()
    entering$sendKeysToElement(list(ln, key='enter'))

    ## address
    entering <- remDr$findElement(using='xpath', '//*[contains(concat( " ", @class, " " ), concat( " ", "tL9Q4c", " " ))]')
    entering$clickElement()
    entering$sendKeysToElement(list(address, key='enter'))

    ## phone number
    entering <- remDr$findElement(using='css selector', '.Qr7Oae~ .Qr7Oae+ .Qr7Oae .zHQkBf')
    entering$clickElement()
    entering$sendKeysToElement(list(pn, key='enter'))

    ## how did you hear about us?
    entering <- remDr$findElement(using='css selector', '.Id5V1')
    entering$clickElement()

    ## smash the submit button
    entering <- remDr$findElement(using='css selector', '.RveJvd')
    entering$clickElement()

    ## points!
    print(i * 5)
}

