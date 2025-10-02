with source as (
    select * from {{ ref('orders') }}
),
renamed as (
    select
        cast(id as integer) as order_id,
        cast(customer_id as integer) as customer_id,
        cast(amount as double) as amount,
        cast(ordered_at as timestamp) as ordered_at
    from source
)
select * from renamed
