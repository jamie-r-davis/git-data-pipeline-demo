with
  customers as (
    select * from {{ ref('stg_customers') }}
  ),

  orders as (
    select * from {{ ref('stg_orders') }}
  ),

  final as (
    select
      c.customer_id,
      c.first_name,
      c.last_name,
      c.email,
      count(o.order_id) as order_count,
      sum(o.amount) as total_amount,
      min(o.ordered_at) as first_order_at,
      max(o.ordered_at) as last_order_at
    from customers c
      left join orders o on o.customer_id = c.customer_id
    group by 1,2,3,4
  )

select * from final
