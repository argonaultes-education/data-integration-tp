DROP TABLE IF EXISTS images, musics, videos, speeches, quotes, quotes_has_images;

DROP TYPE IF EXISTS mylocale;


CREATE TABLE images(
    id SERIAL PRIMARY KEY,
    "path" TEXT,
    public_url TEXT,
    created_at TIMESTAMP DEFAULT NOW() NOT NULL
);


CREATE TABLE musics(
    id SERIAL PRIMARY KEY,
    "path" TEXT,
    public_url TEXT,
    created_at TIMESTAMP DEFAULT NOW() NOT NULL
);

create type mylocale as ENUM('anglais', 'français');

CREATE TABLE videos(
    id SERIAL PRIMARY KEY,
    "path" TEXT,
    created_at TIMESTAMP DEFAULT NOW() NOT NULL,
    "length" INTERVAL,
    public_url TEXT,
    captions BOOLEAN
);

CREATE TABLE speeches(
    id SERIAL PRIMARY KEY,
    "path" TEXT,
    created_at TIMESTAMP DEFAULT NOW() NOT NULL
);

CREATE TABLE quotes(
    id SERIAL PRIMARY KEY,
    sentences TEXT,
    locale mylocale,
    music_id INT REFERENCES musics(id),
    video_id INT REFERENCES videos(id),
    speech_id INT REFERENCES speeches(id),
    created_at TIMESTAMP DEFAULT NOW() NOT NULL
);

CREATE TABLE quotes_has_images(
    quote_id INT REFERENCES quotes(id),
    image_id INT REFERENCES images(id)
);

