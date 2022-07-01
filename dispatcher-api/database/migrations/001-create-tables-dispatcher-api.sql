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

DROP TABLE IF EXISTS shipping_companies;

CREATE TABLE shipping_companies (
    company_id uuid PRIMARY KEY,
    company_name VARCHAR(64) NOT NULL,
    charge_per_package INTEGER
);

DROP TABLE IF EXISTS regions_service;

CREATE TABLE regions_service (
    service_id serial PRIMARY KEY,
    company_id uuid,
    district_id INTEGER,
    CONSTRAINT fk_company FOREIGN KEY(company_id) REFERENCES shipping_companies(company_id) ON DELETE
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
    CONSTRAINT fk_company FOREIGN KEY(company_id) REFERENCES shipping_companies(company_id) ON DELETE
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
        CONSTRAINT fk_company FOREIGN KEY(company_id) REFERENCES shipping_companies(company_id) ON DELETE
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
        CONSTRAINT fk_company FOREIGN KEY(company_id) REFERENCES shipping_companies(company_id) ON DELETE
    SET
        NULL
);

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

--shipping companies
insert into
    shipping_companies (company_id, company_name, charge_per_package)
values
    (uuid_generate_v4(), 'Yurtiçi Kargo', 22);

insert into
    shipping_companies (company_id, company_name, charge_per_package)
values
    (uuid_generate_v4(), 'Aras Kargo', 24);

insert into
    shipping_companies (company_id, company_name, charge_per_package)
values
    (uuid_generate_v4(), 'MNG Kargo', 27);

insert into
    shipping_companies (company_id, company_name, charge_per_package)
values
    (uuid_generate_v4(), 'Horoz Lojistik', 34);

insert into
    shipping_companies (company_id, company_name, charge_per_package)
values
    (uuid_generate_v4(), 'Moto Kurye', 13);

-- add regions_service
insert into
    regions_service (company_id, district_id)
VALUES
    (
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'Yurtiçi Kargo'
        ),
        1
    );

insert into
    regions_service (company_id, district_id)
VALUES
    (
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'Yurtiçi Kargo'
        ),
        2
    );

insert into
    regions_service (company_id, district_id)
values
    (
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'Yurtiçi Kargo'
        ),
        9
    );

insert into
    regions_service (company_id, district_id)
values
    (
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'Yurtiçi Kargo'
        ),
        10
    );

insert into
    regions_service (company_id, district_id)
values
    (
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'Aras Kargo'
        ),
        3
    );

insert into
    regions_service (company_id, district_id)
values
    (
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'Aras Kargo'
        ),
        4
    );

insert into
    regions_service (company_id, district_id)
values
    (
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'Aras Kargo'
        ),
        8
    );

insert into
    regions_service (company_id, district_id)
values
    (
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'Aras Kargo'
        ),
        7
    );

insert into
    regions_service (company_id, district_id)
values
    (
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'MNG Kargo'
        ),
        1
    );

insert into
    regions_service (company_id, district_id)
values
    (
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'MNG Kargo'
        ),
        2
    );

insert into
    regions_service (company_id, district_id)
values
    (
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'MNG Kargo'
        ),
        3
    );

insert into
    regions_service (company_id, district_id)
values
    (
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'MNG Kargo'
        ),
        4
    );

insert into
    regions_service (company_id, district_id)
values
    (
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'MNG Kargo'
        ),
        5
    );

insert into
    regions_service (company_id, district_id)
values
    (
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'MNG Kargo'
        ),
        6
    );

insert into
    regions_service (company_id, district_id)
values
    (
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'MNG Kargo'
        ),
        7
    );

insert into
    regions_service (company_id, district_id)
values
    (
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'MNG Kargo'
        ),
        8
    );

insert into
    regions_service (company_id, district_id)
values
    (
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'MNG Kargo'
        ),
        9
    );

insert into
    regions_service (company_id, district_id)
values
    (
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'MNG Kargo'
        ),
        10
    );

insert into
    regions_service (company_id, district_id)
values
    (
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'Horoz Kargo'
        ),
        5
    );

insert into
    regions_service (company_id, district_id)
values
    (
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'Horoz Kargo'
        ),
        6
    );

insert into
    regions_service (company_id, district_id)
values
    (
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'Moto Kurye'
        ),
        6
    );

insert into
    regions_service (company_id, district_id)
values
    (
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'Moto Kurye'
        ),
        7
    );

insert into
    regions_service (company_id, district_id)
values
    (
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'Moto Kurye'
        ),
        8
    );

insert into
    regions_service (company_id, district_id)
values
    (
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'Moto Kurye'
        ),
        9
    );

insert into
    regions_service (company_id, district_id)
values
    (
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'Moto Kurye'
        ),
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
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'Yurtiçi Kargo'
        ),
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
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'Aras Kargo'
        ),
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
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'MNG Kargo'
        ),
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
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'Horoz Kargo'
        ),
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
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'Moto Kurye'
        ),
        250,
        0
    );

--delivery speeds
insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        1,
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'Yurtiçi Kargo'
        ),
        '02:00:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        2,
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'Yurtiçi Kargo'
        ),
        '04:00:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        9,
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'Yurtiçi Kargo'
        ),
        '05:00:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        10,
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'Yurtiçi Kargo'
        ),
        '03:30:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        3,
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'Aras Kargo'
        ),
        '03:30:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        4,
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'Aras Kargo'
        ),
        '02:30:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        8,
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'Aras Kargo'
        ),
        '01:20:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        7,
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'Aras Kargo'
        ),
        '05:30:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        1,
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'MNG Kargo'
        ),
        '05:30:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        2,
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'MNG Kargo'
        ),
        '02:30:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        3,
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'MNG Kargo'
        ),
        '02:33:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        4,
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'MNG Kargo'
        ),
        '01:30:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        5,
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'MNG Kargo'
        ),
        '00:30:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        6,
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'MNG Kargo'
        ),
        '12:30:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        7,
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'MNG Kargo'
        ),
        '21:30:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        8,
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'MNG Kargo'
        ),
        '13:30:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        9,
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'MNG Kargo'
        ),
        '08:30:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        10,
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'MNG Kargo'
        ),
        '09:30:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        5,
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'Horoz Kargo'
        ),
        '08:30:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        6,
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'Horoz Kargo'
        ),
        '08:30:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        6,
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'Moto Kurye'
        ),
        '01:15:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        7,
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'Moto Kurye'
        ),
        '01:15:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        8,
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'Moto Kurye'
        ),
        '01:15:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        9,
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'Moto Kurye'
        ),
        '01:15:00'
    );

insert into
    delivery_speeds (district_id, company_id, speed)
values
    (
        10,
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'Moto Kurye'
        ),
        '01:15:00'
    );

-- contracted shipping companies
insert into
    contracted_shipping_companies (seller_id, company_id)
values
    (
        (
            select
                seller_id
            from
                seller_companies
            where
                seller_name = 'Penti'
        ),
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'Aras Kargo'
        )
    );

insert into
    contracted_shipping_companies (seller_id, company_id)
values
    (
        (
            select
                seller_id
            from
                seller_companies
            where
                seller_name = 'Penti'
        ),
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'Horoz Kargo'
        )
    );

insert into
    contracted_shipping_companies (seller_id, company_id)
values
    (
        (
            select
                seller_id
            from
                seller_companies
            where
                seller_name = 'Mango'
        ),
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'MNG Kargo'
        )
    );

insert into
    contracted_shipping_companies (seller_id, company_id)
values
    (
        (
            select
                seller_id
            from
                seller_companies
            where
                seller_name = 'Mango'
        ),
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'Moto Kurye'
        )
    );

insert into
    contracted_shipping_companies (seller_id, company_id)
values
    (
        (
            select
                seller_id
            from
                seller_companies
            where
                seller_name = 'Watsons'
        ),
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'Moto Kurye'
        )
    );

insert into
    contracted_shipping_companies (seller_id, company_id)
values
    (
        (
            select
                seller_id
            from
                seller_companies
            where
                seller_name = 'Watsons'
        ),
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'MNG Kargo'
        )
    );

insert into
    contracted_shipping_companies (seller_id, company_id)
values
    (
        (
            select
                seller_id
            from
                seller_companies
            where
                seller_name = 'Bershka'
        ),
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'Horoz Kargo'
        )
    );

insert into
    contracted_shipping_companies (seller_id, company_id)
values
    (
        (
            select
                seller_id
            from
                seller_companies
            where
                seller_name = 'Bershka'
        ),
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'Aras Kargo'
        )
    );

insert into
    contracted_shipping_companies (seller_id, company_id)
values
    (
        (
            select
                seller_id
            from
                seller_companies
            where
                seller_name = 'Bellona'
        ),
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'Yurtiçi Kargo'
        )
    );

insert into
    contracted_shipping_companies (seller_id, company_id)
values
    (
        (
            select
                seller_id
            from
                seller_companies
            where
                seller_name = 'Bellona'
        ),
        (
            select
                company_id
            from
                shipping_companies
            where
                company_name = 'Yurtiçi Kargo'
        )
    );