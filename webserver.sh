#!/bin/bash

echo -e "Changing or creating index.html..."
echo -e "JENKINS DID THIS...@ `date` !!!" > index.html
mv index.html /var/www/html/
echo -e "Created new HTML page"
echo -e check on "http://3.110.187.36:80"
echo -e "END OF SCRIPT!!!"
