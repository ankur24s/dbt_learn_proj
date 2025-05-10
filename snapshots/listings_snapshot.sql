{% snapshot listings_snapshot %}

{{
config(
	 schema = 'snapshot',
	 unique_key = 'listing_id',
	 strategy = 'timestamp',
	 updated_at = 'updated_at',
	 invalidate_hard_deletes = True
)
}}

SELECT
id AS listing_id, name AS listing_name, listing_url, room_type, minimum_nights, host_id,
price AS price_str, created_at, updated_at
FROM
 {{source('src_airbnb','listings')}}

{% endsnapshot %}