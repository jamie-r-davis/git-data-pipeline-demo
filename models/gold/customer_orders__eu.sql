with
  customers as (
    select * from {{ ref('customers_silver') }}
  ),

  orders as (
    select * from {{ ref('stg_orders') }}
  ),

  conversion_rates as (select * from {{ ref('stg_conversion_rates__usd_eur')}}),

  final as (
    select
      c.customer_id,
      c.customer_name,
      c.email,
      c.country,
      count(o.order_id) as order_count,
      sum(o.amount/r.usd_eur_rate)::decimal(15,2) as total_amount_eur,
      min(o.ordered_at) as first_order_at,
      max(o.ordered_at) as last_order_at
    
    from customers c

      left join orders o on 
        o.customer_id = c.customer_id

      asof join conversion_rates r on
        o.ordered_at > r.date

    where
      c.country != 'US'
    
    group by 
      c.customer_id,
      c.customer_name,
      c.email,
      c.country
  )

select * from final
