THEPOINT:
-rather than having messages be sent and stored by a third party, messaging will occur with direct connections from 
one user to another from one ip address to another. These connections will also be encrypted and are NOT cloud based to ensure privacy and security
HOSTNAMESERVER.rb
hostnames are only temporarily owned as long as the client is up
-the hostname server will constantly ping the application to see if it is still up
if it is then sleep(2 seconds)
-if the client application is not up then it will remove that name from the currently in use host names
 
