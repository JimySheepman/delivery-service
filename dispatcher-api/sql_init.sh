#!bin/bash
docker exec -i postgres psql -U postgres -d postgres < /home/merlins/Projeler/delivery-service/dispatcher-api/database/migrations/001-create-tables-dispatcher-api.sql