docker stop postgres 
docker rm postgres
docker run --name postgres -e POSTGRES_PASSWORD=root -d -p 5432:5432 postgres
docker exec -it postgres psql -U postgres -d postgres < /home/merlins/Projeler/delivery-service/dispatcher-api/database/migrations/001-create-tables-dispatcher-api.sql