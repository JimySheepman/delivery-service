CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

DROP TABLE IF EXISTS cities;

CREATE TABLE cities (
    city_id serial PRIMARY KEY,
    city_name VARCHAR(64) NOT NULL
);

DROP TABLE IF EXISTS districts;

CREATE TABLE districts (
    district_id serial PRIMARY KEY,
    city_id serial,
    district_name VARCHAR(64) NOT NULL,
    CONSTRAINT fk_city FOREIGN KEY(city_id) REFERENCES cities(city_id) ON DELETE
    SET
        NULL
);

DROP TABLE IF EXISTS seller_companies;

CREATE TABLE seller_companies (
    seller_id uuid PRIMARY KEY,
    seller_name VARCHAR(64) NOT NULL
);

DROP TABLE IF EXISTS shipping_companyies;

CREATE TABLE shipping_companyies (
    company_id uuid PRIMARY KEY,
    company_name VARCHAR(64) NOT NULL,
    charge_per_package INTEGER
);

DROP TABLE IF EXISTS regions_service;

CREATE TABLE regions_service (
    service_id serial PRIMARY KEY,
    company_id uuid,
    district_id serial,
    CONSTRAINT fk_company FOREIGN KEY(company_id) REFERENCES shipping_companyies(company_id) ON DELETE
    SET
        NULL,
        CONSTRAINT fk_district FOREIGN KEY(district_id) REFERENCES districts(district_id) ON DELETE
    SET
        NULL
);

DROP TABLE IF EXISTS daily_volumetric_weight_limits;

CREATE TABLE daily_volumetric_weight_limits (
    daily_limit_id serial PRIMARY KEY,
    company_id uuid,
    volumetric_weight_limit NUMERIC(7, 3) NOT NULL,
    volumetric_weight_current NUMERIC(7, 3) NOT NULL,
    CONSTRAINT fk_company FOREIGN KEY(company_id) REFERENCES shipping_companyies(company_id) ON DELETE
    SET
        NULL
);

DROP TABLE IF EXISTS delivery_speeds;

CREATE TABLE delivery_speeds (
    delivery_speed_id serial PRIMARY KEY,
    district_id serial,
    company_id uuid,
    speed TIME NOT NULL,
    CONSTRAINT fk_district FOREIGN KEY(district_id) REFERENCES districts(district_id) ON DELETE
    SET
        NULL,
        CONSTRAINT fk_company FOREIGN KEY(company_id) REFERENCES shipping_companyies(company_id) ON DELETE
    SET
        NULL
);

DROP TABLE IF EXISTS contracted_shipping_companies;

CREATE TABLE contracted_shipping_companies (
    contracted_id serial PRIMARY KEY,
    seller_id uuid,
    company_id uuid,
    CONSTRAINT fk_seller FOREIGN KEY(seller_id) REFERENCES seller_companies(seller_id) ON DELETE
    SET
        NULL,
        CONSTRAINT fk_company FOREIGN KEY(company_id) REFERENCES shipping_companyies(company_id) ON DELETE
    SET
        NULL
);

select
    *
from
    cities;

select
    *
from
    districts;

select
    *
from
    seller_companies;

select
    *
from
    shipping_companyies;

select
    *
from
    regions_service;

select
    *
from
    daily_volumetric_weight_limits;

select
    *
from
    delivery_speeds;

select
    *
from
    contracted_shipping_companies;

--cities 
insert into
    cities (city_name)
values
    ('Ankara');

insert into
    cities (city_name)
values
    ('İstanbul');

--districts
insert into
    districts (city_id, district_name)
values
    (1, 'Çankaya');

insert into
    districts (city_id, district_name)
values
    (1, 'Altındağ');

insert into
    districts (city_id, district_name)
values
    (1, 'Mamak');

insert into
    districts (city_id, district_name)
values
    (1, 'Gölbaşı');

insert into
    districts (city_id, district_name)
values
    (1, 'Yenimahalle');

insert into
    districts (city_id, district_name)
values
    (2, 'Arnavutköy');

insert into
    districts (city_id, district_name)
values
    (2, 'Beşiktaş');

insert into
    districts (city_id, district_name)
values
    (2, 'Beyoğlu');

insert into
    districts (city_id, district_name)
values
    (2, 'Kadıköy');

insert into
    districts (city_id, district_name)
values
    (2, 'Silivri');

--seller companies
insert into
    seller_companies (seller_id, seller_name)
values
    (uuid_generate_v4(), 'Penti');

insert into
    seller_companies (seller_id, seller_name)
values
    (uuid_generate_v4(), 'Mango');

insert into
    seller_companies (seller_id, seller_name)
values
    (uuid_generate_v4(), 'Watsons');

insert into
    seller_companies (seller_id, seller_name)
values
    (uuid_generate_v4(), 'Bershka');

insert into
    seller_companies (seller_id, seller_name)
values
    (uuid_generate_v4(), 'Bellona');

--shipping companyies
insert into
    shipping_companyies (company_id, company_name, charge_per_package)
values
    (uuid_generate_v4(), 'Yurtiçi Kargo', 22);

insert into
    shipping_companyies (company_id, company_name, charge_per_package)
values
    (uuid_generate_v4(), 'Aras Kargo', 24);

insert into
    shipping_companyies (company_id, company_name, charge_per_package)
values
    (uuid_generate_v4(), 'MNG Kargo', 27);

insert into
    shipping_companyies (company_id, company_name, charge_per_package)
values
    (uuid_generate_v4(), 'Horoz Lojistik', 34);

insert into
    shipping_companyies (company_id, company_name, charge_per_package)
values
    (uuid_generate_v4(), 'Moto Kurye', 13);

insert into
    regions_service (company_id, district_id)
values
    (
        'aaa1e56f-cce8-4702-bb37-3ae072d42ad6' :: UUID,
        1
    );

insert into
    regions_service (company_id, district_id)
values
    (
        'aaa1e56f-cce8-4702-bb37-3ae072d42ad6' :: UUID,
        2
    );

insert into
    regions_service (company_id, district_id)
values
    (
        'aaa1e56f-cce8-4702-bb37-3ae072d42ad6' :: UUID,
        9
    );

insert into
    regions_service (company_id, district_id)
values
    (
        'aaa1e56f-cce8-4702-bb37-3ae072d42ad6' :: UUID,
        10
    );

insert into
    regions_service (company_id, district_id)
values
    (
        'f693a578-8351-4a37-aac6-8dc976e84c33' :: UUID,
        3
    );

insert into
    regions_service (company_id, district_id)
values
    (
        'f693a578-8351-4a37-aac6-8dc976e84c33' :: UUID,
        4
    );

insert into
    regions_service (company_id, district_id)
values
    (
        'f693a578-8351-4a37-aac6-8dc976e84c33' :: UUID,
        8
    );

insert into
    regions_service (company_id, district_id)
values
    (
        'f693a578-8351-4a37-aac6-8dc976e84c33' :: UUID,
        7
    );

insert into
    regions_service (company_id, district_id)
values
    (
        '6d1cb828-c793-41d6-85bc-4707728b8bd7' :: UUID,
        1
    );

insert into
    regions_service (company_id, district_id)
values
    (
        '6d1cb828-c793-41d6-85bc-4707728b8bd7' :: UUID,
        2
    );

insert into
    regions_service (company_id, district_id)
values
    (
        '6d1cb828-c793-41d6-85bc-4707728b8bd7' :: UUID,
        3
    );

insert into
    regions_service (company_id, district_id)
values
    (
        '6d1cb828-c793-41d6-85bc-4707728b8bd7' :: UUID,
        4
    );

insert into
    regions_service (company_id, district_id)
values
    (
        '6d1cb828-c793-41d6-85bc-4707728b8bd7' :: UUID,
        5
    );

insert into
    regions_service (company_id, district_id)
values
    (
        '6d1cb828-c793-41d6-85bc-4707728b8bd7' :: UUID,
        6
    );

insert into
    regions_service (company_id, district_id)
values
    (
        '6d1cb828-c793-41d6-85bc-4707728b8bd7' :: UUID,
        7
    );

insert into
    regions_service (company_id, district_id)
values
    (
        '6d1cb828-c793-41d6-85bc-4707728b8bd7' :: UUID,
        8
    );

insert into
    regions_service (company_id, district_id)
values
    (
        '6d1cb828-c793-41d6-85bc-4707728b8bd7' :: UUID,
        9
    );

insert into
    regions_service (company_id, district_id)
values
    (
        '6d1cb828-c793-41d6-85bc-4707728b8bd7' :: UUID,
        10
    );

insert into
    regions_service (company_id, district_id)
values
    (
        'abbcd65f-082c-4a6f-b07c-328bba8dcd96' :: UUID,
        5
    );

insert into
    regions_service (company_id, district_id)
values
    (
        'abbcd65f-082c-4a6f-b07c-328bba8dcd96' :: UUID,
        6
    );

insert into
    regions_service (company_id, district_id)
values
    (
        '18928aad-d569-479d-8f17-bd9461c5528c' :: UUID,
        6
    );

insert into
    regions_service (company_id, district_id)
values
    (
        '18928aad-d569-479d-8f17-bd9461c5528c' :: UUID,
        7
    );

insert into
    regions_service (company_id, district_id)
values
    (
        '18928aad-d569-479d-8f17-bd9461c5528c' :: UUID,
        8
    );

insert into
    regions_service (company_id, district_id)
values
    (
        '18928aad-d569-479d-8f17-bd9461c5528c' :: UUID,
        9
    );

insert into
    regions_service (company_id, district_id)
values
    (
        '18928aad-d569-479d-8f17-bd9461c5528c' :: UUID,
        10
    );

-- daily volumetric weight limits
insert into
    daily_volumetric_weight_limits (
        company_id,
        volumetric_weight_limit,
        volumetric_weight_current
    )
values
    (
        'aaa1e56f-cce8-4702-bb37-3ae072d42ad6' :: UUID,
        1100,
        0
    );

insert into
    daily_volumetric_weight_limits (
        company_id,
        volumetric_weight_limit,
        volumetric_weight_current
    )
values
    (
        'f693a578-8351-4a37-aac6-8dc976e84c33' :: UUID,
        1200,
        0
    );

insert into
    daily_volumetric_weight_limits (
        company_id,
        volumetric_weight_limit,
        volumetric_weight_current
    )
values
    (
        '6d1cb828-c793-41d6-85bc-4707728b8bd7' :: UUID,
        1000,
        0
    );

insert into
    daily_volumetric_weight_limits (
        company_id,
        volumetric_weight_limit,
        volumetric_weight_current
    )
values
    (
        'abbcd65f-082c-4a6f-b07c-328bba8dcd96' :: UUID,
        5000,
        0
    );

insert into
    daily_volumetric_weight_limits (
        company_id,
        volumetric_weight_limit,
        volumetric_weight_current
    )
values
    (
        '18928aad-d569-479d-8f17-bd9461c5528c' :: UUID,
        250,
        0
    );

--delivery speeds
insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        1,
        'aaa1e56f-cce8-4702-bb37-3ae072d42ad6' :: UUID,
        '02:00:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        2,
        'aaa1e56f-cce8-4702-bb37-3ae072d42ad6' :: UUID,
        '04:00:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        9,
        'aaa1e56f-cce8-4702-bb37-3ae072d42ad6' :: UUID,
        '05:00:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        10,
        'aaa1e56f-cce8-4702-bb37-3ae072d42ad6' :: UUID,
        '03:30:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        3,
        'f693a578-8351-4a37-aac6-8dc976e84c33' :: UUID,
        '03:30:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        4,
        'f693a578-8351-4a37-aac6-8dc976e84c33' :: UUID,
        '02:30:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        8,
        'f693a578-8351-4a37-aac6-8dc976e84c33' :: UUID,
        '01:20:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        7,
        'f693a578-8351-4a37-aac6-8dc976e84c33' :: UUID,
        '05:30:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        1,
        '6d1cb828-c793-41d6-85bc-4707728b8bd7' :: UUID,
        '05:30:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        2,
        '6d1cb828-c793-41d6-85bc-4707728b8bd7' :: UUID,
        '02:30:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        3,
        '6d1cb828-c793-41d6-85bc-4707728b8bd7' :: UUID,
        '02:33:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        4,
        '6d1cb828-c793-41d6-85bc-4707728b8bd7' :: UUID,
        '01:30:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        5,
        '6d1cb828-c793-41d6-85bc-4707728b8bd7' :: UUID,
        '00:30:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        6,
        '6d1cb828-c793-41d6-85bc-4707728b8bd7' :: UUID,
        '12:30:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        7,
        '6d1cb828-c793-41d6-85bc-4707728b8bd7' :: UUID,
        '21:30:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        8,
        '6d1cb828-c793-41d6-85bc-4707728b8bd7' :: UUID,
        '13:30:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        9,
        '6d1cb828-c793-41d6-85bc-4707728b8bd7' :: UUID,
        '08:30:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        10,
        '6d1cb828-c793-41d6-85bc-4707728b8bd7' :: UUID,
        '09:30:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        5,
        'abbcd65f-082c-4a6f-b07c-328bba8dcd96' :: UUID,
        '08:30:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        6,
        'abbcd65f-082c-4a6f-b07c-328bba8dcd96' :: UUID,
        '08:30:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        6,
        '18928aad-d569-479d-8f17-bd9461c5528c' :: UUID,
        '01:15:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        7,
        '18928aad-d569-479d-8f17-bd9461c5528c' :: UUID,
        '01:15:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        8,
        '18928aad-d569-479d-8f17-bd9461c5528c' :: UUID,
        '01:15:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        9,
        '18928aad-d569-479d-8f17-bd9461c5528c' :: UUID,
        '01:15:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        10,
        '18928aad-d569-479d-8f17-bd9461c5528c' :: UUID,
        '01:15:00'
    );

-- contracted shipping companies
insert into
    contracted_shipping_companies (seller_id, company_id)
values
    (
        'd603d9b6-a84a-4034-8ec9-8ba83d03c81b' :: UUID,
        'f693a578-8351-4a37-aac6-8dc976e84c33' :: UUID
    );

insert into
    contracted_shipping_companies (seller_id, company_id)
values
    (
        'd603d9b6-a84a-4034-8ec9-8ba83d03c81b' :: UUID,
        'abbcd65f-082c-4a6f-b07c-328bba8dcd96' :: UUID
    );

insert into
    contracted_shipping_companies (seller_id, company_id)
values
    (
        '3afd39f6-46aa-4373-a343-02f9a28a304f' :: UUID,
        '6d1cb828-c793-41d6-85bc-4707728b8bd7' :: UUID
    );

insert into
    contracted_shipping_companies (seller_id, company_id)
values
    (
        '3afd39f6-46aa-4373-a343-02f9a28a304f' :: UUID,
        '18928aad-d569-479d-8f17-bd9461c5528c' :: UUID
    );

insert into
    contracted_shipping_companies (seller_id, company_id)
values
    (
        '64ba6c20-1007-4e94-8c88-97221353be3f' :: UUID,
        '18928aad-d569-479d-8f17-bd9461c5528c' :: UUID
    );

insert into
    contracted_shipping_companies (seller_id, company_id)
values
    (
        '64ba6c20-1007-4e94-8c88-97221353be3f' :: UUID,
        '6d1cb828-c793-41d6-85bc-4707728b8bd7' :: UUID
    );

insert into
    contracted_shipping_companies (seller_id, company_id)
values
    (
        '3fd3f6c2-7711-4612-8206-3efec8f11bf6' :: UUID,
        'abbcd65f-082c-4a6f-b07c-328bba8dcd96' :: UUID
    );

insert into
    contracted_shipping_companies (seller_id, company_id)
values
    (
        '3fd3f6c2-7711-4612-8206-3efec8f11bf6' :: UUID,
        'f693a578-8351-4a37-aac6-8dc976e84c33' :: UUID
    );

insert into
    contracted_shipping_companies (seller_id, company_id)
values
    (
        '57f56289-c32a-4d10-ad59-72920adfda84' :: UUID,
        'aaa1e56f-cce8-4702-bb37-3ae072d42ad6' :: UUID
    );

insert into
    contracted_shipping_companies (seller_id, company_id)
values
    (
        '57f56289-c32a-4d10-ad59-72920adfda84' :: UUID,
        'aaa1e56f-cce8-4702-bb37-3ae072d42ad6' :: UUID
    );