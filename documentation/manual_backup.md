# Manual Backup

The manual process to get a dump of Postgres is as follows.  (The matching process of loading the dump file is covered afterwards)
It assumes 

i) you have a development laptop 

ii) with Cloud Foundary CLI installed

iii) installed Postgres on this machine so that the pg_dump command is in the path and can be run

Log in to cloud foundry in a terminal with the cf command and your password 

`cf login`

Select the eyfs-space

# The credentials are shown with this.  You will need the The USER, PASSWORD and DATABASE_NAME shown by running this

`cf service-key eyfs-postgres-prod EXTERNAL-ACCESS-KEY`

# Set up the tunnel. I use port 5436 so I don’t have to stop local Postgres server

`cf ssh -L 5436:<HOST FROM ABOVE>:5432 eyfs-prod`

Dump the data to a text file, using USER, PASSWORD and DATABASE_NAME from the service key step above

`pg_dump --data-only  postgres://<USER><PASSWORD>@localhost:5436/DATABASE_NAME  > dd-mm-yyyy-prod.sql`

Note, pg_dump needs to be in the path
Store the file dd-mm-yyyy-prod.sql somewhere.  

# Restoring the backup

If you only want table data for pages and pictures, you can load the backup into a local database, open it in a desktop client, open another pointing to the production database (using the ssh tunnel) and then cut and paste the records in the GUI.

Or you can use the psql command line tool to read the whole file and run it.

Questions

i) Who will be responsible for doing this ?

ii) Have they have a got laptop with Postgres and Cloud Foundry ?

iii) Where will the SQL dumps be stored ?