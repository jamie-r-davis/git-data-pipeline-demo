with
    source as (
        select * from {{ ref('conversion_rates_usd_eur') }}
    ),
    
    renamed as (
        select
            cast(date as date) as date,
            cast("US dollar/Euro (EXR.D.USD.EUR.SP00.A)" as double) as usd_eur_rate
        from source
    )

select * from renamed
