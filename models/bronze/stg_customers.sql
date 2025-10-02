with 
  source as (
    select * from {{ ref('customers') }}
  ),
  renamed as (
    select
      cast(id as integer) as customer_id,
      first_name,
      last_name,
      email,
      country
    from source
  )
  
select * from renamed
