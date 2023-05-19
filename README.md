# Backup Retention for plans (Test Project)
This project is used for the evaluation of my hard skills in programming.
## My plan api
* The API
 Can provide the endpoint for check Retains
### Development environment
#### Commands
Build the container step 1
In / raiz folder run
```bash
docker-compose build
```
Run application api step 2

```bash
docker-compose up
```
OBS: Step 1 can be run one time. and The database table is configured but not used.
### Test environment
* run this command 
```bash
docker exec -it skie_plans_project-my_plans_api-1 rspec
```
### Endpoint
* Use this endpoint for checkt de result of backup retentions
* params required:
  * plan (String) example: plan=Ultra
  * date (String date format) example: date=2023/05/31
* Request
```bash
GET http://localhost:3030/api/snapshots/should_retain?plan=Pro&date=2023/05/31
```
* Response
```bash
{
  "should_retain": true
}
```
* Response if params pass plan wrong
```bash
{
	"messenger": "Some params are not present!",
	"status": "unprocessable_entity"
}
```
* Response if params incorrect
```bash
{
	"messenger": "Some params are not present!",
	"status": "unprocessable_entity"
}
```
## The library
* I thinking good to develop a gem for providing this service.
### Development environment

* before run all commands, open this folder backup_retention_plan and continue the steps
#### Commands
Build the container step 1

```bash
docker-compose build
```
Run application specs step 2

```bash
docker-compose run --rm backup_retention_plan rake spec
```
OBS: Step 1 can be run one time.