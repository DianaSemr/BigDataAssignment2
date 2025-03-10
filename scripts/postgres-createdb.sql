CREATE TABLE IF NOT EXISTS categories (
	category_id integer PRIMARY KEY,
	category_code varchar(30)
) TABLESPACE pg_default;

CREATE TABLE IF NOT EXISTS products (
	product_id integer PRIMARY KEY,
	brand varchar(20)
) TABLESPACE pg_default;

CREATE TABLE IF NOT EXISTS Users (
	user_id integer PRIMARY KEY,
	first_purchase_date timestamp,
	user_device_id smallint
) TABLESPACE pg_default;

CREATE TABLE IF NOT EXISTS events (
	event_time timestamp,
	event_type varchar(10),
	product_id integer,
	category_id integer,
	price real,
	user_id integer,
	user_session varchar,
	CONSTRAINT fk_categories_category_id_to_events_category_id FOREIGN KEY (category_id) REFERENCES categories (category_id),
	CONSTRAINT fk_products_product_id_to_events_product_id FOREIGN KEY (product_id) REFERENCES products (product_id),
	CONSTRAINT fk_Users_user_id_to_events_user_id FOREIGN KEY (user_id) REFERENCES Users (user_id)
) TABLESPACE pg_default;

CREATE TABLE IF NOT EXISTS campaigns (
	id integer,
	campaign_type varchar(13),
	channel varchar(12),
	topic varchar(50),
	started_at timestamp,
	finished_at timestamp,
	total_count integer,
	ab_test boolean,
	warmup_mode boolean,
	hour_limit integer,
	subject_length integer,
	subject_with_personalization boolean,
	subject_with_deadline boolean,
	subject_with_emoji boolean,
	subject_with_bonuses boolean,
	subject_with_discount boolean,
	subject_with_saleout boolean,
	is_test boolean,
	position integer
) TABLESPACE pg_default;

CREATE TABLE IF NOT EXISTS messages (
	id integer PRIMARY KEY NOT NULL,
	message_id varchar,
	campaign_id integer,
	message_type varchar(13),
	client_id bigint,
	channel varchar(12),
	platform varchar(10),
	email_provider varchar(30),
	stream varchar(10),
	date date,
	sent_at timestamp,
	is_opened boolean,
	opened_first_time_at timestamp,
	opened_last_time_at timestamp,
	is_clicked boolean,
	clicked_first_time_at timestamp,
	clicked_last_time_at timestamp,
	is_unsubscribed boolean,
	unsubscribed_at timestamp,
	is_hard_bounced boolean,
	hard_bounced_at timestamp,
	is_soft_bounced boolean,
	soft_bounced_at timestamp,
	is_complained boolean,
	complained_at timestamp,
	is_blocked boolean,
	blocked_at timestamp,
	is_purchased boolean,
	purchased_at timestamp,
	created_at timestamp,
	updated_at timestamp,
	user_device_id smallint,
	user_id integer,
	CONSTRAINT fk_campaigns_id_to_messages_campaign_id FOREIGN KEY (campaign_id) REFERENCES campaigns (id),
	CONSTRAINT fk_Users_user_id_to_messages_user_id FOREIGN KEY (user_id) REFERENCES Users (user_id)
) TABLESPACE pg_default;

CREATE TABLE IF NOT EXISTS friends (
	friend1 integer,
	friend2 integer,
	CONSTRAINT fk_Users_user_id_to_friends_friend1 FOREIGN KEY (friend1) REFERENCES Users (user_id),
	CONSTRAINT fk_Users_user_id_to_friends_friend2 FOREIGN KEY (friend2) REFERENCES Users (user_id)
) TABLESPACE pg_default;
