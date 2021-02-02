1. Compile the wait-connection.c this is used to listen for a tcp connection `gcc -o wait-connection wait-connection`
2. clone this repository into the guezzlpage/ subdirectory
3. run ./deploy.sh as a daemon/in a screen session, or run ./deploy-once.sh as a cronjob
4. setup your CI/CD webhook to connect to the wait-connection binary, http will open a tcp connection too!
