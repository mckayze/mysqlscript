#!/bin/bash
mysql.server start

random-string(){
    cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1
}

passwordUser=$(random-string)
passwordDevelopment=$(random-string)
passwordStaging=$(random-string)
passwordProduction=$(random-string)

echo $passwordUser
echo $passwordDevelopment
echo $passwordStaging
echo $passwordProduction

#mysql -u root -e "SET PASSWORD FOR user@'127.0.0.1' = PASSWORD(‘(#ogg^qqvmBmtChlC&p.’);"

mysql -u root -e "SET PASSWORD FOR 'user'@'127.0.0.1' = PASSWORD($passwordUser);"

mysql -u root -e "SET PASSWORD FOR 'development'@'localhost' = PASSWORD($passwordDevelopment);"
mysql -u root -e "SET PASSWORD FOR 'staging'@'localhost' = PASSWORD($passwordStaging);"
mysql -u root -e "SET PASSWORD FOR 'production'@'localhost' = PASSWORD($passwordProduction);"