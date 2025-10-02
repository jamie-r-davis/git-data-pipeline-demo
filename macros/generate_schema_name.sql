{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}
    {%- set schema_prefix = env_var("DBT_SCHEMA_PREFIX", "") | trim -%}
    
    {%- if custom_schema_name is not none -%}

        {{schema_prefix}}{{ custom_schema_name | trim }}

    {%- else -%}

        {{schema_prefix}}{{ default_schema }}

    {%- endif -%}

{%- endmacro %}