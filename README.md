# Backup Retention for plans (Test Project)
This project is used for the evaluation of my hard skills in programming.
## My plan api
* The API
 Can provide the endpoint for check Retains
### Endpoint
* Use this endpoint for checkt de result of backup retentions
* params required:
  * plan (String) example: plan=Ultra
  * date (String date format) example: date=2023/05/31
* Request copy and paste in your browser
```code
GET http://localhost:3030/api/snapshots/should_retain?plan=Pro&date=2023/05/31
```
* Response
```code
{
  "should_retain": true
}
```
* Response if params pass plan wrong or date 
```code
{
  "should_retain": false
}
```
* Response if params incorrect
```code
{
	"messenger": "Some params are not present!",
	"status": "unprocessable_entity"
}
```
### Development environment
#### Commands
Build the container step 1
In / raiz folder run
```code
docker-compose build
```
Run application api step 2
```code
docker-compose up
```
Run config database
```code
docker compose run --rm my_plans_api rails db:migrate
```
OBS: Step 1 can be run one time. and The database table is configured but not used.
### Test environment
* run this command 
```code
docker compose run --rm my_plans_api rspec
```
## library gem
* I thinking good to develop a gem for providing this service. [backup_retention_plan](https://rubygems.org/gems/backup_retention_plan)
### Development environment

* before run all commands, open this folder backup retention plan and continue the steps inside a folder
#### Commands
Build the container step 1

```code
docker-compose build
```
Run application specs step 2

```code
docker-compose run --rm backup_retention_plan rake spec
```
OBS: Step 1 can be run one time.
