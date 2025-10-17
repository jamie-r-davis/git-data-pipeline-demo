with
  customer_orders as (select * from {{ ref('customer_orders') }}),

  final as (
    select
      *
    from customer_orders
    where
      country = 'US'
  )

select * from final
