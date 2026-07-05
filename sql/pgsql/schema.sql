create table if not exists ttrss_plugin_img_phash_urls(
	id serial not null,
	article_guid varchar(250) not null,
	url text not null,
	owner_uid integer not null references ttrss_users(id) on delete CASCADE,
	phash bigint,
	duplicate_of varchar(250),
	dupe_similarity smallint,
	created_at timestamp not null default NOW());

drop index if exists ttrss_plugin_img_phash_urls_url_idx;
create index ttrss_plugin_img_phash_urls_url_idx on ttrss_plugin_img_phash_urls(url);

drop index if exists ttrss_plugin_img_phash_urls_created_idx;
create index ttrss_plugin_img_phash_urls_created_idx on ttrss_plugin_img_phash_urls (created_at);
