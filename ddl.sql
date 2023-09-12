DROP TABLE IF EXISTS tickers CASCADE;

CREATE TABLE tickers (
ticker VARCHAR PRIMARY KEY,
company VARCHAR
);

DROP TABLE IF EXISTS years CASCADE;

CREATE TABLE years (
id INTEGER PRIMARY KEY NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 ),
year_val INTEGER
);

DROP TABLE IF EXISTS months CASCADE;

CREATE TABLE months (
id INTEGER PRIMARY KEY NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 ),
month_val INTEGER
);

DROP TABLE IF EXISTS dows CASCADE;

CREATE TABLE dows (
id INTEGER PRIMARY KEY NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 ),
day_of_week INTEGER
);

DROP TABLE IF EXISTS core_layer_stock_prices CASCADE;

CREATE TABLE core_layer_stock_prices (
	id INTEGER PRIMARY KEY NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 ),
    open_val DECIMAL,
    close_val DECIMAL,
    high DECIMAL,
    low DECIMAL,
    value DECIMAL,
    volume BIGINT,
    date_stock DATE,
    start_time TIME,
    end_time TIME,
    year_id INTEGER REFERENCES years(id),
    month_id INTEGER REFERENCES months(id),
    dow_id INTEGER REFERENCES dows(id),
    ticker VARCHAR REFERENCES tickers(ticker)
);