with
  customers as (select * from {{ ref("stg_customers") }}),

  final as (
    select
      customer_id,
      last_name || ', ' || first_name as customer_name,
      email,
      country
    from customers
  )

select * from final