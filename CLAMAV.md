Instructions for setting up clamav-rest server:

1) Log into cloud front from the command line:

`cf login -u EMAIL`

2) Select space to add server
```
Select a space:
1. eyfs-dev
2. eyfs-pre-prod
3. eyfs-prod
4. eyfs-test
```
3) Create the `clamav-rest` server with the following command:

`cf push`

The docker image, app name and route are in the `manifest.yml` file.

4) Create the network policy for each cms application (dev, test, preprod and prod).  

```
cf add-network-policy PUBLIC_APPNAME PRIVATE_APPNAME -s eyfs-prod --protocol tcp --port 9000
```

i.e. for eyfs-cms-dev app in eyfs-dev space
```
cf add-network-policy eyfs-cms-dev eyfs-clamav-rest-private -s eyfs-prod --protocol tcp --port 9000
```

5) The default for all applications is set to: 

```
http://eyfs-clamav-rest-private.apps.internal:9000/scan
```

So currently no need to set the url for the application.  If this is needed (i.e. you want to test a different clamav-rest server) then you can set the RESTY_SERVICE_URL env var. So, for example, if a new private appname is created called `new-eyfs-clamav-rest-private` then the CMS app would need the following set:

```
cf set-env eyfs-cms-dev RESTY_SERVICE_URL http://new-eyfs-clamav-rest-private.apps.internal:9000/scan
```