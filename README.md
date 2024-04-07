# Fit Market Dashboard Back-End Application with NestJS
This is a guide to run the application in development mode. It's recommended to run the application in a containerized manner with **Docker**. This guideline will focus on running the app in a container. Most of the terminal commands are specific to **Linux** operating system. You can interpret those on another OS as well. The application is recommended to run on **Node v20.11.1** and **PostgreSQL v16.02**.

## Prerequisites
- Install **Docker Engine** ([Installation Guide](https://docs.docker.com/engine/install)) and **Docker Compose** ([Installation Guide](https://docs.docker.com/compose/install)) on your machine
- Install **Git** ([Installation Guide](https://git-scm.com/downloads))
## Getting Started
- Clone the repository from [here](https://github.com/scarecrow-11/fit-market-dashboard-backend). You can run the following command
	```
	$ git clone https://github.com/scarecrow-11/fit-market-dashboard-backend.git
	```
- Go to the project root folder named **/fit-market-dashboard-backend** with the following command
	```
	$ cd ./fit-market-dashboard-backend
	```
- Create a **docker-compose.yaml** file in the root folder. An example docker compose file is given below
	```
	version: '3.9'
	
	services:
		fmd-db:
			image: postgres:16.2
			restart: always
			environment:
				POSTGRES_USER: username
				POSTGRES_PASSWORD: password
			ports:
				- '5432:5432'
			volumes:
				- fmd-db:/var/lib/postgresql/data
		fmd-backend:
			build:
				context: .
				dockerfile: Dockerfile
			restart: always
			environment:
				PORT: 4000
				DATABASE_URL: postgresql://username:password@fmd-db:5432/fmd-db?schema=public
			ports:
				- '4000:4000'
			depends_on:
				- fmd-db
			volumes:
				- ./src:/app/src
	volumes:
		fmd-db:
	```
- Run the following command to spin up the containers
	```
	$ docker compose up
	```
## Usage
- Access the **PostgreSQL** database on **[http://localhost:5432](http://localhost:5432)**
- Access the **NestJS** API on **[http://localhost:4000](http://localhost:4000)**
## Additional Information
- **PostgreSQL** Documentation [here](https://www.postgresql.org/docs/16/index.html)
- **NestJS** Documentation [here](https://docs.nestjs.com)
- **Prisma** Documentation [here](https://www.prisma.io/docs/orm)
- **Docker** Documentation [here](https://docs.docker.com)
